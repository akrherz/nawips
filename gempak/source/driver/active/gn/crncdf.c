#include "geminc.h"
#include "gemprm.h"
#include "imgdef.h"
#include "netcdf.h"
#include "proto_xw.h"


void crncdf ( char *imgnam, int *iret )
/************************************************************************
 * crncdf								*
 *									*
 * This subroutine reads the image data from an AWIPS NetCDF file.	*
 * The full image is placed in memory pointed to by imgData.		*
 *									*
 * crncdf ( imgnam, iret )						*
 *									*
 * Input parameters:							*
 *	*imgnam		char		Name of image file		*
 *									*
 * Output parameters:							*
 *	*iret		int		Return code			*
 *					G_NORMAL = normal return	*
 *					G_NIMGFL = cannot open/read img	*
 *					G_NMEMRY = memory alloc failure	*
 **									*
 * Log:									*
 * S. Jacobs/NCEP	 6/99	Created					*
 * R. Curtis/EAI	 9/00   Implemented into GEMPAK                 *
 * S. Guan/NCEP          8/15   Modified the code for Sectorized_CMI    *
 *                              data                                    *
 * S. Guan/NCEP          9/30   Take care bit_depth  bits netcdf4 data  *                             
 ***********************************************************************/
{

	int		ncid, ncret;
        int             data_id;
        short           *pdatac;
        double          bit_depth;
        int             i, total, move;
	size_t		start[2], count[2];

/*---------------------------------------------------------------------*/
	
	*iret = G_NORMAL ;

/*
 *	Open the NetCDF file.
 */
	nc_open ( imgnam, NC_NOWRITE, &ncid );

/*
 *	Read the image data.
 */
	start[0] = 0;
	start[1] = 0;
	count[0] = imnlin;
	count[1] = imnpix;
        total = imnlin * imnpix; 
        ncret = nc_inq_varid (ncid, "Sectorized_CMI", &data_id);
        if ( ncret != 0 ) data_id = 0;
        ncret = nc_get_att_double ( ncid, NC_GLOBAL, "bit_depth", &bit_depth );
        if ( ncret != 0 ) bit_depth = 0;
        if ( bit_depth < 8.1) {
	    nc_get_vara_uchar ( ncid, data_id, start, count, imgData );
        } 
        else {
/*          imgData is 8 bits, netcdf4 data is bit_depth  bits */
            pdatac =  malloc(imnlin * imnpix * sizeof (short));
            nc_get_vara_short ( ncid, data_id, start, count, pdatac );
            move = (int) bit_depth - 8;
            for (i = 0; i < total; i++) { 
                imgData[i] = pdatac[i] >> move;
            }    
        }
   

/*
 *	Close the NetCDF file.
 */
	nc_close ( ncid );
	
}
