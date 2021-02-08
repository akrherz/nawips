			N-AWIPS 5.6.d Release Notes
				5/22/01	

Patch 5.6.d covers development from April 3 to May 22, 2001.  


*****************************************************************************

I. Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements

	1. Line Vertex Movement Modification (MPC, TPC)

	   The movement of vertices for line objects has been modified
	   at the request of the MPC and TPC.  This function now operates
	   in a similar fashion as it did before version 5.6.c.  For line 
	   objects, the cursor must now be within 300 pixels of the vertex 
	   for dragging.  All other object types require the cursor to be 
	   within 20 pixels.

	2. Surface Prog Product Changes (HPC)

		a. Text File Name Change for Surface Prog Message

		   The text file name now uses the last 4 characters of
		   the VG file name concatenated with .dat instead of the
		   first 3 characters.

		b. High/Low Group Types

		   The surface prog text message now properly processes High
		   and Low symbols with group types High and Low, respectively,
		   in addition to the Label group type.

	3. Label Color NOT Set to Line Color by Default (HPC)

	   The label text color is no longer set to use the line color by 
	   default when labeling lines.  If a site desires to have the label
	   use the line color by default, set the label color equal to the
	   line color for the desired label(s) in the table:

	   $GEMTBL/pgen/grptyp.tbl.

	4. Added Change All Groups Action (SPC) 

	   A new product generation action, "CHNG GROUP" has been added to
	   the product generation palette.  This action allows changing
	   all groups or selected groups in a VG file to another group.
	   For example, if a VG file contains the OUTLOOK and TORNOUTL group
	   types, they can be changed, to HAILOUTL.
	   
	   To invoke this function, click on the the "CHNG GROUP" action.
	   The "VG Group Change" GUI appears.  Click on "CURRENT GROUP"
	   button to change all groups or selected groups in the file.
	   (Group types in the file appear darker in the list of groups).
	   Click on the "CHANGE GROUP" button and select the desired group
	   type.  Click the "APPLY" button to execute the change.

	5. Watch Generation Refinements (SPC)

		a. List of States Added to "Format Watch" GUI

		   A non-editable list of states included in the watch has
		   been added to the "Format Watch" GUI.  

		b. List of WFOs added to "Watch Specifications and County List"
		   GUI

		   A non-editable list of WFOs in the watch has been added to 
		   the GUI.

		c. Automatic Generation of Adjacent Areas 

		   The Great Lakes and and coastal waters in the watch are now 
		   automatically turned on in the "Watch Specifications and 
		   County List" GUI.  These may still be turned on or off 
		   by the user.

	6. Watch Status Message Refinements (SPC)

		a. Text Processing Improvements

		   The Watch Status Message is now generated with auto-wrapping
		   and all upper-case characters.

		b. GUI Name Change

		   The GUI has been renamed to "Watch Status".

		c. Removal of "#" Character

		   The "#" character has been removed from the 
		   "... See Mesoscale Discussion" text string.

	7. Outlook Group Type Checking (SPC)

	   The outlook message formatting now checks the VG file group types
	   with the group type set in the "Outlook Message" GUI.  If other
	   group types exist, a warning message dialog box appears listing
	   these groups.

	8. Convective SIGMET Improvements (AWC)

	   Added the Great Lakes and coastal waters to the "From" line
	   text message.

	9. International SIGMET Changes (AWC)

	   An option has been added to use the AFOS header in the 
	   international SIGMET instead of the WMO header.  To 
	   use the AFOS header, the environment variable, $SIGMETFMT must
	   be set to AFOS.  Any other value will result in the use
	   of the WMO header.

    B.  Product Generation Bug Corrections

	1. Multiple Line Objects for a Given Contour (MPC, HPC)

	   Corrected the problem where contours sometimes were
	   incorrectly made up of more than one line segment.

	2. International SIGMET Lat/Lon Encoding Bug (AWC)

	   Corrected error in the encoding of lat/lon values
	   in the text message when the minutes value is zero.

	3. SIGMET "From" Line Ordering Problem (AWC)

	   Corrected the ordering of lat/lon points in the "From"
	   line for line type SIGMETs.


II. NMAP/NMAP2 Display Improvements and Bug Corrections 

    A.  New Hot Keys Added (SPC)

	New hot keys have been added to NMAP/NMAP2.  They are:
	
	h       Turns all background data on/off by toggling the hide/show loop
		button

	i       Turns an image "on/off" by toggling the fade between black
		and the default brightness setting

        u       Undo an action in product generation
        r       Redo an action in product generation

	In addition, the four arrow keys (2, 4, 6, 8) on the numeric key pad 
	roam in the direction of the respective arrow when in the roam mode.  
	(Note that this function currently does not work on IRIX5/IRIX6 
	platforms.)

	The complete set of hot keys are given in the NMAP/NMAP2 help.  Click
	"help" and click "Hot Keys" in the scroll list.  The hot keys help
	is listed in Section IX of these release notes for reference. 

    B.  Restore Files Treated as GEMPAK Tables (ALL)

	Restore files now follow the same rules as all other GEMPAK tables
	in terms of where they can be located and search order.  The 
	following search order applies to all GEMPAK tables 
	(tables located under $GEMTBL) and restore files:

		local directory
		$NCDESK/subdirectory_name
		$NCSITE/subdirectory_name
		$GEMTBL/subdirectory_name

        For restore files, the subdirectory name must be "restore".  If the
	restore file is not located in one of the above locations, then
	the directory specified in the $GEMTBL/nmap/mod_res.tbl is searched.

    C.  Logo Improvements (TPC)

	The NWS Logo has been added.  In addition, the NWS and NOAA logos
	can now be placed as a function of loop in NMAP2.  After the logo
	is selected from the "Option" pulldown, the "Loop Selection_popup"
	appears.  Click on the "This loop" or "All loops" button to apply
	the logo to the displayed loop or all loops, respectively.

    D.	Cloud Height Corrections (AWC)

	1. Blank Station ID Handling

	Blank station IDs in the station table file are now properly handled.
	Previously, blank IDs would cause the program to not find the
	appropriate sounding station.  
	
	2. Dominant Data Problem

	NMAP would not calculate cloud height if data other than the IR imagery
	were dominant.  This problem has been corrected.

    E.	Busy Core Dump (Unidata)

	Corrected a memory problem in the Busy program detected by Unidata.

    F.  Illegal VG File Name Handling (HPC)

	Improved the handling of illegal VG File names when saving the VGF.
	Illegal characters, e.g., "/" are now trapped and a warning is
	provided to the user.


III. NMAP Bug Corrections

    A.  Frame Time Error for Radar Images (SPC)

	The frame time for the first frame of a radar loop was incorrect.
	This error, which was causing the track function to fail in some 
	cases, has been corrected.

    B.	CCFP Single Color Display Bug (AWC) 

	Corrected the problem where the CCFP could not be displayed as
	a single color in the background.  This error was also present
	in NMAP2.

IV. NMAP2

    A.  NMAP2 Improvements

	1. Map Selection Re-engineer (ALL)

	   The software that supports the "Map Selection" GUI has been
	   re-engineered to correct several known problems and allow for
	   enhancements.  The following bug corrections and improvements
	   have resulted:

		a. Size of Image Implemented

		   The size of image roam option available in NMAP has now
		   been implemented in NMAP2.

		b. Default overlay selection

		   Overlays, e.g.,  the county map, RFC boundaries, can now
		   be turned on/off by default when NMAP2 is invoked.  The
		   overlays are listed in the table:

		   $GEMTBL/nmap/mapovl.nmap

		   To turn a selected overlay on, off by default, set the
		   value to 1, 0 respectively, in the DEFAULT column of the
		   table.

		c. Pre-defined Areas for Images

		   Pre-defined areas that can be selected from the GUI now
		   work properly for image data. 

	2. Stop Function Added (ALL)

	   The stop button has been implemented in NMAP2.  NOTE: The stop
	   button does NOT work properly when resizing the NMAP2 display
	   window.  It therefore should not be used to stop loop loading
	   as the result of resizing NMAP2.

	3. Increase Maximum Number of Data Categories from 20 to 40 (TPC)

	   The maximum number of data types for a particular data category 
	   has been increased from 20 to 40.

	4. Removed $SAT and $RAD Hard Coding (AWC)

	   The $SAT and $RAD environment variable names are no longer required
           in the $GEMTBL/config/datatyp.tbl.  Any name that points to the
	   location of the satellite and radar image directory trees may now 
	   be used in the table.

	5. Watch Display Improvements (SPC)

	   Watches within 90 minutes of expiration time are now displayed
	   in NMAP2 and GPMAP using a different (short dashed) line type
	   to distinguish them from other watches.

    B. NMAP2 Bug Corrections

	1. Mandatory Level Check (AWC)

	   Modified NMAP2 to only use the mandatory data levels when plotting
	   upper-air data at the standard levels.  

	2. Reload Bug for Last Frame (PR)

	   Corrected the problem where the reload function did not work
	   for the last frame in the loop sequence.

	3. Change Loop Map Window Problem (SPC)

	   Changing the loop from the "Data Selection Window" while the
	   "Map Selection Window" GUI is present caused several problems.
	   Therefore, it is no longer possible to change the loop number
	   when the "Map Selection Window" GUI is active.

	4. Roam and Clear Data Problem (HPC) 

	   Corrected the problem where the roam was turned off after clearing
	   a data set.

	5. Long Restore File Name in Data GUI Problem (HPC)

	   Corrected the problem where long model restore file names were
	   being truncated in the "Data Selection Window" GUI.

    C.  NMAP functions NOT implemented in NMAP2

	1. The check off function ("chk") that allows turning on/off selected
	   data sets for loading is not implemented in NMAP2.

V. Decoder Improvements

    A.  Decode/Display Coast Guard Station Observations (MPC) 

	Modified the the marine decoder, (DCMSFC) to decode Coast Guard 
	station observations.  The decoded reports are stored in the
	hourly ship files for N-AWIPS access and display functions.  These
	observations are plotted along with other marine data and appear
	as fixed stations with 4-character IDs beginning with the letter "K" 
	off U.S. coastlines and the Great Lakes.

    B.  GGWARN Correction Handling (SPC)

	Modified GGWARN to properly handle corrections in warnings and
	severe local storm reports.

    C.  METAR Decoder handling of U.S. vs. Canadian Station ID (Unidata)

	Modified the METAR decoder to distinguish between U.S. and Canadian
	station IDs with the same three trailing characters.  The U.S. 
	stations are stored with the three character ID, while the
	Canadian stations are stored with a "C" prepended to the three 
	character ID.

VI.  General Improvements

    A. 	SFGRAM Enhancements (ALL)

	The SFGRAM program has been improved in two ways.  
	
	First, a file template may be specified explicitly for the SFFILE 
	variable.  For example, SFFILE = YYMMDD.hrly opens the appropriate 
	file(s) that match this template corresponding to the specified DATTIM.  
	Second,  SFGRAM can now open more than one surface file.  Multiple 
	file access requires an explicit template for SFFILE or an alias 
	specified in the table $GEMTBL/config/datatype.tbl.  
	
	For example, if METAR data are stored in daily files, and the 
	datatype.tbl contains an entry METAR for the METAR files, then the
	following provides a meteogram from 12z, May 15th through 12z, 
	May 16th:

	SFFILE = METAR
	DATTIM = 15/12-16/12

    B.  Day Of Week Option Added to GEMPAK Title String (ALL)

	A new option has been added to the title string to print out
	the day of the week along with the date and time.  The question
	mark character, "?", included with the title string in combination
	with either the "^" or "~" character, prints the day of week for
	the valid time.  See the GEMPAK title help for additional details.

    C.  Added Divergence Tendency Diagnostic (AWC)

	A new diagnostic, DIVT(S,V) has been added to GEMPAK to calculate
	the divergence tendency.  To properly calculate this parameter,
	the values for S and V must be HGHT and WND, respectively.  Note
	that this diagnostic is ONLY VALID for cylindrical projections, i.e.,
	MER and CED.  In the future, it will be generalized to work properly
	for non-cylindrical projections.

    D.  Eastern Region Text Product Handling (ALL) 

	The LDM pattern action table (pqact.conf) and the NWX table
	$NAWIPS/tables/nwx/stf.bull were updated to accommodate the changes
	made to the Eastern Region text product headers that became
	effective on May 8th, 2001.

    E.	ATCF Encode/Decode Modifications for New Format (HPC, TPC)

	NMAP2 and GPMAP have been modified to plot ATCF tracks in the
	new format.  In addition, NMAP/NMAP2 product generation has
	been modified to create the hurricane track text product in
	the new ATCF format.

    F.	NAGRIB PDS Extension Handling (ALL)

	The GRIB decoder program (NAGRIB) has been modified to optionally
	append the PDS extension name to the GEMPAK parameter name.  A new
	variable, PDSEXT has been added to NAGRIB.  If PDSEXT is set to
	"YES", then the PDS extension name is added to the grid parameter 
	name.  By default, the PDSEXT variable is set to "NO" and thus the
	extension name is not appended.

	*** IMPORTANT PLEASE NOTE ****

	The PDSEXT variable is treated like all GEMPAK variables.  If it
	is set to "YES" in a script or interactive session, then for any
	subsequent execution of the program, in the same directory,  its 
	value will remain as "YES", unless it is explicitly set to "NO".  
	Therefore, we recommend that PDSEXT be set to "NO" in all NAGRIB
	scripts.

    G.  Hurricane Graphics Production Program (TPC) 

        A new program, GPTPC, has been written to generate five hurricane
        graphic products for the TPC.  They are:

		1. Track error watch/warn plot
		2. Wind swath plot
		3. Strike probability plot (Atlantic storms only)
		4. Wind intensity graph
		5. Wind speed table

	An operating instructions document will be sent to the TPC to
	describe the instructions for running GPTPC.  The GPTPC program
	help contains additional details.

    H.  Region Filling Added to GPMAP (ALL)

	GPMAP can now fill selected bounded geographic regions.  A new
	parameter, BND, specifies the the bounded region name, and the
	fill attributes, such as color, fill pattern, etc.  See the
	GEMPAK help for BND for additional details.  Geographic regions
	that can be filled are the bounds files located in $GEMTBL/bounds.  
	These regions are:

		U.S. States		Counties
		Low Resolution World	Great Lakes
		North American Lakes	CWAs

VII. General Bug Corrections

    A.  NWX Errors (ALL, Unidata)

	Corrected the problem where switching between warning and time-driven
	products multiple times caused NWX to sometimes hang or output 
	incorrect text products.  Also corrected a fatal error found by
	Unidata when bulletins had null characters.

    B.  NTRANS Print Problem Between Linux and Non-Linux (HPC)

	Corrected the problem where multipanel printing failed when using
	one metafile produced on a Linux platform and one metafile produced
	on a non-Linux platform.

    C.  VG Driver Correction (TPC)

	The VG driver now properly creates the VG file for the HRCN data
	type specified in GPMAP.

    D.  GDPLOT2 Correction for Dual Time Grids (TPC)

        Corrected GDPLOT2 so that it can now properly display grids
	with a double grid time.

VIII. Calling Sequence Changes

    A. $GEMPAK/source/appl/plot/glogo.f
    B. $GEMPAK/source/gplt/plot/glogo.f
    C. $GEMPAK/source/device/plot/dlogo.f
    D. $GEMPAK/source/gplt/device/plot/dlogo.f
    E. $GEMPAK/source/driver/active/gn/hlogo.f
    F. $GEMPAK/source/bridge/sv/svghdr.f, svout.f
    G. $GEMPAK/source/programs/gp/gpmap/gpminp.f
    H. $GEMPAK/source/gemlib/lc/lcdist.f
    I. $GEMPAK/source/nmaplib/nmp/nmpgmapattr.c, nmpgovlattr.c, nmpsmapattr.c
    J. $GEMPAK/source/cgemlib/cvg/cvgrdsel.c

See the nawips.log and changes.log for additional details concerning
these routines.

IX.  NMAP/NMAP2 Hot Keys

    Pressing keyboard keys allows easy access to selected Nmap functions.  
    All Nmap hot keys are case insensitive. Only the lower case are listed 
    below. 

    The following list hot keys for Nmap/Nmap2 display functions:

	- 	Step backward / Halt loop
	=	Step forward / Halt loop
	l	Loop forward / Halt loop
	1	Loop rock / Halt loop

	f 	Reset the fade on the current look-up table and restores the 
		current look-up table

	h	Turns all background data on/off by toggling the hide/show loop
		button

	i 	Turns an image "on/off" by toggling the fade between black
		and the default brightness setting		

	w	Toggle the data window up or down
		(Same as mouse button 3)

    The numeric key pad arrow keys (2, 4, 6, 8) roam in the direction of the 
    respective arrow when in the roam mode.  (Note that this function is 
    currently not supported on IRIX5/IRIX6 platforms.)

    The following list hot keys for Nmap/Nmap2 product generation functions:

	u	Undo 
	r	Redo 

    The following hot keys display different loops for Nmap2:

	F1	View loop 1
	F2	View loop 2
	F3	View loop 3
	F4	View loop 4
	F5	View loop 5
	F6	View loop 6
	F7	View loop 7
	F8	View loop 8


X.  Table Format Changes  **** IMPORTANT PLEASE NOTE ****

    A.  SPLPAT.TBL

	Three values in the table $GEMTBL/draw/splpat.tbl have been changed.
	The value for the "TYPE" parameter was changed for three line objects.
	They are:

	Dry-line -    TYPE changed from 997 to 1700
	TROF -        TYPE changed from 998 to 1800 
	Squall Line - Type changed from 999 to 1900

	These values MUST be changed if a site has its own version of this
	table.

	The Tropical TROF type was added for the front with no pips.

    B.  Product Generation Palette Button Tables

	The product generation buttons are now listed by row in the button
	tables.  These tables are located in $GEMTBL/pgen, with file names
	of type *btn.tbl.  If a site has local versions of these tables,
	they MUST be changed to order the buttons by row.

    C.  MAPOVL.NMAP

	The format of the map overlay table, $GEMTBL/nmap/mapovl.nmap, has
	changed in two ways.
 
	First, two new columns have been added for the Lat/Lon row.  They
	are LTLNSTEP and LBLFREQ.  LTLNSTEP specifies the lat/lon plotting
	frequency in degrees.  LBLFREQ specifies the lat/lon label frequency.
	If these values are missing they are set to unity by default.

	Second, one new column, M_WIDTH, has been added for all marker type 
	overlays, i.e., TYPE = 2.  M_WIDTH specifies the marker
	width.  If its value is missing, it is set to unity by default.

    D.	NMAP/NMAP2 Resource File (Nmap)

	The NMAP/NMAP2 resource file has been modified to add references
	to the new hot keys.  These references MUST be present in the
	file for the hot keys to work properly.  The resource file is:

	$NAWIPS/resource/Nmap


*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.d 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.d >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

