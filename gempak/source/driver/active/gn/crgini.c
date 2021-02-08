#include "geminc.h"
#include "gemprm.h"
#include "imgdef.h"
#include "proto_xw.h"


void crgini ( char *imgnam, int *iret )
/************************************************************************
 * crgini								*
 *									*
 * This subroutine reads the image data from an AWIPS GINI file.	*
 * The full image is placed in memory pointed to by imgData.		*
 *									*
 * crgini ( imgnam, iret )						*
 *									*
 * Input parameters:							*
 *	*imgnam		char		Name of image file		*
 *									*
 * Output parameters:							*
 *	*iret		int		Return code			*
 *					G_NORMAL = normal return	*
 *					G_NIMGFL = cannot open/read img	*
 **									*
 * Log:									*
 * J. Cowie/COMET	11/95						*
 * S. Jacobs/NCEP	 1/97	Copied from XRGINI			*
 * J. Cowie/COMET	 1/97	Changed common variable names		*
 * J. Cowie/COMET	12/97	Added cfl_clos if error on cfl_seek	*
 ***********************************************************************/
{

	FILE	*fp;
	char	defdir[12];
	long	lofset;
	int	nbin, ier;

/*---------------------------------------------------------------------*/
	
	*iret = G_NORMAL;
	
/*
 *	Open the file and seek to data offset.
 */
	defdir[0] = CHNULL;
	fp = cfl_ropn ( imgnam, defdir, &ier );
	if  ( ier != 0 )  {
	    *iret = G_NIMGFL;
	    return;
	}
 	else {
	    lofset = (long) imdoff;
	    cfl_seek ( fp, lofset, SEEK_SET, &ier );
	    if  ( ier != 0 )  {
		*iret = G_NIMGFL;
		cfl_clos ( fp, &ier );
		return;
	    }
	}

/*
 *	Read the raw image data.
 */
	cfl_read ( fp, imldat, imgData, &nbin, &ier );
	cfl_clos ( fp, &ier );
		
}
