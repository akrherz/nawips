			N-AWIPS 5.4.3.s Patch Release Notes
				7/14/99	

Patch 5.4.3.s covers development from June 29, to July 13, 1999.   

		  Product Generation Changes
		  --------------------------

Improvements to NMAP product generation functions include:

	o  Modified the outlook product generation to add connecting
       	   line segments between grouped arrow lines.  These
	   segments indicate the order in which the information
	   is written to the file.  If the order is incorrect,
	   the user may click to UPDATE button and the ordering
           will change.  This step can be repeated until the
	   proper order is obtained.  This modification addresses
	   the incorrect order problem that sometimes occurs with
	   outlooks with 3 segments that are grouped together.



			NMAP Display Improvements	
			-------------------------

	o  Added an option to toggle the display of the image in the
	   NMAP MAP Selection Window.  The default is set to NOT
	   display the image.

	o  Added ability to edit the attributes of the Watch/Warn
	   data type.  The user can change colors, labeling, and
           warning marker type by clicking on the edit button in
	   the data (Frame Set Definition) window.  Also, changed
	   NMAP to only allow one instance of the Watch/Warn data 
	   type. 


			General Improvements
			--------------------

	o  Updated the Aircraft decoder to handle more PIREP 
	   parameters. The sky cover group, icing type, turbulence
	   frequency and turbulence type are now decoded.



			General Bug Corrections
			-----------------------

	o Modified GPMAP to save text attributes and reset them
	  after a VG file is displayed.  This prevents the problem
	  of text attributes from the VG file being used in subsequent
	  GEMPAK programs, like GPTEXT, when they are not explicitly
	  set.

	o Corrected the Watch decoder to properly obtain the watch area
          corner points.


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


Patch T:  Anticipated Delivery - August
--------

	o Add a preliminary version of international SIGMET product 
	  generation.

	o Make the background file open functionality available in
	  product generation.


NMAP Data Handling Redesign:  Anticipated Delivery - September
----------------------------

	Significant changes in NMAP data handling are being made.  
	These changes will make it much easier to add new data types 
	to NMAP.  Also, the re-design will allow new capabilities 
	such as multiple loops, paneling, and saving display 
	configurations to be added in the future.



The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.s 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.s >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
