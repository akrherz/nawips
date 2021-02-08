			N-AWIPS 5.4.3.t Patch Release Notes
				8/18/99	

Patch 5.4.3.t covers development from July 17 to August 18, 1999.   

		  Product Generation Changes
		  --------------------------

New product generation functions include:

	o  Added preliminary capability to draw, edit and create
	   international SIGMET messages.

Improvements to NMAP product generation functions include:

	o  Added the zero value for line labels.

	o  Added a new symbol for tropical storms.



			NMAP Display Improvements	
			-------------------------


	o  Added the LAKES map to the map overlay list for NMAP.



			General Improvements
			--------------------

	o  Updated the aircraft decoder to store the undecoded report 
	   string in a GEMPAK file.  Also, all base and top heights 
	   are now stored in feet instead of meters.

	o  Added new aircraft parameter symbols ITSY, TTSY, and TFSY
	   which are icing type symbol, turbulence type symbol, and
	   turbulence frequency symbol, respectively.

	o  Added function PR_XVFR to calculate flight conditions: 
	   instrument flight rules, IFR, visual flight rules, VFR, 
	   and marginal visual flight rules, MVFR, from ceiling and 
	   visibility information.  This function was developed by
	   the AWC.

	o  Added Flight Information Region (FIR) map backgrounds to
	   map file database.

	o  Modified the program GDPLOT2 so that it now allows the
	   input of cycle information in the file specification 
	   like the other GD programs.  Note that the calling
	   sequence for TG_QRNG has changed.

	o  Modified GDPLOT2, GDPLOT and GDWIND to use the latitudinal
	   wind filter properly.


			General Bug Corrections
			-----------------------


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


NMAP Data Handling Redesign:  Anticipated Delivery - September
----------------------------

	Significant changes in NMAP data handling are being made.  
	These changes will make it much easier to add new data types 
	to NMAP.  Also, the re-design will allow new capabilities 
	such as multiple loops, paneling, and saving display 
	configurations to be added in the future.



The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.t 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.t >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
