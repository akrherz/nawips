			N-AWIPS 5.4.3.i Patch Release Notes
				6/24/98

This patch contains several new capabilities and improvements to the product 
generation software.

New capabilities include:

	o The ability to generate a parallelgram watch and write the watch
	  information to a GEMPAK file.  This function is preliminary in
	  nature and has the following known problems:  When multiple watches
	  are being created/edited, the attributes and half-widths may change.
	  Also, attributes are not editable and plotted watch numbers are
	  rotated incorrectly.

	o The ability to generate a QPF text message from a QPF chart.

	o The ability to open and save VG files for editing from other 
	  directories other than the local directory.  A browse feature has
	  been added.  To open a file, read permission is necessary.  To
	  save a file, write permission is necessary.

Improvements include:

	o Made modifications to the Outlook product generation as a result 
	  of SPC testing.  Added a table, $GEMTBL/nmap/outlook.tbl, that allows 
	  the definition of outlook areas to be table driven.  Also, added the 
	  label earth location to the output text file.  Rounded off the points 
	  inside 7.5 miles to the nearest VOR point.

	o Changed the pip size to a floating number to improve the control of
	  pip size.

	o Undo function now works for all operations except refresh and 
	  delete all.	

	o Software text is now rotated upon initial placement like the wind
	  barbs and arrows.

	o Added new line dashing patterns.

	o Rearranged the text popup window and buttons.  Text attributes 
	  are now saved for each type of text from instance to instance.
	  Initial settings are controlled by the table setting.tbl.

	o Added the capability to flip the arrow head from one end to the 
	  other end of line.

	o Improved GPTEXT to better handle multiple columns of text. 

	o Reduced the size of the ROAM widget.

	o Improved the performance of special line access by saving the line
	  pattern information in memory instead of reading the information 
	  from a file multiple times.

	o Added highlighting to the palette buttons to indicate which operation
	  is active.

	o Improved the calculation of the refresh area for text strings.

	o Selected objects will be displayed with handle bars from frame
	  to frame.

	o Updated product generation help.  Also add a What's New help to
	  NMAP help list that gives new features and improvements.


Patch h and i VG file Incompatibilities:

	The scaling of pip size has changed in patch i.  Also, all text is now
	stored as special text.  Therefore, front pips and text produced in
	patch i will not display properly in patch h.  A convert program, 
	convcvg, MUST be run to convert patch i VG files to patch h compatible 
	files.  
	
	Usage:  convcvg 3i3h infile outfile

	Patch i can display VG files created in Patch h.


Several improvements have been made to the NMAP display functions.  They 
include:

	o  Added the ability to access previous model runs.  Also NMAP can now
	   access models with non-uniform forecast time increments, e.g., the
	   RUC2.

	o  Modified the data access for satellite data making it like the radar 
	   data access.  This change allows the display of irregularly spaced 
	   satellite images.

	o  Added the display of the dominant frame time to the NMAP border.

	o  Loading and looping will now always terminate on the last frame 
	   except for model data.

	o  Added the ability to vary the text size and other text attributes 
	   in the station plot map overlay function.

	o  Added mandatory levels above 100 mb to the NMAP station model for 
	   upper air data.

	o  Added the marine coastal zones as a map background.


Decoders:

	o  The METAR decoder wil now choose 3 levles of sky cover data based
	   on an FMH-1 algorithm, rather than just using the first 3 levels 
	   found.  Ceiling height is now available.  Also, tornados, funnel
	   clouds, and water spouts are decoded correctly.


Bug fixes:

	o  Corrected problem where upper-air data were not displayed properly 
	   for intervals less than 12 hours.

	o  Fixed problems with special line drawing.  Front pip size now stays
	   the same as the length of the front changes.

	o  Fixed several bugs detected by the AWC in the code.  These include
	   calling sequence error in testcgr; removing unused cvgctdsto.c and
	   cvgsvctd.c; the use of Xtfree instead of free, where appropriate;
	   adding XmprocessingDirection for all scale widgets; and the use
	   of xmotion field in the roam control structure to ensure 
	   smoother roaming.


See the N-AWIPS logs for additional details.  This patch includes
development from  5/7/98 to 6/24/98.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.i 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.i >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


