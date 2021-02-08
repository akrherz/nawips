			N-AWIPS 5.4.2.g Patch Release Notes
				6/23/1997


This file describes the patch and provides instructions for its installation.

This patch contains some bug fixes and code improvements to version 5.4.2.f

These include:

	o  Added symbol drawing/editing to NMAP product generation.

	o  Added wind barb drawing/editing to NMAP and VG files.

	o  Added function to clear the VG display in NMAP.

	o  Changed the way VG files are handled in NMAP product generation.
	   Opening a named VG file, reads the contents of that file into
	   .DEFAULT.vgf.  All editing is performed on the .DEFAULT.vgf file.
	   Click on the "save" button to save the changes to a named file.

	o  Added flip capability for fronts and special lines.
	   NOTE:  Flip does not currently work on stationary fronts.

	   Also, one related bug remains in GEMPAK application level 
	   code for the direction indicator.  The front and special 
	   line code at the "I" level allows a direction indicator of 
	   "0", but the GEMPAK code for settings doesn't change 
	   settings when a 0 is passed in.  This causes fronts and 
	   special lines to have thier pips on different sides of 
	   the front depending on which device is active.  The work
           around is to use either -1 or 1 for the direction 
	   indicator until the "I" level code can be corrected.

	o  Added AWC fix for line widths in the FAX driver.

	o  Fixed the special lines direction bug.

	o  Added special symbols and text, e.g, turbulence, to GPLT.  
	   The capability to draw/edit these symbols has not been 
	   added to NMAP yet.

	o  NMAP can now display VG files as background data.  That is,
	   the files can be displayed so that they are not editable.  
	   Also, increased the number of data display layers from 4 to 6.

	o  Added stop and moving cloud icons to NTRANS and NSAT.  Also
	   added print capability to NAFOS.

NOTE:  Most of the NMAP restore files have been modified by the HPC to
improve the product characteristics.  If you have created or modified
NMAP restore files, you should save them somewhere other than where the
patch is being applied.  It is recommended that all NMAP restore files
be removed before this patch is applied.

NOTE:  NMAP can now display VG files as a data type.  A table located
in $GEMTBL/nmap called vgf.nmap defines the names and paths of users
where vgf files are located for display.  By default, the latest VG files
is selected from a directory defined in the following order:

	1)  If the user's login name matches one in the table, NMAP uses
	    the associated directory to find the latest VG file.

	2)  If the user's login name is not in the table, NMAP searches
	    the users current directory for the latest VG file.

	3)  If their are no VG files in the user's current directory,
	    NMAP pops up the data source selection box, which contains
	    the list of users defined in the table.
	   

NOTE:  The loop speed table for GUI programs has been moved to 
$GEMTBL/tables/loop.  Its format has changed.

NOTE:  The format of the data alias table has changed.

See the N-AWIPS logs for additional details.  This patch includes
development from 06/04/97 through 6/20/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.g 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.g >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


