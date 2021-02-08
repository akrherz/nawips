			N-AWIPS 5.4.2.b Patch Release Notes
				3/27/97


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.
These include:

	o The new VGF device driver which creates VGF files from GEMPAK.
	o Modified GPMAP program which reads VGF files and displays them.
	o Help has been added to the VIEWFAX program and fax driver.
	o The drawing of the turbulence symbols has been improved and
	  flight level text has been added.
	o Minor bug fix to NTRANS.


See the N-AWIPS logs for additional details.

This patch requires some recompiling and linking of all GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.b 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.b >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


