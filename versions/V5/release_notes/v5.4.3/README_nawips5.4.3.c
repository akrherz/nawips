			N-AWIPS 5.4.3.c Patch Release Notes
				10/27/1997

This patch contains some bug fixes and enhancements to 5.4.3.b

	o Added capability to turn off the fill for filled in 
	  regions when displaying VGF files in NMAP.

	o Added capability to display AFOS files in GPMAP.

	o Corrected several problems in the product generation 
	  software.  

		- Fixed the problem where symbols were not
	  	  always being properly stored in AFOS files.  

		- Fixed the problem where left or right justified
		  text could not be selected or moved if placed
		  near the left side of the screen.

		- Fixed the problem where setting the marker size
		  affected the size of the handle bar vertices.

		- Fixed the problem where the "all delete" function
		  was not properly deleting VG elements.


See the N-AWIPS logs for additional details.  This patch includes
development from 10/14/97 to 10/23/97.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.c 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.c >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



