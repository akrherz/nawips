			N-AWIPS 5.4.2.j Patch Release Notes
				8/6/1997


This file describes the patch and provides instructions for its installation.

The patch contains some bug fixes and code improvements to version 5.4.2.i.

These include:

	1.  Added capability to FAX driver to handle products that 
	    are "indented" and contain offsets, products (580, 581).
	    Also updated the FAX driver to properly produce products
	    542-549.

	2.  Added start and end group setting to the VG driver.

	3.  Improved the map overlay capability in NMAP.  The map
	    overlays are now table driven.  They are specified in 
	    the table $GEMTBL/nmap/mapovl.nmap.

	4.  Updated the program avnbul to handle special text for 
	    cloud types and the dashed line for turbulence.

	NOTE:  The fax product table, faxprod.tbl is NOT compatible
	       with previous versions because an additional column
	       has been added for the product offset value.


See the N-AWIPS logs for additional details.  This patch includes
development from 7/25/97 through 8/5/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.j 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.j >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


