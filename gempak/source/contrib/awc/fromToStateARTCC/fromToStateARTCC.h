#include "geminc.h"
#include "gemprm.h"

/*****************************************************************************
Header File for fromToStateARTCC Software.
Purpose:  Define structures & function proto-types for application.
Log: L. Hinson/AWC    05/09 Created
                      01/10 Updated for GEMPAK Release
*****************************************************************************/

typedef struct {
  char vorid[5];
  float lat;
  float lon;
} vor_record;

typedef struct {
  float lat;
  float lon;
} coord_point;

static int loadVorTable(vor_record vortable[]);
static int splitpoints(char *str, char *delimiter, char vorpoints[][15]);
static char *trim_spaces(char *str);
static void reorderpoints(int count, float *lat, float *lon, float *rlat, float *rlon);
static void xlateVorToLatLon(char varpointrefs[][15], int count,
     vor_record vortable[], int vor_count, float lats[], float lons[]);
static int getindex(char *vorid, vor_record vortable[], int vor_count);
static void computenewlatlon(float *lat, float *lon, int *radius, char *compassdir,
                      float *newlat, float *newlon);
static void obtainStates(float *lat, float *lon, int *npoints, char *state_list);
static void obtainARTCCs(float lat[], float lon[], int *npoints, char *artcc_list);
