			N-AWIPS 5.4.2.d Patch Release Notes
				5/15/97


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.c
These include:

	o  Several new capabilities for product generation have been
	   added.  The capability to draw and edit special line types
	   are now included in NMAP.  Also text can be added and edited.  
	   The NMAP pallets for product generation have been reorganized 
	   into actions, classes, and objects.  

	o  Some new display capabilities have been added to NMAP.  Marine 
	   (Ship, Buoy, and platform) data can now be plotted.  Some
	   bugs including the problems with printing model with satellite
	   imagery and lat/lon lines labelling have been corrected.

	o  Some improvements have been made to the METAR and flash flood
	   decoders.

	o  Corrections have been made to the FAX product table and
	   to the VIEWFAX program.


	   WARNING: The vgf file is NOT compatible with previous 
	   versions of this file.


See the N-AWIPS logs for additional details.  This patch includes
development from 04/24/97 through 5/13/97.

This patch requires some recompiling and linking of all GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.d 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.d >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


