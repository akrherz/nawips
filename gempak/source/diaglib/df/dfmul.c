#include "df.h"

void df_mul ( int *iret )
/************************************************************************
 * df_mul								*
 *									*
 * This subroutine multiplies two scalar grids:				*
 *									*
 *     MUL (S1, S2) = S1 * S2						*
 *									*
 * df_mul ( iret )							*
 *									*
 * Output parameters:							*
 *	*iret		int		Return code			*
 *					As for DG_GETS			*
 **									*
 * Log:									*
 * M. desJardins/GSFC	10/85						*
 * M. desJardins/GSFC	 5/88	Added new stack subroutines		*
 * G. Huffman/GSC	 9/88	Error messages				*
 * K. Brill/GSC		 8/89   Subsetting				*
 * K. Brill/GSC		10/89	Subsetting				*
 * T. Lee/GSC		 4/96	Single dimension for dgg		*
 * K. Tyle/GSC           5/96   Moved IGDPT outside do-loop             *
 * K. Brill/HPC		 1/02	CALL DG_SSUB and DG_ESUB		*
 * K. Brill/HPC		11/02	Eliminate use of the SUBA logical array	*
 * R. Tian/SAIC		11/05	Recoded from Fortran			*
 ************************************************************************/
{
    int num1, num2, num, kxd, kyd, ksub1, ksub2, i, im1, zero, ier;
    float *gnum1, *gnum2, *gnum, dg1, dg2;
/*----------------------------------------------------------------------*/
    *iret = 0;
    zero = 0;

    dg_ssub ( iret );

    /*
     * Get the two grids from the stack.
     */
    dg_gets ( &num1, iret );
    if ( *iret != 0 ) return;
    dg_gets ( &num2, iret );
    if ( *iret != 0 ) return;

    /*
     * Get a new grid number and multiply the grids.
     */
    dg_nxts ( &num, iret );
    if ( *iret != 0 ) return;

    /*
     * Grid number to grid.
     */
    dg_getg ( &num1, &gnum1, &kxd, &kyd, &ksub1, &ksub2, iret );
    dg_getg ( &num2, &gnum2, &kxd, &kyd, &ksub1, &ksub2, iret );
    dg_getg ( &num,  &gnum,  &kxd, &kyd, &ksub1, &ksub2, iret );

    for ( i = ksub1; i <= ksub2; i++ ) {
        im1 = i - 1;
	dg1 = gnum1[im1];
	dg2 = gnum2[im1];
	if ( ERMISS (dg1) || ERMISS (dg2) ) {
	    gnum[im1] = RMISSD;
	} else {
	    gnum[im1] = dg1 * dg2;
	}
    }

    /*
     * Make a name of the form 'MUL'//S1//S2 and update header;
     * update stack.
     */
    dg_updh ( "MUL", &num, &num1, &num2, iret );
    dg_puts ( &num, iret );
    dg_esub ( &num, &zero, &zero, &zero, &ier );
    if ( ier != 0 ) *iret = ier;

    return;
}
