#include "geminc.h"
#include "gemprm.h"
#include "bldfzlvlvgf.h"
#include <stdio.h>
#include <string.h>
/****************************************************************************
   bldfzlvl.c

   Purpose:  This software is used in the process of rendering Freezing Level 
             Graphics derived from AIRMET text.  It will decode an ascii input 
             file consisting of freezing levels and multiple freezing level 
             information. Outputs a VGF file representation of freezing level 
             info. 
             
   Input File Format: %c|%c|%3s|%3s|%3s|%3s|%1s|%c|%3s|%f,%f %f,%f ...
                      Type|Style|Base|Top|Level|FcstHr|Tag|Desk|IssType|Lat,Lon ...
                      M/F   C/O  SFC/ 999/ SFC/  0-6   1   E/C/ COR/AMD/ 99.99,199.99
                                 999  XXX  999/            W    NRM
                                 XXX       XXX
                                 
   Output File: VGF File with GFA FZLVL/M_FZLVL Objects.

   Usage: bldfzlvlvgf -i <inputfile> -o <outputfile>
          cat <inputfile>|bldfzlvl -i - -o <outputfile>
          
   Contents:
   main
   
   createVGF
   buildFrzLvl
   writeVGF
   setCommonTags
   initPreVGFTag
   cvg_crthdr
   parselatlon
   
   Log: Larry J. Hinson, AWC 12/06   Created
        L. Hinson             1/10   Updated for Initial GEMPAK release
*******************************************************************************/

int main(int argc, char *argv[]) {
  char infilename[256];
  char outfilename[256];
  char linein[64000];
  char *ptr;
  int i;
  int infileset=False, outfileset=False;
  FILE *filein;
  record_t *rec;
  int num_points;
  int numrecs=0;

  static char usageString[] = "Usage: bldfzlvlvgf -i <inputfile> -o <outputfile>\n"
                              "       cat inputfile|bldfzlvlvgf -i - -o <outputfile>\n";
  for (i=0; i < argc; i++) {
    if (strcmp(argv[i],"-h")==0) {
      printf(usageString);
    }
    if (strcmp(argv[i],"-i")==0) {
      strcpy(infilename, argv[i+1]);
      infileset=True;
    }
    if (strcmp(argv[i],"-o")==0) {
      strcpy(outfilename, argv[i+1]);
      outfileset=True;
    }
  }
  if (! infileset) {
    printf(usageString);
    exit(1);
  }
  if (! outfileset) {
    printf(usageString);
    exit(1);
  }
  if (strcmp(infilename,"-")==0)
    filein=stdin;
  else
    if ((filein=fopen(infilename,"rt"))==NULL) {
      printf("Cannot open %s \n",infilename);
      exit(1);
    }
  ;
  while (fgets(linein,64000,filein)!=NULL) {
    if (strlen(linein) > 27) {
      /* Malloc Freezing Level Rec */
      if (numrecs == 0) {
        G_MALLOC( rec, record_t, numrecs+1,"buildRec");
      } else {
        G_REALLOC (rec, record_t, numrecs+1,"buildRec");
      }
      /*parse the line to basic component structure */
      sscanf(linein,"%c|%c|%3s|%3s|%3s|%3s|%1s|%c|%3s",
                    &rec[numrecs].type, &rec[numrecs].style, rec[numrecs].base,
                    rec[numrecs].top, rec[numrecs].lvl, rec[numrecs].fcstHr,
                    rec[numrecs].tag, &rec[numrecs].desk, rec[numrecs].issType);
      if ((ptr=strrchr(linein,'|'))==NULL) {
        printf("Problem finding last '|' character\n");
        return 1;
      }
      parselatlon(ptr+1,&rec[numrecs],&num_points);
      rec[numrecs].numlocs=num_points;
      numrecs++;
    }
  }
  /* Records Created... Now Build VGF file... */
  createVGF(rec,numrecs,outfilename);
  for (i=0; i < numrecs; i++)
    G_FREE( rec[i].location, Location);
  if (numrecs > 0)
    G_FREE( rec, record_t);
  return 0;
}

static void createVGF(record_t *rec, int numrecs, char *filename)
{
  preVGFtag_t pvt;
  long fsize;
  VG_DBStruct el;
  char newfile[256];
  int i, ier, iret;
  /*Load The Settings Table */
  ces_rtbl(&iret);
  /* Question Existence of File- If exists, remove */
  cfl_inqr(filename, NULL, &fsize, newfile, &ier);
  if (ier < 0) {
    cvg_crvgf(filename, &ier);
  } else {
    remove(filename);
    cvg_crvgf(filename, &ier);
  }
  for (i=0; i < numrecs; i++) {
    el.hdr.vg_class = (char) CLASS_MET;
    el.hdr.vg_type = (char) GFA_ELM;
    el.hdr.grptyp = 8;
    el.hdr.grpnum = 0;
    el.elem.gfa.info.nblocks=0;
    initPreVGFTag(&pvt);
    buildFrzLvl(&rec[i],filename,&el, &pvt);
    writeVGF(&el, &pvt, filename);
  }
}

static void buildFrzLvl(record_t *rec,char *fname, VG_DBStruct *el, preVGFtag_t *pvt)
{
  int i, subType, catType, hazType, np, ier;
  float ernlon=-999.0;
  float ernlat=0.0;
  if (rec->type == 'F')
    strcpy(pvt->gfa_areaType,"FZLVL");
  else
    strcpy(pvt->gfa_areaType,"M_FZLVL");
  if (strcmp(rec->issType,"NRM")==0)
    strcpy(pvt->gfa_status,"NRML");
  else
    strcpy(pvt->gfa_status,rec->issType);          /* Set Product Status */

  sprintf(pvt->gfa_tag,"%s%c",rec->tag,rec->desk); /* Set the sequence id */
  strcpy(pvt->gfa_fcstHr, rec->fcstHr);            /* Set the forecast time */
  catType = GFA_USER_SMEAR;
  if (rec->type == 'F') {
    if (strcmp(rec->lvl,"SFC")==0)
      hazType = GFA_HAZARD_FZLVL_SFC;
    else
      hazType = GFA_HAZARD_FZLVL;
  } else {
    hazType = GFA_HAZARD_M_FZLVL;
  }
  sprintf(pvt->gfa_subType, "%d", hazType*10 + catType); /* Compute the Subtype */
  if (rec->style == 'O') {                            /*Set Open/Closed ontour)*/
    el->hdr.closed = (char) 0;
    strcpy(pvt->contour,"Open");
  } else {
    el->hdr.closed = (char) 1;
    strcpy(pvt->contour,"Closed");
  }
  np = rec->numlocs;                                    /* Process Lat/Lon Points */
  el->elem.gfa.info.npts = np;
  for (i = 0; i < np; i++) {
    if (rec->location[i].lon > ernlon) {
      ernlon=rec->location[i].lon;
      ernlat=rec->location[i].lat;
    }
    el->elem.gfa.latlon[i]=rec->location[i].lat;
    el->elem.gfa.latlon[i+np]=rec->location[i].lon;
  }
  sprintf(pvt->gfa_lat," %5.2f", ernlat);              /* Set Text Label Location */
  sprintf(pvt->gfa_lon," %5.2f", ernlon);
  strcpy(pvt->gfa_bottom, rec->base);
  strcpy(pvt->gfa_top, rec->top);
  strcpy(pvt->level, rec->lvl);
  sscanf(pvt->gfa_subType, "%d", &subType);
  ces_get(subType, el, &ier);
  el->hdr.grptyp = 8;
  setCommonTags( el, pvt );
  cvg_setFld (el, "<Contour>",pvt->contour, &ier);
  if (rec->type == 'F')
    cvg_setFld (el, "<Level>",pvt->level, &ier);
  else {
    cvg_setFld (el, TAG_GFA_TOP, pvt->gfa_top, &ier);
    cvg_setFld (el, TAG_GFA_BOTTOM, pvt->gfa_bottom, &ier);
  }
}

static void writeVGF(VG_DBStruct *el, preVGFtag_t *pvt, char *fname) {
  int start=-1, np, ier, loc;
  el->hdr.filled = (char) 0;
  el->hdr.smooth = (char) 0;
  np=el->elem.gfa.info.npts;
  cvg_crthdr(el, np, el->elem.gfa.latlon, el->elem.gfa.latlon+np, &ier);
  el->hdr.recsz = (int) ( sizeof(VG_HdrStruct) + sizeof(int) * 2 +
      sizeof(char) * STD_STRLEN * el->elem.gfa.info.nblocks ) +
      sizeof(float) * np * 2;
  cvg_writefD(el, start, el->hdr.recsz, fname, &loc, &ier );
  cvg_freeElPtr ( el );
}

static void setCommonTags(VG_DBStruct *el, preVGFtag_t *pvt) {
  int ier;
  cvg_setFld (el, TAG_GFA_AREATYPE, pvt->gfa_areaType, &ier);
  cvg_setFld (el, TAG_GFA_FCSTHR, pvt->gfa_fcstHr, &ier);
  cvg_setFld (el, TAG_GFA_TAG, pvt->gfa_tag, &ier);
  cvg_setFld (el, TAG_GFA_STATUS, pvt->gfa_status, &ier);
  cvg_setFld (el, TAG_GFA_SUBTYPE, pvt->gfa_subType, &ier);
  cvg_setFld (el, TAG_GFA_LAT, pvt->gfa_lat, &ier);
  cvg_setFld (el, TAG_GFA_LON, pvt->gfa_lon, &ier);
}

static void initPreVGFTag(preVGFtag_t *pvt)
{
  strcpy(pvt->gfa_subType," 2");
  strcpy(pvt->gfa_areaType,"");
  strcpy(pvt->gfa_lineWidth," 1");  /* 2 for snapshots, 3 for smears */
  strcpy(pvt->gfa_fcstHr,"");
  strcpy(pvt->gfa_tag,"");
  strcpy(pvt->gfa_status,"");
  strcpy(pvt->frequency,"OCNL");
  strcpy(pvt->severity,"MOD");
  strcpy(pvt->contour,"Closed");
  strcpy(pvt->type,"");
  strcpy(pvt->DUE_TO,"");
  strcpy(pvt->gfa_top,"");
  strcpy(pvt->gfa_bottom,"");
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

static void parselatlon(char *instr, record_t *rec, int *num) {
  char *ptr=instr;
  char *token;
  int num_tokens=0;
  float lat,lon;
  token=strtok(ptr, " ");
  while(token != NULL) {
    sscanf(token, "%f,%f",&lat,&lon);
    if (num_tokens==0) {
      G_MALLOC(rec->location, Location, num_tokens+1,"Location");
    } else {
      G_REALLOC(rec->location, Location, num_tokens+1,"Location");
    }
    rec->location[num_tokens].lat=lat;
    rec->location[num_tokens].lon=lon;
    num_tokens++;
    token = strtok(NULL, " " );
  }
  *num=num_tokens;
}
