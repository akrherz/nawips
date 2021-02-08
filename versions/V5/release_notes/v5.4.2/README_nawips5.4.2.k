			N-AWIPS 5.4.2.k Patch Release Notes
				9/9/1997


This file describes the patch and provides instructions for its installation.

The patch contains some bug fixes and code improvements to version 5.4.2.j.

These include:

	1.  Added capability to FAX driver to handle products that 
	    have a reserved value in the file footer.  Also, modfied
	    the fill algorithm and changed the fill from solid
	    to a pattern.

	2.  Rewrote the AFOS driver.  Modified the driver to handle
	    text offsets as a series of up/down/left/right cursor
	    movements.  Modified the symbols to be stored as AFOS
	    text characters to save space.  Created a new product
	    table for the UTF driver, gempak/tables/pgen/afosprod.tbl.

	3.  Updated the program avnbul to handle the graphics type
	    "line" for turbulence that is generated automatically.
	    Also added "-XXX" to the turbulence string when only
	    one level is given.

	4.  Corrected NTRANS time matching to handle cases where
	    there are more than 30 frames.

	NOTE:  The UTF driver has been rewritten.  The contents of
	$GEMPAK/source/driver/active/utf MUST be deleted BEFORE
	applying this patch.


See the N-AWIPS logs for additional details.  This patch includes
development from 8/5/97 through 9/3/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.k 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.k >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


