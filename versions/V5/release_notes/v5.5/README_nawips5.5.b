			N-AWIPS 5.5.b Patch Release Notes
				06/01/00	

Patch 5.5.b covers development from April 21 to June 1, 2000.  
	

I. Product Generation Changes


    A. NMAP Product Generation Improvements

	1. Watch Generation Function

		a. Added the production of SEL and PWN text products.
		
		b. Added the capability to cancel watches for SEL and 
		   PWN products.  Click on the "Watch Cancel" object
		   button to cancel a watch.  

		c. Added a check for no anchor points within a watch
		   when drawing, editing, or formatting a watch.

		d. The watch number must now be entered when creating
		   a watch.  An error message pop-up appears if no 
		   watch number is entered.

		e. A forecaster name must now be entered when formatting
		   a watch.  An error message pop-up appears if no
		   forecaster name is entered.

		f. Increased the maximum number of forecaster names
		   from 20 to 30 for all SPC products.  Also, the
		   SPC products now all use the same table to 
		   retrieve the forecaster names.  The table is:
		   $GEMTBL/config/forecasters.tbl.

		g. Recreate instead of append text products if the
		   same watch number is re-entered.

		h. Corrected the watch duration warning message to
		   prevent the user from formatting the watch
		   without acknowledging the message.

		i. Corrected the watch text products when there are
		   multiple WFO's responsible for the same county.

	2. Convective SIGMET Product Change

	   The states included in a convective SIGMET are calculated
	   and now included in the output from line text file.

	3. Improvements to the Product Generation Open/Save Function

		a. Removed the file name entry text box from the open
		   GUI.  

		b. Removed the path name from the VG file name in 
		   the save GUI.

		c. The default location for saving a VG file is now
		   the "Local" directory no matter where the VG file
		   resided when it was opened.

		d. The current VG file name is now highlighted in 
		   the open GUI.

		e. Longer VG file names are now displayed in the NMAP
		   lower border.  The string "VGF:" has been removed
		   to allow for additional characters.
		   

	4. Graph-To-Grid Improvements

		a. Added capability to display filled contours and the
		   color bar.  The parameters FINT, FLINE, and CLRBAR
		   have been added to the GUI to specify the attributes
		   of color fill and the color bar.

		b. The .info file is now saved to the same location as
		   the VG file as requested by the HPC.

	5. Hurricane Text Product Improvements

		a. Modified the hurricane text product to retrieve the 
		   storm ID from the VG file name.  Also modified the 
		   "Track Message" GUI to be wider and more narrow, and 
		   not editable.  Changed the cycle time algorithm at the 
		   request of the HPC.  Modified the header identifier 
		   for the MPC.


II. NMAP Display Improvements	

    A. Improved Cloud Height Function

       Added a new algorithm that uses climatology to estimate the
       cloud height at the request of the AWC.  This algorithm
       uses a new table:$GEMTBL/config/climate.tbl that contains
       climatological profiles for selected latitudes for winter
       and summer seasons.  Cloud heights are computed by 
       interpolating cloud temperature to the climate profiles
       contained in this table.  An inverted cosine curve is used 
       to account for seasonal height variations.  The climatology 
       algorithm is used if no soundings are found within the search 
       radius.

       The climatological profiles can be modified by editing the
       climate.tbl.  Additional levels can be added, if desired.

    B. NOAA Logo Added to NMAP/NMAP2

       An option to embed the NOAA logo into NMAP/NMAP2 frames has been
       added.  Select the NOAA Logo under the Option pull-down to embed
       the NOAA logo into all frames.  A black and white or color NOAA logo
       may be selected.  The logo attributes (size and location) are 
       read from the table: $GEMTBL/nmap/logo.tbl.

    C. Modify Cursor Size, Type and Color Added for GUI Programs 

       The cursor size, type and color can now be changed for the N-AWIPS
       GUI programs for the cursor that occurs in the data window.  The 
       table $GEMTBL/config/cursorref.tbl specifies the default cursor 
       attributes.  Currently, attributes for three different types of 
       cursors can be specified.

       CURS_DEFAULT specifies the cursor for normal operations in the
       data area of the GUI programs.

       CURS_BUSY specifies the cursor when the GUI program is performing
       an operation, such as loading data frames.

       CURS_POINT_SELECT specifies the cursor in NMAP/NMAP2 when using
       the seek or cloud height functions.

       See the documentation in cursorref.tbl for additional details.

       NMAP/NMAP2 provide a GUI to alter the cursor attributes for
       each cursor type.  Select the "Cursor" entry on the "Option"
       pulldown to invoke this GUI.

    D. Watch Number Displayed by Default

       The watch number is now plotted by default when displaying
       watches in NMAP/NMAP2.  This change was done at the request of
       the SPC.

    E. Added the display of volcanic ash and mountain wave international
       SIGMETS to NMAP/NMAP2. 


III. NMAP Bug Corrections

    A. CCFP Text Box Drawing

       Corrected the problem where CCFP text box was not drawn if the
       text box type was set in the "Text Attributes" panel.

    B. From Line Coordinates Error

       Corrected from line coordinates error when changing from the
       line to area type for SIGMETS.

    C. Seek While Roaming Error

       The seek function ghost markers and line are now visible 
       while roaming.

IV. Single Forecast Time Model File Processing  
    **** Important Please Note ****

    Modifications have been made so that NAGRIB, GDPLOT2, NMAP, and 
    NMAP2 can now handle single forecast time model files. We
    strongly recommend that processing of single forecast time files
    be done in parallel with the current multi-time file processing.

    Any metafile processing using this new data flow paradigm should
    also be done in parallel with the existing data flow.  Note that
    metafile generation MUST be done using GDPLOT2 when processing
    single forecast time files.  The other GD programs have NOT yet
    been modified to handle single forecast time files.

    NMAP and NMAP2 do NOT automatically update as new single forecast 
    time model files become available in the database.  For NMAP, to 
    access new grids click the "data source" bar and click "Accept" 
    to update the time line.  Then click the "Load" button.  For NMAP2, 
    click the "Modify Data" button then click the "Accept" button to 
    update the time line. Then click the "Load" button. 

    Auto-update for grid files is planed for the next patch.


IV. Decoder Improvements

    A. Ship Decoder 

       The ship decoder has been modified to allow an option to 
       create 6-hour files of ship data only.  This change was 
       done at the request of the TPC.  The 6-hour file option is 
       an addition to, not a replacement of, the current mode in which 
       hourly files of all marine surface data (ship, CMAN, fixed and 
       drifting buoys) are created.  A separate instance of the decoder 
       using command line option "-a 6" must be run to create the 6-hour 
       ship files.  NMAP and NMAP2 have been modified to display these 
       data.  Click on the "SHIP6HR" entry under "OBS" to display these 
       data.

    B. Aircraft Decoder

       The aircraft decoder was modified  to use airline-supplied tables 
       for decoding turbulence in some AIRREPS.  Also, one-digit wind 
       speeds are now properly handled.

V. General Improvements

    A. Change to Contouring Pre-processing Algorithm

       The contouring pre-processing has been modified to eliminate 
       extrapolation of valid data onto grid points flagged as
       missing.  This extrapolation was causing undesirable contouring 
       of wave heights near coast lines.  This change should NOT affect
       the contouring of grids that do not have missing data.

    B. Climatic Zone Map

       A climatic zone map was added at the request of the CPC.  The
       map file is tpczus.cpc.

    C. Added 22 Caribbean Islands for Seek/Locator Functions

    D. The cleanup script has been modified to properly work on all
       supported platforms.

    E. Modified program GDINFO to not spawn GPLT processes.  

VI. Known Problems

    A.  Auto-update 

        Auto-update occasionally fails to properly update when the skip 
        factor is greater than one.

    B.  Seek Function

	1. If the data set or map background is changed, the seek function 
	   exits.  Click on the seek function icon to restore its current 
	   settings.

	2. The seek function does not locate the county if an independent 
           city of the same name exists in the county's state.  The seek 
	   function finds the independent city instead.

    C.  Add/Delete Counties 

	If counties are added or deleted, these counties are not saved 
	correctly to the product text files if either the "Apply" button
	is clicked on the "FORMAT WATCH" GUI, or the watch is saved and
	issued later in a session.

    D.  Graph-to-Grid

	Graph-to-Grid inproperly overwrites a pre-existing grid file if
	the projection is changed without changing the file name.
       

VII. Calling Sequence Changes

    A. $GEMPAK/source/appl/plot/glogo.f
    B. $GEMPAK/source/gplt/plot/glogo.f
    C. $GEMPAK/source/gplt/device/plot/dlogo.f
    D. $GEMPAK/source/device/plot/dlogo.f
    E. $GEMPAK/source/driver/active/gn/hlogo.f
    F. $GEMPAK/source/programs/gd/grphgd/ggdriv.f


See the nawips.log and changes.log for additional details concerning
these routines.


VIII. Table Format Changes

   A.  Forecaster Name Table Changes For SPC Products *** Please Note ***

       The watch, watch status and outlook now all use the same table:
       $GEMTBL/config/forecasters.tbl to retrieve the list of forecasters.
       The format of this table has changed.  The string "FORECASTER"
       in the first column has been removed.  Also, forecaster names have
       been removed from the table: $GEMTBL/nmap/nmap_pgw.tbl.  This
       table is no longer used to retrieve the forecaster names for
       the watch product.


IX. NMAP2: Evaluation Version:

**** NOTE THAT NMAP2 SHOULD NOT BE USED TO CREATE OPERATIONAL PRODUCTS. ****  

NMAP2 continues to be made available to obtain user feedback.  Many 
bug corrections and improvements have been made in response to user 
feedback and CDB testing.

    A. NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g, satellite
	   data are not implemented in NMAP2.


    B. NMAP2 Bug Corrections

	1. Several corrections to problems associated with roam, zoom
	   and various projections among loops have been made.


    C. NMAP2 Improvements

	1. Added the Wipe Button

	   The wipe button has been re-implemented in NMAP2.  It now
	   will erase all data frames in the currently displayed loop.
	   Data in other loops are NOT erased.  The function invokes 
	   a confirmation pop-up to allow the user to cancel.

	2. Added the "Map" Button to the Data Selection Window.

	3. Increased Number of Loops From 4 to 8.
	   
	   The maximum number of loops has been increased to 8.  Also,
	   the maximum number of frames that can be loaded in NMAP2, 
	   including all loops, is 80.  The most recent images up to
	   80 are loaded if the requested number of frames exceeds 80.

	   Users should exercise caution in loading large numbers of 
	   frames especially on workstations with limited memory.
	   If the workstation memory is exceeded, the workstation
	   may lock up and/or NMAP may crash.

	4. Bad Frame Deletion.

	   Bad frames can be marked so they are not displayed as 
	   part of the loop.  To mark a bad frame, display it.  Select
	   the "Bad Frame" entry from the Option pulldown.  Upon 
	   confirmation, the bad frame will no longer be displayed.
	   To re-display the bad frame, all of the frames must be
	   re-loaded.

    D. NMAP2 Known Bugs

	1.  Hide/Show Loop After Auto-Update

	    Auto-update turns the loop back on even if the "Hide Loop" is
	    set. 

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.5.b 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.5.b >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.
