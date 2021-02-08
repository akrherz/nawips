#include "geminc.h"
#include "gemprm.h"
#include "drwids.h"
#include "vgstruct.h"
#include "pgprm.h"

/************************************************************************
 * wpcmpd.c								*
 *									*
 * CONTENTS:								*
 * wpcmpd								*
 ***********************************************************************/

int main ( int argc, char **argv )
/************************************************************************
 * wpcmpd								*
 *                                                                      *
 * This program generates the WPC Mesoscale Precipitation Discussion	*
 * from scalloped lines in a VGF.					*
 *                                                                      *
 * Example:								*
 * wpcmpd vgf_file.vgf							*
 * Produces latlon pairings in the ASCII file vgf_file.mpd		*
 *                                                                      *
 * main(argc, argv)                                                     *
 *                                                                      *
 * Input parameters:                                                    *
 *  argc   int      number of parameters of command line                *
 *  argv   char**   parameter array of command line                     *
 *                                                                      *
 * Output parameters:                                                   *
 * Return parameters:                                                   *
 *                      NONE                                            *
 *                                                                      *
 **                                                                     *
 * Log:                                                                 *
 * S. Jacobs/NCEP	 7/14	Copied from SPENES			*
 * S. Jacobs/NCEP	 8/14	Fixed a problem with the STATES list	*
 * S. Jacobs/NCEP	 8/14	Use only 4 digits for lon => 100W	*
 * S. Jacobs/NCEP	 8/14	Do not process LINE_ELM element types	*
 ***********************************************************************/
{
int		ii, ix, iy, pagflg, ne, npts, ier, iret, ilen,
		nitems, more, curpos, indx[MAXLISTITEMS];

long		ifilesize;

float		x[MAXLISTITEMS], y[MAXLISTITEMS],
		flat[MAXLISTITEMS], flon[MAXLISTITEMS];

char		vg_class, vg_type, buffer[2048], bufferfinal[8192],
		str[20], *cptr, errgrp[12], infile[128], stname[32],
		ifname[128], outfile[128], info[2048], stpo[4],
		cstl_listwfo[10000], cstl_liststate[10000],
		cstl_listrfc[10000], cstl_listabb[10000];

char		device[13], dfilnam[73], pro[80];
int		mode, istat, iunit, itype;
float		xsize, ysize, lllat, lllon, urlat, urlon,
		prjang1, prjang2, prjang3;

VG_DBStruct	el;

FILE		*ifptr, *ofptr;
/*---------------------------------------------------------------------*/

    /* 
     * Set defaults for gsdeva and gsmprj
     */
    mode = 1;
    strcpy ( device, "GIF" );
    iunit = 1;
    strcpy ( dfilnam, "MPDWPC" );
    itype = 1;
    xsize = 2000.0F;
    ysize = 2000.0F;
    lllat = 10.0F;
    lllon = -120.0F;
    urlat = 50.0F;
    urlon = -50.0F;
    strcpy ( pro, "str" );
    prjang1 =   90.0F;
    prjang2 = -105.0F;
    prjang3 =    0.0F;
    cstl_listwfo[0] = '\0';
    cstl_listrfc[0] = '\0';
    cstl_liststate[0] = '\0';
    cstl_listabb[0] = '\0';

    in_bdta ( &ier );
    ginitp ( &mode, &istat, &ier);
    gsdeva (device, &iunit, dfilnam, &itype, &xsize, &ysize, &iret,
	    strlen(device), strlen(dfilnam));
    gsmprj ( pro, &prjang1, &prjang2, &prjang3, 
	     &lllat, &lllon, &urlat, &urlon, &iret, strlen(pro));
    clo_init ( &ier );

    /*
     *  Check if number of input arguments is correct.
     */
    if ( argc < 2 )  {
	pagflg = G_FALSE;
	strcpy ( errgrp, "MPDWPC" );
        ip_help ( errgrp, &pagflg, &ier,
                  strlen(errgrp) );
	gendp (&mode, &ier);
	exit (0);
    }

    /*
     *  First input on command line is input vgf file name.
     */
    strcpy ( infile, argv[1] );
    cfl_inqr ( infile, NULL, &ifilesize, ifname, &ier );
    ifptr = (FILE *) cfl_ropn(ifname, "", &ier);
    if ( ier != 0 )  {
	printf("Error opening VGF file %s\n", infile );
	gendp (&mode, &ier);
	exit (0);
    }

    /*
     *  Output filename is input filename w/ "mpd" filename extension.
     */
    strcpy ( outfile, infile );
    cptr = strrchr( outfile, '.' );
    if ( cptr != (char *)NULL )  {
	cptr[0] = '\0';
    }
    strcat( outfile, ".mpd" );
    
    /*
     *  Loop through all the elements until a line is found.
     */
    ne = 0;
    more = G_TRUE;
    curpos = 0;
    buffer[0] = '\0';
    bufferfinal[0] = '\0';
    while ( ne < MAX_EDITABLE_ELEMS && more == G_TRUE )  {
	cvg_rdrecnoc( ifname, ifptr, curpos, &el, &ier );

	if ( ier < 0 )  {
	    more = G_FALSE;
	}
	else  {

	    curpos += el.hdr.recsz;

	    vg_class = el.hdr.vg_class;
	    vg_type  = el.hdr.vg_type;

            if ( ( (int)vg_class == CLASS_LINES ) &&
	    	 ( el.hdr.vg_type == SPLN_ELM ) )  {

		/*
		 * Only process if this is a scallop line.
		 */
		if ( el.elem.spl.info.spltyp == 3 ) {

		/*
		 *  Open output file.
		 */
		ofptr = (FILE *)cfl_wopn ( outfile, &ier );
		if ( ier != 0 )  {
		    printf("Error opening/creating output file %s\n",
		    	    outfile );
	            gendp (&mode, &ier);
		    exit (0);
    		}

	       /*
		* Find FIPS bounded by the closed line
		*/

		if ( (int)vg_type == LINE_ELM )  {
		    npts = el.elem.lin.info.numpts;
		}
		else if ( (int)vg_type == SPLN_ELM )  {
		    npts = el.elem.spl.info.numpts;
		}

		/*  Find what states are in area */

		if ( (int)vg_type == LINE_ELM )  {
		    clo_binpoly ( "STATE_BNDS", npts,
		    		  el.elem.lin.latlon,
                                  &(el.elem.lin.latlon[npts]),
				  &ier );
		}
		else if ( (int)vg_type == SPLN_ELM )  {
		    clo_binpoly ( "STATE_BNDS", npts,
		    		  el.elem.spl.latlon,
                                  &(el.elem.spl.latlon[npts]),
				  &ier );
		}
		clo_tgltln ( "STATE_BNDS", MAXLISTITEMS, &nitems,
			      flat, flon, &ier);

		for ( ii = 0; ii < nitems; ii++ )  {
		  clo_bginfo( "STATE_BNDS", ii, info, &ier );
		  cst_gtag( "STATE", info, "?", stpo, &ier);
		  
		  if (strstr(cstl_listabb, stpo)==NULL) {
		    strcat(cstl_listabb, stpo);
		    strcat(cstl_listabb, "...");
		    if  ( ( (ii+1)%9 == 0  ) && ( ii != nitems-1 ) )  {
		      strcat(cstl_listabb, "\nSTATES...");
		    }

		    /*
		    strcat(cstl_listabb, "Z000-");		  
		    */

		    /*
		    tb_idst ( stpo, stname, &ier,
		    	      strlen(stpo), sizeof(stname) );
		    if  ( ier == 0 )  {
			strcat(cstl_liststate, stname);
			strcat(cstl_liststate, "...");		  
			if  ( ( (ii+1)%4 == 0 ) && ( ii != nitems-1 ) ) {
			  strcat(cstl_liststate, "\nLOCATION...");
			}
		    }
		    */
		  }
		}

		ilen = 66;
		cst_wrap ( cstl_listabb, "-", &ilen, "\n",
		       	   (char *)NULL, cstl_listabb, &ier );


		/*  Find what WFOs are in area */
		if ( (int)vg_type == LINE_ELM )  {
		    clo_binpoly ( "CWA_BNDS", npts,
		    		  el.elem.lin.latlon,
                                  &(el.elem.lin.latlon[npts]),
			          &ier );
		}
		else if ( (int)vg_type == SPLN_ELM )  {
		    clo_binpoly ( "CWA_BNDS", npts,
		    		  el.elem.spl.latlon,
                                  &(el.elem.spl.latlon[npts]),
			          &ier );
		}
		clo_tgltln ( "CWA_BNDS", MAXLISTITEMS, &nitems,
			      flat, flon, &ier);

		for ( ii = 0; ii < nitems; ii++ )  {
		  clo_bginfo( "CWA_BNDS", ii, info, &ier );
		  cst_gtag( "WFO", info, "?", stpo, &ier);
		  strcat(cstl_listwfo, stpo);
		  strcat(cstl_listwfo, "...");
		  if  ( ( (ii+1)%9 == 0  ) && ( ii != nitems-1 ) )  {
		    strcat(cstl_listwfo, "\nATTN WFO...");
		  }
		}

		/*  Find what RFCs are in area */
		/*
		*/
		if ( (int)vg_type == LINE_ELM )  {
		    clo_binpoly ( "RFC_BNDS", npts,
		    		  el.elem.lin.latlon,
                                  &(el.elem.lin.latlon[npts]),
			          &ier );
		}
		else if ( (int)vg_type == SPLN_ELM )  {
		    clo_binpoly ( "RFC_BNDS", npts,
		    		  el.elem.spl.latlon,
                                  &(el.elem.spl.latlon[npts]),
			          &ier );
		}
		clo_tgltln ( "RFC_BNDS", MAXLISTITEMS, &nitems,
			      flat, flon, &ier);

		for ( ii = 0; ii < nitems; ii++ )  {
		  clo_bginfo( "RFC_BNDS", ii, info, &ier );
		  cst_gtag( "RFC", info, "?", stpo, &ier);
		  strcat(cstl_listrfc, stpo);
		  strcat(cstl_listrfc, "...");
		  if  ( ( (ii+1)%6 == 0  ) && ( ii != nitems-1 ) )  {
		    strcat(cstl_listrfc, "\nATTN RFC...");
		  }
		}

		/*
		 *  Format lats and lons into buffer.
		 */
		if ( (int)vg_type == LINE_ELM )  {
		    npts = el.elem.lin.info.numpts;
		}
		else if ( (int)vg_type == SPLN_ELM )  {
		    npts = el.elem.spl.info.numpts;
		}
		for ( ii = 0; ii < npts; ii++ )  {
		    if ( (int)vg_type == LINE_ELM )  {
		        x[ii] = el.elem.lin.latlon[ii];
		        y[ii] = el.elem.lin.latlon[ii+npts];
		    }
		    else if ( (int)vg_type == SPLN_ELM )  {
		        x[ii] = el.elem.spl.latlon[ii];
		        y[ii] = el.elem.spl.latlon[ii+npts];
		    }
		    /*
		     * Make sure lats and lons are rounded
		     * to 100ths of deg.
		     */
		    x[ii] = ((int)(x[ii]*100.0F)) / 100.0F;
		    y[ii] = ((int)(y[ii]*100.0F)) / 100.0F;
		    indx[ii] = ii;
		}

		clo_reorder ( npts, x, y, indx, &ier );

		/*
		 * Re-order the points to be clockwise
		 * with the northernmost point first.
		 */
		for ( ii = 0; ii < npts; ii++ )  {
		    ix = G_NINT(x[indx[ii]]*100.0F) % 10000;
		    iy = G_NINT(y[indx[ii]]*100.0F) % 10000;
		    sprintf( str, "%04d%04d ", ix, -iy );
		    strcat ( buffer, str );
		    /* Add a new line after every 5th point */
		    if ( (ii+1)%5 == 0 ) {
			sprintf( str, "\n            " );
			strcat ( buffer, str );
		    }
		}
		sprintf( str, "\n" );
		strcat ( buffer, str );

		}
	    }

	}
	ne++;
    }

    strcat ( bufferfinal, "STATES..." );
    strcat ( bufferfinal, cstl_listabb );
    strcat ( bufferfinal,"\n" );

    /*
    strcat ( bufferfinal,"LOCATION..." );
    strcat ( bufferfinal, cstl_liststate );
    strcat ( bufferfinal,"\n" );
    */

    strcat ( bufferfinal,"ATTN WFO..." );
    strcat ( bufferfinal, cstl_listwfo );
    strcat ( bufferfinal,"\n" );

    strcat ( bufferfinal,"ATTN RFC..." );
    strcat ( bufferfinal, cstl_listrfc );
    strcat ( bufferfinal,"\n" );

    strcat ( bufferfinal,"LAT...LON   " );
    strcat ( bufferfinal, buffer );
    strcat ( bufferfinal,"\n" );

    /*
     *  Write to output file.
     */
    cfl_writ ( ofptr, (int)strlen(bufferfinal),
    	       (unsigned char *)bufferfinal, &ier );

    /*
     *  close files and exit.
     */
    cfl_clos ( ifptr, &ier );
    cfl_clos ( ofptr, &ier );
    gendp (&mode, &ier);
    return(0);

}
