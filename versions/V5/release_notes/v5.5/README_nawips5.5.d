			N-AWIPS 5.5.d Release Notes
				08/28/00	

Patch 5.5.d covers development from July 3 to August 25, 2000.  


********************************************************************

I. Product Generation Changes


    A. NMAP Product Generation Improvements

	1. Track Function Improvement (SPC, AWC)

	The tracking function now has the option to use the frame times to
	calculate the track.  Select the desired first frame and click on
	the starting track point.  Select the desired second frame and click
	on the second track point.  The track is then calculated and drawn 
	using the selected frame times and track positions.  The track
	display has also been improved.  The track line is now wider and
	a diamond is used to mark the projected track positions.  Also, a
	label skip factor can be entered or just the first and last 
	projected track times can be labeled.

	2.  Label Value Display (HPC, RFC)

	The value of the text label for lines, fronts, symbols, and
	circles is now displayed when editing these objects.  This
	enhancement allows the user to see the label value if it is
	not visible in the graphical display.

	3.  Improved Palette Selection Indicator

	The selected action, class, and object are now indicated by
	reversing the color on the palette icon instead of 
   	highlighting the icon.  


    B. NMAP Product Generation Bug Corrections    

	1. Save After Append Problem (HPC, MPC)

	The save after a VG file is appended now works properly.  Previously,
	the save did not prompt the user for a file name the first time
	it was clicked after an append.

	2. Watch Warning Advisory Save Problem (SPC)

	Changes to the watch warning advisory save edit window are now
	saved to the text file.

	3.  Stationary Front Color Problem (MPC)

	Corrected a problem where the stationary front blue color was
	not set properly during post processing.

	4.  Multi-line Text Problem on Linux (HPC) 

	Corrected a problem where multi-line text was appearing as
	a single line after post-processing the VG file on Linux
	platforms.

	5.  Incorrect Local Directory Location After Browse (HPC) 

	Corrected a problem where the local directory improperly pointed
	to the browse directory in the VG open function.  This problem
	only occurred if the browse button was clicked.

	6.  Graph-to-Grid Negative Numbers Problem (HPC)

	Corrected a problem where graph-to-grid sometimes ignored the
	GGLIMS parameter and created incorrect negative values.

	7.  Outlook Flipped Lines Problem (SPC)

	Corrected the outlook text message when lines are flipped.

II. NMAP Display Improvements	


    A. New Hot Key for LUT Restore (TPC)

       Added a new hot key, f, that restores the proper look-up table
       when switching between instances of NMAP or NMAP2.  This key
       resets the fade control to the default setting.  Note that
       this hot key is not case sensitive.

    B. CWA and NEXRAD Added to Seek and Locator Functions (SPC)

       The County Warning Area (CWA) and NEXRAD radar location have been
       added to the seek and locator functions in NMAP and NMAP2.


III. NMAP Bug Corrections

    A.  Maximum Number of Grid File Times Correction (SPC, HPC)

	The maximum number of times was corrected in NMAP/NMAP2 to
	use the maximum allowable grid times.  Previously, NMAP was
	failing when the number of times in a cycle exceeded 200.

    B.  Upper-Air Station Models (TPC)

	Corrected problem where adding new station models to the table:
	$GEMTBL/config/prmlst.tbl did not get read by NMAP. 

    C.  Seek Function (TPC)

	Corrected problem where the seek function could not access
	the break points table.



IV. Decoder Improvements

    A. International SIGMET Decoder (AWC)

       DCISIG was modified to decode flight levels without the "FL"
       prefix.  It was also changed to decode the new WMO header
       PHFO from Hawaii.  Also added the capability to decode
       the tropical cyclone, TC, phenomena type.  This sigmets
       can now be displayed with The tropical cyclone symbol in GPMAP 
       and NMAP2.

    B. New AIRMET Decoder (AWC)

       A new airmet decoder (DCAIRM) has been written.  Airmets
       can now be displayed in GPMAP and as a miscellaneous type
       in NMAP2.


V. General Improvements

    A. GIF Driver Added to SNCROSS, SNHODO, SNTSER, GDCROSS, GDTSER (TPC) 

    B. SNCROSS (HPC)

       Several improvements were made to SNCROSS.  These include 
       increasing the internal grid size to better define the 
       data boundaries, adding the option to color fill the area
       underground, and adding line color, type, and width to
       the border.

    C. Map File Updates

	1. Coastline Map Improvements (TPC)

	The coastline map has been improved.  Islands were added and
	the resolution now matches the high resolution baseline political
	boundary map.

	2.  RFC Boundary Map Improvements (RFC)

	The State College RFC boundary was corrected.

    D. Line Ghosting Improvements (TPC)

       Improved the ghost line appearance in product generation and the
       seek function.  The ghost line is now wider and appears white on
       a black background.

    E. Tab Removal in NWX Table (Unidata)
	
       Removed unnecessary tabs in the table: $NAWIPS/tables/nwx/dclim.stn
       reported by Unidata.

    F. ERMISS.FNC position in FORTRAN Files Corrected (Unidata)
	
       The GEMPAK function: "ERMISS.FNC" is now properly located within
       the declaration statement to comply with FORTRAN standards.

    G. CLO Changes  *** Important Please Note ***

       The clo functions that support the locator and seek functions
       have been modified.  The functions can now handle a generalized
       bound file format.  The following tables were modified:

		$GEMTBL/config/clo.tbl
		$GEMTBL/nmap/locator.tbl
		$GEMTBL/bounds/countybnds.tbl, countybnds.tbl.info

       Note that the first entry in the locator.tbl appears at the
       default in the locator function.

       The table $GEMTBL/cities/citiesloc.tbl has been removed and replaced
       by: $GEMTBL/stns/cities.tbl which is now a standard station table.

       New generalized state and CWA bounds tables now are used.  They are:

		$GEMTBL/bounds/statebnds.tbl, statebnds.tbl.info
		$GEMTBL/bounds/cwabnds.tbl, cwabntd.tbl.info

    H. Corrected Contour Discontinuities Across Greenwich Meridian (MPC, HPC)
       
       Added grid shifting for CED and MER grid for contouring.  This
       modification allows contouring across the prime meridian without
       discontinuities.  When creating VG files, this correction eliminates
       two separate lines.

    I. New AVN/MRF MOS Added to NWX

       The new formats for AVN and MRF MOS can now be displayed in NWX.
       They appear as "NEW AVN" and "NEW MRF" in the NWX GUI.

    J. Non X-Based GIF Driver

       A new non-X based GIF driver has been added called GIF2.  This
       driver does not use X Windows.  Note that hardware attributes 
       including hardware fonts and line widths are not available 
       with this driver.  The X-based driver, GF, continues to be
       supported.

    K. NETCDF Library

       NETCDF library routines have been added.  In the future they will
       be used to access AWIPS data sets.  They are located in:

		$GEMPAK/source/netcdf-3.4


VI. Known Problems

    A.  Add/Delete Counties 

	If counties are added or deleted, these counties are not saved 
	correctly to the product text files if either the "Apply" button
	is clicked on the "FORMAT WATCH" GUI, or the watch is saved and
	issued later in a session.

    B.  Watch County List Fatal Error

	If any button in the "Watch Specifications and County List" GUI
	is clicked BEFORE a watch is drawn, NMAP/NMAP2 will crash.


VII. Calling Sequence Changes

    A. $GEMPAK/source/gemlib/gg/ggmisc.f
    B. $GEMPAK/source/programs/gp/gpmap/gpminp.f
    C. $GEMPAK/source/cgemlib/cvg/cvgtrksto.c, cvgsvtrk.c
    D. $GEMPAK/source/bridge/hc/hcdecd.f
    E. $GEMPAK/source/gemlib/gr/grrarg.f


See the nawips.log and changes.log for additional details concerning
these routines.


VIII. NMAP2: Evaluation Version:

**** NOTE THAT NMAP2 SHOULD NOT BE USED TO CREATE OPERATIONAL PRODUCTS. ****  

NMAP2 continues to be made available to obtain user feedback.  Many 
bug corrections and improvements have been made in response to user 
feedback and CDB testing.

    A. NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g, satellite
	   data are not implemented in NMAP2.

    A. NMAP2 Bug Corrections

	1.  Inability to Change Map Attributes (TPC)
    
	    Map and lat/lon attributes such as line color and width can now
	    be modified.  Click the "LOAD" button from the map window to
	    apply attribute changes.

	2.  LUT Reset Problem (TPC)

	    Fixed the problem where the Look-up tables were lost if the cancel
	    button in the Data Selection Window was clicked.

	3.  Seek Function Problem (TPC)

	    The seek function now operates properly for cities such as San 
	    Juan, Puerto Rico which are not part of states.  This correction
	    also applies to NMAP.

	4.  Island Corrections (TPC)

	    The islands table used by the seek and locator function was 
	    corrected and updated to include the TPC additions.  Locations 
	    for St. Thomas, Great Tobago, and Little Tobago were corrected.
	    This correction also applies to nmap.

	5.  Empty Image Directory Problem (TPC)

	    The fatal bug when accessing empty image data directories was
	    corrected.

	6.  Zoom Problems (TPC)

  	    All known zoom problems have been corrected. Clicking on the
	    cancel button no longer improperly sets the zoom in a loop. Also,
	    NMAP2 now properly de-activates the loop controls and auto-update
	    in all cases while the map window is active.  Previously,
	    zooming from the map window would activate these functions and
	    cause errors in some cases.  Also, the reload button now works
	    properly when observational data are loaded and the area is 
	    zoomed.  Finally, the zoom is properly retained if the cancel
	    button is clicked in the roam mode.

	7.  NOAA Logo Problems (TPC)

	    Corrected the logo placement errors when there are multiple loops
	    with different roam factors.  Also, NMAP2 now properly places the
      	    logo when no data frames are loaded.

	8.  Load From Station Edit GUI (TPC)

	    Corrected problem where the "Load" button did not work in the
	    station edit GUI.

	9.  Analysis Grid Data Handling	(SPC)

	    Fixed various problems in displaying analysis grids.  These
	    problems were detected by the SPC.  Also corrected errors
	    in the timeline and loading ordering for analysis grid and
	    MOS data.  


    B. NMAP2 Improvements

	1. New Hot Key for LUT Restore (TPC)

	   Added a new hot key, f, that restores the proper look-up table
	   when switching between instances of NMAP2.  This key resets the
	   fade control to its default setting.  Note that this hot key
	   is not case sensitive.

	2. Improved Data Selection (TPC)

	   Modified the data selection so that the last path accepted for
	   each data category is "remembered"  When a new source and category
	   are selected, the last entries for that category are highlighted.
	   This "remembering" works across loops.

	3. AIRMET Display (AWC)

	   Airmets can now be displayed as a miscellaneous data type.


    C. NMAP2 Known Bugs

	1. NMAP2 will "burn-in" the product generation graphic in the
	   following scenario.  
		
		a. Start product generation before loading data.  
		b. Load data into more than one loop where one of the
		   loops has a roam factor set and a non-roamed loop
		   is in view. 
		c. Exit product generation.

            The VG file graphic remains on the last frame of the non-roamed
	    loop.  This "burn-in" problem only happens in this scenario.

	2. Image Unzoom in the Map Window

	   The unzoom from the map window on images does not draw the proper
	   map in the map window.  However, if the "Load" button is clicked,
	   the unzoomed image will load properly.

    D. NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g, satellite
           data are not implemented in NMAP2.



*****************************************************************************

INSTALLATION NOTE:

This patch requires new links for the MOS station tables for NWX.  The
following links are required in $NAWIPS/tables/nwx:

ln -s ../../gempak/tables/stns/avnmos.stn avnmos.stn
ln -s ../../gempak/tables/stns/mrfmos.stn mrfmos.stn
ln -s ../../gempak/tables/stns/ngmmos.stn ngmmos.stn
ln -s ../../gempak/tables/stns/newmos.stn newmos.stn

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.5.d 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.5.d >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

