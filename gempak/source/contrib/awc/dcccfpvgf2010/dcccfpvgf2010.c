#include "geminc.h"
#include "gemprm.h"
#include "vgstruct.h"
#include "drwids.h"
#include "pgprm.h"
#include <stdio.h>
#include <math.h>
#include <time.h>

/* Software: dcccfpvgf2010.c
    Purpose: Decodes raw CCFP coded messages and renders them into VGF files
     which are renderable into GIF Images with variable-filled polygons,
	 text attribute boxes, line connectors from the polygon to text attribute
	 box, and a motion vector with a speed.
    The software also renders CCFP messages issued from Canada into editable
      VGF files.
	 
   	This software takes advantage of the CCF object rendering defined in
        GEMPAK code. 
	
	For a Null CCFP Issuance, a VGF file with just a header is generated.
    
    Usage: dcccfpvgf -i <filename> <-o output format string> 
           <-noccfpcoords 99.9 -999.9>
           <-nocanccfp> <-vgfforops> <-oldformat>
    -i = input filename
    -o = output filename;default format when -o omitted "%Y%m%d_%H_F%f_fcst.vgf"
    -noccfpcoords - Coordinate for NO CCFP Expected to Meet Criteria Msg
    -nocanccfp - No Canada CCFP Msg.
    -vgfforops - Build VGFs for Operational Use (No Criteria Msg omitted)
    -oldformat - Read 5.11.3- CCFP Message Format. (No Line Coverage)
    For Piping in data from stdin, use: cat <filename> | dcccfpvgf2010 -i -
      where the "-" is the identifier for stdin.
	 where "output format string" is filename format. Default is 
	   %Y%m%d_%H_F%f_fcst.vgf
           
   Output:
   The original CCFP message consists of 3 forecast periods.  Therefore, 3 VGF
   files are generated as output.  CCFP messages may be for 1 forecast
   period.  Default output filenames will be set by the default format string 
   %Y%m%d_%H_F%f_fcst.vgf consisting of the Year, month, day, and issuance hour. 
   The valid time %f will be designated as 02 04 or 06, obtained by 
   differentiating the issue and valid times encoded within the CCFP message.

Log:
   L. Hinson/AWC    07/09   Created
   L. Hinson/AWC    04/10   Changed Grptyp writes for Areas/Lines to 8 (LABEL)
                            The previous number of '97' for GRPTYP_CCF created
                            problems when editing VGF files containing only 1
                            CCF area, with placement turned on.  
*******************************************************************************/


static void cvg_crthdrcolor ( VG_DBStruct *el, int np, float *lat, float *lon,
  int major, int minor, int grouptype, int groupnumber, int *iret );

static char * getpos(char *rec, int pos, char *delimiter);

static void getlatlonarrayandTBIfNeeded(char *start, int numpoints, float lat[],
   float lon[], int TBneeded, float *tblat, float *tblon);

static void GenPlVGFLine(char *outfilename, int color, int type, int numvertices, float lat[], float lon[]);

static void GenPlVGFArea(char *outfilename,int coverage,int prob,int growth,int tops,
   int speed, int dir, int numvertices,float lat[],float lon[],
   float leftcentertextlat, float leftcentertextlon);

static void GenVGFLine(char *outfilename,int color,int type,int numvertices, float lat[], float lon[]);

static void GenNoCCFPCritMsg(char *lastoutfilename,float noccfplat,float noccfplon);

static void GenNoCanCCFPMsg(char *lastoutfilename, float lat1, float lon1);

static void GenTestMsg(char *lastoutfilename, char *testmsg, float lat1, float lon1);

int main(int argc, char *argv[]) {

  static char usageString[] = "Usage: dcccfpvgf2010 -i <filenamein> [-o formatstring]"
                              " [-oldformat] [-nocccfpcoords lat lon] [-vgfforops]\n";
  char arearec[100][1000];  /* 100 Areas */
  char linerec[100][1000];  /* 100 Lines */
  char areafile[100][FILE_FULLSZ];
  char linefile[100][FILE_FULLSZ];

  char infilename[FILE_FULLSZ];
  char outfilename[FILE_FULLSZ];
  char lastoutfilename[FILE_FULLSZ];
  float latw[100];
  float lonw[100];
  int i;
  char rec[1000];
  FILE *filein;
  char *ptr;
  int infileset=0;
  int outputformatset=0;
  char header[5], isstime[15], valtime[15];
  int iyear,imonth,iday,ihour,vyear,vmonth,vday,vhour;
  int coverage,prob,growth,tops,speed,dir,numpoints;
  float tblat, tblon;
  char *ptrto8thfieldinrec;
  char *ptrto2ndfieldinrec;
  int ier;
  char newfil[256];
  long fsize;
  int TextBoxNeeded=0;
  char outputformat[100];
  #ifdef Linux
    struct tm trec = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '\0'};
  #else
    struct tm trec = {0, 0, 0, 0, 0, 0, 0, 0, 0};
  #endif
  int hrdiff;
  float canlats[]={ 48.0, 48., 48., 48., 48., 48., 48.0, 47.35};
  float canlons[]={-90.0,-87.,-85.,-80.,-75.,-70.,-68.5,-68.50};
  char fstr[80];
  float noccfplat=38.0,noccfplon=-117.5;
  float noccfpcanlat=46.5,noccfpcanlon=-85.2;
  float testlat=22.8,testlon=-123.0;
  int firstccfp=0,areafound=0,linefound=0,oldformatsw=0, nocanccfpsw=0;
  int vgfforopssw=0;
  int areacount=0, linecount=0;
  int pconf, pcvg;
  int iret;

  for (i=0; i < argc; i++) {
    if (strcmp(argv[i], "-h") == 0) {
      printf("%s",usageString);
    }
    if (strcmp(argv[i],"-i")==0) {
      strcpy(infilename,argv[i+1]);
      infileset=-1;
    }
    if (strcmp(argv[i],"-o")==0) {
      strcpy(outputformat,argv[i+1]);
      outputformatset=-1;
    }
    if (strcmp(argv[i],"-noccfpcoords")==0) {
      sscanf(argv[i+1],"%f",&noccfplat);
      sscanf(argv[i+2],"%f",&noccfplon);
    }
    if (strcmp(argv[i],"-nocanccfp")==0) {
      nocanccfpsw=-1;
    }
    if (strcmp(argv[i],"-vgfforops")==0) {
      vgfforopssw=-1;
    }
    if (strcmp(argv[i],"-oldformat")==0) {
      oldformatsw=-1;
    }
  }
  if (! infileset) {
    printf("%s",usageString);
    exit(1);
  }
  /* Load up Settings Table */
  ces_rtbl(&iret);
  if (! outputformatset)
    strcpy(outputformat,"%Y%m%d_%H_F%f_fcst.vgf");
  if (strcmp(infilename,"-")==0)
    filein=stdin;
  else
    if ((filein=fopen(infilename,"rt"))==NULL) {
          printf("Cannot open %s \n",infilename);
          exit(1);
    }
  ;
  areafound=-1;linefound=-1;
  firstccfp=-1;

  while (fgets(rec,500,filein)!=NULL) {
    TextBoxNeeded=0;
    if (strstr(rec," TEST ") != 0) {
      GenTestMsg(lastoutfilename,rec,testlat,testlon);
    }
    if (strncmp(rec,"CCFP",4) == 0) {
      if (! firstccfp) {
        if (! vgfforopssw) {
          if (! areafound && ! linefound) {
                GenNoCCFPCritMsg(lastoutfilename,noccfplat,noccfplon);
          }
          if ( nocanccfpsw ) {
            GenNoCanCCFPMsg(lastoutfilename,noccfpcanlat,noccfpcanlon);
          }
        }
      }
      firstccfp=0;
      areafound=0; linefound=0;
      sscanf(rec,"%s %s %s",header,isstime,valtime);
      sscanf(isstime,"%4d%2d%2d_%2d%*2d",&iyear,&imonth,&iday,&ihour);
      sscanf(valtime,"%4d%2d%2d_%2d%*2d",&vyear,&vmonth,&vday,&vhour);
      /* Info obtained...recreate file format name */
      /* Decide if 2-hour, 4-hour, or 6-hour forecast */
      hrdiff=vhour-ihour;
      if (hrdiff<0) {
        hrdiff=24-ihour+vhour;
      }
      trec.tm_year=iyear-1900;
      trec.tm_mon=imonth-1;
      trec.tm_mday=iday;
      trec.tm_hour=ihour;
      if (mktime(&trec)==-1)
        trec.tm_wday=7;
      strftime(outfilename,100,outputformat,&trec);
      if ((ptr=strstr(outfilename,"%f"))!=NULL) {
        sprintf(fstr,"%s%s","%02d",ptr+2);
        sprintf(ptr,fstr,hrdiff);
      }
      strcpy(lastoutfilename,outfilename);
      cfl_inqr(outfilename, NULL, &fsize,newfil,&ier);
      if (ier < 0) {
        cvg_crvgf(outfilename, &ier);
      }
      if (! vgfforopssw) {
        /* Generate Border in Canada.  Blue changed to gray */
        GenVGFLine(outfilename,25,8,8,canlats,canlons);
      }
    }
    if (strstr(rec,"AREA") != 0) {
      areafound = -1;
      /* Copy area to area array */
      strcpy(arearec[areacount],rec);
      strcpy(areafile[areacount],outfilename);
      areacount++;
    }
    if (strstr(rec,"LINE") != 0) {
      linefound = -1;
      strcpy(linerec[linecount],rec);
      strcpy(linefile[linecount],outfilename);
      linecount++;
    }
  }
  if ( nocanccfpsw && ! vgfforopssw) {
     GenNoCanCCFPMsg(lastoutfilename,noccfpcanlat,noccfpcanlon);
  }
  if (! areafound && ! linefound && ! vgfforopssw) {
     GenNoCCFPCritMsg(lastoutfilename,noccfplat,noccfplon);
  }
  fclose(filein);
  if (areacount > 0) {
    /* Render Low Confidence, Low/Med/High Coverage areas */
    /* Render High Confidence, Low/Med/High Coverage areas */
    for (pconf = 3; pconf >=1; pconf-=2) {
      for (pcvg = 3; pcvg >= 1; pcvg--) {
        for (i = 0; i < areacount; i++) {
          sscanf(arearec[i], "AREA %d %d %d %d %d %d %d", &coverage, &prob, &growth,
               &tops, &speed, &dir, &numpoints);
           /* Render Low Coverage First */
          if (prob == pconf && coverage == pcvg ) {
            ptrto8thfieldinrec=getpos(arearec[i],8," ");
            TextBoxNeeded=-1;
            getlatlonarrayandTBIfNeeded(ptrto8thfieldinrec,numpoints,latw,lonw,
                TextBoxNeeded,&tblat,&tblon);
            GenPlVGFArea(areafile[i],coverage,prob,growth,tops,speed,dir,numpoints,
               latw,lonw,tblat,tblon);
          }
        }
      }
    }
  }
  if (linecount > 0) {
    linefound = -1;
    TextBoxNeeded=0;
    for (i = 0; i < linecount; i++) {
      if (oldformatsw) {
        sscanf(linerec[i],"LINE %d", &numpoints);
        ptrto2ndfieldinrec=getpos(linerec[i],2," ");
        coverage = 1;
      } else {
        sscanf(linerec[i],"LINE %d %d", &coverage, &numpoints);
        ptrto2ndfieldinrec=getpos(linerec[i],3," ");
      }
      getlatlonarrayandTBIfNeeded(ptrto2ndfieldinrec,numpoints,latw,lonw,
            TextBoxNeeded,&tblat,&tblon);
      GenPlVGFLine(linefile[i],28,coverage,numpoints,latw,lonw);
    }
  }
  return 0;
}

static void GenPlVGFLine(char *outfilename, int color, int type, int numvertices, float lat[], float lon[]) {
  VG_DBStruct el;
  int grpnum, ii, np, start, loc, ier;
  el.hdr.vg_class = CLASS_SIGMETS;
  el.hdr.vg_type = SIGCCF_ELM;
  if (type == 1)  {
    el.elem.ccf.info.subtype = SIGTYP_LINE_HIGH;
    ces_get (SIGTYP_LINE_HIGH, &el, &ier);
  } else {
    el.elem.ccf.info.subtype = SIGTYP_LINE_MED;
    ces_get (SIGTYP_LINE_MED, &el, &ier);
  }
  el.hdr.grptyp = GRPTYP_CCF;
  crg_ggnxt (GRPTYP_CCF, &grpnum, &ier);
  el.hdr.grpnum = grpnum;
  el.hdr.closed=0;
  el.hdr.filled=0;
  el.hdr.smooth=0;
  el.elem.ccf.info.cover = 0;
  el.elem.ccf.info.tops = 0;

  el.elem.ccf.info.prob = 0;
  el.elem.ccf.info.growth = 0;
  el.elem.ccf.info.spd = 0.0;
  el.elem.ccf.info.dir = 0.0;

  /* Write Polygon */
  start = -1;
  np = numvertices;
  el.elem.ccf.info.npts = np;
  el.hdr.recsz = (sizeof (VG_HdrStruct) + sizeof (CCFType));

  for ( ii = 0; ii < np; ii++ ) {
      el.elem.ccf.latlon[ii]    = lat[ii];
      el.elem.ccf.latlon[ii+np] = lon[ii];
  }
  cvg_crthdrcolor(&el, np, lat, lon, color, color, 8, grpnum, &ier);
  cvg_writefD( &el, start, el.hdr.recsz, outfilename, &loc, &ier );
}

static void GenPlVGFArea(char *outfilename, int coverage,int prob,int growth,int tops,
   int speed, int dir, int numvertices,float lat[],float lon[],
   float leftcentertextlat, float leftcentertextlon) {
   VG_DBStruct el;
   int grpnum, start, np, ii, loc, ier;
   float sumlat, sumlon;


   /* Initialize el Structure */
   el.hdr.vg_class = CLASS_SIGMETS;
   el.hdr.vg_type = SIGCCF_ELM;
   el.elem.ccf.info.subtype = SIGTYP_AREA;

   ces_get (SIGTYP_AREA, &el, &ier);

   el.hdr.grptyp = GRPTYP_CCF;

   crg_ggnxt (GRPTYP_CCF, &grpnum, &ier);
   el.hdr.grpnum = grpnum;

   /* Fill out rest of el structure */
   np = numvertices;
   
   el.hdr.closed = 1;
   el.elem.ccf.info.textlat = leftcentertextlat;
   el.elem.ccf.info.textlon = leftcentertextlon;
   
   /* Compute a centroid */
   sumlat=sumlon=0.0;
   for (ii =0; ii < (np - 1); ii++) {
     sumlat+=lat[ii];
     sumlon+=lon[ii];
   }   
   el.elem.ccf.info.arrowlat = sumlat/(np-1);
   el.elem.ccf.info.arrowlon = sumlon/(np-1);

   switch (coverage) {
     case 1:
       el.hdr.filled = el.elem.ccf.info.fillhi;
       break;
     case 2:
       el.hdr.filled = el.elem.ccf.info.fillmed;
       break;
     case 3:
       el.hdr.filled = el.elem.ccf.info.filllow;
       break;
     default:
       el.hdr.filled = el.elem.ccf.info.filllow;
       break;
   }
   switch (prob) {
     case 1:
       el.hdr.min_col = el.hdr.maj_col;
       break;
     case 3:
       el.hdr.maj_col = el.hdr.min_col;
       break;
     default:
       el.hdr.maj_col = el.hdr.min_col;
       break;
   }
   el.elem.ccf.info.cover = coverage;
   el.elem.ccf.info.tops = tops;

   el.elem.ccf.info.prob = prob;
   el.elem.ccf.info.growth = growth;
   el.elem.ccf.info.spd = (float)speed;
   el.elem.ccf.info.dir = (float)dir;
   /* Write Polygon */
   start = -1;
   
   el.elem.ccf.info.npts = np;
   el.hdr.recsz = (sizeof (VG_HdrStruct) + sizeof (CCFType));

   for ( ii = 0; ii < np; ii++ ) {
     el.elem.ccf.latlon[ii] = lat[ii];
     el.elem.ccf.latlon[ii+np] = lon[ii];
   }

   cvg_crthdrcolor( &el, np, lat, lon, el.hdr.maj_col, el.hdr.min_col,
                    8, grpnum, &ier);
   cvg_writefD( &el, start, el.hdr.recsz, outfilename, &loc, &ier );
}

static void GenTestMsg(char *lastoutfilename, char *testmsg, float lat1, float lon1) {
       int np, start, loc, ier, lens;
       char text[120];
       VG_DBStruct el;
       float lat[1],lon[1];
       char *ptr;
       lat[0]=lat1;
       lon[0]=lon1;
       ptr=strstr(testmsg,"MESSAGE");
       if (ptr!=0) {
         strncpy(text,testmsg,(int)(ptr-testmsg));
         text[ptr-testmsg+1]='\0';
         strcat(text,"IMAGE");
         strcat(text,ptr+7);
       }
       start=-1;
       np=1;
       el.hdr.vg_class=CLASS_TEXT;
       el.hdr.vg_type=(char)SPTX_ELM;
       el.elem.spt.info.lat=lat[0];
       el.elem.spt.info.lon=lon[0];
       el.elem.spt.info.offset_x=0;
       el.elem.spt.info.offset_y=0;
       el.elem.spt.info.ialign=-1;
       el.elem.spt.info.rotn=0;
       el.elem.spt.info.sztext=1.4;
       el.elem.spt.info.sztext=1.5;
       el.elem.spt.info.itxfn=22;
       el.elem.spt.info.itxfn=10;
       el.elem.spt.info.ithw=1;
       el.elem.spt.info.iwidth=2;
       el.elem.spt.info.txtcol=14;
       el.elem.spt.info.lincol=2;
       el.elem.spt.info.filcol=1;
       el.elem.spt.info.sptxtyp=0;
       el.elem.spt.info.turbsym=0;
       /*sprintf(text,"%s",testmsg);*/
       lens=(int)strlen(text);
       strcpy(el.elem.spt.text,text);
       el.hdr.recsz = (int)( sizeof(VG_HdrStruct) +
                     sizeof(SpTextInfo) + (size_t)lens + 1 ) ;
       cvg_crthdrcolor( &el, np, lat, lon, 2, 2, 0, 1, &ier);
       cvg_writefD( &el, start, el.hdr.recsz, lastoutfilename, &loc, &ier );
}

static void GenNoCanCCFPMsg(char *lastoutfilename, float lat1, float lon1) {
       int np, start, loc, ier, lens;
       char text[120];
       VG_DBStruct el;
       float lat[1],lon[1];
       lat[0]=lat1;
       lon[0]=lon1;
       start=-1;
       np=1;
       el.hdr.vg_class=CLASS_TEXT;
       el.hdr.vg_type=(char)SPTX_ELM;
       el.elem.spt.info.lat=lat[0];
       el.elem.spt.info.lon=lon[0];
       el.elem.spt.info.offset_x=0;
       el.elem.spt.info.offset_y=0;
       el.elem.spt.info.ialign=-1;
       el.elem.spt.info.rotn=0;
       el.elem.spt.info.sztext=1.4;
       el.elem.spt.info.sztext=1.2;
       el.elem.spt.info.itxfn=22;
       el.elem.spt.info.itxfn=10;
       el.elem.spt.info.ithw=1;
       el.elem.spt.info.iwidth=2;
       el.elem.spt.info.txtcol=14;
       el.elem.spt.info.lincol=2;
       el.elem.spt.info.filcol=1;
       el.elem.spt.info.sptxtyp=0;
       el.elem.spt.info.turbsym=0;
       sprintf(text,"%s"," NO CANADIAN\n     CCFP");
       lens=(int)strlen(text);
       strcpy(el.elem.spt.text,text);
       el.hdr.recsz = (int)( sizeof(VG_HdrStruct) +
                     sizeof(SpTextInfo) + (size_t)lens + 1 ) ;
       cvg_crthdrcolor( &el, np, lat, lon, 2, 2, 0, 1, &ier);
       cvg_writefD( &el, start, el.hdr.recsz, lastoutfilename, &loc, &ier );
}

static void GenNoCCFPCritMsg(char *lastoutfilename, float lat1, float lon1) {
       int np, start, loc, ier, lens;
       char text[120];
       VG_DBStruct el;
       float lat[1],lon[1];
       lat[0]=lat1;
       lon[0]=lon1;
       start=-1;
       np=1;
       el.hdr.vg_class=CLASS_TEXT;
       el.hdr.vg_type=(char)SPTX_ELM;
       el.elem.spt.info.lat=lat[0];
       el.elem.spt.info.lon=lon[0];
       el.elem.spt.info.offset_x=0;
       el.elem.spt.info.offset_y=0;
       el.elem.spt.info.ialign=-1;
       el.elem.spt.info.rotn=0;
       el.elem.spt.info.sztext=2.42;
       el.elem.spt.info.itxfn=22;
       el.elem.spt.info.ithw=1;
       el.elem.spt.info.iwidth=2;
       el.elem.spt.info.txtcol=2;
       el.elem.spt.info.lincol=2;
       el.elem.spt.info.filcol=1;
       el.elem.spt.info.sptxtyp=0;
       el.elem.spt.info.turbsym=0;
       sprintf(text,"%s","CONVECTION IS NOT\nEXPECTED TO REACH \n  CCFP CRITERIA");
       lens=(int)strlen(text);
       strcpy(el.elem.spt.text,text);
       el.hdr.recsz = (int)( sizeof(VG_HdrStruct) +
                     sizeof(SpTextInfo) + (size_t)lens + 1 ) ;
       cvg_crthdrcolor( &el, np, lat, lon, 2, 2, 0, 1, &ier);
       cvg_writefD( &el, start, el.hdr.recsz, lastoutfilename, &loc, &ier );
   }

static char * getpos(char *rec, int pos, char *delimiter) {
        int i;
        char *ptr=rec;
        for (i=0;i<pos;i++) {
                ptr=strstr(ptr+1,delimiter);
        }
        return (ptr+1);
}


static void getlatlonarrayandTBIfNeeded(char *start, int numpoints, float lat[],
    float lon[], int TBneeded, float *tblat, float *tblon) {
        int i,ilat,ilon;
        char *ptr=start;
        sscanf(start,"%d %d",&ilat,&ilon);
        lat[0]=ilat/10.0;
        lon[0]=ilon/10.0*-1;
        for (i=1;i<numpoints;i++) {
                ptr=strstr(ptr+1," ");
                ptr=strstr(ptr+1," ");
        if (ptr != 0) {
                  sscanf(ptr+1,"%d %d",&ilat,&ilon);
        } else {
          printf("***Error. Insufficient lat/lon points in coded message.\n");
          printf("   Number of points specified=%d\n",numpoints);
          return;
        }
                lat[i]=ilat/10.0;
                lon[i]=ilon/10.0*-1;
        }
        if (TBneeded) {
          ptr=strstr(ptr+1," ");
          ptr=strstr(ptr+1," ");
          sscanf(ptr+1,"%d %d",&ilat, &ilon);
          *tblat=ilat/10.0;
          *tblon=ilon/10.0*-1;
    }
}

static void cvg_crthdrcolor ( VG_DBStruct *el, int np, float *lat, float *lon,
  int major, int minor, int grouptype, int groupnumber, int *iret )
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
     *   Get the major/minor color and group type/number.
     */
    el->hdr.maj_col=major;
    el->hdr.min_col=minor;
    el->hdr.grptyp = grouptype;
    el->hdr.grpnum = groupnumber;

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

static void GenVGFLine(char *outfilename,int color, int type,int numvertices, float lat[], float lon[]) {
  VG_DBStruct el;
  int np, ii, start, loc, ier;

  start=-1;
  el.hdr.vg_class=CLASS_LINES;
  el.hdr.vg_type=(char) LINE_ELM;
  np=numvertices;
  el.elem.lin.info.lintyp=type;
  el.elem.lin.info.lthw=0;
  el.elem.lin.info.width=3;
  el.elem.lin.info.lwhw=0;
  el.hdr.closed=0;
  el.hdr.filled=0;
  el.hdr.smooth=0;
  el.elem.lin.info.numpts=np;
  el.hdr.recsz = (int)( (sizeof(float) * (size_t)(2 * np)) +
   sizeof(VG_HdrStruct) + sizeof(LineInfo) );
  for ( ii = 0; ii < np; ii++ ) {
      el.elem.lin.latlon[ii]    = lat[ii];
      el.elem.lin.latlon[ii+np] = lon[ii];
  }
  cvg_crthdrcolor( &el, np, lat, lon, color, 3, 0, 1, &ier);
  cvg_writefD( &el, start, el.hdr.recsz, outfilename, &loc, &ier );
}
