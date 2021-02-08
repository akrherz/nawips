			N-AWIPS 5.4.3.g Patch Release Notes
				2/24/98

     This patch contains some bug fixes and enhancements to 5.4.3.f

	Several new capabilities and enhancements have been added to 
	product generation.  They include:

	o  Added capability to append VG files together.  Append is now
	   a option when opening a VG file.  

	o  Improved the open/close VG file functions.  The active file 
	   name is now cleared when exiting product generation or 
	   deleting all objects.  Also, changed the open function to 
	   require VG files to have the .vgf extension.

	o  Many improvements have been made to the line modification 
	   tool.  Additional points can now be added to lines and 
	   fronts without automatic termination at the closest 
	   vertex.  The tool also highlights which part of the object
	   will remain after modification by highlighting the
	   appropriate segment.  The user may change the direction 
	   of transversal by moving the mouse before clicking on the 
	   first new vertex.

	o  Added the Undo/Redo function for lines and fronts.  Any 
	   operation performed on a line or front can be undone or 
	   kept with the Undo/Redo function.

	o  Improved the text entering and editing functions.  Text can 
	   be entered and modified without having the cursor in the 
	   text pop-up panel.

	o  Updated the Watch-By-County function to allow watch 
	   definition and saving of counties to a GEMPAK file.   

	o  Created a new program, GPTEXT, which allows ASCII text files 
	   to be imported and output to available device drivers.  

	o  Changed the UTF driver to draw the selected line type 
	   around the fill region.

	o  Changed the FAX driver to draw the selected line type around 
	   the fill region.  Also, the dots are now drawn rounded 
	   instead of square.

	o  Changed the color of the product generation palette to black 
	   text with a vanilla background to improve readability.

	-----

	Several problems have been corrected in the product 
	generation.  They include:

	o  Fixed the problems associated with displaying dashed lines 
	   after zooming and moving them.  Also, fixed the problem of 
	   objects being saved into the background if data is loaded 
	   within product generation.  Also, fixed the problems 
	   associated with roaming in product generation.

	o  Fixed a fatal error when the line dashing pattern is 
	   modified in the table newdraw.tbl.

	o  Fixed the problem with invisible and inconsistent ghost line 
	   colors when editing objects.

	o  Fixed the calculation in the AFOS driver to include minutes as 
	   required for some AWC products.


	------

	o  Added the capability to display flash flood guidance (FFG) 
	   in NMAP.  FFG can be displayed as color coded markers or 
	   numeric values.  FFG may be overlayed with other NMAP 
	   data types.

	o  Made the default filter values for data plotting 
	   table-driven for NMAP. The filter value for surface, ship, 
	   and FFG is a field in the tables sfc_stn.tbl, ship_stn.tbl, 
	   and ffg_stn.tbl, respectively.

	o  Fixed the problems with time matching for radar data in NMAP. 

	------

	o  Added color coding of parameters to SFMAP.

	o  Added new decoder for land synoptic data.  The display of 
	   synoptic data in NMAP will be added in a future patch.

	o  Added the capability to change the default colors for 
	   printing from the GEMPAK and GUI programs.  A new table, 
	   $GEMTBL/colors/cvtclr.psc may be edited to change the 
	   color values.


See the N-AWIPS logs for additional details.  This patch includes
development from 1/5/98 to 2/24/98.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.g 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.g >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



