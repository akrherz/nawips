               N-AWIPS 5.6.m Release Notes
                    9/25/03

Version 5.6.m covers development from June 12 to September 25, 2003.  

******************************************************************************

I.  Product Generation Changes
	
    A.	NMAP/NMAP2 Product Generation Improvements 

	1. Improvements to the Mid-level Significant Weather Text Box (AWC)

	   At the request of the AWC, the SWM cloud information box has been
	   modified to not require the display of turbulence and icing
	   information. If the user does not enter any height information for
	   either turbulence or the icing, then that particular item is
	   not displayed in the text box and the text box size is reduced
	   accordingly.

  	2. WOU Collection and Generation Improvements (SPC)

	   Several improvements have been made to the program WOUPDT that 
           collects WCNs and generates WOU updates.

	   The handling of watch cancellations has been improved.  First,
	   a new flag -c has been added to the program to create WOU, SEL and  
	   SAW cancel text messages immediately if no previous cancellation
	   message for a watch has been issued.  Second, a cancellation 
           message can now be created after the watch expires if it has 
           not been previously generated.  A new parameter, WOU_CNL_PLUS_MIN, 
           specified in the table $GEMTBL/txtprd/woudef.tbl controls the 
           maximum number of minutes after the watch expires that a watch 
           cancellation will be issued.  The woudef.tbl table also specifies 
           the search path for finding the original watch text files 
           (ww####.txt) that are needed to create the SEL and SAW cancel text 
           messages.

	   The WOUPDT program can now be run so that it only creates a WOU if
	   the list of counties for a watch has changed.  Use the -n flag 
	   to exercise this option.

	   If no flag is used with the program, then a WOU is created without
	   checking to see if the status of the watch has changed, as was done 
           for the previous version of this program.  This option should be 
           used for scheduled issuances, e.g, hourly updates of the watch. 

           See WOUPDT.HLP for more information about WOU flags and woudef.tbl.

	3. Watch Generation Improvements (SPC)

	   A county lock button was added to the "Watch Specifications and
           County List" GUI. Locking the counties allows the watch to be 
           resized without the counties being cleared.  When this button is 
           activated, the 'Create', 'Add/Del', 'Clear', 'Clustering', 
           'States' and 'Toggle Anchor Pts' are made insensitive.  This button 
           is reset to "Off" each time the "Watch Specifications and County 
           List" window pops up.

	   The "Watch Coordination" window has been modified to include a list 
           of replacement watch numbers. Also, the list of replacement 
           watch numbers and their associated WFOs was added to the "WCC Save" 
           window and the output text product. Also, the ids 'WNAW' and 'WNAR' 
           were added to the WFO 'ATTN' line.

	4. Status Message Changes (SPC)

           In the watch status message, the expiration time was changed from
           the top of the hour (H+00) to 40 minutes past the hour (H+40).
           Also changed when the 'Final' status message expires to when the
           watch expires.

    B.  Product Generation Pre/Post-Processing Programs

	1.  Hurricane Graphics Improvements for 2003 Season (TPC)

	    The Kelly graphic creation program, GPKGRF, has been modified
	    by adding a stippled area and its associated legend 
            'Potential Day 4-5 Track Area' to the legend box when a 5 day 
            track is specified.  This change was done to improve the distinction
	    between the Day 1-3 track and the Day 4-5 track.

II.  NMAP2 Display Improvements 

    A.  Option help available in NMAP2 (ALL)

	The GEMPAK help files for the "Options" window in NMAP2 are now 
        available.  "Color Enhancement", "Cursor", "Dwell Rate",
        and "Locator" functions have separate help descriptions under their
        respective Option help topic, e.g, "Option-Cursor".  Other "Option"
        pull-down items help appear under "Option - General Description".

    B.	Busy Process Removed (ALL)

	The Busy sub-process has been removed from NMAP2 because it would
        occasionally cause NMAP2 to slow down or hang up.  The Busy process
        controlled the cloud and sun icon, located to the right of the "Stop"
        icon, that moved to indicate that NMAP2 was busy loading frames, e.g.,
        when an auto-update was occurring.  Thus the cloud and sun icon has
        been removed from the NMAP2 GUI.  To indicate that NMAP2 is loading 
        frames, the "Stop" icon turns red and the cursor changes shape, as was 
        done in previous versions of NMAP2.

    C.  Roam Sharing Option Added (AWC, ALL)

	A new option called "Roam Share" has been added to the "Option" pull
	down.  If this option is turned on (the default), then loops with
	the same navigation and roam factor will "share" the roam information.
	This means that switching loops will preserve the same location 
        when roaming.  The default for this option is specified in the table 
        $GEMTBL/config/prefs.tbl.

    D.  Parameter help available in NMAP2 (HPC)

	The GEMPAK help files for SFPARM and SNPARM are now available from the
	"Help" window in NMAP2 by selecting "Parameters - Surface" and 
        "Parameters - Upper Air", respectively. 

    E.  Add day of the week and forecast hour to NMAP2 window (OPC,ALL)

	NMAP2 displays the frame time in the lower left hand corner of the main
	display window. It has now been enhanced to include the day of the week
	of the frame time. Also, if the dominant data type is a forecast model,
	the forecast hour for the frame is displayed.

    F.  Added Option to Stop Looping on Current Frame (OPC, ALL)

	A new option has been added to allow looping to stop on the current
	frame instead of the last frame.  The option is controlled by selecting
	the "Loop Stop" item on the NMAP2 "Option" pull down.  The default
	for this option is specified in the table $GEMTBL/config/prefs.tbl. 

    G.  Added Watch Number Color Coding to SVRL Watches (SPC)

        Severe local storm watches (SVRL) can now be distinguished by color 
        coding them by the last digit of the watch number.  This capability has 
        been added in the same way as it was done in a previous release for the
        WCN and WOU watch products.  Click the "Edit Source" button in the
        "Data Selection Window" GUI to invoke the "SVRL Attributes" GUI.
        To enable watch number color coding, click the "Color Code" check box.
        Watch plotting and color are specified by clicking the adjacent check
        box and color palette button, respectively, for watch number digits
        zero through nine.  Default values for the "SVRL Attributes" GUI
        are specified in the table $GEMTBL/config/miscset.tbl.

III. Decoder Improvements

    A.  Aircraft Decoder Improvements (AWC)

        The aircraft decoder DCACFT has been modified to interpret '-OCNL' in
        the context of turbulence as denoting a range (e.g., 'MOD-OCNL SVR'),
	for PIREP reports.  In addition, more navaid locations were added to 
        the PIREP station table $GEMTBL/stns/pirep_navaids.tbl.

    B.  International SIGMET Improvements (AWC, AR, PR)

	The international SIGMET decoder DCISIG has been enhanced to decode
	Alaskan SIGMETs that use lat/lon and VOR positions.  Not all Alaskan
	SIGMETs will be decoded, especially if they are very different from the
	format generated by the encoder or use new keywords or have missing
	keywords.  However, some modifications have been made to decode selected
        irregular reports that have been found to be non-standard.

	DCISIG has also been modified to decode tropical cyclones (WCP) from
	PGUM and PHFO.  Again non-standard WCP SIGMETs may not be decoded.

	DCISIG has also been modified to decode the phenomena CB for
	SIGMETS issued by the U.S.

    C.  DCWOU decoder changes (SPC)

	The WOU decoder was updated to be able to decode WOU cancellation 
	messages. The cancel messages have only the header line being written
        to the decoded file; no counties follow this line.  In addition,
        the decoder was modified to decode WOU text messages issued from a
	backup site, e.g., AFWA.

IV.  General Improvements

    A.  Time Line Range and Interval values in the SPF (ALL)

	The time range and interval values for the dominant data source
	have been added to the Saved Procedure Files. In a future release
	the user will have control over these time line attributes. However,
	for this release, these values do not have any effect on the time line.
	They have been added now in preparation for the future development.

    B.  Graph-to-Grid (ALL)

	Several improvements to the graph-to-grid processing have been made.

	1) Internal coding was re-engineered to accommodate large grids while at 
	   the same time reducing the overall memory requirements by about 2/3. 
	   Grids may now be up to 1000x1000.

	2) The algorithm has been improved to allow for multiple minima and
	   maxima to be specified for either closed contours or open contours.
           Previously, only one extrema could be specified for only closed 
           contours. 

	3) Improvements to bounds handling have been made. In addition to 
           BOUNDS areas masking grid points (set value to missing), BOUNDS 
           areas now also prevent contour information from being "seen" from 
           one side of a bounded area to the other. For example, with a land 
           BOUND, grid points being analyzed in the Gulf of Mexico will not 
           be influenced by contour lines in the Atlantic because of the 
           presence of the Florida peninsula.

	4) A problem reported by CPC has been corrected where computations were 
	   incorrect for grid areas substantially larger than the drawn analyses.

	5) A diagnostic listing has been added when the history grid is 
           requested. The listing includes information about memory usage, etc.

    C.  List data in NWX in alphabetical order (AWC)

	When selecting data by "state" in NWX, the results are displayed in
	alphabetical order based on the search string. The search string is the
	station ID or the bulletin ID, depending on the type data selected by
	the user.

    D.  TAF parameters added for ceilings, mountain obscuration thresholds (AWC)

        New TAF parameters TCMS, TMOB, WCMS and WMOB, along with new functions
        to calculate temporary/probability and worst case ceilings and mountain
        obscuration thresholds, have been added.  These parameters can be 
        displayed in GEMPAK surface programs and NMAP2.  For NMAP2 display,
        the parameters must be added to the table, $GEMTBL/config/prmlst.tbl,
	which specifies station plotting models.  See the sfparm.hl2 help file
	for a more detailed description of each of these new TAF parameters.

    E.  Added CPC products to NDFD Encoder and Decoder (CPC)

	Several new parameters were added to support encoding and decoding
	CPC products into the NDFD.  The parameters PTBN, PTNN, and PTAN 
        were added to the g2vars.tbl to support CPC Temperature Below Normal, 
        Near Normal, and Above Normal products, respectively.  Also, the
        parameters PPBN, PPNN, and PPAN were added to the g2vars.tbl to 
        support CPC Precipitation Below Normal, Near Normal, and Above Normal 
        products, respectively.  The GD2NDFD and NDFDG2 programs were modified 
        slightly to accommodate the new CPC products.

    F.  New grid diagnostics (HPC)

	Two new grid diagnostics have been added at the request of the HPC:

            INT (S) - Converts the grid point value to an integer.
	    NINT (S) - Rounds the grid point value to the nearest integer.

    G.  Enhance GDGRIB for large grids (OPC)

	The GRIB encoding program, GDGRIB, has been modified to read and process
	grids larger than the limit of 275,000 grid points for diagnostics.
	GDGRIB will now read grids directly from the GEMPAK grid file, if
	possible. If the grid can be read directly, the grid size limit is
	750,000. For diagnostic functions, the limit is still 275,000 grid
	points.

    H.  MPC to OPC Name Changes (OPC)

	With the name change of the Marine Prediction Center to the Ocean
	Prediction Center, all of the references to MPC have been changed
	to OPC.

	Various tables were modified to use OPC instead of MPC. Most notably,
	the SSA bounds table, the map file names table, the parameter list
	table for station data, and the geog table have entries that now
	reference the OPC.

	The appropriate help files were also modified to reflect these changes.

	NOTE: Please check your scripts and restore files to make sure that you
	now use OPC instead of MPC.

    I.  GFS Marine MOS data added to NWX (OPC)

        The GFS-based marine MOS data has been added to NWX as data type
        "MARINE MOS" under the "MOS" category.

    J.  Fosberg and Haines Fire Weather Indices (SPC)

	The Fosberg Index and the Haines Index may now be computed for observed
	data.

	The Fosberg index (FOSB) may be used in SFPARM in the surface data
	programs. FOSB is computed from the surface temperature, relative
	humidity and wind speed and gives an index for the Flame Length and Fuel
	Drying.

	There are 3 Haines Indices: LHAN, MHAN and HHAN. These stability indices
	are used in the GEMPAK parameter STNDEX in the upper air data programs.
	The Haines indices are simple measures of the chance that an existing
	fire will become a dangerous, erratic fire. LHAN is for the low level
	Haines index and is a layer between 950-850 mb. MHAN is the mid level
	index value and is for the layer 850-700 mb. Finally, HHAN is the high
	level index for 700-500 mb.

    K.  Increase number of items in GDPLOT2 program parameters (SPC)

	The number of functions and plotting attributes, separated by an
	exclamation point (!), has been increased from 10 to 20. This will allow
	up to 20 fields to be overlaid in one execution of GDPLOT2.

    L.  10-bit Imagery Calibration Improvement (TPC)

        The 10-bit imagery calibration has been improved by applying a
        higher-ordered polynomial to increase precision of 10-bit imagery
	to within 0.001 degrees K.  This calibration is used by the NODT and
	cloud height functions.

V.  Bug Corrections 

    A.  Bounds (ALL)

        Corrected a problem with the NMAP/NMAP2 locator which could incorrectly
	calculate a bound area if the display projection was cylindrical and
	the bound area circled the globe.

    B.  CLIPVGF (ALL)

	Corrected a problem with the CLIPVGF program when a polygon had only
	one point on one side of the clip boundary.

    C.  NMAP/NMAP2 locator (ALL)

	Re-engineered locator code to allow any number of entries in the
	table "locator.tbl".

    D.  NMAP2 Hot Keys After Zoom (ALL)

	Corrected the problem where the hot keys did not work unless the mouse
	was clicked after selecting the "Zoom" or "Unzoom" buttons. 

    E.  Correct SFCHCK to work with "Ship" format files (AWC)

    	SFCHCK was originally written to work with regular surface files, which
    	can only have 4800 stations per file. "Ship" format surface files, which
    	are used for ship, aircraft and other types of data, can have up to 4999
    	reports. Therefore, SFCHCK was corrected to allow for up to 4999 stations
    	or reports. 

    F.	Fix display of TAFs in NWX (AWC)

	NWX had a problem where the latest TAFs could not be displayed between
	23Z of the current day and 00Z of the following day. During this
	one-hour period, TAFs that were issued in this period could not be
	found and displayed. This problem has been corrected.

    G.  Site Radar Selection Failure After 50 Successive Selections (AWC)
	
	Corrected a problem detected by the AWC where NMAP2 would crash 
        after 50 combinations of clicking "New Source" and "Clear Source"
	in the "Data Selection Window".  Note that a more efficient way
	to change data source is to click on the "Modify Source" button. 

    H.  Fix watch decoder DCWTCH (SPC)

        Increased the size of a character string in DCWTCH to allow watch status
        lines with many points to be decoded properly.

    I.  Fix hurricane graphics programs for non-TPC issuance (TPC,HPC)

        Hurricane graphics programs GPKGRF and GPTPC were generalized to handle
        intervening text appearing between the storm identifier and the local
        time string in a forecast/advisory message, e.g., "ISSUED BY THE
        HYDROMETEOROLOGICAL PREDICTION CENTER CAMP SPRINGS MD".

    J.  Inherit Map Attributes with Satellite Images in Native Projections
        (TPC, SPC)

	Corrected the problem where NMAP2 was not properly handling the
	inheritance of map attributes from one loop to another for 
	satellite images in their native projections.

VI. Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

VII. Map and Table File Updates

    The following summarizes significant table changes.  See 
    $NAWIPS/versions/tables.log and nawips.log for a complete list of all 
    table and map file changes. 

    A.  Update GRIB-to-GEMPAK parameter tables (ALL)

	The GRIB format allows for different versions of the parameter table.
	Version 3 of the table was the last update. Recently, NCEP has added
	versions 129 and 130 for local and specialized parameters. Therefore 
        tables for versions 129 and 130 have been added for use in NAGRIB and 
        GDGRIB.

    B.  Updated International Sigmet Station Table (AWC)

	Sixteen reporting stations have been added to the international
	Sigmet station table $GEMTBL/stns/intlsig.tbl.

    C.  Updated Volcano Station Table (AWC, AR)

	The table $GEMTBL/stns/volcano.tbl has been updated to include all
	volcanos that have been active since 1900.  In addition, two new 
	columns have been added to the table.  Column 1 (labeled "station ID") 
        contains the official Smithsonian number such as "1401-09" for 
        Popocatepetl.  Column 10 contains the geographic location of the 
        volcano such as "Mexico".

    D.  Split HPC and TPC SSA Bounds Areas (OPC)

	Four new regions were added to the SSA bounds files to split the 
	HPC and TPC areas at the request of the OPC.  The new areas
	are HPC050W, HPC050E, TPC215W and TPC215E.  Corresponding VGF and
	map files have also been created.

    E.  METAR Station Table Updates (SPC, ALL)

	Added 13 new stations to the METAR surface station table 
	$GEMTBL/stns/sfstns.tbl at the request of the SPC.  Also corrected 
        the longitude for Montreal (WPQ), Canada.

    F.  Updated Default Color Settings for Watch Product Displays (SPC)

	Changes made by the SPC to the default colors for various watch 
        products, e.g., WOU, were added to the table $GEMTBL/config/miscset. 

    G.  Fire Zone Maps and Bounds (SPC)

	Created fire zone map files, $GEMPAK/maps/*fzus.nws and updated 
	the fire zone bounds files.

    H.  Updated Watch County Cluster File (SPC)

	Added changes made by the SPC to the file $GEMTBL/stns/countyclust.tbl 
	to add independent city, Bristol, VA, to be clustered with
        Washington County, VA.

    I.  NWX Table Updates for Daily and Monthly Climatology Reports (SPC)

	The daily and monthly climatology station tables were updated to
	reflect corrections submitted by the SPC.	

    J.  Update to AWIPS Product ID Table (SPC)

	The AWIPS product ID table $GEMTBL/pgen/awdef.tbl was updated for 
	the SPC day 3 product.

VIII.   Calling Sequence Changes

    A.  Added time zone to $GEMPAK/source/cgemlib/css/cssdate.c 

        Added the return of the system time zone to css_date. This was
        done in support of text product improvements.

    B.	$GEMPAK/source/contrib/hpc/gdgrib/gdgogf.f

    C.  $GEMPAK/source/bridge/wo/wosgmt.f

    D.	$GEMPAK/source/gemlib/gg/ggwwcr.f

    E.	$GEMPAK/source/gemlib/gh/ghkglb.f, ghkglp.f

    F.	$GEMPAK/source/gemlib/gg/ggwact.f, ggwwtp.f

    G.	$GEMPAK/source/cgemlib/cgr/cgrdang.c

    H.	$GEMPAK/source/programs/gd/grphgd/ggsort.c, gindex.f, gindx1.f

    I.	$GEMPAK/source/bridge/is/isarea.f

    J.  Format change for station information output string functions 

        The station information output string returned by subroutines
        clo_finddesc, clo_findstn and clo_findmatch now uses the <TAG>value
        format.  GEMPAK routines which call these subroutines were modified as
        needed.  These routines are located in $GEMPAK/source/cgemlib/clo.

See the nawips.log and changes.log for additional details concerning
these routines.

IX.    Configuration Changes

    A.	Eliminated $NAWIPS/include Directory (ALL)

	***** Site Administrators Important Please Note *****

	The directory pointed to by the environmental variable NAWIPS_INC,
	$NAWIPS/include, was removed.  The environment variable has been 
	removed from the .cshrc file.  (A sample file is included as
	.cshrc_5.6.m) All references to this environmental variable in compile
	and link scripts have been removed.  The two files, Nxm.h and NxmTxt.h
	that used to reside in this directory have been moved to $GEMINC to
	put all global .h files in one directory. 

	IMPORTANT NOTE:  Any local compile or link scripts containing the
	environment variable NAWIPS_INC must remove all references to it.


*****************************************************************************


The necessary compiling and linking instructions are contained in
the following file:

     release_build_5.6.m 

To execute the script and save its output in a file type:

     cd $GEMPAK/build
     release_build_5.6.m >&! RELEASE_$NA_OS & ; tail -f RELEASE_$NA_OS

The output of the script will be written to RELEASE_$NA_OS.

Note that the build script removes files that have been eliminated in
this version.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each release always appears
in the file: $NAWIPS/versions/remove.log.
