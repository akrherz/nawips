			N-AWIPS 5.4.3.e Patch Release Notes
				12/3/1997

This patch contains some bug fixes and enhancements to 5.4.3.d

	o  Added capability to edit parts of lines and fronts in
	   NMAP product generation.

	o  Added computations for distance and direction from 
	   VOR and anchor points for  watch-by-county function 
	   in NMAP.  VOR and anchor points can be displayed as
	   markers.

	o  Modified NMAP so that front width and wind width defaults
	   can be read from the table newdraw.tbl.  NOTE: The format
	   of newdraw.tbl has been changed.

	o  Changed the move object function in NMAP so that the closest
	   vertex is selected when moving an object.

	o  Corrected a bug found by the AWC where text object movement
	   was not being handled properly if other objects were deleted.

	o  Sorted the faxprod.tbl table by wheel ID.  Modified the
	   rotation values for the AWC products.  Also modified
	   the indentation and reserved values for the TPC products.

	o  Increased the maximum number of product groups for model data
	   in NMAP from 10 to 25.

	o  Made relh and dpdc parameters available for surface data
	   in NMAP as requested by the SPC.

	o  Added a new grid diagnostic to compute wet bulb potential
	   temperature.

	o  Fixed a bug in NALARM where the program was not flashing 
	   when new AFOS products were stored.  This problem appeared
	   on HPUX10 platforms.   
	   
	o  Modified NTRANS and device drivers to allow a color 
	   Look-Up-Table to be applied to printer output.

	o  Fixed the front setting software to accept a front code
	   of "0".

	o  Modified the calling sequence of GSTEXT/GQTEXT.  Added
	   new parameters for border/blank fill type, rotation
	   orientation (screen or north relative) and justification.
	   The border/blank fill type is not implemented in this
	   patch.  Modified GTEXT to rotate text in either screen 
	   relative or north relative mode.


See the N-AWIPS logs for additional details.  This patch includes
development from 11/4/97 to 12/2/97.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.e 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.e >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



