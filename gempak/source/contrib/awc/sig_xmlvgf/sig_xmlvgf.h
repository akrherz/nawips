/*****************************************************************************
 Header file for sig_xmlvgf Software.

 Purpose:  Define structures and prototype declarations for sig_xmlvgf.c

 Log: L. Hinson/AWC      05/09    Created
                         02/10    Updated for GEMPAK Release
*****************************************************************************/
#include <stdio.h>
#include <libxml/xpath.h>
#include "afbufr_common.h"
#define BUFR_MISSING_VALUE -999999.
enum GFADesignator {SIERRA, TANGO, ZULU, GFA};
enum GFATypes {IFR, IFR_CIG, IFR_VIS,
  MT_OBSC, TURB, TURB_HI, TURB_LO, TURB_SIGMET, SFC_WND, LLWS,
  ICE, ICE_SIGMET, FZLVL, M_FZLVL, TS_SIGMET};
#define numGFADesig 4
#define numGFATypes 15
char *GFADesignatorNames[] = {"SIERRA","TANGO","ZULU","GFA"};
char *GFATypeNames[] = {"IFR", "IFR_CIG", "IFR_VIS", "MT_OBSC",
  "TURB", "TURB-HI", "TURB-LO", "TURB_SIGMET", "SFC_WND", "LLWS",
  "ICE", "ICE_SIGMET", "FZLVL", "M_FZLVL", "TS_SIGMET" };

typedef struct {
  char gfa_subType[4];
  char gfa_areaType[STD_STRLEN];
  char gfa_lineWidth[3];
  char gfa_cycle[3];
  char gfa_fcstHr[STD_STRLEN];
  char gfa_tag[25];
  char gfa_status[5];
  char category[5];
  char frequency[5];
  char severity[5];
  char contour[7];
  char level[4];
  char type[STD_STRLEN];
  char DUE_TO[STD_STRLEN];
  char gfa_top[5];
  char gfa_bottom[5];
  char gfa_fzltop[5];
  char gfa_fzlbottom[5];
  char gfa_fzlrange[STD_STRLEN];
  char gfa_lineElm[32];
  char gfa_lineType[32];
  char gfa_lat[20];
  char gfa_lon[20];
} preVGFtag_t;

static void create_isig_gairm_vgf(char *rawdoc, int size, char *outputFormatVGF);
static void createGAirmVGF(xmlDocPtr doc, enum GFADesignator GFADesignatorType, char *cycle, char *typeobject, char *vgffilename);
static void writeGAirmVGF(VG_DBStruct *el, char *fname);
static VG_DBStruct * buildGAirmSierraVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                    VG_DBStruct *el);
static VG_DBStruct * buildGAirmTangoVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                   VG_DBStruct *el);
static VG_DBStruct * buildGAirmZuluVGF( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                  VG_DBStruct *el);
static VG_DBStruct * buildGfaVGF ( xmlDocPtr doc, char *filename, char *hazardType, int *nIn,
                                  VG_DBStruct *el);
static void setGAirmCommonTags(VG_DBStruct *el, preVGFtag_t *pvt);
static void setGAirmGFAIdObsFcst(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el);
static void setGAirmDescFeature(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el);
static void setGAirmTimePeriod(xmlDocPtr doc, preVGFtag_t *pvt, VG_DBStruct *el);
static void determineCycle(char *validFromDateTime,char *cycle);
static void determineBulletinType(char *typeObject, char *bulletinType);
static void initPreVGFTag(preVGFtag_t *pvt);

static void cvg_crthdr ( VG_DBStruct *el, int np, float *lat, float *lon,
                           int *iret );
static void convertType(char *shortname, char *longname);
static void parsePtsToArrayFlt(char *coordStr, int *np, float lats[], float lons[]);
static void setVGFCycleAndType(char *outputFormatIn, char *cycle, char *airmetType,
                     char *outputFormatStr);
static void buildVGFFilenameAndDateStampFmIssTime(char *issTimeStr, char *outputformat,
                                        char *filename, char *dateStamp);
