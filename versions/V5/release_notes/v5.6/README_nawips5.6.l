               N-AWIPS 5.6.l Release Notes
                    6/13/03

Patch 5.6.l covers development from March 21, 2003 to June 12, 2003.  

******************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 

	1. International SIGMET Improvements (AR, PR) 

	   The International SIGMET maker has been generalized to 
	   properly make the message headers for oceanic SIGMETS issued from 
           Guam (PGUM), Hawaii (PHFO) and Alaska (PANC).  Areas and isolated 
           points are encoded using lat/lon coordinates only.  No geographical 
           reference points such as VOR or island names are used in this 
           delivery.

	   For the Alaskan SIGMETs, three header lines will be generated: (1) 
           the WMO header and date/time group, (2) the AWIPS header, and (3) the 
           FAA header and date/time group.

           For the Guam and Hawaiian SIGMETs, two header lines will be generated: 
           (1) the WMO header and date/time group, and (2) the AWIPS header.  The 
           WMO and AWIPS headers will assume only one storm of a particular type 
           (tropical cyclone, volcanic ash, or other) in this delivery.  
           Therefore, the last digit in the WMO and AWIPS headers will always be 
           a 1, unless it is a WMO header for a volcanic ash issued from PHFO 
           which means it will be a 0.  If there is more than one storm of a 
           type, then the last digit in the headers can be edited before saving 
           the text product.

	2. Open VGF Performance Improvement (HPC, ALL) 

	   The performance of opening VG files has been improved for the
	   case when files are opened repeatedly with the "Replace" option.  
	   This improvement does not apply to the case when layering is 
	   active. 

	3. Extend NMAP Hurricane Track Product to 5 Days (HPC/OPC)

	   The Hurricane Track Product has been modified to create a list of
	   locations out to 5 days. The product is created from a line with up
	   to 7 points. The points on the line refer to location of the tropical
	   system at forecast hours 12, 24, 36, 48, 72, 96 and 120. If there
	   are less than 7 points on the line, then only the corresponding
	   forecast hour locations are added to the product.

	4. Watch Product Improvements and Corrections (SPC)

	   Numerous improvements and corrections have been made to the
	   generation of watch products in response to SPC requests and
	   Watch by County (WBC) tests.  For a complete description of all
	   the modifications, refer to the nawips.log entries listed under
	   1bb29-46.  Some of the more significant changes are highlighted
	   below.

	   The Watch Coordination Call (WCC) message pass code is now read
	   from the table $GEMTBL/config/WCCphone.tbl.  The pass code is the
	   second entry for each phone number listed in the table.

	   Added 1.5 and 2.5 inch hail sizes to the "Format Watch" GUI for the
	   SAW and SEL products and corrected the problem with the 0.5 inch
	   selection.

	   The WOU update text message format was modified to more closely match
	   the WOU initial format at the request of the SPC.

	   Corrected the SAW and SEL products for the cases of replace and 
           continuing watches, and cancellations.

	   Corrected the updated WOU message creation for the day boundary 
           problem between Saturday and Sunday and the incorrect assignment of 
           the day when the Z time day is after the local time day.

	   Corrected the problem where changing the county marker attributes of
	   an issued watch reset the watch to the non-issued state.

    B.  Product Generation Pre/Post-Processing Programs

	1. Mesoscale Discussion Product Improvements (SPC)

	   The mesoscale discussion product text generation program has
	   been rewritten in collaboration with the SPC.  The new program,
	   MDPSPC, uses the first scallop line found in the VGF to 
	   automatically compute the lists of states and WFOs.
     
	2. Hurricane Graphics Improvements for 2003 Season (TPC, PR)

	   Modified the program GPKGRF, the Kelly graphic, to read breakpoint 
           names and locations from a table.  This change makes it easier to 
           update breakpoints annually and to align the watch/warning bands 
           to the coastline.  Also, modified the smoothing algorithm used by 
           GPKGRF to improve the accuracy of the track error display.

           All programs which read tropical advisories (GPKGRF, GPTPC, DCHRCN)
           have been modified to accept either a 2-digit or a 4-digit year in 
           the storm identifier.

II.  NMAP2 Display Improvements 

    A.  Roam Improvements and Bug Corrections (ALL)

	Several improvements and bug corrections have been made to the roam 
        function.  The roam factor selected for a loop is now indicated by the 
        greyed out entry in the "Roam" pull down list.  Also, the "Size of Image" 
        roam factor now can be applied to radar images as well as satellite 
        images.  Problems reported by the AWC and SPC regarding improper roaming 
        after auto-updates and hot key and mouse combination roaming were also 
        corrected.  Also, problems between the roam, auto-update and busy 
        functions were corrected.  This problem may have caused some occasional 
        NMAP2 hangs.	

    B.  AIRMET Display Improvements (AWC, AR, PR)

	Two enhancements have been added to improve the display of the 
        AIRMETS.

	First, turbulence AIRMETS can now be color coded based on a user 
	selected flight level. For example, turbulence AIRMETS below 
	15000 feet can be plotted in light blue and AIRMETS above 
	15000 feet can be plotted in dark blue.  To specify the colors and
	flight level, invoke the "AIRM Attributes" GUI by clicking the 
	"Edit Source" button on the "Data Selection Window".  The colors
	and threshold flight level in hundreds of feet are adjacent to
	the "Turbulence" check box in the GUI.  The color choices can be
        modified by clicking on each color box to invoke the color palette.

	Second, AIRMET plotting can now be filtered by flight level.  The
	"Lower Filter Level" and "Upper Filter Level" check boxes on the 
	"AIRM Attributes" GUI control the filtering.  If the "Lower Filter Level"
	is checked, then only AIRMETs greater than or equal to its value (entered 
        in hundreds of feet in the adjacent text box) are plotted.  For AIRMETs
	that have two flight levels, the maximum flight level must be greater
	than or equal to the low filter value to be plotted.  Similarly, if
	the "Upper Filter Level" is checked, then only AIRMETS less than or
	equal to its value are plotted.  If both filter levels are checked, then
	only AIRMETS that lie between the limits are plotted. 

	The default values for the flight levels and colors for the "AIRM
	Attributes" GUI are specified in the table $GEMTBL/config/miscset.tbl.

    C.  Non-Convective SIGMET Improvements (AWC)

	The plotting of non-Convective SIGMETS can now be filtered by 
	the name, e.g. "Oscar", of the SIGMET.  Click on the "Edit Source"
	button of "Data Selection Window" to invoke the "NCON Attributes"
	GUI.  Check boxes adjacent to each name are used to control whether
	SIGMETS associated with that name are plotted.  If the check box
	is on, then the SIGMET with that name is plotted.  The defaults
	for the "NCON Attributes" GUI are specified in the table
	$GEMTBL/config/miscset.tbl. 

    D.  TAF Display Improvements (AWC)

	Numerous additions and improvements were made to the display of TAF
	parameters in SFMAP and NMAP2 in response to AWC requests, including
	low-level wind shear, color-coded ceilings MSL, and display of
	various combinations of prevailing, temporary and probability weather
	and flight conditions.

    E.  Cloud Height Algorithm Improvement (AWC)
	
	The cloud height calculation has been modified to use the
	previous sounding report if the latest is not available.  Previously,
	climatology was used if the latest sounding closest to the cursor
	was not available.

    F.  Increased Maximum Number of Frames in NMAP2 (HPC, ALL)

	The maximum number of frames that can be loaded into NMAP2 has been 
        increased from 80 to 120 frames.

    G.  QSCT Improvements (OPC)

	Two new capabilities have been added to the display of QSCT winds.

	First, rain flagged and non-rain flagged winds can now be distinguished
	by color coding.  A second colunm of color palettes has been added
	to the "QSCT Attributes" GUI.  Rain flagged winds can be color
	coded by clicking on the "Use 2nd color for Rain" button.  Also,
	the number of wind speed intervals has been increased from eight to
	twelve.

	Second, an option has been added to plot the scan times associated
	with each orbital pass by plotting a labeled line at user selected
	time intervals.  Click on the "Time Stamp Interval" check box in the
        "QSCT Attributes" GUI to enable this option.  Click the adjacent color
	box to select the desired line color.  The adjacent text box specifies
	the time interval in minutes from 0Z.  Click the "Line" button to 
        specify the line thickness.  

	The defaults for all of the attributes in the "QSCT Attributes" GUI
	are specified in the table $GEMTBL/config/miscset.tbl.

    H.  Added Watch Number Color Coding to Watch Box Plotting (SPC)

	Watch boxes can now be distinguished by color coding them by
	the last digit of the watch number.  This capability has been 
	added in the same way as it was done in the previous release for the
	WCN and WOU watch products.  Click the "Edit Source" button in the
	"Data Selection Window" GUI to invoke the "WTCH Attributes" GUI.
	To enable watch number color coding, click the "Color Code" check box.
	Watch plotting and color are specified by clicking the adjacent check
	box and color palette button, respectively, for watch number digits
	zero through nine.  Default values for the "WTCH Attributes" GUI
	are specified in the table $GEMTBL/config/miscset.tbl.

    I.  Changed Start Time for Watch Display (SPC)

	NMAP2 was modified to match the watch box beginning valid time to the
	NMAP2 frame time.  Previously, watch boxes could be displayed up to
	an hour before their starting valid times.  This change was made at the
	request of the SPC.

III. Decoder Improvements

    A.  NDFD Encoder/Decoder (ALL)

	The NDFD Encoder (gd2ndfd) and Decoder (ndfdg2) have been modified to
	convert between the GRIB parameter id numbers and the GEMPAK parameter
	names using a table. The table, $GEMTBL/grid/g2vars.tbl, was added 
        to easily allow the addition of new parameters.

	The Decoder was also modified to accept a user input skip factor. The
	skip factor, GSKIP, is used to reduce the resolution of the output
	GEMPAK grid. If the original grid has more than 750,000 grid points,
	GSKIP may be used to reduce the number of points to less than 750,000,
	which is the maximum number of points for storage in a GEMPAK file.

    B.	Aircraft Decoder Improvements (AWC)
	
	The Aircraft decoder DCACFT has been modified to interpret 'OCNL' in the
	context of turbulence as denoting a range (e.g., 'MOD OCNL SVR').
	More navaid locations were added to the PIREP station table
	$GEMTBL/stns/pirep_navaids.tbl.  Also corrected a fatal bug when an 
	undecodable time field is the first report processed following the 
	decoder start-up.

    C.  TAF Decoder Improvements (AWC)

	The TAF decoder DCTAF has been modified to decode low-level wind shear
	and to conform to specifications in NWSI 10-813 which differ from the
	WMO standard.  Ceilings above mean sea level are now computable.
	Mountain obscuration threshold values and 41 U.S. and Canadian stations
	were added to the station table.

IV.  General Improvements

    A.  Model Diagnostics Re-engineer (ALL)

   	Two long-standing known problems were corrected with grid data 
        calculations as the result of improvements in the diagnostics
	software.

	1. Temporary Grid Naming Problem

   	   The use of the //X construct in GFUNC and GVECT has been restored.
   	   This capability allows the user to save the results of a diagnostic 
           calculation in the internal grid set for use in a later diagnostic 
           as the shorter saved name. (See the help for GPARM for more 
           information and an example.)

	2. TAV and TDF Grid Diagnostic Function Errors
      
	   Fixed the problem where the grid diagnostic processing lost the 
           ability to detect a change in grid navigation.  This correction solves 
           the problem of TDF and TAV functions not working for forecast hours 
           before or after the change in grid navigation in models such as the 
           GFS.

    B.  NWX Append Mode Option Added (AWC, ALL)

	An append option has been added to allow reports to be listed from 
        multiple stations.  Click the "Append" radio button near the bottom
	of the "Text Report" GUI.  If this option is turned on, then as 
        each station is selected, its report is added to the "Text Report"
	GUI's text window.

    C.  New Sleet/Snow Combination Symbol Added (HPC)

	A new sleet/snow combination symbol has been added to GEMPAK and
	NMAP product generation at the request of the HPC.  The new symbol
	appears as two stars and a triangle with a dot at its center 
	separated by a slash.

    D.  Added New Symbols C, A, X and N (PR) 

	The new symbols C, for cyclonic, A, for anti-cyclonic, X for maximum
	and N, for minimum have been added to the GEMPAK plotting routines.
	The symbols are also available in NMAP product generation.  

    E.  New Fire Weather Grid Diagnostics Added (SPC)

	Two new fire weather diagnostics have been added.  They are the
	Fosberg index, diagnostic FOSB (TMPC, RELH, SPED) and the Haines 
	index for low, middle and high elevations, LHAN, MHAN, HHAN, 
	respectively.  See the GEMPAK help $GEMHLP/gparm.hl2 for additional
	details.

    F.  Objective Dvorak Technique(ODT) Incorporated into N-AWIPS (TPC)

	A new program, NODT, has been written to incorporate the ODT program
        (version 5.3) from the Coooperative Institute for Meteorological 
        Satellite Studies, University of Wisconsin - Madison into the N-AWIPS 
        environment.  This release represents an initial set of capabilities.  
        Improvements to the program in future releases will be based on TPC 
        testing and evaluation.

	The program's algorithm ONLY works for storms equal to or greater than 
	hurricane strength (T# >= 3.5)... do not use on weaker systems. An image 
	file and a (lat,lon) earth coordinate defining the tropical storm center 
	must be provided. 

	To run the program, type "nodt" followed by any options followed by 
        the image file name. For example, 
        "nodt -clatlon.cpf -yhistoryfile.odt imagefilename".  Output is sent 
        to the screen (unless redirected); also, a history file entry is made 
        to the appropriate file.

	Available options as well as usage examples are in the file 
        "$GEMHLP/nodt.hlp" and may be viewed by typing "nodt -h" or simply 
        "nodt".

V.  Bug Corrections 

    A.  Upper-Air Forecast Data Set Problems with SPFs (ALL)

	Corrected the problem where upper-air forecast data set attributes
	were not properly saved to the Stored Procedure Files (SPFs).

    B.  SPF Problem with Saving Parameter Conditions (ALL)

	A problem was corrected with the use of certain parameter conditions in
	the SPF files. If the less than (<) condition was used for a parameter
	in surface or upper air data, then reading the SPF file would result
	in erroneous entries. This was a problem since the keyword tags are
	delimited by "<" and ">". The less than condition must now be escaped.
	That is, a backslash (\) must appear before any less than sign that is
	not the beginning of a new keyword tag.  When a SPF is saved with
	parameter conditions with a "<", the backslash character is 
        automatically added to the SPF.

	All existing SPF files that have "<" in the parameter conditions must
	be modified to include the backslash. This may be accomplished by either
	re-selecting and re-saving all of the data for the SPF, or by using
	a text editor and adding the backslash to the appropriate locations
	in the file.

    C.	Significant Weather Chart BUFR Message Encoding/Decoding (AWC)

	Several problems in the generation and display of high level
	significant weather chart BUFR messages have been corrected.
	Corrections include properly encoding charts with greater
	than 256 tropopause symbols, the plotting of scallop lines,
	and the proper plotting of directional arrows associated with 
	fronts.  In addition, the encoding and decoding problems associated
	with the jets have been corrected. 

    D.  NWX Decoded TAF Displaying More Than One Report (AWC)

	The "time covered" selection panel for decoded TAFs has been disabled
	in NWX, and only the most recent single TAF is displayed for the
	selected station(s) or state.  Formerly, from 15 minutes before the
	hour up to the hour, NWX would display multiple reports for a station,
	even with the "time covered" set to one hour.

    E.  Corrected Icing Symbols Used for SIGMETS (AWC)

	The icing symbol that is plotted for non-convective sigmets was changed 
        from moderate to severe, and the icing symbol for international sigmets 
        was changed from moderate-severe to severe.

    F.  Incorrect Diameter for Isolated Convective Sigmet (AWC)

	When plotting an isolated convective sigmet (as a circle), the diameter
	was being misinterpreted as a radius, and the circle was twice as big
	as it should have been.  This bug has been fixed.

    G.  Contour Fill Problem (AWC)

	Corrected a problem with the contour fill when contouring data with very
	large data ranges.  This problem reported by the AWC occurred when 
	contouring grids using the Richardson's number calculation.

    H.  Edit Turbulence Symbol Problem (AWC)

	Corrected the problem where the incorrect turbulence symbol was plotted
	after editing the turbulence text.

    I.  Volcano Symbol Placement (AWC)

	Corrected the problem where volcano symbols were not properly placed
	if they were placed more than once in an NMAP product generation session.

    J.  GIF Output Skewed on 16-bit Displays (AWC)

	A bug was reported by the AWC where the GIF file created by the GF
	device driver was skewed when a 16-bit display was used with an
	X-dimension that was not divisible by 4. This problem has been fixed,
	and the output from 8-bit and 24-bit displays have been verified to
	not have any problems.

    K   SFGRAM Problem (EMC)

	Corrected the problem where SFGRAM did not generate plots.  This problem
        occurred when the DATTIM range is set to specific values, e.g., 05/12-
        08/00, as opposed to ALL, and the file name is not an alias.

    L.  Lat Lon label plotting problems (EMC)

	A bug was fixed with the plotting of lat-lon line labels. If the user
	selected a polar stereographic projection and a garea that included
	the pole, either north or south, but was not the complete hemisphere,
	then there was a space left for the labels on the left side of the
	plot area. However, the labels were drawn at the central longitude.
	The space left for the labels has been eliminated and the latitude
	lines now extend to the edge of the plot area.

    M.  NMAP2 Watch Color Coding Problem (SPC)

	Corrected the color coding problem with watch numbers ending in zero
	for the display of WOUs, WCNs, and Watch Boxes.

    N.  Data Selection Window and Data Source Popup Locations (SPC)

	The locations of the Data Selection Window and Data Source pop up have
	been modified in the Nmap resource file and in the source code to be
	higher on the screen.  The Data Source pop up is placed relative to
	the Data Selection Window and was being placed differently if the user
	selected New Source or Modify Source.  This difference has been
	eliminated.

    O.  Corrected Southern Hemisphere Grid Decoding Problem (Unidata)

	Corrected the entry for AWIPS grid number 220 in the table
	$GEMTBL/grid/grdnav.tbl.  This grid is used for the Southern Hemisphere
	SSMI-derived sea ice concentrations.

VI. Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Jet Selection Problem in Product Generation (AWC)

	Sometimes the wrong jet is selected, e.g., when grouping objects.
	This problem occurs when a jet is split across the displayed area, 
	i.e, when a portion of the jet appears on both the left and right
	sides of the display area.  In this case, it is possible that
	the split jet will be selected instead of the jet closest to
	the cursor if the cursor is closer to the virtual line the connects
	the split jet across the data display. 	

    C.  Inherit Map Attributes for Un-Remapped Images (SPC, TPC)
	
    	The "Apply Settings" and "Get Settings" functions do not work
        properly for satellite images that are in their native projections.

VII. Map and Table File Updates

    The following summarizes significant table changes.  See 
    $NAWIPS/versions/tables.log and nawips.log for a complete list of all 
    table and map file changes. 

    A.  Miscset.tbl (ALL)

	The table $GEMTBL/config/miscset.tbl which specifies the default 
	attributes for the miscellaneous data type has been modified to
	add new features for the watch, airmet, non convective sigmet, and
	QSCT data types.  This table MUST be reconciled with local changes
	made at sites for the new features to work properly.

    B.  Prmlst.tbl (AWC)

	The table $GEMTBL/config/prmlst.tbl that specifies the default station
	plotting models for observational data has been modifed to account
	for the new display capabilities for the TAF data. 

    C.  Taf_parms.tbl (AWC)

	The table $GEMTBL/nmap/taf_parms.tbl was modified to add the newly 
	available TAF parameters.

    D.  Sigmetinfo.tbl (PR, AR)

	The table $GEMTBL/pgen/sigmetinfo.tbl was modified to account for 
	selections needed by the Pacific and Alaskan Regions to generate
	their oceanic sigmets.

VIII.   Calling Sequence Changes

    A.	$GEMPAK/source/ccgemlib/ctb/ctbrdcpf.c, ctbwrcpf.c
    B.  $GEMPAK/source/nmaplib/nms/nmsdspl.f
    C.  $GEMPAK/source/gemlib/gg/ggqsct.f, ggqsrd.c
    D.  $GEMPAK/source/cgemlib/ctb/ctbg2gnam.c, ctbg2gpdn.c
    E.	$GEMPAK/source/gemlib/gg/ggairm.f
    F.  $GEMPAK/source/gemlib/gg/ggtcsm.f
    G.  $GEMPAK/source/bridge/tf/tfdecd.f, tfgrpt.f

See the nawips.log and changes.log for additional details concerning
these routines.

*****************************************************************************


The necessary compiling and linking instructions are contained in
the following file:

     patch_build_5.6.l 

To execute the script and save its output in a file type:

     cd $GEMPAK/build
     patch_build_5.6.l >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.
