			N-AWIPS 5.4.2.e Patch Release Notes
				5/21/97


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.d
These include:

	o Fixed several problems in the produt generation software
	  found when using a AWC generated VGF file. 
	  Checked for divide by zero when calculating line slopes.
	  Provided error handling and bound checking when loading
	  a VGF file with greater than the number of allowable
	  elements.  Increased number of modifiable elements to
	  2000.  Put move and slide functions in for regular lines.
	  Properly set device ranges for displayable elements and
	  added lines and symbols.  Corrected fatal error when
	  stop button in clicked and then product generation mode
	  is executed. Improved performance of VGF file loading and
	  refreshing.

	o Updated marine decoder.  Added calculation for wave height
	  from wind wave and swell heights.

NOTE:  The user must click the refresh button in the product generation
       mode after he prints to activate the edit functions.


See the N-AWIPS logs for additional details.  This patch includes
development from 05/14/97 through 5/21/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.e 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.e >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


