			N-AWIPS 5.4.2.c Patch Release Notes
				4/23/97


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.b
These include:

	o  Some new capabilities for product generation including the
	   ability to move objects and draw lines in NMAP.  Also VFG
	   files can be named, saved and restored in NMAP.  The GUI is 
	   also improved.

	o  Some new capabilities have been added to NMAP.  Printing is now
	   available in NMAP. NOTE: Do NOT print model data overlaid on
	   image data.  This does not work properly.  The data access 
	   for observational data has been improved.  The station model 
	   for observational data is now table driven and uses GEMPAK 
	   aliases.  Map and lat/lon as selected from the GUI are now 
	   properly applied to the model data.

	o  A new decoder for Supplemental Climatological Data.  Also,
	   the flash flood guidance decoder has been revised.

	o  A new decoder, dcmsfc, that decodes ship, and buoy reports
	   is now available.

	o  Revised ths surface stations table to include many more foreign
	   METAR reporting stations.

	o  Removed changes to turbulence symbols plotting that were made
	   in 5.4.2.b.

See the N-AWIPS logs for additional details.  This patch begins on 04/01/97.

This patch requires some recompiling and linking of all GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.c 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.c >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


