			N-AWIPS 5.4.3.r Patch Release Notes
				7/1/99	

Patch 5.4.3.r covers development from June 10, to June 29, 1999.  This 
patch contains several emergency corrections made to patch q.

		  Product Generation Changes
		  --------------------------

Improvements to NMAP product generation functions include:

	o  Modified the track function to display the speed in knots 
	   and the direction from instead of towards the motion 
	   vector.

	o  Modified the watch function to perform the snapping after 
	   the mouse is released during modification.  This change 
	   was done at the request of the SPC.

	o  Improved the default group type that appears in attribute 
	   windows for symbols and lines.  All symbols now default to 
	   group type "LABEL".  Line types that used to default to 
	   "OTHER" now default to "LABEL".  Added "SLGT", "MDT", and 
	   "HIGH" label selections for the arrow-head line type for 
	   outlook labeling.  The attribute window editing now allows 
	   only one label to be placed per object.


			NMAP Display Improvements	
			-------------------------

	o  Roam factors are now table-driven.  A roam table, 
	   $GEMTBL/nmap/nmap_roam.tbl can contain up to 19 roam 
	   factors.  The factors in this table appear in the roam 
	   pull-down menu after the 'Fit to Screen and 'Size of Image'
	   options.  The maximum roam factor allowed is 20.  This 
	   table can be copied to a local directory to modify roam 
	   factors for a particular account.

	o  Increased the maximum number of data sources from 6 to 8.


			General Bug Corrections
			-----------------------

	o  Corrected a fatal bug with auto-update when the map window 
	   is popped up.


			Known Problems
			--------------

Auto-update occasionally fails to properly update when the skip 
factor is greater than one.

			Planned Development
			-------------------

This section is an attempt to communicate CDB software development
plans.  The information is an estimate at the time the release notes
are written.

The following describes some of the capabilities we are anticipating 
delivering in future patches:

Patch S:  Anticipated Delivery - about 2 weeks
-------
	o Correct the Watch decoder to properly obtain the watch area 
	  corner points.

	o Add additional pilot report information requested by the 
	  AWC to the aircraft decoder.

	o Add an option to toggle the display of the image in the 
	  NMAP MAP Selection Window.

	o Make the background file open functionality available in 
	  product generation.

	o Add a GUI for Watch/Warning display in NMAP.  This GUI will 
	  allow display of either watches or warnings or both.  Color 
	  and label options will also be available.


Patch T:  Anticipated Delivery - August
--------

	o Add a preliminary version of SIGMET product generation.


NMAP Data Handling Redesign:  Anticipated Delivery - September
----------------------------

	Significant changes in NMAP data handling are being made.  
	These changes will make it much easier to add new data types 
	to NMAP.  Also, the re-design will allow new capabilities 
	such as multiple loops, paneling, and saving display 
	configurations to be added in the future.



The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.r 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.r >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
