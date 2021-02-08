			N-AWIPS 5.6.e Release Notes
				9/21/01	

Patch 5.6.e covers development from June 25 to September 21, 2001.  


*****************************************************************************

I. Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements

	1. Watch Generation Refinements (SPC)

		a. Toggle Anchor Points Added

		   Watch anchor points can now be toggled on/off for use in
		   the watch definition.  Click the  "Toggle Anchor Pts" 
		   button on the  "Watch Specifications and County List"
		   GUI and select the desired anchor point with the cursor.  
		   Click the left mouse button to exclude/include the anchor
		   point.  Excluded anchor points IDs are listed in the GUI 
		   after the "Inactive" string.

		b. Watch Date/Time Entry Improvements 

		   Watch initial and expiration date and time entries have
		   been improved to make user input easier and to minimize
		   errors.  The date string (YYMMDD) has been combined into
		   one text entry box for the initial and expiration times.  A 
		   pull-down has been added for the initial time (HHMM) entry.
		   The initial time pulldown defaults to the current clock
		   time rounded to the nearest 15 minutes.   The pulldown 
		   includes choices starting about an hour before the
		   current time, rounded to the nearest 15 minutes, to 5 and 
		   1/2 hours after the current time, incremented every 15 
		   minutes.  The expiration time pulldown includes all 24 
		   hour choices.  The expiration date string is now 
		   automatically adjusted based on the initial and expiration 
		   hour selections.  If the expiration hour is before the 
		   initial hour, the expiration date is incremented to the 
		   next day.

		c. Continuing Watches Added to "Format Watch" GUI

		   Active watches numbers are now listed in the "Format
		   Watch" GUI in the text box following the "Continuing
		   Watches" string.  These numbers are obtained from the
		   issued watches decoded from the watch data base.  If 
		   no watches are active, the text box contains the 
		   "0000" string.

		d. Watch Element Change **** Important Please Note *** 

		   The watch element has been changed to store the county 
		   FIPS code.  The FIPS code replaces the county centroid 
		   as the key.  This change will prevent errors that 
		   have occurred where the centroid lat/lon values are not 
		   consistent between the county table and bounds files.  
		   NMAP/NMAP2 is backward compatible, that is, old watches 
		   using the county centroid lat/lon are properly handled.  
		   
		   The watch element change also affects the add/delete 
		   counties function.  Previously, counties were added/deleted 
		   by selecting the nearest county centroid to the cursor.  
		   Now, the county selection is based on which county the 
		   cursor is in.

		e. Anchor Point Falling Outside Watch Problem Corrected

		   In rare cases, a watch defining anchor point fell outside
		   of the watch box after snapping.  This problem has been
		   corrected by selecting the next closest anchor point and
		   re-calculating the snapping.

	2. Watch Status Message Refinements (SPC)

		a. Status Line Lat/Lon Ordering Problem

		   Corrected the problem where the status line lat/lon points
		   were sometimes ordered incorrectly.

		b. Increased Maximum Allowable States

		   Increased the maximum allowable states included
		   in a status message from 7 to 25. 

	3. Convective Sigmet Refinements (AWC)

	   The calculation for states included for convective sigmets 
	   covering coastal waters have been modified to properly follow the 
	   rules specified by the AWC.  Sigmets over coastal waters now 
	   include the states whose waters are covered.  Also, the word 
	   "dist" has been changed to "width" in the "Convective sigmet Edit" 
	   GUI.

	4. Sigmet "From" Line Orientation (AWC)

	   Sigmets with end points within one tenth of a degree latitude are
	   now defined to have a west-east orientation.  Larger differences
	   in latitude are defined to have a north-south orientation. 

	5. Volcanic Ash International Sigmet Default Change (AWC)

	   The default trend value has been changed to "-none" for the
	   "Trend" field in the "International Sigmet Format" GUI.

	6. Hurricane Graphics Refinements (TPC)

	   The program GPTPC has not been modified since the executables
	   were sent to the TPC during the summer of 2001.

	7. New Tropical Marine Product (TPC)

	   GPMAP has been enhanced to generate the tropical marine graphic.
	   No modifications have been made since the executables were sent to 
	   the TPC during the summer of 2001.

	8. Nuclear Fallout Symbol Added (AWC)

	   A new symbol for nuclear fallout has been added to NMAP product
	   generation and the supporting GEMPAK libraries.  Currently, the
	   symbol is drawn as three triangles and dot in the center.


    B.  Product Generation Bug Corrections

	1. Fatal Error Upon Selection of Color Palette (HPC) 

	   Corrected the fatal problem which occurred when a MISC data type 
	   editing window is canceled and a color is selected from the palette.

	2. Symbol Size Less Than One Problem with Uattribd.tbl (HPC)

	   Corrected the problem where symbol sizes less than one in the table,
	   uattribd.tbl, where not properly processed.

	3. "Label" Action Corrected (HPC)

	   The "Label" action now works properly.  This action was 
	   inadvertently broken in version 5.6.d.1.

	4. Line labeling Corrections (HPC, SPC)

	   The way in which attributes are applied to lines when the "Label"
	   button is turned on and off has been corrected.  The following
	   rules have been established:
	   
	   If the "Label" button is turned off, then the attributes, e.g., 
	   color, are obtained from the setting.tbl upon the initialization 
	   of NMAP.  If the attributes are changed, the values last set for
	   a particular line type are used for that line type.  The 
	   attribute values are never read from the grptyp.tbl.

	   If the "Label" button is turned on, then attributes are obtained
	   from the grptyp.tbl for the following cases:

		a. Each time a line type is clicked for drawing.
		b. Each time the label value or group type is changed.

	5. Erroneous Multiple WFOs Removed from Watch Status Message (SPC)

	   The county table was modified to have only the proper single
	   WFO associated with each county.  This modification corrects
	   the multiple WFO problem with watch status products reported
	   by the SPC.

	6. Label String Not Appearing in "Line Attributes" GUI (HPC)

	   Corrected the problem where in some cases the text string
	   associated with a label does not appear in the "Line
	   Attributes" GUI.  This happened when a text string was grouped
	   after greater than ten lines are grouped together.


II. NMAP/NMAP2 Display Improvements and Bug Corrections 

	
    A.  Map Window Sizing (ALL) 

	The size of the map window drawing area is now automatically
	set to two-thirds the size of the main windows drawing area.  The 
	size of the map window is no longer specified in the NMAP resource
	file.


III.  NMAP2 Improvements  

    A.  Procedures Added to NMAP2 (ALL)
	
	NMAP2 now has the capability to save and restore loop information
	by using procedures.  Procedures are stored in Stored Procedure
	Files (SPFs) which are accessed by clicking the "Save Data Settings"
	and "Restore Data Settings" in the "Data Selection Window".  The
	following information can be saved and retrieved from an SPF for
	up to eight loops:

		1. Data set name(s) and path(s)
		2. Dominant data set
		3. Skip factor
		4. Number of frames
		5. Roam factor
		6. Auto-Update on/off
		7. Pre-defined area name
		8. Graphics area and map projection
		9. Map on/off, lat/lon lines on/off, map overlay name(s)

 	A complete description of this new functionality is available in
	the NMAP2 on-line "Procedure Save/Restore" help.  This help is
	also included in Section IX at the end of these release notes.

    B.  QuikScat Wind Data Display (MPC) 

	The capability to decode and plot QuikScat wind data has been 
	added.  QuikScat wind barbs are plotted by selecting the "QSCT" 
	category under the "MISC" data category.   NMAP2 plots the 
	QuikScat winds accumulated in 6 hour bins for each frame in the
	loop.  The program starts at the most recent hour based on the system 
	time and increments the time-line hourly.   

	Wind barbs are displayed by color coding based on wind speed intervals.
	Click on the "Edit Source" button to invoke the QSCT Attributes" 
	pop-up to modify the wind speed intervals and colors.  This GUI also
	allows changing other attributes including the wind barb skip factor,
	the wind barb size and width, and data quality flags.  The data 
	quality flags include the high wind speed, low wind speed, rain and
	availability flags.  Clicking a flag presented in the GUI will turn
	off the filter for this quality check.  For example, if the "High
	Wind Speed" button is checked, then wind data exceeding the high
	wind threshold is plotted.  By default all flags are turned on 
	which means that all data are plotted.
	
	GPMAP can also plot QuikScat wind data. A new GEMPAK parameter,
	QSCT has been added.  It specifies the end time, speed intervals
	and colors, barb attributes, skip plotting factor, and data
	flags.  See the GEMPAK help on QSCT for additional details.

    C.	Improved AWIPS Satellite Processing (AR)

	NMAP2 has been enhanced to recognize additional AWIPS channel
	identifiers.  This improvement allows the Alaskan Region to 
	display AWIPS satellite sectors derived from polar orbiting 
	satellites.

    D.	Added Capability to Process Templates Containing Minutes (SPC)

	NMAP2 has been enhanced to process dataset templates specified in
	the datatype.tbl table that contain minutes.

    E.  ACTF Display Beyond 72 Hours Added (HPC)

	NMAP2 has been enhanced to plot tracks for all forecast hours
	in the ACTF file.  GPMAP also can now plot all the forecast hours.

    F.  Turn On/Off Data Sources Added to "Data Selection Window" (ALL)

	The capability to toggle a data source on/off in the "Data 
	Selection Window" has been added to NMAP2.  This function is
	analogous to the NMAP "Chk" feature.  If a data source is turned
	off, it remains in the GUI, but will not be loaded into the loop
	frames with a subsequent load.  Click the "Turn Source On/Off" button
	to toggle the selected data source.  If a data source is turned off,
	the "(Off)" string appears ahead of the source name in the GUI.
	If a dominant data source is turned off, the next data source listed
	in the GUI will automatically become dominant.

    G.	Added Capability to Read GDATTIM from Restore File (ALL)

	NMAP2 now reads the GDATTIM specified in the NMAP grid restore file.
	The GDATTIM value is used to set the time range in the NMAP2 time line.


IV. NMAP2 Bug Corrections

    A.  Fatal Error With Smaller Datatype.tbl Table (AR, HPC)

	Corrected the fatal error which occurred when the datatyp.tbl table
	was reduced in size.

    B.  Product Generation Graphics Erroneously Put Into Background (ALL)

	The scenario (Item V. in the 5.6.d.1 release notes) where the 
	product generation graphics are mistakenly put into the background
	has been corrected.  This occurred when a new map area or overlay
	was added from the "Map" GUI with product generation active.

    C.	Display of Minneapolis Radar Problem (AWC)

	Corrected problem where the Minneapolis radar was not being displayed
	at the AWC.

    D.	Display of Radar Data with Byte Swapping (SPC)

	Corrected a problem reported by the SPC where in some cases the radar
	data did not display.  This problem happened when radar images are 
	loaded after a satellite image is loaded requiring byte swapping.

    E.  Incorrect Plotting of Some International Sigmets (AWC)

	Corrected the problem where International Sigmets containing
	tropical cyclones were not decoded and plotted properly.

    F.  Fatal Problem with "Stop" Button (ALL)

	A fatal crash has been corrected for the case when the "Stop" button
	is clicked if product generation is active.

    G.  Fatal Problems with Time-Line (ALL)

	Corrected a fatal error where clicking anywhere in the time-line
	GUI, caused a crash if no data sets are selected.  Also corrected
	the fatal error caused when clicking the "UP" arrow for the skip
	factor with no times selected on the time-line.


V.  Decoder Improvements

    A.  MRF MOS Decoder Updated for Wind Format Change (ALL)

	The MRF MOS decoder has been updated to decode the WDR parameter
	instead of the WND and WSP parameters to account for this format
	change.

    B.  Marine Decoder (MPC, TPC)

	Coast guard reports with the SXUS86 bulletin headers have been added
	to the marine surface decoder, DCMSFC.  Also, the decoder has been
	modified not to decode reports from International SeaKeepers vessels
	unless the bulletin originator is KWUM.  It also now ignores reports
	with "TEST" IDs. 

    C.  International Sigmet Decoder (AWC)

	The international Sigmet decoder was improved to better account for
	multiple phenomena delimiters for NTAA, RJAA, and EGGY reports.

VI.  General Improvements

    A. 	Unidata Version of NSHARP Added to N-AWIPS (ALL)

	The Unidata version of NSHARP has been added to the N-AWIPS
	suite of GUI programs.  The program can be accessed from NTL.
	No changes to NSHARP have been made at this time.

    B.	SFEDIT Output File Name Length Increased (SPC)

	The maximum output file name length was increased from 72 to 128
	characters.

    C.  OUTPUT Parameter Increased (HPC)

	The OUTPUT parameter which is used by many GEMPAK programs to
	specify the output file name was increased from 48 to 160 
	characters.

    D.  Special Symbols Added to HILO Parameter (MPC)

	The capability to plot special symbols for high and low contour
	fields has been added to the GEMPAK HILO parameter.  All 40 special
	symbols are available.  To specify a special symbol, enter "S" before
	the symbol number for the symbolh/symboll specification in the
	HILO parameter.  See the GEMPAK help on the HILO parameter for 
	additional details.

    E. 	New Program, CPCGSTN, Lists Stations Within Closed Contours (CPC)

	A new program, CPCGSTN, lists all stations from a station table that
	are inside lines specified in a VGF.  See the program help for 
	additional details.

    F.	AWIPS Product Table Updated for Three New CPC Products (CPC)

	The table, $GEMTBL/pgen/awdef.tbl was updated to handle the 3-7,
	6-10, and 8-14 Day Max Heat Index products.

    G.  Divergence Tendency Calculation Improved (AWC)

	The divergence tendency diagnostic, DIVT, has been improved to properly
	compute values on any valid grid projection.
	
    H.  New Program To Decode Flood Product (HPC)

	A new program called, fop, was written to decode the text file generated
	by the RFCs into a VGF.  The program is executed in a stand-alone
	fashion. To run the program type: fop filename, where filename is
	the name of the flood product text file generated by the RFCs.  The
	program creates a VGF using the input file name with a .vgf extension.

    I.  Multiple Forecast Grid Files in GD Programs (ALL)

	All remaining grid data display programs now properly handle both
	multiple forecast time files and single forecast files.  These
	programs are: GDCNTR, GDCROSS, GDDIAG, GDLIST, GDMAP, GDPROF,
	GDSTAT, GDSTREAM, GDTHGT, GDTSER, GDWIND, GDPLOT.

    J.  NWX Display of METAR Special Reports (SPC)

	Improvements were made to the display of METAR special reports
	in NWX.  Special reports are now listed in reverse chronological
	order like the METAR observations.  Also, the special reports are
	now aligned with the other METAR observations to improve viewing 
	ease.  The display was also corrected not to break the special
	report at 80 characters.

    K.	Graph-To-Grid Checks for Excessive Intersections Added (HPC)

	The graph-to-grid program, GRPHGD, has been modified to check
	for excessive intersections that can adversely affect the
	resultant grid.  The program now sends a warning to the user
	for this condition.


VII. General Bug Corrections

    A.  Radar Time Mis-Match Problem (Unidata) 

	Corrected the problem where the radar time was incorrect in some
	cases.  The scan date and time is now used in all cases for 
	radar imagery.

    B.  VG Device Driver Text Problem (AR, MPC)

	The VG device driver was corrected to properly save the text
	border and fill attributes.

    C.  Contour Fill Problem with Only One Fill Interval (SPC)

	Corrected the problem where no color fill was done for cases
	with only a single interval.

VIII. Calling Sequence Changes

    A. $GEMPAK/source/gemlib/gh/ghkgph.f, ghswdf.f, ghwipl.f, ghwrel.f 
    B. $GEMPAK/source/gemlib/gg/ggwtch.f
    C. $GEMPAK/source/bridge/hc/hcdecd.f, hcfvld.f, hcghdr.f, hcout.f,
                                hcquad.f, hcspqd.f
    D. $GEMPAK/source/programs/gd/gdmap/gdmdsp.f
    E. $GEMPAK/source/nmaplib/ngd/ngdtlst.f
    F. $GEMPAK/source/gemlib/gg/ggmisc.f
    G. $GEMPAK/source/programs/gp/gpmap/gpminp.f
    H. $GEMPAK/source/programs/gd/gdcross/gdxdsp.f
    I. $GEMPAK/source/programs/gd/gdprof/gdpdsp.f
    J. $GEMPAK/source/programs/gd/gdstream/gdsdsp.f
    K. $GEMPAK/source/programs/gd/gdwind/gdwdsp.f
    L. $GEMPAK/source/gemlib/gr/grftim.f
    M. $GEMPAK/source/driver/active/xw/xmloop.c
    N. $GEMPAK/source/cgemlib/clo/clocmpdir.c
    O. $GEMPAK/source/bridge/is/isegar.f, isegtm.f, isegts.f


See the nawips.log and changes.log for additional details concerning
these routines.

IX. NMAP2 Procedures

A. Functionality

NMAP2 provides the capability to save and restore loop information by using
Stored Procedure Files (SPFs).  The following information can be saved
and retrieved from an SPF for up to eight loops:   
                
        1. Data set name(s) and path(s)
        2. Dominant data set
        3. Skip factor
        4. Number of frames
        5. Roam factor
        6. Auto-update on/off
        7. Pre-defined area name
        8. Graphics area (garea) and map projection (proj)
        9. Map on/off, Lat/Lon Lines on/off, Map overlay name(s)

The latest times are used for each SPF specified data set. 

Currently NMAP2 does not save and restore map overlay or data attributes 
that are modified using the edit functions.  This functionality will be added
in the future.

B.  Operation

Save and restore functions are accessed by clicking the "Save Data Settings" 
and "Restore Data Settings" buttons in the "Data Selection Window".  

The "Save Data Settings" function saves loop information to a user selected
ASCII SPF for all of the loops loaded in the "Data Selection Window" GUI. For 
example, suppose loop 1 contains GOES East Satellite imagery and METAR surface
observations and loop 2 contains radar imagery and model data.  To save this
information to an SPF, click the "Save Data Settings" which invokes the 
"Save to SPF file" GUI.  This GUI allows the user to select an existing SPF 
name or to specify a new SPF name.  The "Save to SPF file" GUI operates in a 
similar fashion as the VGF open/save GUI.  SPFs are listed in the GUI by 
directory name.   Directory names are specified in the table, 
GEMTBL/nmap/spf.nmap.  

If a source is turned off in the "Data Selection Window", it is not saved to 
the SPF.  However, if the turned off source is an image, its projection is 
saved to the SPF.  Upon restore, the default garea and proj for the dominant 
data source in the SPF is used.  It is recommended that all data sources be 
turned on when saving to an SPF to avoid confusion.

The "Restore Data Settings" function fills the "Data Selection Window" GUI with 
loop information specified in an SPF.  It does not load the data into the loop
frames.  In this way the user has the opportunity to modify any settings 
before loading.  To retrieve a desired SPF click the "Restore Data Settings" 
button.  The "Restore from SPF file" GUI is invoked which presents the same 
list of directories and SPFs as the "Save from SPF file" GUI discussed above.  
Select the desired SPF from the scroll list and click the "OK" button.  A 
"Restore Confirmation" GUI is invoked which lists the data source and dominant 
data for each loop.  Click the "Accept" or "Cancel" button to fill the 
"Data Selection Window" GUI, or to select another SPF, respectively.

Restore clears out all loop information from the "Data Selection Window". 
For example, suppose NMAP2 has data sets, map areas and other information 
filled in for loops 1, 2, and 3.  Selecting an SPF with loops 1 and 2 specified 
overides the current loop information in loops 1 and 2 and clears the data 
sets in loop 3.  In addition, map areas, and overlays are set to the defaults 
for loops 3-8.

C.  SPF Creation, Editing and Error Processing

The SPF is an editable ASCII file.  It is recommended that the "Save Data 
Settings" button be used to save procedures instead of creating an SPF from 
scratch.  In this way the user is assured that the SPF will have the correct 
format and operate as intended.  The "Save Data Settings" function 
automatically adds a prolog to the SPF including account name and creation 
date.

A user edited SPF has the potential for improper formatting and errors.
Invalid SPF entries are handled according to the following rules. 

	1. Invalid entries in SPF are noted in "Error Messages" pop-up upon 
	   restore. 

	2. No attempt is made to restore a data set with invalid data 
	   source values.  Valid data sources are consecutively renumbered 
	   when restoring. For example, if source 1 is invalid, then source 2 
	   becomes source 1 and source 3 becomes source 2, and so on upon 
	   restoring. 

	3. If the dominant data source entry is invalid, the first data 
	   source becomes dominant.  If the first data source entry is 
	   dominant and invalid, then the next data source becomes the 
	   dominant one.
 
	4. If skip value is invalid, it is set to 0 meaning no frames 
	   are skipped.   

	5. If the frames value is invalid, it is set to the default value for 
	   the corresponding data type.  The default is determined by the first 
	   value specified in the table $GEMTBL/config/datatyp.tbl.

	6. Invalid roam factors are set to 0 (fit to screen).  A roam factor 
	   of 1 (size of image) will be set to 0 if no image source exists 
	   for a given loop.

	7. If the auto update value is invalid, it is set to 1, which is on.
	
	8. If either the garea or proj value is invalid in the SPF, then

		a) If imagery is displayed, then garea is set to the
		entire image using the image projection;

		b) If imagery is not displayed, then garea and proj are
		set to the default values that are retrieved from
		the first entry in the $GEMTBL/nmap/mapinfo.tbl table.

	9. If the pre-defined area name is invalid but garea and proj are 
	   valid, then the name is set to "CUSTOM" and the garea and proj 
	   values from the SPF are used. 

D. SPF Syntax

The SPF has two columns.  The first column is a reserved keyword that indicates
the loop attribute.  The second column is the value for that loop attribute.
Keywords and their values are grouped by loop in the file. The exclamation 
point, !, proceeds comment lines in the file.  

The following table lists the reserved keywords and their valid values specified
in the Definitions section. 

	<reserved keyword>	Valid value(s)   
-------------------------------------------------------------------

	<loopN_sourceM>     	Category | Data Source 

	<loopN_dominant>	D

	<loopN_frames>		W

	<loopN_skip>		X

	<loopN_roam>		Y 

	<loopN_auto_update>	Z  

	<loopN_map>		Area name

	<loopN_proj>		proj   

	<LoopN_garea>		garea 

	<LoopN_map_ovl>		Map | Lat/Lon | Overlay_Name 

---------------------------------------------------------------------

	Definitions:

	Category     : Data Category type, e.g., CAT_SFC for METAR data. This
		       value comes from the CATEGORY column in the 
	               $GEMTBL/config/datatyp.tbl 
	Data Source  : Source names listed in the "Data Source" GUI separated
		       by slashes, e.g., SURF_OBS/METAR/standard
	N	     : Loop number (integer,  0 < N < 9 )
	M	     : Source number for a given loop (integer, M > 0)
	D	     : Dominant data source number (integer, D > 0)
	W	     : Number of frames to load (integer, 0 < W < 80)
	X	     : Frame Skip factor (integer, 0 <= X < W  )
	Y	     : Roam Factor (integer 0 = fit to screen, 
		       1 = size of image, 1 < Y < 20 roam factor )
	Z	     : Auto Update Flag ( 0 = off, 1 = on ) 
	Area name    : Pre-defined area name.  This string is from the list of
		       selections that appear along the left side of the
		       "Map Selection" GUI. The values are specified in the
		       $GEMTBL/nmap/mapinfo.nmap table. 
	proj	     : GEMPAK proj value
	garea	     : GEMPAK garea value
	Map	     : Literal "Map" string.  If this string is not present, 
		       then the default map is not drawn.
	Lat/Lon	     : Literal "Lat/Lon" string.  If this string is not present,
		       then lat/lon lines are not drawn.
	Overlay_Name : The overlay name from the list of selections along the
		       right hand side of the "Map Selection" GUI.  The values
	               are specified in the $GEMTBL/nmap/mapovl.nmap table.



*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.e 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.e >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

