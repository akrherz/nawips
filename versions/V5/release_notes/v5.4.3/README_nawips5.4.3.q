			N-AWIPS 5.4.3.q Patch Release Notes
				6/11/99	

Patch 5.4.3.q covers development from May 24, to June 10, 1999.

		  Product Generation Changes
		  --------------------------

The following new functions have been added to product generation in NMAP:

	o Added delete object action.  This function allows the deletion of
	  all objects of a particular type.  For example, to delete all cold
	  fronts, click on "DEL OBJ".  Then click on the "Front" and "CLD"
	  icons on the product generation palette.  All cold fronts are 
	  highlighted and are deleted by clicking on the "OK" button.

	o Added the capability to draw circles.  Click on the "Circles" class
	  icon.  The center of the circle is defined by the cursor.  The 
	  circle size is specified by moving the mouse and clicking the 
	  left mouse button when the desired radius is achieved.


Improvements to NMAP product generation functions include:

	o Made several improvements to the track function.  Track information
	  including speed, direction, and vertex position is displayed by
	  selecting the track after it is drawn.  Also, the track can be 
	  adjusted by selecting a vertex.  Other applicable actions now work 
	  for the track object including move, copy and group.

	o Added group type selection to symbols, front and line labels.
	  All valid groups can now be assigned to labels.

	o Made several refinements to the watch formatting at the request of
	  the SPC:  
		- Watches can now have multiple replacement numbers;
	  	- the default issuing status is active;
		- the default half-width is 60 statute miles; 
		- the default expiration time rounds to a whole hour;
		- the watch object is saved to a VG file;
		- the text product file name can not be modified in the 
		  Product Save text box;
		- the half-width for VOR is now rounded to the nearest
		  5 nautical mile;
		- the watch number is now based on existing watches
		  in the directory.

	  Also corrected the snapping so that it properly references 
	  anchor points inside the watch box.


			NMAP Display Improvements	
			-------------------------

	o  Refined the drawing of watches and warnings at the request of the
	   SPC.  Removed the watch number, date and time, and the warning 
	   county, date and time from the display to reduce clutter.  
	   Added a title string to the bottom of the plot area.  The title 
	   time is the clock time when the watches and warnings are plotted.  


			Other Improvements
			------------------

	o  Increased the maximum number of stations from 3800 to 4800 in
	   GEMPAK files to accommodate more international synoptic stations.

	   NOTE:  This change REQUIRES a complete system rebuild.

	o  NAMSND was modified to allow character station identifiers to
	   be read and written to GEMPAK output files from the model
	   BUFR sounding files.



			General Bug Corrections
			-----------------------


	o Corrected some problems with the auto-update.  Auto-update now 
	  handles the case where files are saved out of chronological order.
	  The file name instead of the file modification time is used to check
	  the chronological order of files.  Also, in some cases the time
	  line was not properly reflecting the actual frame loaded.  This
	  problem has been corrected.  Auto-update still occasionally fails
	  to update properly when the skip factor is greater than one.

	o Corrected the watch decoder, dcwtch, to treat replaced watches
	  as watch cancellations.

	o Fixed problems plotting lat/lon lines for the satellite projection
	  (un-remapped) images.  This problem was found by the AWC.

	o Corrected the AFOS driver to properly place the AFOS end of file
	  string.  This correction allows the product to be put directly on
	  the AFOS communications network.

	o Corrected two printing problems in NMAP.  Corrected problem with
	  printing all frames with model data.  Also eliminated the
	  extra blank page at the end of all prints from nmap.


			Known Problems
			--------------

Auto-update occasionally fails to properly update when the skip factor is 
greater than one.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.q 

To execute the script and save its output in a file type:

		cd $GEMPAK/build
		patch_build_5.4.3.q >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
