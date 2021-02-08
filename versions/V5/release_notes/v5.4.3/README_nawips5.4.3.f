			N-AWIPS 5.4.3.f Patch Release Notes
				1/6/1998

     This patch contains some bug fixes and enhancements to 5.4.3.e

	o  Added capability to edit attributes of lines, fronts
	   winds and text after they are drawn in NMAP.  The attribute
	   editor is displayed after an element is selected from
	   the "select" operation.

	o  Added SAVE/SAVE_AS/RESTORE functions to NMAP product
	   generation for VG files.  The name of the VG
	   file appears in the title bar at the bottom of the 
	   NMAP display window.  The .DEFAULT.vgf has been 
	   renamed to .DEFAULT.vgf.save when product generation 
	   is exited.  When entering product generation, a blank 
	   VGF file will be loaded (after the first time when 
	   there will be a default file from 5.4.3.e).  The 
	   RESTORE function loads the VG file from the previous 
	   session.

	o  Added capability to rotate winds as they are being placed.

	o  Added capability to select which piece of a closed
	   area is to be saved when modifying it.  Also, fixed
	   the modify function to work properly when roaming.

	o  Added capability to display radar data in NMAP.  Note:
	   for centers that have radar data the environment variable
	   $RAD must be defined to the top of the directory tree
	   where the radar data resides.  Also, the file 
	   $GEMTBL/nmap/dcatg.nmap should have the IMAGE line
	   active and the SAT line commented out.

	o  Fixed problem with the REFRESH function.  Objects are
	   now displayed on top of filled areas when the REFRESH
	   button is clicked.

	o  Fixed problem where the turbulence symbols were not
	   being plotted in AFOS files.

	o  Fixed problem where blank out text was not being printed
	   by the post script driver.

	o  Corrected bug where titles were not appearing in 4-panel
	   displays of NTRANS.  

	o  Added new stations in Arizona and Nevada for NWX zone
	   forecasts.

	o  Added WFO stations, NEXRAD radar sites and County Watch 
	   Area maps to NMAP overlay function.  



See the N-AWIPS logs for additional details.  This patch includes
development from 12/2/97 to 1/5/98.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.f 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.f >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



