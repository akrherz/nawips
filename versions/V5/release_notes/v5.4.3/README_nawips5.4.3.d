			N-AWIPS 5.4.3.d Patch Release Notes
				11/6/1997

This patch contains some bug fixes and enhancements to 5.4.3.c

	o Added initial capabilities for watch-by-county product generation.

	o Added N-AWIPS version number display to all GUI programs. 

	o Added the capability to disable the stop button in NTRANS so that
	  the user may click ahead to select products.

	o Added new decoder for AIRCRAFT (AIREP, PIREP, RECCO, AMDAR)
	  bulletins.  The decoder creates ship-type GEMPAK surface files.

	o Corrected several problems in the product generation 
	  software.  

		- Corrected the problem where some operations in
		  NMAP were not properly refreshing.

		- Corrected the range errors for non-centered special
		  text.

		- Fixed the bug with move and select operations when
		  zooming and roaming.

	o Fixed problem where incorrect values of VSBY and PO3I where
	  being displayed in NMAP.

	o Set the color for THTA labels in GDCROSS to be the same as 
	  the border color.  The color was previously undefined.

	o Fixed problem in GPMAP where text attributes were not being
	  properly reset after VG or AFOS files were plotted.


See the N-AWIPS logs for additional details.  This patch includes
development from 10/23/97 to 11/4/97.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.d 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.d >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



