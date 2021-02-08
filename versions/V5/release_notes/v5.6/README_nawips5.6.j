               N-AWIPS 5.6.j Release Notes
                    12/10/02

Patch 5.6.j covers development from September 23 to December 10, 2002.  

******************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 
	
	1. Added Extrapolation Action (ALL)

           A new action, "EXTRAP" has been added to product generation that
           moves or copies an object based on user entered speed, direction,
           and time interval. Click the "EXTRAP" button to invoke the action.
           Then select the desired object and click the left mouse button 
           to displace the object.  The "Extrapolation" GUI provides text
           box entries for speed, direction and time interval.  The "Copy"
           and "Move" radio buttons specify whether the object is copied
           when displaced to a new position, or whether it is just moved,
           respectively.  Objects grouped with the selected object can also
           be moved by clicking on the "grp" radio button above the product
           generation action buttons.  

	2. Volcano Symbol Improvements (AWC)

           The volcano symbol now accesses the complete list of active
           volcanos contained in the table $GEMTBL/stns/volcano.tbl.  This
           table contains about 100 active volcanos.  The volcano symbol GUI
           has been improved to use a cascading menu based on the first letter(s)
           of the volcano name for volcano selection.

           The text box associated with volcano symbol is now filled at the 
           request of the AWC.

	3. Added New List Class (SPC)

	   A new "List" class has been added to product generation that allows
	   the creation of an object that contains a list of counties, zones,
	   WFOs or States.  

	   Click the "List" class and select the desired list object, e.g., 
           "County".  The list element may be created by clicking on the 
	   screen, e.g., clicking on desired counties, or by selecting a 
	   closed line which is used to calculate all list objects it 
           contains.  In either case, list objects can be added or deleted by 
           clicking the left mouse button.  The selected list object, e.g., 
           county, is indicated with a user selected marker type and color.  
           List elements may be edited after they are created by clicking on 
           one of the list object markers.

	   The list class implemented in this release is a first level set
	   of capabilities.  Future releases will add a GUI that will list
	   out the selected list, e.g., county names, IDs, etc., similar
	   to the Watch GUI.  Also, the mesoscale point production program,
	   MDP, will be modified to use the list object to extract the 
	   WFOs and states associated with the mesoscale discussion graphic. 

    B.  Product Generation Pre/Post-Processing Programs
     
	1. Significant Weather Chart BUFR Message Decoder Improvements(AWC)

	   Two improvements were made to the SIGBUFR program which decodes
	   significant weather BUFR messages.  These improvements were made as 
           the result of testing the program with BUFR messages generated from 
	   the UKMET office.

           First, bogus warning messages were eliminated that indicated that 
           local tables were missing.

	   Second, the jet wind speed logic was improved.  A check was added to
	   determine whether the wind speed difference from the current wind to 
	   the previous wind along the jet is equal to 20 knots.  If it is and 
           the flight level is missing, then a hash mark is plotted.  If the 
           difference is not equal to 20 knots, then a wind barb without flight 
           level is plotted.

	2. Test Program to Create Six-Sided Watch Box (SPC)  

	   A new test program, rebun, has been created to generate a six-sided 
           polygon from a set of counties associated with a watch.  The intent 
           of this program is to allow the SPC to test the rebundling 
           algorithm.  This algorithm will be incorporated into the Watch By 
           County (WBC) processing in a future release.  The rebun program reads 
           in a watch vgf and outputs a vgf that contains the corresponding 
           six-sided polygon.  Testers can compare the input watch counties
	   with the output polygon created by the program.  Type "rebun" to get 
	   help on this program. 

II.  NMAP2 Display Improvements 

    A.  LUT Name Added to SPF (ALL)

	The color look-up table (LUT) name can now be saved and restored
	from Stored Procedure Files (SPFs).  This capability allows loops
	to have pre-specified LUTs when loading from a SPF. 

    B.  Marker Symbols Added to Marker Selection GUI (ALL)

	Marker symbols are now displayed instead of the marker number when
	selecting the marker type for SVRL, WARN and WSTM miscellaneous data 
        types.  Note that the capability to change marker types for winter
	watches, warnings and advisories was not available in previous N-AWIPS
	versions. 
 
    C.  Convective Sigmet Display (AWC)

        NMAP2 now displays only the latest convective sigmet associated with
	each frame instead of all convective sigmets that are valid at frame
	time.  This change was done at the request of the AWC.

    D.  Display of Model Sounding Data Added (ALL)

	Added the capability to display model sounding forecast data sets.  
	Click on "UAIR_FCST" data category in the "Data Source" GUI to select
	the desired model, cycle and station model to display.

    E.  County Outline Option Added for Watches and Warnings, Decluttering 
        (SPC, HPC)

	A new option has been added to allow the counties associated with
	watches, warnings, or advisories to be outlined instead of using
   	a marker at the county centroid.  This option is available for
	SLS watches , warnings, and the winter watch, warnings and advisories, 
	the SVRL, WARN, and WSTM data categories,  respectively.  Click the 
	"Outline" radio button in the "Attributes" GUI to select the outline 
	option.  The "Attributes" GUI is invoked by clicking the "Edit Source" 
	button in the "Data Selection Window" GUI.  The outline uses the color 
	and width settings set by the symbol attributes GUI.  A flag to 
	control whether outline is plotted by default is specified in table 
	$GEMTBL/nmap/miscset.tbl.

    	**** Important Please Note: ***** 

	Miscellaneous data types are now plotted on top of map to improve 
	display clarity. Previous versions plotted the map on top of all 
	data types.

    F.  Toggle on/off Auto-Update for All Loops (SPC)

     	A new option has been added to allow auto-update to be turned off for 
        all loops.  This option is activated by clicking and holding the 
	"Auto-Update" button to invoke a pop-up menu.  To turn-off auto-update
	for all loops select "Auto-Update Lock".  The "Auto-Update" button 
    	turns red in this case.  Select "Auto-Update Unlock" to reset the 
	auto-update state for each loop to what it was before auto-update was 
	locked.  Clicking the "Auto-Update" button without holding down the 
	left mouse button toggles auto-update on/off as it did for previous 
	versions of NMAP2.  That is, clicking just toggles auto-update for the 
	visible loop. 

    G. 	Added Loop Pause on Rocking Animation (SPC)

	The "Dwell Rate" GUI now controls the pause time when the animation 
	is set to the "rock" mode.  Previously, the user could not control the
    	amount of time the animation pauses when frames are rocking.  Now the
     	"last" slider bar on the "Dwell Rate" GUI controls the amount of time
     	the animation pauses at the beginning and end of the loop when rocking 
	back and forth.  This capability has also been added to NMAP.

III. Decoder Improvements

    A.  TAF Decoder Improvements (AWC) 

        The TAF decoder DCTAF has been modified to improve error checking and 
	report time checking, fix bugs in pointers, and prioritize use of
        change indicators 'TEMPO' and 'PROB'.

	Also a new TAF station table has been created that includes only 
	stations that generate TAF reports.  The table is 
	$GEMTBL/stns/tafstn.tbl.  Previously, the surface station table
	$GEMTBL/stns/sfstns.tbl was used by the decoder.  This table
	contains numerous stations that do not report TAFs.

    B.  Winter Weather Watch, Warning and Advisory Decoder Improvements (HPC)

	Numerous improvements have been made to the winter weather decoder, 
    	DCWSTM.  The decoder now handles cancellations on a zone by zone
     	basis instead of a message basis.  The decoder properly obtains
     	weather type and handles expiration information.  Error processing
     	has been improved.  In particular, the decoding of date/time has been
    	made more robust.

    C.  RDF Decoder (HPC) 

	Several improvements have been made to the Regional Digital Forecast
	(RDF) decoder, DCRDF.  The parameters having range values such as QPF, 
        12HR MAX QPF, SNOW 12HR, and MX/MN were added.  Also the precipitation 
        parameters SPRINKLES, RAIN SHW, RAIN, TSTMS, DRIZZLE, SNOW SHWRS, 
        SNOW, FLURRIES, SLEET, FRZNG RAIN, and FRZNG DRZL were added.  Allowed 
        for two time lines with different time zones.  Added a forecast hour 
        (a 6-hour synoptic time) to handle the possible overflow of 12 hourly 
        parameters in the first segment. 

    D.  New Decoder Written to Decode WOUs (SPC)

	A new decoder, DCWOU, has been written to decode watch outline updates
	(WOU) reports and store them to an ASCII file.  The capability to
	display WOUs in NMAP2 will be added in a future release. 

    E.  New Decoder Written to Decode WCNs (SPC)

	A new decoder, DCWCN, has been written to decode watch county 
        notification (WCN) reports and store them to an ASCII file.  The 
        capability to display WOUS in NMAP2 will be added in a future release. 

IV.  General Improvements
                    
    A.	NWX TAF Display Improvements (AWC)

	Created a new TAF station table to eliminate numerous stations that did 
	not generate TAF reports in version 5.6.i.  ($GEMTBL/stns/tafstn.tbl) 
	Also corrected the problem on Linux platforms where TAF reports were 
	not properly broken into multiple lines in the NWX text window.  
	(Known Bugs, Item E, release notes v5.6.i)

    B.  Enhanced GPMAP to Better Display Watches and Warnings (HPC, SPC)

	Counties included in a watch or warning for the WARN, SVRL, and WSTM 
	data types can now be outlined.  An outline flag specifies whether
	the county is outlined or not, YES and NO, respectively.  This flag
	replaces the fill flag in the previous version.  If a watch or
	warning is a "test" only, a hollow marker will be plotted at the county 
	centroid to indicate this, and no outlining will be done.  See the GPMAP
	WARN, SVRL, and WSTM help for additional details.

    C.  New Grid Diagnostics Added (HPC, Unidata) 

	Two new grid diagnostics have been added.  

	The function NCDF(S1,S2,S3) has been added to compute the normal 
	distribution function given the value of the random variable, the mean 
	of its assumed normal distribution, and standard deviation.  This 
	function returns the probability of the random variable taking on a 
	value less than or equal to the given value.  This function was
	written in collaboration with the HPC.

	The function MISS(S1,S2) has been added to replace the missing value in 
	a grid, S1, with a user-selected value, S2.  This function was written
	in collaboration with Unidata.

    D.  NSHARP Improvements (Unidata, ALL)

	The following improvements have been made in collaboration with 
	Unidata.

        1. NSHARP Now Accesses Model Grid and Sounding Files 

     	   NSHARP can now access and generate profiles for model grid files 
           and sounding forecasts generated from models.  Profiles generated
           from model grid files are accessed by selecting "Model Soundings"
           under the "Load" pull-down.  The map area may be zoomed or changed
           by selecting the appropriate option in the "Model Sounding 
           Selection" GUI.   The location can be selected by clicking on the
           map, entering a lat/lon, or entering a station ID.  Profiles 
           generated from model forecast soundings are accessed by selecting
           "PFC Soundings" under the "Load" pull-down.  The desired profile
           location is selected by clicking on the station marker in the map
           window.  The map area may be zoomed or changed by selecting the
           appropriate option in the "Model Sounding Selection" GUI. 

	2. Help Facility Added
	
	   An on-line help facility similar to NMAP has been added to NSHARP.
           Click the "About" button in the main NSHARP GUI and select the
           desired topic.
	
	3. Table-Driven Data Set Selection

           The data sets that appear for NSHARP data categories are now
           table-driven and use the aliases and templates specified in
           the GEMPAK table, $GEMTBL/config/datatype.tbl.  Menu choices
           for observed, model point forecast (PFC), and model grid files 
	   are specified in the tables nsharp_observed.tbl, nsharp_pfc.tbl, 
	   and nsharp_models.tbl, respectively.  These tables are located in 
	   $NAWIPS/tables/nsharp.

IV.  Bug Corrections 

    A.	NMAP2/NMAP GUI Problems with Motif2.1.x/Linux Platforms (AWC, HPC)

	Two GUI problems detected by the AWC and HPC on Linux platforms using
	Motif 2.1 or greater have been corrected.

	First, a problem where certain radio buttons do not accept user input
	has been corrected.  This problem was detected in the "screen" and
	"north" radio buttons in the "Text Attributes" GUI.  The radio button
	problem was also corrected in several other GUIs where the application
	sets the state of the radio button. 

	Second, a problem that caused the "Layer Control" GUI to not appear or
	in some cases a NMAP2/NMAP crash has been corrected.  This problem 
	occurred when the GUI was invoked multiple times in a session.

    B.	CCFP Text Product Erroneous Valid Time (AWC)

     	Corrected the erroneous valid time generated by the program createccfp 
	which creates the CCFP text product.

    C.  International Sigmet From Line Error (AWC)

    	Corrected the problem for area type international Sigmets where the 
	first point's latitude and longitude was not repeated in the from 
	line in the text product.

    D.  High/Low Text Labeling Problem in GD Programs (EMC)

	Corrected the problem where the High/Low Symbol size was not properly
	re-set when plotting contours using GDPLOT2 or GDCNTR.  This would
	cause incorrect symbol sizes to be plotted in some cases.

    E.	RFOP Problem (HPC, RFC) 

     	Improved the rfop program to check for invalid fill patterns by setting 
	the text value to the missing value.   This program converts a VGF to
	the ASCII format required by the RFCs.

    F.  Contour Point Reduction Problem (HPC)

	Corrected a problem where point reduction (using the fltr option
	on the LINE parameter) sometimes caused contour lines to cross
	for QPF generated lines.  This problem occurred with contours in high
	gradient areas.

    G.  Upper-Air Significant Level Processing Error (HPC) 
     
	Corrected the upper-air significant level merging to account for invalid
	significant winds (PPBB) and  temperatures (TTBB) reported at the 
	surface.  This problem was detected with erroneous surface values
	encoded over several soundings in Saudi Arabia.

    H.	Graph-to-Grid Fatal Error (HPC)
	
	Corrected the problem where if the first entry in the table
	$GEMTBL/grphgd/grphgd.tbl is not QPF, then NMAP2/NMAP2 core dumps
	after clicking the Graph-to-Grid button in product generation. 
	(Known Bugs, item B, release notes 5.6.i).	

    I.	WCL Problem After Adding or Deleting Counties (SPC)

	The generation of the Watch County List (WCL) product was not properly
     	keeping track of counties added or deleted from the watch.  This 
	problem has been corrected.

    J. 	NMAP2 Print Problems (SPC)

     	Corrected a problem where the data was shifted with respect to the map 
	on all but the last frame after exiting product generation.  Also
	corrected problem where VGF elements were printed twice. 

    K. 	NMAP2 Frame Counter Problem with Empty Loops (SPC)

     	Corrected the problem where if an empty loop was incremented or
     	decremented, the frame counter would indicate an invalid frame number.  
	This problem was reported to occasionally cause NMAP2 to crash.

    L.  Status Message Problems (SPC)

     	Modified the status message text generation to include Great Lakes and 
	adjacent coastal water identifiers.  Also corrected a fatal bug if a 
	null file name is entered for the watch status text file. 

    M.  Hide/Show Problem (SPC)
	
	Corrected the problem where the "HIDE/SHOW Loop" button did not work
	properly after exiting product generation.

    N.  24-bit Problems (Unidata) 

     	The following problems found by Unidata when using N-AWIPS on 24 bit
     	platforms have been corrected.

     	First, NTL was not properly initializing colors.

	Second, the GD programs, gdcntr, gdmap, gdstream, and gdwind did not
	properly load color look-up tables if contours were plotted on top
	of imagery.

    O.	NOAAPORT Decoding Problem (Unidata)

	A problem decoding radar data received on NOAAPORT has been corrected.

    P.  Increase Maximum Decoder Bulletin Size (Unidata)
     
   	The maximum bulletin size, DCMXBF, used by the decoders was increased
	from 16 kb to 100 kb to handle large bulletin sizes.  In particular, 
	some RDF bulletins were found to exceed 16 kb.

V.   Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Temporary Grid Naming Problem  (Unidata)

        The capability to name grid diagnostics in the GEMPAK parameters
        GFUNC and GVECT does not work.  This capability, specified by using
        the "//" characters, should allow a computed grid to be named for later
        use in a diagnostic function in a grid program.

    C.  Inherit Map Attributes for Un-Remapped Images (SPC, TPC)

    	The "Apply Settings" and "Get Settings" functions do not work
        properly for satellite images that are in their native projections.

    D.  TAV and TDF Grid Diagnostic Function Errors (ALL) 

    	The calculations are incorrect for the time average (TAV) and time
     	difference (TDF) grid diagnostics when there are single forecast time
    	grid files that include different navigations.  For example, the 
     	calculations are wrong for the AVN and MRF single forecast time files
     	because the MRF and AVN grid navigations change to reflect a coarser
        spatial resolution beginning at 180 and 192 hours, respectively.  This 
     	problem has been discovered during recent CDB testing but has been 
    	present for at least two years.  Note that the TAV and TDF 
     	calculations are correct for all other cases where the grid navigation 
     	does not change for a forecast cycle.  For example they work properly 
     	for the eta model single forecast time files, and AVN and MRF combined
     	forecast grid files.

VI. Map and Table File Updates

    The following summarizes significant table changes.  See 
    $NAWIPS/versions/tables.log and nawips.log for a detailed list of all 
    table and map file changes. 

    A.  Table Modifications for New Extrap Action (ALL) 
     
	The following tables were modified to support the new Extrap action
	in NMAP/NMAP2 product generation:

	1. $GEMTBL/config/prefs.tbl
	2. $GEMTBL/pgen/funcbtn.tbl

    B.	Table Modifications for New List Class (ALL)
	
	The following tables were modified or added to support the new List 
	class in NMAP/NMAP2 product generation:

	1. $GEMTBL/pgen/classbtn.tbl (Modified)
	2. $GEMTBL/pgen/setting.tbl (Modified)
	3. $GEMTBL/pgen/uattribd.tbl (Modified)
	4. $GEMTBL/pgen/listbtn.tbl (New)

    C.  New Parameters for RDFs Added (HPC)

	The table $GEMTBL/config/prmlst.tbl was modified to add several new
	parameters now decoded and displayed for the RDFs.

    D.  County Outline Option (SPC, HPC)

	The table, $GEMTBL/config/miscset.tbl was modified to add an outline
	flag to specify whether the county is outlined by default for the
	SVRL, WARN and WSTM watches and warning data types.

VII.  Calling Sequence Changes

    A.  $GEMPAK/source/bridge/tf/tfdecd.f, tffcin.f
    B.	$GEMPAK/source/programs/gd/gdstat/gdywrt.f
    C.	$GEMPAK/source/bridge/ws/wssgmt.f
    D.	$GEMPAK/source/bridge/rd/rdcdat.f, rddcpm.f, rdidat.f, rdsynt.f

See the nawips.log and changes.log for additional details concerning
these routines.


*****************************************************************************


The necessary compiling and linking instructions are contained in
the following file:

     patch_build_5.6.j 

To execute the script and save its output in a file type:

     cd $GEMPAK/build
     patch_build_5.6.j >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.
