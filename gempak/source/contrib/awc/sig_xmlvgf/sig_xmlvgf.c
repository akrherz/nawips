/*****************************************************************************
This software reads KML Style XML document files for input and generates
GEMPAK VGF files from  those documents.

Usage: sig_xmlvgf -i <xml filename> [-ovgf <vgf filename>]

Default VGF format:  YYYYMMDD_HHMM_<type>_<cycle>Z.vgf where
  YYYYMMDD_HHMM is the issue time of the SIGMET,
  <type> is the Hazard Category of SIERRA, TANGO, ZULU, GFA
  <cycle> is the 2-digit Cycle time 03, 09, 15, 21.

Use of -ovgf overrides the filename output with strftime format specification

 Contents:
 main
 
 create_isig_gairm_vgf
 convertType
 createGAirmVGF
 writeGAirmVGF
 buildGfaVGF
 buildGAirmSierraVGF
 buildGairmTangoVGF
 buildGairmZuluVGF
 setGAirmCommonTags
 setGAirmGFAIdObsFcst
 setGAirmDescFeature
 parsePtsToArrayFlt
 setGAirmTimePeriod
 determineCycle
 determineBulletinType
 initPreVGFTag
 cvg_crthdr
 setVGFCycleAndType
 buildVGFFilenameAndDateStampFmIssTime
 
Log:  L. Hinson/AWC     05/09    Created
      Re-Engineered     11/09
                        02/10    Updated for GEMPAK Release
*****************************************************************************/
#include <stdio.h>
#include <assert.h>
#include <libxml/xmlreader.h>
#include <libxml/xpath.h>
#include <libxml/xpathInternals.h>

#include "geminc.h"
#include "gemprm.h"
#include "pgprm.h"
#include "vgstruct.h"
#include "vgtag.h"
#include "drwids.h"
#include "sig_xmlvgf.h"
#include "parseAWC_XML.h"

#define MAXST 128
#define MXXPATH 200

#define ONEBLOCK        2048

static char _cycle[3];

int main ( int argc, char **argv)
{
/***********************************************************************
sig_xmlvgf

This programs reads XML files describing GFA elements and
generates VGF files.

Usage:
sig_xmlvgf -i <XML_FILE> [-ovgf <VGF FILE>]

***********************************************************************/
  int i,ier=0;
  Boolean inpxmlFileset=False, outputFormatVGFset=False;
  char *xmlStr = NULL;
  char inpxmlfile[MAXST], outputFormatVGF[MAXST];

  static char usageString[] ="Usage: sig_xmlvgf -i <xml document> "
                             "[-ovgf <VGF_FILE>]\n";

  for (i=0; i < argc; i++) {
    if (strcmp(argv[i],"-h")==0) {
      printf(usageString);
      exit(1);
    }
    if (strcmp(argv[i],"-i")==0) {
      sscanf(argv[i+1],"%s",inpxmlfile);
      inpxmlFileset=True;
    }
    if (strcmp(argv[i],"-ovgf")==0) {
      sscanf(argv[i+1],"%s",outputFormatVGF);
      outputFormatVGFset=True;
    }
  }
  if (! outputFormatVGFset ) {
    strcpy(outputFormatVGF, "%Y%m%d_%H%M_<type>_<cycle>.vgf");
  }
  if (! inpxmlFileset) {
    printf(usageString);
    exit(1);
  }
  G_MALLOC ( xmlStr, char, ONEBLOCK, "xml string");
  xmlStr[0]='\0';
  loadXmlfile(&xmlStr,inpxmlfile,&ier);
  create_isig_gairm_vgf((char*) xmlStr, strlen((char*) xmlStr), outputFormatVGF);
  G_FREE (xmlStr, char);
  return 0;
}

static void create_isig_gairm_vgf(char *rawdoc, int size, char *outputFormatVGF) {
  xmlDocPtr doc;
  char xpathExpr[MAXST];
  char typeObject[MAXST];
  char validFromDateTime[21];
  char bulletinType[7];
  char cycle[3];
  char dateStamp[16];
  char outputFormatStr[MAXST],vgffilename[MAXST];
  char shorttypeObject[4];
  enum GFADesignator GFADesignatorType = SIERRA;
  int i;

  doc = xmlReadMemory(rawdoc,size,"noname.xml",NULL,0);
  if (doc==NULL) {
    printf("isig_xmlvgf::Error in parsing document.\n");
    exit(1);
  }
  /* Get the hazard and validFrom  (time) of this product */
  sprintf(xpathExpr,"/SIGMET");
  getInfoStr(doc,xpathExpr,"/@hazard",shorttypeObject);
  convertType(shorttypeObject,typeObject);
  getInfoStr(doc,xpathExpr,"/Header/ValidFrom", validFromDateTime);
  /* Determine bulletin Type, SIERRA, TANGO, ZULU from hazard*/
  determineBulletinType(typeObject,bulletinType);
  for (i=0; i< 4; i++) {
    if (strcmp(bulletinType, GFADesignatorNames[i])==0) {
      GFADesignatorType = (enum GFADesignator) i;
      break;
    }
  }

  /* Infer a cycle Time  from the validFrom time of the SIGMET */
  determineCycle(validFromDateTime,cycle);
  setVGFCycleAndType(outputFormatVGF, cycle, bulletinType, outputFormatStr);
  buildVGFFilenameAndDateStampFmIssTime(validFromDateTime, outputFormatStr, vgffilename,
                                     dateStamp);
  createGAirmVGF(doc, GFADesignatorType, cycle, typeObject, vgffilename);
  xmlFreeDoc(doc);
}

static void convertType(char *shortname, char *longname) {
  char *shortnames[] = {"TB","IC","DS","SS","VA","TS"};
  char *longnames[] = {"TURB_SIGMET", "ICE_SIGMET", "DS_SIGMET", "SS_SIGMET",
                       "VASH_SIGMET","TS_SIGMET"};
  int numnames=6;
  int i;
  strcpy(longname,"NA_SIGMET");
  for (i=0;i < numnames; i++) {
    if (strcmp(shortname,shortnames[i])==0) {
      strcpy(longname,longnames[i]);
      break;
    }
  }
}


static void createGAirmVGF(xmlDocPtr doc, enum GFADesignator GFADesignatorType, char *cycle, char *typeobject, char *vgffilename)
{
  char newfile[256];
  long fsize;
  int nIn = 0;
  int i;
  int iret, ier;
  VG_DBStruct *el=0x0;
  ces_rtbl(&iret);
  strcpy(_cycle,cycle);
  cfl_inqr(vgffilename, NULL, &fsize, newfile, &ier);
  if (ier < 0) {
    cvg_crvgf(vgffilename, &ier);
  } else {
    remove(vgffilename);
    cvg_crvgf(vgffilename, &ier);
  }
  switch (GFADesignatorType) {
    case SIERRA:
      el = buildGAirmSierraVGF(doc, vgffilename, typeobject, &nIn, el);
      break;
    case TANGO:
      el = buildGAirmTangoVGF(doc, vgffilename, typeobject, &nIn, el);
      break;
    case ZULU:
      el = buildGAirmZuluVGF(doc, vgffilename, typeobject, &nIn, el);
      break;
    case GFA:
      el = buildGfaVGF(doc, vgffilename, typeobject, &nIn, el);
      break;
  }
  for (i=0; i < nIn; i++) {
    cvg_freeElPtr ( &el[i] );
  }
  G_FREE( el, VG_DBStruct );
}

static void writeGAirmVGF(VG_DBStruct *el, char *fname)
/****************************************************************************
    This function performs the final routines necessary to write and append an
    object to a VGF file.

    writeVGF
  Input parameters:
    el         VG_DBStruct *el    VGF el structure
    pvt        preVGFtag_t *      pre VGF Tag structure
    fname      char *             Name of VGF file

    Log: L. Hinson 10/07
****************************************************************************/
{
  int start=-1, np, ier, loc;
  el->hdr.filled = (char) 0;
  el->hdr.smooth = (char) 0;
  np=el->elem.gfa.info.npts;
  cvg_crthdr(el, np, el->elem.gfa.latlon, el->elem.gfa.latlon+np, &ier);
  el->hdr.recsz = (int) ( sizeof(VG_HdrStruct) + sizeof(int) * 2 +
      sizeof(char) * STD_STRLEN * el->elem.gfa.info.nblocks ) +
      sizeof(float) * np * 2;
#ifdef V5102
  cvg_writef(el, start, el->hdr.recsz, fname, &loc, &ier);
#else
  cvg_writefD(el, start, el->hdr.recsz, fname, &loc, &ier );
#endif
  /* cvg_freeElPtr ( el ); */
}

static VG_DBStruct * buildGfaVGF ( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                            VG_DBStruct *el)
{
  preVGFtag_t pvt;
  int subType, ier;
  char qualifier[STD_STRLEN]="";
  char xpathExpr[MAXST];
  G_MALLOC (el, VG_DBStruct, *nIn + 1, "buildGfaVGF");
  if (strcmp(hazardType,"TS_SIGMET")==0) {
    el[*nIn].hdr.vg_class=(char) CLASS_MET;
    el[*nIn].hdr.vg_type=(char) GFA_ELM;
    el[*nIn].hdr.grptyp = 8;
    el[*nIn].hdr.grpnum = 0;
    el[*nIn].hdr.delete=0;
    el[*nIn].elem.gfa.info.nblocks=0;
    initPreVGFTag(&pvt);
    strcpy(pvt.gfa_areaType,"TS");

    sprintf(xpathExpr,"/SIGMET");
    getInfoStr(doc, xpathExpr, "/@qualifier",qualifier);

    /*Frequency choices are defined as either ISOL or OCNL*/
    strcpy(pvt.frequency,"OCNL");
    if (strstr(qualifier, "ISOL") !=NULL )
      strcpy(pvt.frequency, "ISOL");
    if (strstr(qualifier, "OCNL") !=NULL || strstr(qualifier, "FRQ") != NULL)
      strcpy(pvt.frequency, "OCNL");

    strcpy(pvt.type,"");
    if (strstr(qualifier, "GR") != NULL)
      strcpy(pvt.type, "GR");

    /*Category choices are either blank, EMBD, or OBSC*/
    strcpy(pvt.category,"");
    if (strstr(qualifier, "EMBD") != NULL)
      strcpy(pvt.category,"EMBD");
    if (strstr(qualifier, "OBSC") != NULL)
      strcpy(pvt.category,"OBSC");

    strcpy(pvt.gfa_status,"NRML");
    setGAirmGFAIdObsFcst(doc, &pvt, &el[*nIn]);
    sscanf(pvt.gfa_subType, "%d", &subType);
    ces_get(subType, &el[*nIn], &ier);
    setGAirmCommonTags( &el[*nIn], &pvt);
    cvg_setFld (&el[*nIn], "<Category>", pvt.category, &ier);
    cvg_setFld (&el[*nIn], "<Frequency>", pvt.frequency, &ier);
    cvg_setFld (&el[*nIn], "<Type>", pvt.type, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_TOP, pvt.gfa_top, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_BOTTOM, pvt.gfa_bottom, &ier);
    writeGAirmVGF(&el[*nIn], filename);
    (*nIn)++;
  }
  return el;
}

static VG_DBStruct * buildGAirmSierraVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                    VG_DBStruct *el)
{
  preVGFtag_t pvt;
  int subType,ier;
  char type[STD_STRLEN]="";
  G_MALLOC (el, VG_DBStruct, *nIn + 1, "buildGAirmSierraVGF");
  if (strcmp(hazardType,"DS_SIGMET")==0 || strcmp(hazardType,"SS_SIGMET")==0 ||
      strcmp(hazardType, "VASH_SIGMET")==0 ) {
    el[*nIn].hdr.vg_class=(char) CLASS_MET;
    el[*nIn].hdr.vg_type=(char) GFA_ELM;
    el[*nIn].hdr.grptyp = 8;
    el[*nIn].hdr.grpnum = 0;
    el[*nIn].hdr.delete=0;
    el[*nIn].elem.gfa.info.nblocks=0;
    initPreVGFTag(&pvt);
    strcpy(pvt.gfa_areaType,hazardType);
    if (strcmp(hazardType,"DS_SIGMET")==0)
      strcpy(type, "VIS BLW 3SM WDSPRD DS");
    if (strcmp(hazardType,"SS_SIGMET")==0)
      strcpy(type, "VIS BLW 3SM WDSPRD SS");
    if (strcmp(hazardType,"VASH_SIGMET")==0)
      strcpy(type, "VIS BLW 3SM VOLCANIC ASH");
    strcpy(pvt.type, type);
    strcpy(pvt.gfa_status,"NRML");
    setGAirmGFAIdObsFcst(doc, &pvt, &el[*nIn]);
    sscanf(pvt.gfa_subType, "%d", &subType);
    ces_get(subType, &el[*nIn], &ier);
    setGAirmCommonTags( &el[*nIn], &pvt);
    cvg_setFld (&el[*nIn], "<Type>", pvt.type, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_TOP, pvt.gfa_top, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_BOTTOM, pvt.gfa_bottom, &ier);
    writeGAirmVGF(&el[*nIn],filename);
    (*nIn)++;
  }
  return el;
}

static VG_DBStruct * buildGAirmTangoVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                   VG_DBStruct *el)
{
  preVGFtag_t pvt;
  int subType,ier;
  G_MALLOC (el, VG_DBStruct, *nIn + 1, "buildGAirmTangoVGF");
  if (strcmp(hazardType,"TURB_SIGMET")==0) {
    el[*nIn].hdr.vg_class=(char) CLASS_MET;
    el[*nIn].hdr.vg_type=(char) GFA_ELM;
    el[*nIn].hdr.grptyp = 8;
    el[*nIn].hdr.grpnum = 0;
    el[*nIn].hdr.delete=0;
    el[*nIn].elem.gfa.info.nblocks=0;
    initPreVGFTag(&pvt);
    strcpy(pvt.gfa_areaType,hazardType);
    strcpy(pvt.gfa_status,"NRML");
    setGAirmGFAIdObsFcst(doc, &pvt, &el[*nIn]);
    sscanf(pvt.gfa_subType, "%d", &subType);
    ces_get(subType, &el[*nIn], &ier);
    setGAirmCommonTags( &el[*nIn], &pvt);
    cvg_setFld (el, "<Severity>",pvt.severity, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_TOP, pvt.gfa_top, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_BOTTOM, pvt.gfa_bottom, &ier);
    writeGAirmVGF(&el[*nIn],filename);
    (*nIn)++;
  }
  return el;
}

static VG_DBStruct * buildGAirmZuluVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                  VG_DBStruct *el)
{
  preVGFtag_t pvt;
  int subType,ier;
  G_MALLOC (el, VG_DBStruct, *nIn + 1, "buildGAirmZuluVGF");
  if (strcmp(hazardType,"ICE_SIGMET")==0) {
    el[*nIn].hdr.vg_class=(char) CLASS_MET;
    el[*nIn].hdr.vg_type=(char) GFA_ELM;
    el[*nIn].hdr.grptyp = 8;
    el[*nIn].hdr.grpnum = 0;
    el[*nIn].hdr.delete=0;
    el[*nIn].elem.gfa.info.nblocks=0;
    initPreVGFTag(&pvt);
    strcpy(pvt.gfa_areaType,hazardType);
    strcpy(pvt.gfa_status,"NRML");
    setGAirmGFAIdObsFcst(doc, &pvt, &el[*nIn]);
    sscanf(pvt.gfa_subType, "%d", &subType);
    ces_get(subType, &el[*nIn], &ier);
    setGAirmCommonTags( &el[*nIn], &pvt);
    cvg_setFld (el, "<Type>", "ICE", &ier);
    cvg_setFld (el, "<Severity>",pvt.severity, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_TOP, pvt.gfa_top, &ier);
    cvg_setFld (&el[*nIn], TAG_GFA_BOTTOM, pvt.gfa_bottom, &ier);
    writeGAirmVGF(&el[*nIn],filename);
    (*nIn)++;
  }
  return el;
}

static void setGAirmCommonTags(VG_DBStruct *el, preVGFtag_t *pvt)
/*****************************************************************************
    This routine set up common tags for all GFA elements.  These tags are set via
    the cvg_setFld function.

    setCommonTags(el, pvt)
    Input Parameter
    el           VG_DBStruct *       VGF el structure
  Output parameter:
    pvt          preVGFtag_t *       pre VGF tag

    Log:  L. Hinson 10/07
    L. Hinson 06/08         Add TAG_GFA_CYCLE
*****************************************************************************/
{
  int ier;
  cvg_setFld (el, TAG_GFA_AREATYPE, pvt->gfa_areaType, &ier);
  cvg_setFld (el, TAG_GFA_CYCLE, pvt->gfa_cycle, &ier);
  cvg_setFld (el, TAG_GFA_FCSTHR, pvt->gfa_fcstHr, &ier);
  cvg_setFld (el, TAG_GFA_TAG, pvt->gfa_tag, &ier);
  cvg_setFld (el, TAG_GFA_STATUS, pvt->gfa_status, &ier);
  cvg_setFld (el, TAG_GFA_SUBTYPE, pvt->gfa_subType, &ier);
  cvg_setFld (el, TAG_GFA_LAT, pvt->gfa_lat, &ier);
  cvg_setFld (el, TAG_GFA_LON, pvt->gfa_lon, &ier);
  cvg_setFld (el, TAG_GFA_ARROW_LAT, pvt->gfa_lat, &ier);
  cvg_setFld (el, TAG_GFA_ARROW_LON, pvt->gfa_lon, &ier);
}


static void setGAirmGFAIdObsFcst(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el)
{
  char xpathExpr[MAXST];
  char name[20];
  int seriesnum;
  sprintf(xpathExpr,"/SIGMET/Header/series");
  getInfoStr(doc,xpathExpr,"/@name",name);
  getInfoInt(doc,xpathExpr,"/@number",&seriesnum);
  sprintf(pvt->gfa_tag,"%c%d",name[0],seriesnum);
  setGAirmTimePeriod(doc, pvt, el);
  setGAirmDescFeature(doc, pvt, el);
}

static void setGAirmDescFeature(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el)
{
  char xpathExpr[MAXST];
  char coordStr[512];
  char arealDescription[10];
  float latPts[100];
  float lonPts[100];
  float ernlon=-999.0;
  float ernlat=0.0;
  char top[5], base[5];
  char fltlvl[10];
  int closeFlag=1;
  int np=0;
  int i;
  sprintf(xpathExpr,"/SIGMET/ObsOrFcst");
  getInfoStr(doc,xpathExpr,"/arealDescription/@type",arealDescription);
  closeFlag=0;
  if (strcmp(arealDescription,"Area")==0) closeFlag=1;

  switch(closeFlag) {
    case 1:
      el->hdr.closed = (char) 1;
      strcpy(pvt->contour, "Closed");
      break;
    case 0:
      el->hdr.closed = (char) 0;
      strcpy(pvt->contour, "Open");
      break;
    default:
      el->hdr.closed = (char) 1;
      strcpy(pvt->contour, "Closed");
  }

  getInfoStr(doc,xpathExpr,"/arealDescription/coordinates",coordStr);
  parsePtsToArrayFlt(coordStr,&np,latPts,lonPts);
  el->elem.gfa.info.npts=np;

  for (i=0; i < np; i++) {
    if (lonPts[i] > ernlon) {
      ernlon = lonPts[i];
      ernlat = latPts[i];
    }
    el->elem.gfa.latlon[i] = latPts[i];
    el->elem.gfa.latlon[i+np] = lonPts[i];
  }
  sprintf(pvt->gfa_lat, " %5.2f", ernlat);
  sprintf(pvt->gfa_lon, " %5.2f", ernlon);

  getInfoStr(doc,xpathExpr,"/flt_lvl/@lvl",fltlvl);
  strcpy(base,"SFC");
  if (strstr(fltlvl,"BLW")!=NULL) {
    sscanf(fltlvl,"BLW %s",top);
    strcpy(base,"SFC");
  } else {
    if (strstr(fltlvl,"-")!=NULL) {
      sscanf(fltlvl,"%3s%*c%3s", base, top);
    } else {
      strcpy(top, fltlvl);
    }
  }
  sprintf(pvt->gfa_top,"%3s",top);
  sprintf(pvt->gfa_bottom,"%3s",base);
}

static void parsePtsToArrayFlt(char *coordStr, int *np, float lats[], float lons[]) {
  char *ptr = NULL;
  *np = 0;
  if (strstr(coordStr," ") == NULL) {
    sscanf(coordStr,"%f,%f,%*d",&lons[0],&lats[0]);
    (*np)++;
  } else {
    ptr = strtok(coordStr, " ");
    while (ptr != NULL) {
      sscanf(ptr,"%f,%f,%*d",&lons[*np], &lats[*np]);
      (*np)++;
      ptr=strtok(NULL," ");
    }
  }
}

static void setGAirmTimePeriod(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el)
{
  char xpathExpr[MAXST];
  char validFromTime[21];
  char validUntilTime[21];
  int bhour, bminute, ehour, eminute;
  int catType, hazType;
  sprintf(xpathExpr,"/SIGMET/Header");
  getInfoStr(doc,xpathExpr,"/ValidFrom", validFromTime);
  getInfoStr(doc,xpathExpr,"/ValidUntil", validUntilTime);
  sscanf(validFromTime,"%*4d%*c%*2d%*c%*2d%*c%2d:%2d",&bhour,&bminute);
  sscanf(validUntilTime,"%*4d%*c%*2d%*c%*2d%*c%2d:%2d",&ehour,&eminute);
  strcpy(pvt->gfa_cycle,_cycle);
  sprintf(pvt->gfa_fcstHr, "%02d:%02d-%02d:%02d", bhour, bminute, ehour, eminute);
  catType = GFA_USER_SMEAR;
  if (strcmp(pvt->gfa_areaType,"TURB_SIGMET")==0) {
    hazType = GFA_SIGMET_TURB;
  } else if (strcmp(pvt->gfa_areaType,"ICE_SIGMET")==0) {
    hazType = GFA_SIGMET_ICE;
  } else if (strcmp(pvt->gfa_areaType,"DS_SIGMET")==0) {
    hazType = GFA_SIGMET_DS;
  } else if (strcmp(pvt->gfa_areaType,"SS_SIGMET")==0) {
    hazType = GFA_SIGMET_SS;
  } else if (strcmp(pvt->gfa_areaType,"VASH_SIGMET")==0) {
    hazType = GFA_SIGMET_VASH;
  } else if (strcmp(pvt->gfa_areaType,"TS")==0) {
    hazType = GFA_HAZARD_TS;
  } else {
    hazType = GFA_HAZARD_IFR;
  }
  sprintf(pvt->gfa_subType,"%d", hazType*10 + catType);
}

static void determineCycle(char *validFromDateTime,char *cycle) {
  int hour, minute;
  float vfrom;
  sscanf(validFromDateTime, "%*11d%2d:%2d",&hour, &minute);
  vfrom = hour+minute/60.0;
  if ((vfrom >=20.75 && vfrom < 24.0) || (vfrom >=0.0 && vfrom < 2.75)) {
    strcpy(cycle,"21");
  } else if (vfrom >=2.75 && vfrom < 8.75) {
    strcpy(cycle,"03");
  } else if (vfrom >=8.75 && vfrom <= 14.75) {
    strcpy(cycle,"09");
  } else {
    strcpy(cycle,"15");
  }
}

static void determineBulletinType(char *typeObject, char *bulletinType) {
  strcpy(bulletinType,"UNK");
  if (strcmp(typeObject,"TURB_SIGMET")==0 || strcmp(typeObject,"TB")==0)
    strcpy(bulletinType,"TANGO");
  if (strcmp(typeObject,"ICE_SIGMET")==0  || strcmp(typeObject,"IC")==0)
    strcpy(bulletinType,"ZULU");
  if (strcmp(typeObject,"DS_SIGMET")==0   || strcmp(typeObject,"DS")==0)
    strcpy(bulletinType,"SIERRA");
  if (strcmp(typeObject,"SS_SIGMET")==0   || strcmp(typeObject,"SS")==0)
    strcpy(bulletinType,"SIERRA");
  if (strcmp(typeObject,"VASH_SIGMET")==0 || strcmp(typeObject,"VA")==0)
    strcpy(bulletinType,"SIERRA");
  if (strcmp(typeObject,"TS_SIGMET")==0 || strcmp(typeObject,"TS")==0)
    strcpy(bulletinType,"GFA");
}

static void initPreVGFTag(preVGFtag_t *pvt)
/************************************************************************
    This routine initializes the elements of the pre-VGF tag structure to
    either blank or some common value.

    initPreVGFTag
  Input/Output Parameter:
    pvt     preVGFtag_t  *   Pre-VGF Tag Structure

    Log:  L. Hinson 10/07
************************************************************************/
{
  strcpy(pvt->gfa_subType," 2");
  strcpy(pvt->gfa_areaType,"");
  strcpy(pvt->gfa_lineWidth," 2");  /* 2 for snapshots, 3 for smears */
  strcpy(pvt->gfa_fcstHr,"");
  strcpy(pvt->gfa_tag,"");
  strcpy(pvt->gfa_status,"");
  strcpy(pvt->category,"");
  strcpy(pvt->frequency,"OCNL");
  strcpy(pvt->severity,"MOD");
  strcpy(pvt->contour,"Closed");
  strcpy(pvt->type,"");
  strcpy(pvt->DUE_TO,"");
  strcpy(pvt->gfa_top,"");
  strcpy(pvt->gfa_bottom,"");
  strcpy(pvt->gfa_fzltop,"");
  strcpy(pvt->gfa_fzlbottom,"");
  strcpy(pvt->gfa_fzlrange,"");
  strcpy(pvt->gfa_lineElm,"20");  /* Common amongst most except IFR*/
  strcpy(pvt->gfa_lineType," 1");
  strcpy(pvt->gfa_lat,"");
  strcpy(pvt->gfa_lon,"");
}

static void cvg_crthdr ( VG_DBStruct *el, int np, float *lat, float *lon,
                       int *iret )
/************************************************************************
    * cvg_crthdr                                                           *
    *                                                                      *
    * This function builds common header attributes for an VGF element     *
    *                                                                      *
    * cvg_crthdr ( el, np, lat, lon, iret )                                *
    *                                                                      *
    * Input parameters:                                                    *
    *      *el     VG_DBStruct     pointer to an element structure         *
    *       np     int             number of points                        *
    *      *lat    float           latitude to initialize max/min range    *
    *      *lon    float           longitude to initialize max/min range   *
    *                                                                      *
    * Output parameters:                                                   *
    *      *iret   int             Return code                             *
    *                                                                      *
    **                                                                     *
    * Log:                                                                 *
    * J. Wu/GSC    01/01   Created                                         *
 ***********************************************************************/
{
  int         ii;
  /*---------------------------------------------------------------------*/

  *iret = G_NORMAL;

  cvg_initelm( el );

    /*
  *  Find the maximum and minimum range.
    */
  el->hdr.range_min_lon = lon[0];
  el->hdr.range_min_lat = lat[0];
  el->hdr.range_max_lon = lon[0];
  el->hdr.range_max_lat = lat[0];

  for ( ii = 0; ii < np; ii++ ) {
    if ( el->hdr.range_min_lon > lon[ii] )
      el->hdr.range_min_lon = lon[ii];
    if ( el->hdr.range_min_lat > lat[ii] )
      el->hdr.range_min_lat = lat[ii];
    if ( el->hdr.range_max_lon < lon[ii] )
      el->hdr.range_max_lon = lon[ii];
    if ( el->hdr.range_max_lat < lat[ii] )
      el->hdr.range_max_lat = lat[ii];
  }
}


static void setVGFCycleAndType(char *outputFormatIn, char *cycle, char *airmetType,
                     char *outputFormatStr)
/******************************************************************************
    setCycleAndType

    This routine takes the output format string in outputFormatIn, and
  substitutes the contents of either the cycle airmetType for these string literals:
    '<cycle>' and '<type>', should they exist.
    Output is in outputFormatStr

    void setCycleAndType (outputFormatIn, cycle, airmetType, outputFormatStr)

  Input parameters:
    outputFormatIn    char *    Input Format String
    cycle             char *    Typically will be 03Z, 09Z, 15Z, 21Z
    airmetType        char *    Typically will be TANGO, SIERRA, TANGO
  Output parameters:
    outputFormatStr   char *    Output Format String.
  Log:
    L. Hinson/AWC       01/06     Created

******************************************************************************/
{
  char *ptr=NULL;
  if ((ptr=strstr(outputFormatIn,"<cycle>")) !=NULL) {
    strcpy(outputFormatStr,outputFormatIn);
    outputFormatStr[ptr-outputFormatIn]='\0';
    strcat(outputFormatStr,cycle);
    strcat(outputFormatStr,"Z");
    strcat(outputFormatStr,ptr+7);
    strcpy(outputFormatIn, outputFormatStr);
  }
  if ((ptr=strstr(outputFormatIn,"<type>")) != NULL) {
    strcpy(outputFormatStr,outputFormatIn);
    outputFormatStr[ptr-outputFormatIn]='\0';
    strcat(outputFormatStr,airmetType);
    strcat(outputFormatStr,ptr+6);
  } else {
    strcpy(outputFormatStr,outputFormatIn);
  }
}

static void buildVGFFilenameAndDateStampFmIssTime(char *issTimeStr, char *outputformat,
                                        char *filename, char *dateStamp) {
    /* Routine uses issue time for setting file name.
       System time (gmtime) is used for the datestamp that gets set in
       the creation of the BUFR message to */
                                          int year, month, day, hr, min;
#ifdef Linux
    struct tm trec = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '\0'};
#else
    struct tm trec = {0, 0, 0, 0, 0, 0, 0, 0, 0};
#endif
    time_t rawtime;
    struct tm *timeinfo;
    sscanf(issTimeStr,"%4d%*c%2d%*c%2d%*c%2d:%2d", &year, &month, &day, &hr,
           &min);
    trec.tm_year=year-1900;
    trec.tm_mon=month-1;
    trec.tm_mday=day;
    trec.tm_hour=hr;
    trec.tm_min=min;
    strftime(filename,MAXST,outputformat,&trec);
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    strftime(dateStamp,MAXST,"%Y%m%d_%H%M",timeinfo);
    printf("gmtime timestamp=%s\n",dateStamp);
}

