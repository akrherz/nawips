			N-AWIPS 5.4.3.p Patch Release Notes
				5/24/99	

Patch 5.4.3.p covers development from May 4, to May 24, 1999.

		  Product Generation Changes
		  --------------------------

The following new functions have been added to product generation in NMAP:


	o Added initial capability to draw a track and extrapolate the track 
	  into the future.  A new track class has been added to product
          generation for this feature.  Currently, only the delete action can
	  operate on tracks after they have been drawn.


Improvements to NMAP product generation functions include:

	o The HPC excessive rainfall text product has been enhanced by adding
	  distance and 16-point compass direction information relative to
	  station reference points.

	o Product message windows now disappear after clicking to save text 
	  products.

	o The default value for front labels is now set according to the front 
	  type.

	o Changed the format of the hurricane track product to conform to
	  the ACTF requirement.


The following improvements have been made to product generation post-processing
capabilities:


			NMAP Display Improvements	
			-------------------------

	o Model data no longer has to be dominant when combining with other 
	  data types.

	o Added capability to display the latest watches and warnings in NMAP.  
	  Watch parallelograms are plotted with valid time information.  
	  Warnings are indicated by plotting a marker at the county centroid.  
	  Watch and warning types are indicated by color coding.  Thunderstorm
	  watch and warnings are cyan and tornado watch and warnings are
	  red.  Flash flood warnings are green.

	  
			Other Improvements included in this patch
			-----------------------------------------

	o Added decoders dcwarn and dcwtch that decode watches and warnings.  
	  The output of these decoders are ASCII files that can be read by 
	  NMAP and GPMAP.

	o Added the capability to reduce the number of points that are 
	  generated for contours and maps.  A new parameter, fltr has been 
	  added to the LINE variable that allows control of the amount of point 
	  reduction.  This feature is especially useful for the generation of 
	  contours for VG file editing in NMAP.

	o Changed the GEMPAK mandatory flag (/MAN) option for upper-air data.  
	  If this flag is specified, no interpolation is performed.  Formerly, 
	  if data were missing from a particular mandatory level, data from 
	  other mandatory levels were interpolated to the missing data level.

	o Moved the color bar labels for radar images to the center of each box
	  on the color bar.  Also, added CLRBAR to SFMAP to control the 
	  appearance of the color bar displayed for color-coded parameters.


			General Bug Corrections
			-----------------------

	o Corrected problem in the contouring algorithm where in some cases a 
	  portion of the contour was being drawn twice.

	o Corrected Y2K problems with images detected by the AWC.

			Known Problems
			--------------

	o Autoupdate does not work properly when a skip factor greater than one
	  is set.



The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.p 

To execute the script and save its output in a file type:

		cd $GEMPAK/build
		patch_build_5.4.3.p >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
