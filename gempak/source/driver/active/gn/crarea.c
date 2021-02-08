#include "geminc.h"
#include "gemprm.h"
#include "imgdef.h"
#include "proto_xw.h"


void crarea_pixel ( unsigned char *dptr );

void crarea ( char *imgnam, int *iret )
/************************************************************************
 * crarea								*
 *									*
 * This subroutine reads the image data from a MCIDAS AREA file.	*
 * The full image is placed in memory pointed to by imgData.		*
 *									*
 * crarea ( imgnam, iret )						*
 *									*
 * Input parameters:							*
 *	*imgnam		char		Name of image file		*
 *									*
 * Output parameters:							*
 *	*iret		int		Return code			*
 *					G_NORMAL = normal return	*
 *					G_NIDSIZ = invalid image depth	*
 *					G_NIMGFL = cannot open/read img	*
 *					G_NMEMRY = memory alloc failure	*
 **									*
 * Log:									*
 * J. Cowie/COMET	 3/95						*
 * J. Cowie/COMET	 5/95	Modified to work with NAWIPS 5.2.1	*
 * S. Jacobs/NCEP	 1/97	Copied from XRAREA			*
 * J. Cowie/COMET	 1/97	Changed common variable names		*
 * J. Cowie/COMET	12/97	Added cfl_clos if error on cfl_seek	*
 * S. Chiswell/Unidata	 8/06	Added multibyte image check		*
 ***********************************************************************/
{
	FILE		*fp;
	char		defdir[12];
	long		lofset;
	unsigned int	iboff;
	int		lstrt, ii, jj, kk, nbin, ier;
	unsigned char	*rwdptr, *imdptr;
/*---------------------------------------------------------------------*/

    if ( imdpth <= 0 ) {
	*iret = G_NIDSIZ;
	return;
    }
/*
 *  Open the file and seek to data offset.
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
	    cfl_clos ( fp, &ier );
	    *iret = G_NIMGFL;
	    return;
	}
    }
    *iret = G_NORMAL;
/*
 *  If this file contains only one channel (band) and no line
 *  prefix data, read the raw data directly into imgData and exit.
 */
    if ( imprsz == 0 && imnchl == 1 ) {
	cfl_read ( fp, imldat, imgData, &nbin, &ier );
	cfl_clos ( fp, &ier );
	crarea_pixel ( imgData );
	return;
    }
    else {
/*
 *  Allocate space for the raw image data.
 */
	if  ( ( rawData == (unsigned char *) NULL ) ||
		( imldat > (int)last_rawsize) ) {
	    if  ( rawData != (unsigned char *) NULL) {
		free(rawData);
	    }
	    rawData = (unsigned char *) calloc ( imldat,
			sizeof(unsigned char) );
	    if  ( rawData == (unsigned char *) NULL ) {
		*iret = G_NMEMRY;
		return;
	    }
	    last_rawsize = imldat;
	}
/*
 *  Read the raw image data.
 */
	cfl_read ( fp, imldat, rawData, &nbin, &ier );
	cfl_clos ( fp, &ier );

    }
/*
 *  Process the prefix bytes and move data for the
 *  image channel into the imgData array.
 *
 *  NOTE: This has been tested for images with prefix bytes.
 *	  Have not tested any image files with multiple channels
 *	  in the file.
 */
    imdptr = imgData;

    for ( ii = 0; ii < imnlin; ii++ ) {
/*
 *  Calculate the starting byte in rawData for this line.
 */
	lstrt = ii * (imnpix * imdpth * imnchl + imprsz);
	rwdptr = &rawData[lstrt];
/*
 *  Process prefix data to each line, if any.
 *  iboff = band offset in each element.
 */
	iboff = 0; 
	if  ( imprsz != 0 ) {
/*
 *  Skip 4 bytes of validity code.
 */
	    if  ( imvald != 0 )  rwdptr += 4;
/*
 *  Skip documentation and calibration code.
 */
	    rwdptr += imdcsz + imclsz;
/*
 *  Process level map to get the band for each element,
 *  if necessary.
 */
	    if  ( imnchl > 1) {
/*
 *  Get the band offset.
 */
		for ( kk = 0; kk < imlvsz; kk ++ ) {
		    if  ( *rawData == 8 ) {
			iboff = kk;
			rwdptr += imlvsz - kk;
			break;
		    }
		    else {
			rwdptr ++;
		    }
		}
	    }
	    else {
/*
 *  Skip the level map.
 */
		rwdptr += imlvsz;
	    }
	}  /* End of "if  ( imprsz != 0 )"  */
/*
 *  Get the image data.
 */
	for ( jj = 0; jj < imnpix; jj++ ) {
	    for ( kk = 0; kk < imdpth; kk++ ) {
		*imdptr++ = *(rwdptr + iboff);
		rwdptr ++;
	    }
	}
    }  /* End of loop over imnlin  */
    crarea_pixel ( imgData );
}

/*=====================================================================*/

void crarea_pixel ( unsigned char *dptr)
/************************************************************************
 * crarea_pixel								*
 *									*
 * This subroutine swaps pixel bytes if necessary.			*
 * The full image is placed in memory pointed to by imgData.		*
 *									*
 * Input parameters:							*
 *	*dptr	unsigned char		pointer to image data		*
 *									*
 **									*
 * Log:									*
 * S. Chiswell/Unidata	 8/06	created					*
 ***********************************************************************/
{
int		eswap = 0, ii, jj;
unsigned char	dval;
union	{ unsigned char little[4]; unsigned int bocheck; } _etest;

/*---------------------------------------------------------------------*/
/*
 *  Determine if swapping is required.
 */
    _etest.bocheck = 1;
    if  ( ( _etest.little[3] && imbswp ) || 
	( _etest.little[0] && ! imbswp ) ) {
	eswap = 1;
    }
/*
 *  Swap bytes if necessary.
 */
    if ( eswap ) {
	for ( ii = 0; ii < imnpix * imnlin * imdpth; ii += imdpth ) {
	    for ( jj = 0; jj < imdpth / 2; jj++ ) {
		dval = dptr[ii+imdpth-jj-1];
		dptr[ii+imdpth-jj-1] = dptr[ii+jj];
		dptr[ii+jj] = dval;
	    }
	}
    }
}
