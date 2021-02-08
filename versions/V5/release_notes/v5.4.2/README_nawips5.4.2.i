			N-AWIPS 5.4.2.i Patch Release Notes
				7/25/1997


This file describes the patch and provides instructions for its installation.

The patch contains some bug fixes and code improvements to version 5.4.2.h .

These include:

	1.  Added capability to close and fill lines drawn in NMAP product
	    generation.

	2.  Improved the operation of drawing lines and fronts.  A selected
	    line or front can now be drawn more than once without going back
	    and clicking on the palette.

	3.  Added remaining 7 special text types to NMAP GUI.  
	    Added capability to rotate special text.  Fixed bug in
	    displaying special text in mono-color.  Fixed bug in
	    moving special text more than once.  Improved shapes
	    of special text symbols.

	4.  Added filled arrow head arrow and dashed line to NMAP
	    product generation.

	5.  All tables associated with product generation have been
	    moved from $GEMTBL/parms to $GEMTBL/pgen.

	6.  Improved the format of the drawing table and improved its
	    documentation.  

	    Note:  This table, drawing.tbl has been moved from 
	    $GEMTBL/parms to $GEMTBL/pgen.  Its format is NOT 
	    compatible with the previous version. 

	7.  Corrected several problems in the FAX driver.  Also,
	    created a new product table with improved documentation for
	    FAX products.  This table is called: $GEMTBL/pgen/faxprod.tbl 

	    NOTE:  Much of the FAX driver has been rewritten.  You MUST
	    delete all files in $GEMPAK/source/driver/active/fax BEFORE
	    you apply this patch.

	8.  Added "FILTER" parameter to GDPLOT2 and NMAP with the
	    default value equal to "YES".  This feature will 
	    automatically thin (filter) wind barbs and vectors.
	    It performs like the filter parameter in other GEMPAK
	    programs.


NOTE:  The VG file is NOT compatible with Patch h because of changes 
       in special text and the way it is stored.
	    

See the N-AWIPS logs for additional details.  This patch includes
development from 7/17/97 through 7/25/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.i 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.i >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


