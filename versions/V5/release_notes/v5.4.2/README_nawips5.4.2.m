			N-AWIPS 5.4.3 Patch Release Notes
				10/3/1997

This patch contains two bug fixes to 5.4.3.

	o  The display of lat/lon in NMAP has been corrected when
	   in the roam mode.

	o  The file creation time has been corrected in the UTF
	   (AFOS) driver.

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.2.m 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.m >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.

For the purposes of logging these two bug corrections are labelled
m in nawips.log.


