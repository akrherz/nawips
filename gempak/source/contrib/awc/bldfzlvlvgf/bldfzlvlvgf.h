#include "geminc.h"
#include "gemprm.h"
#include "vgstruct.h"
#include "vgtag.h"
#include "drwids.h"

/******************************************************************************
 Header File for Build Freezing Level VGF Software
 Purpose: Define structures to store Freezing Level/Multi-Freezing Level Info.
          Define Function Prototypes
 Log: L. Hinson/AWC   12/06   Created
                      01/10   Updated for GEMPAK Release
******************************************************************************/
 
typedef struct {
  float lat;
  float lon;
} Location;

typedef struct {
  char type;
  char style;
  char base[4];
  char top[4];
  char lvl[4];
  char fcstHr[5];
  char tag[2];
  char desk;
  char issType[4];
  int numlocs;
  Location *location;
} record_t;

typedef struct {
  char gfa_subType[4];
  char gfa_areaType[STD_STRLEN];
  char gfa_lineWidth[3];
  char gfa_fcstHr[STD_STRLEN];
  char gfa_tag[6];
  char gfa_status[5];
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
  char gfa_lineElm[32];
  char gfa_lineType[32];
  char gfa_lat[20];
  char gfa_lon[20];
} preVGFtag_t;

static void parselatlon(char *instr, record_t *rec, int *num);
static void createVGF(record_t *rec, int numrecs, char *filename);
static void writeVGF(VG_DBStruct *el, preVGFtag_t *pvt, char *fname);
static void buildFrzLvl(record_t *rec,char *fname, VG_DBStruct *el, preVGFtag_t *pvt);
static void initPreVGFTag(preVGFtag_t *pvt);
static void setCommonTags(VG_DBStruct *el, preVGFtag_t *pvt);
static void cvg_crthdr ( VG_DBStruct *el, int np, float *lat, float *lon,
                  int *iret );
