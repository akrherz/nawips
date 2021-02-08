			N-AWIPS 5.4.3.v Patch Release Notes
				9/30/99	

Patch 5.4.3.v covers development from September 8 to September 29, 1999.   

		  Product Generation Changes
		  --------------------------

Improvements to NMAP product generation functions include:

	o The International Sigmet formatting has been improved.
	  The date, movement, trend, remarks, and forecaster
	  name have been added to the User Interface and are
	  placed into the output text message.  

	o Several changes to the Sigmet product generation functions
	  have been made at the request of the AWC.  The position
	  of the Sigmet type has been rearranged in the GUI with
	  area, line and isolated types from left to right. The  
	  maximum sequence number has been increased to 300.  
	  The file name for the outlook Sigmet has been corrected.

	o Modify, partial delete, multi-select, delete object, and
	  connect functions now work for Sigmet objects.

	o The order of operation when opening the product
	  generation palette has changed.  The working file, 
	  .DEFAULT.vgf is now created before the palette is displayed. 
	  This change better prevents the possibility of multiple 
	  NMAPs running product generation in the same directory.


Improvements to product generation post-processing functions include:

	o Improvements were made to the Graph-to-Grid program as
	  requested by the HPC. The problems with smoothing of 
	  missing data were eliminated.  Also, the program now applies
	  limits to computed grid point values. The maximum number 
	  of lines was increased to 200.



		NMAP Display Improvements	
		-------------------------

	o Added a new function to retrieve the satellite IR temperature
	  and associated sounding derived height and pressure. The 
	  function called "Cloud Hgt" is invoked in a similar fashion
	  as the seek function.  Click on the "Cloud Hgt" button 
	  next to the seek button on the main NMAP title bar.  Move 
	  the cursor to the desired pixel and click the left mouse 
	  button.  The function returns the pixel value, temperature in 
	  degrees Kelvin and the distance in kilometers to the nearest 
	  sounding that has appropriate data.  The height in feet and
	  pressure in millibars corresponding to the satellite derived 
	  temperature appears in the scroll window.  The function finds 
	  the corresponding height by starting near the top of the 
	  sounding and moving down.  Therefore, in some cases there 
	  may be more than one height and pressure in the scroll box 
	  corresponding to the estimated cloud top temperature.  
	  Currently, the function uses soundings from the 0Z or 12Z 
	  sounding files where images with times earlier than 12Z use 
	  the 0Z file, and images with times later than 12Z and less 
	  than 0Z use the 12Z file. Note that to activate this function 
	  after drawing in product generation, click the "Take Control" 
	  button.
	  
	o Increased the number of models allowed in the user interface
	  from 30 to 60.

	o Changed the seek function to use a cross-hair cursor when
	  it is active.  The Cloud height function also uses the
	  cross-hair cursor when active.

		
		NMAP Bug Corrections
		--------------------

	o Corrected problem detected by the SPC where data sets without
	  the date/time string in file name template were not being
	  loaded properly.

	o Fixed the problem, where in some cases, the watch status line
	  labels were not being plotted in the proper location.

	o Corrected problem where model data products were sometimes 
	  overwriting the display of other data types.


		General Improvements
		--------------------

	o Modified the PostScript driver to select the paper size
	  better.  Also, changed the paper size 24 x 36 to 20 x 32 to
	  print the entire plot.  Added the paper size, 32 x 42.

	o Added the Convective Sigmet boundaries as a background map.
	  The alias name for this map is convsigmet.


		Known Problems
		--------------

Auto-update occasionally fails to properly update when the skip 
factor is greater than one.


		Calling Sequence Changes
		------------------------

The calling sequences have been changed in the following routines:

	gempak/source/cgemlib/cfl/cflmdat.c
	gempak/source/gemlib/fl/flmdat.f
	gempak/source/programs/gd/grphgd/grginp.f
	nprogs/nmap/source/nmap_mcanvw.c
	gempak/source/cgemlib/cvg/cvgsigsto.c, cvgsvsig.c

See the nawips.log and changes.log for additional details concerning
these routines.


		Table Format Changes
		--------------------

The format for the Sigmet product table, $GEMTBL/pgen/sigmetinfo.tbl has
been changed and is NOT compatible with previous versions.


		Planned Development
		-------------------

This section is an attempt to communicate CDB software development
plans.  The information is an estimate at the time the release notes
are written.

NMAP2 is currently being tested and de-bugged by the CDB.  A
testing and evaluation version will be released in the future.

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.v 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.v >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
