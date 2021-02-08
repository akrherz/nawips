			N-AWIPS 5.4.2.f Patch Release Notes
				6/4/97


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.e
These include:

	o  Several corrections have been made to the product generation
	   software.  These include corrections to allow proper editing
	   of elements created using the VG driver.  Contour line editing
	   has also been corrected in NMAP.

	o  Multiple line text creation has been added to GPLT and NMAP.

	o  Several new MPC products have been added to NWX.

	o  New AFOS alarms requested by the HPC have been added.

	o  NMAP model product attributes have been improved.


See the N-AWIPS logs for additional details.  This patch includes
development from 05/22/97 through 6/3/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.f 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.f >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


