			N-AWIPS 5.4.3.b Patch Release Notes
				10/14/1997

This patch contains some bug fixes and enhancements to 5.4.3.a

	o Updated the calculation of the AFOS time stamp to use
	  a base time supplied by the user in the UTF driver. An
	  appropriate valid time for forecast products is now
	  written to the file.

	o Corrected the problem where the vertices of closed
	  lines were not being properly placed when editing
	  them.

	o Fixed the font pop-up menu problem in NMAP where the
	  font was not properly being re-set to the default
	  (Courier).

	o Added marker attribute editing pop-up to NMAP.


See the N-AWIPS logs for additional details.  This patch includes
development from 10/8/97 to 10/14/97.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.b 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.b >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.



