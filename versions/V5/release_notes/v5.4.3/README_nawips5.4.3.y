			N-AWIPS 5.4.3.y Patch Release Notes
				1/28/00	

Patch 5.4.3.y covers development from December 17 to January 28, 2000.   

		  Product Generation Changes
		  --------------------------


Improvements to NMAP product generation functions include:


	o  Several modifications were made to the watch generation 
	   function: 

		- The watch county centroid locations are now stored 
		  with the watch object in the VG file.  This change 
		  was done in preparation for adding and deleting
		  counties from a list available in a future release.  
		  Note that watches created before this patch will 
		  automatically be converted to the new watch format 
		  when they are read in.

		- The counties included in a watch are no longer
		  automatically calculated and displayed when a
		  watch is created or edited.  Click on the "Create 
		  Counties" button on the "Watch Specifications and 
		  County List" panel to calculate and display the 
		  counties enclosed or touched by the watch box. Click 
		  on the "Clear Counties" button to eliminate all 
		  counties associated with the watch.

		  If a state is turned off, counties associated with that 
		  state will not be displayed and not be included in the
		  county list.

	o  Improvements made to the international SIGMET
	   generation function include:

		- Added the capability to input two flight levels for
		  cloud heights.

		- Added the capability to enter two flight levels for
		  turbulence reports.

		- Added the options for "TO", "ABV" "BLW", and "BTN"
		  to the GUI and properly space the output in the 
		  text product.  If "FCST" is chosen when specifying
		  the flight levels, the level information will
		  immediately follow the phenomena specification.
		  Conversely, if "TOPS" is chosen, the level 
		  information will appear in the usual place following
		  the from line.

	o  Modified the VG file read and write routines so that VG
	   files created on Linux platforms can be read on other
	   platforms and programs running on Linux can read VG 
	   files created on other platforms.

	o  Modified the streamline line type to draw the arrow head
	   at the end of the streamline.  


		NMAP Display Improvements	
		-------------------------

	o  Added the moist-adiabatic technique to the cloud height 
	   function.  The technique uses the closest sounding.  If
	   the sounding is unstable, then the most unstable parcel
	   below 600 mb is lifted moist adiabatically until the 
	   satellite derived cloud top temperature is reached.  The
	   corresponding height is then returned as the cloud height.
	   If the sounding is stable, then no cloud height is calculated.
	   The sounding station ID and temperature are displayed.
	   Click on the "Moist-Adiabatic" radio button in the "CLOUD
	   HEIGHT OPTIONS" panel to invoke this technique.

	o  Modified the Seek and Locator functions to be table 
	   driven.  Now, any table in the standard GEMPAK station table
	   format can be added to these functions by editing two 
	   tables.  No software modifications are necessary.  The following 
	   tables must be edited:

		$GEMTBL/config/clo.tbl
		$GEMTBL/nmap/locator.tbl

	   The clo.tbl specifies an alias for the table, used in the
	   locator.tbl, and the format type of the table.  The locator.tbl
	   specifies the GUI name which appears in the Seek and Locator 
	   functions and the display format for the Locator function.

	   See the documentation in these tables for additional 
	   details.

	   Note that the deg/min format in the seek function is incorrect.
	   It gives values in decimal instead of deg/min format.

	o Added the active volcanos to the seek and locator functions.

		
		NMAP Bug Corrections
		--------------------

	o  Fixed Nmap problem where after printing in product generation
	   objects could not be selected without clicking the refresh
	   button.

	o  Corrected the set time function with the time line.  It works
	   as it did in earlier releases.


		NEW PROGRAM NMAP2: Evaluation Version:
		--------------------------------------

NMAP2 is a new version of NMAP that allows the loading and display of 
multiple loops of data.  Up to 4 independent loop sequences can be loaded and
displayed.  NMAP2 has also been structured to allow the addition of new data 
sets more easily.  Product generation functions have not been changed in NMAP2. 


**** NOTE THAT NMAP2 SHOULD NOT BE USED TO CREATE OPERATIONAL PRODUCTS. ****  

NMAP2 is being made available to obtain user feedback.

NMAP2 provides all the functionality of NMAP with the following exceptions:

	o The "Stop" function is not implemented.

	o The "RELOAD" frame function is not implemented.

	o Default data set selections for specific types, e.g, satellite
	  data are not implemented in NMAP2.

	o The "Set Time" function is not implemented.

NMAP2 provides the following new capabilities:

	o Up to 4 independent loops can be loaded, displayed and animated.
	  Look-up tables, zoom factors, and roaming factors are stored 
	  independently for each loop.

	o The roam factor may be selected before loading a loop sequence.

	o Loop sequences may be changed when in product generation.  Product
	  generation objects will be properly drawn when switching from
	  one loop sequence to another.

	o The most recent image or dataset is displayed while the rest of
	  the frames are loaded.

	o The time matching rule is the same for all data types in NMAP2.
	  The closest time is found to match the dominant time for
	  each frame regardless of whether that time is before or after
	  the dominant time.

NMAP2 has the following known problems:

	o The MISC data source type, i.e, watches, warnings, sigmets, etc., 
	  cannot be edited. 
	  
	o The station edit function does not work properly.

	o The "Show Image" function in the "Map Selection" window displays
	  the oldest image instead of the most recent.

	o Changing the data source from image to observations does not 
	  always work properly.

	o The last frame of the loop sequence is always displayed when
	  switching from one loop to another instead of remembering 
	  which frame was displayed previously. 

The user interface for selecting and loading data is significantly different 
from NMAP.  The following provides a brief description of the new interface:

	o Click on the "Data" icon or press the right mouse button, as in 
	  NMAP, to invoke the "Data Selection Window".

	o Click the "Add New Source" to select the desired data source.  
	  A "Data Source" panel will pop-up similar to NMAP to specify
	  the desired dataset.  Additional data sets can be added to
	  the loop by re-clicking on the "Add New Source" button.  The
	  selected data sets for the loop can be seen by clicking on
	  the "Data Source" button.

        o Each selected data source is added to the "Dominant Source" button
	  menu.  Click on this button to select the desired dominant data set.

        o Click on the "Loop" button to specify data sets for another
	  loop.  Select the data sets as described above.

	o Click on the "LOAD" button to load the selected data sets 
	  for the loop(s).

	o Click on the "Modify Source" button, to change a data set
	  for a loop.


Click on the labeled loop buttons that appear to the left of the "Zoom"
button in the main NMAP window to display different loaded loops.  Alternatively,
press the F1 - F4 keys to select the desired loop.

Click on the NMAP2 help in NMAP or NMAP2 to get the above help.


		Decoder Improvements
		--------------------

	o  Modified the International Sigmet decoder to decode the UK
	   sigmets which have a well-defined boundary.

	o  Modified the aircraft decoder, dcacft, to save the aircraft
	   type (ACTP), for PIREPS reports.  The aircraft type can now
	   be displayed in NMAP.  Also modified the decoder to store the
	   PIREP reporting station ID as the STID.   These changes were
	   made at the request of the AWC.

	o  The flash flood guidance decoder was modified to handle either
	   4 or 2 digit year coding.  Some RFCs are now using the 4
	   digit code. 

	o  Modified the marine decoder, dcmsfc, to check for an invalid
	   report time of 24Z that was occurring in some ship reports.
	   This change was made in response to a problem noted by the 
	   MPC.

		Map Improvements
		----------------

	o  N-AWIPS no longer needs swapped versions of map files for
	   Linux platforms.  All swapped map files for Linux have been
	   removed.  The directory $GEMMAPS/swapped has been removed.

	o  Added nine RFC basin map files.  These maps were generated
	   by the Arkansas-Red Basin RFC.  These maps can be referenced
	   by their alias names which are listed in the table:

		$GEMTBL/config/mapfil.tbl


		General Improvements
		--------------------

	o  Modified the contour types that are specified in the
	   GEMPAK variables CTYPE and TYPE.  Type "L" now specifies the 
	   GEMPAK contouring algorithm without sub-boxes.  It is somewhat 
	   faster because no sub-box checking is done.  Eliminated types 
	   "I" and "S" which were never implemented.


		General Bug Corrections
		------------------------
		
	o  Fixed the error reporting software in NTRANS when there are
	   too many Metafiles or metafile directories.  This error, 
	   reported by the HPC, was causing NTRANS to fail when the
	   maximum numbers were exceeded.  

	   Note that the maximum number of metafiles allowed in a
	   directory is 100.  The maximum number of metafile 
	   directories is 50.  If these numbers are exceeded, NTRANS
	   will write an error message to the Unix window it was
	   invoked from, and continue processing.  It will read up
	   to the maximum number of allowable files and directories.

	o  Fixed a bug that was causing watch cancellations and 
	   replacements to be ignored.  


		Known Problems
		--------------

Auto-update occasionally fails to properly update when the skip 
factor is greater than one.

The Seek function does not display the ghost markers and line when
roaming.  Click on the "Seek Results" window to make these features
reappear after roaming.  Also, if the data set or map background is 
changed, the seek function exits.  Click on the seek function icon to 
restore its current settings.

The seek function does not locate the county if an independent city
of the same name exists in the county's state.  The seek function
finds the independent city instead.


		.CSHRC Change *** IMPORTANT PLEASE NOTE ***
		--------------------------------------------

The NAWIPS .cshrc file should be modified to remove the check
for Linux when setting the environment variable GEMMAPS.  Linux
platforms no longer use their own swapped versions of N-AWIPS map files.


		Calling Sequence Changes
		------------------------

The calling sequences have been changed in the following routines:

	$GEMPAK/source/nmaplib/nms/nmsdspl.f

	$GEMPAK/source/gemlib/in/intype.f, inctyp.f

	$GEMPAK/source/cgemlib/clo/clocitygall.c, clofindmatch.c,
	clofindstn.c, clordstn.c, clotclosest.c, clotdirect.c,
	clotgid.c, clotgltln.c, clotinltln.c, clotinpoly.c

	$GEMPAK/source/cgemlib/cvg/cvgsvwbx.c, cvgwbato.c

	$GEMPAK/source/gemlib/im/imgpix.f

	$GEMPAK/source/gemlib/sn/snghgt.f.


		Moved NMAP Product Generation Code to New Library
		-------------------------------------------------

The NMAP product generation code located in $NMAP/source/vgf has been
moved to $GEMPAK/source/nmaplib/pgen.  This move was done to have
the common NMAP product generation routines in one library for use by  
NMAP and NMAP2.

See the nawips.log and changes.log for additional details concerning
these routines.

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.y 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.y >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA.
