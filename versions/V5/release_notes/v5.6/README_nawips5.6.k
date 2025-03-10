               N-AWIPS 5.6.k Release Notes
                    3/21/03


Patch 5.6.K covers development from December 10, 2002 to March 21, 2003.  

******************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 

	1. Mid-Level Cloud Text Box Added (AWC)

	   A new object has been added to create the Mid-Level Cloud (MLC) text 
	   box required for mid-level significant weather chart production.  
	   The filled box includes the cloud type, cloud amount, turbulence 
           symbol with top and base altitude, icing symbol with top and base 
           altitude, and the thunderstorm coverage with top and base altitude.  
           A two column box is created with appropriate symbology and text.

	   The MLC object appears under the "Text" class.  Click the 
	   "Mid Level Cloud" object icon to invoke the "Text Attributes" GUI.
	   This GUI selects the MLC elements and attributes. Cloud types and
	   amount are selected by clicking on the desired check boxes.  The
	   cloud type and amount ordering that appears in the GUI and that is 
	   plotted in the resultant text box is specified in the table:
	   $GEMTBL/pgen/mcloud.tbl.  The turbulence type and icing type symbols
           are selected from corresponding pop ups.  Their top and base 
	   altitudes are entered in the corresponding text boxes separated
	   with a slash.  These altitudes are parsed using the same rules
	   as those associated with turbulence and cloud level text types 
           plotted on the high level significant weather charts.  For example
	   if the string "300/" is entered, the text is plotted as "300" 
           directly over the "XXX" string.  The MLC text attributes including
	   size, font, style, justification and color are also specified in the
	   GUI in a similar fashion as other text types.

	   After the MLC elements and attributes are selected, the MLC text box
	   is placed by moving the cursor to the desired position on the
	   screen.  A ghost box is drawn to indicate the size of the drawn
	   box for placement guidance.  Click the left mouse button to place
	   the MLC box.  The MLC text object can be moved, edited, etc., like
	   other objects.  The table $GEMTBL/pgen/setting.tbl specifies the
	   default attributes for the MLC text object.  Its attributes are 
	   listed in the sub-type 15 entry for the SPTX_ELM text type.  

	2. Watch County Marker Attributes Added to Watch Generation (SPC)

	   The county marker type, size and width can now be selected when
	   drawing a watch in product generation.  These plotting attributes
	   are specified in the "Watch Attributes" GUI.  

	   The marker attributes have been added to the watch element in
	   this version.  However, the software is backwards compatible, i.e.,
	   watches from previous versions are properly read and processed.

	   ***** Important, Please Note *****

	   The default values for the marker attributes are set in the table 
	   $GEMTBL/pgen/setting.tbl in the "CLASS_WATCHES" entries.  The 
	   columns MRKTYP, MRKSIZ and MRKWID have been added to the watch
	   entries to specify the marker attribute defaults.  These columns
	   MUST be included in setting.tbl to ensure that the proper defaults
	   are obtained in product generation for the watch markers. 
	
	3. Line Labeling and Group Types in LPFs (SPC) 

           A new option has been added to allow line labeling to use the
	   group type specified in the Layer Product File (LPF) for the
	   active layer.  For example, suppose a LPF is loaded containing
	   group type hailotlk, tornotlk, and windotlk for layers one, two
	   and three, respectively.  If layer one is active and a line
	   is drawn or selected, then the default group type is hailotlk.
	   If the active layer is switched to layer two, then the default
	   group type is changed to tornotlk for subsequent line labeling.

	   To set this option, add the string "/LAYER" to the "GRP" column
	   in the table $GEMTBL/pgen/setting.tbl for line objects where
	   this new feature is desired.  The default group type for
           a line object will continue to be the value specified in the 
           setting.tbl as with previous N-AWIPS versions unless a LPF is opened. 
           If a LPF is opened, and the active layer specifies a valid group
	   type, then its value will be used instead of the value in the
	   setting.tbl.  

	4. Open/Save VGF Performance Improvements  (TPC)

	   The "OPEN" and "SAVE" actions were modified to improve their
	   performance.  These operations now run faster than previous
           versions of N-AWIPS, particularly on HPUX11 platforms.

    B.  Product Generation Pre/Post-Processing Programs
     
	1. QPF Product Modifications (HPC)

	   Duplicate points have been removed from the QPF text product
	   generated by NMAP at the request of the HPC.

	2. Excessive Rainfall Product Modification (HPC)

	   The product header has been removed from the excessive rainfall
	   product at the request of the HPC.

	3. Graph-To-Grid Improvements (OPC, TPC) 

	   Two new capabilities have been added to the graph-to-grid 
           functionality:

           A BOUNDS parameter has been added to specify a bounded geographical 
           area where graph-to-grid analysis is limited.  For example, this 
           capability could be used to perform an analysis strictly over land 
           areas.  See the help file $GEMHLP/bounds.hl2 for additional details.

	   Also added the capability for the user to graphically specify a 
           limiting minima or maxima within an innermost closed contour. This 
           function is accomplished using a labeled symbol where the label is 
           the numeric limiting value.

	   See the help file $GEMHLP/grphgd.hlp for complete Graph-to-Grid 
           information.

	4. New Forecast Area Boundary added for Pacific Region (PR, SSA)

	   A new forecast boundary area was added to the Seamless Surface
	   Analysis (SSA) bounds file at the request of the Pacific Region.  
           The new area is called PR2.  In addition, a PR2 map file and VGF have
	   been created.

	5. Initial WOU Encoder Improvements (SPC/Watch By County (WBC) )

	   The string ''...TEST' has been added to the watch number header line
           for the initial WOU text product generated from NMAP.  Currently, 
           all initial WOUs generated from NMAP product generation are formatted 
           as test watches. 

	   The string "REMAINS" was replace with "IS" following the watch
	   number in the text product. 

	   The duplicate county problem has been corrected.  This problem 
           occurred in one of the WOUs generated for the March 14th, 2003 
           test.  This error happened when counties were added to the watch 
           using the Add/Delete feature in the "Watch Specifications and 
           County List" GUI.  The problem was also corrected for the SEV 
           product.     

	6. New Program (WOUPDT) to Collect WCNs and Create WOU Updates (SPC/WBC)

	   A new program, WOUPDT, collects WCNs and uses the most recent WOU
	   to create an updated WOU text product required for the Watch By
	   County (WBC) program.  The program reads the most recently 
	   decoded WCN files and creates a list of active counties for a 
	   given watch number.  If a WFO does not send a WCN for a watch,
	   then that WFO's county information is taken from the latest WOU.
           Once all of the active counties have been found, the county
           list is formatted into a WOU text file which can be disseminated.
	   Currently, this program formats a WOU as a test watch.

	   To run the program type woupdt followed by desired date and time
	   given in GEMPAK format which is YYMMDD/HHNN in GMT.  If no date and
	   time is input, then the program uses the system clock time.  The
	   WOU output file name is "####_YYYYMMDDHHNN.wou", where #### is the
	   watch number, YYYY is the year, MM is the month, DD is the day,
	   HH is the hour and NN is the minute.

	   To get help for the program, type "woupdt -h" which displays the 
           file $GEMHLP/woupdt.hlp.  In addition to information on how to run
	   the program, this help contains the rules for how the program
	   uses the various time strings that are in the decoded WCNs.  In
	   addition, the help file $GEMHLP/dcwcn.hlp describes the rules
	   for how the times encoded in the WCN are decoded.

	7. MDP Improvements (SPC)      

	   The MDP program which creates the mesoscale discussion 
	   text product has been improved.  First, the program now only 
           generates the product for scallop lines.  It will generate the 
           product for the first scallop line it finds in the VGF.  In 
           addition, if a WFO or State list element is associated with the 
           scallop line, then the program adds the WFO and states IDs to 
	   the output text product.  

	   The following steps are necessary in NMAP product generation to
	   create the product with WFOs and state IDs.  Select the scallop
	   line type and label it using the "MESO_DSC" group type.  Then
	   click the "List" class and select the "WFO" or "State" object.
	   Click the drawn scallop line and the wfos or states will be 
	   associated with that object. 
       
        8. Hurricane Graphics Improvements for 2003 Season (TPC)

	   Program GPKGRF, the Kelly graphic, can now produce either 3 or 
           5 day plots.  The default is a 5 day plot, with the track for 
	   days 4 and 5 shown as a dashed line and the potential track area 
           for days 4 and 5 shaded with a dashed diagonal line fill.  Input 
           can be either a 3 day or a 5 day forecast.  If a 5 day forecast is 
	   input, a 3 day plot can be produced by specifying 3 as the fourth 
	   field of the GEMPAK parameter STRMID (see help for STRMID).

	   The hurricane decoder DCHRCN can handle either 3 or 5 day forecast
	   bulletins, and will display (in GPMAP or NMAP2) as many forecast 
           points as it decodes.

	   The tropical cyclone marine graphic (danger area) has been 
           modified to remove the "EXPERIMENTAL" label and to plot the Low 
	   (with x) special symbol for all track points of a subtropical 
	   system.

II.  NMAP2 Display Improvements 

    A.  Winter Weather Storm Display Hierarchy (HPC)

	The plot order for winter weather storm display (WSTM) is now
	based on message type.  Winter storm warnings now overplot watches,
        which in turn overplot advisories. 

    B.  WOU and WCN Display Added (SPC/WBC)

	The Watch By County (WBC) products, Watch Outline Updates (WOUs) and 
        Watch County Notification (WCNs) can now be displayed in NMAP2 and 
	GPMAP.  These data types are displayed using the decoded report 
	data sets.

	In NMAP2, these data types are listed under "MISC" category in the
	"Data Source" window.  They are plotted in a similar fashion as
	warnings.  Markers or county outlines can be used to depict active
	WOUs and WCNs.  Test watches are depicted as open markers or county
	outlines.  Regular watches can be depicted as filled markers
	as well as county outlines.  Click the "Edit Source" button in the 
        "Data Selection Window" to specify the plotting attributes including 
        marker symbol, color and size in the "WCN/WOU Attributes" GUI.  The 
	expiration time, county name or watch number can also be plotted. 

	The WOU and WCN displays can also be color coded based on the last 
	digit of the watch number.  This feature can be used to distinguish 
	watches that are occurring at the same time.  Click the "Color Code"
	check box in the "WCN/WOU" GUI to color code by watch number.  Click
	each watch number check box in the GUI to plot watches that end
	in that digit.  Click the associated color square to specify the
	desired plotting color.  The GUI also allows the selection of
	a different marker type to distinguish watches.

	The table $GEMTBL/config/miscset.tbl specifies the default plotting
        attributes for WOUs and WCNs.  Default marker attributes are specified
	for Thunderstorm and Tornado watch types.  In addition, default
	attributes for each watch number ending digit (0-9) are also listed
	if watch number color coding is active.  The "Color Code" FLAG 
	specifies whether watch number color coding is turned on (set to "1") 
	or off (set to "0") by default. 

	Two new parameters, WOU and WCN have been added to GPMAP to allow
        plotting of WOUs and WCNs, respectively.  Each of these parameters
        specifies the ending valid watch time and plotting attributes.
        See the GEMPAK help on WOU and WCN for additional details.

    C.  Added Option to Eliminate SPF Confirmation Window (SPC)

 	An option was added to eliminate the appearance of the "Restore
	Confirmation" GUI when restoring Stored Procedure Files (SPFs).
	The GUI sometimes adversely affects performance, especially when
	restoring SPFs with model data.  The option to control whether
	the restore confirmation window appears is specified in the table
	$GEMTBL/config/prefs.tbl.  A new entry, "RESTORE_POPUP" has been 
	added to the table. The value of false and true correspond to the window
	not appearing and appearing, respectively.  If there is no entry,
	the window does not appear.

    D.	Added Option to Plot Surface Level for Upper-Air Data (TPC)

	The surface level can now be plotted for upper-air and upper-air 
	forecast data types.

	Click the "Edit Source" button on the "Data Selection Window" GUI
	to invoke the "UAIR Parm Edit" GUI.  Click the "Sfc" check box
	to plot the surface level reports for the upper-air data.

    E.	Hurricane Break Points Added to Locator and Seek Functions (TPC)

	The hurricane break points locations have been added to the locator
	and seek functions.  The break points appear as "TROPCY_BRKS" in the
	locator and seek function pop-ups.  The table 
	$GEMTBL/stns/nhcbreaks.tbl contains the break point locations which
	have been updated for the 2003 season.

III. Decoder Improvements

    A.	PIREP Decoder Improvements (AWC)

	Several missing navaids locations were added to the PIREP station table
	$GEMTBL/stns/pirep_navaids.tbl.  In addition, the maximum number of
	reports in a ship type file used by the DCACFT (aircraft) and 
	DCMSFC (marine) decoders has been increased from 3399 to 4999. 

    B.	Winter Storm Decoder Improvements (HPC)
	
	The winter storm decoder, DCWSTM, was improved to properly handle
	double headlines and blank zone strings.

    C.  WOU Decoder Improvements (SPC) 

        Several corrections have been made to the WOU decoder as the result of
	field tests and internal CDB testing.

    D.  WCN Decoder Improvements (SPC)

	Numerous improvements and corrections have been made to the WCN decoder
	as the result of field tests and internal CDB testing. 

IV.  General Improvements

    A.  GEMPAK Grid Access Improvements for Large Grids (ALL)

    	New capabilities have been added to GEMPAK grid programs
	in support of accessing large grids including the National Digital
	Forecast Data Base (NDFD) 5 KM grids.

	The maximum grid size that can be stored in a GEMPAK file may now
	be larger than the maximum number of grid points used for calculation
	and display purposes which is 275,000, (LLMXGD).  A new parameter,
	LLMXTG, specifies the maximum number of grid points that can be
	stored.  It is currently set to 750,000 grid points for all platforms
	except AIX.  Please see the note below for more information regarding
	LLMXTG.

        To access grid files with grids larger than 275,000 grid points, the 
        grid must be subset to not exceed LLMXGD grid points.  The subset can be
	specified using an area (GAREA) or by specifying points using a new 
        GEMPAK parameter IJSKIP.  

        The IJSKIP parameter specifies the number of points to skip in each 
        direction and/or the beginning and ending grid point number in each 
        direction.  In addition, if the parameter is set to "YES", then it 
        will automatically calculate the optimum skip factors to display the 
        maximum number of grid points for the geographic region defined by 
        the GAREA parameter.  See the GEMPAK help on IJSKIP for additional 
        details.

	**** N-AWIPS Administrators Important Please Note *****

	The LLMXTG parameter is set in the file $GEMINC/MCHPRM.xxx, where 
        xxx is the operating system name.  As indicated above, it has been set 
        to 750,000 grid points on all supported platforms except AIX where it
	has been set to 275,000.  We reduced its size on AIX because we found
	that our AIX workstation ran out of memory when running NMAP2.  This
	problem is probably due to the age and lack of system resources on
	our AIX workstation.  None of our other platforms (HP, IRIX, Sun, and
	Linux) has any problems supporting 750,000 grid points.  If sites
	do run into memory problems, please report them to the CDB.  If sites
	do not need access to grids greater than 275,000, we recommend they
	reduce LLMXTG to LLMXGD before compiling the system.  

    B.  New Fill Patterns Added to GEMPAK and NMAP (AR)

	Four new fill patterns have been added to the GEMPAK device drivers
	and NMAP product generation.  The new fill patterns are dotted,
	zig-zag, and two additional diagonal line patterns with smaller spacing
	than the existing diagonal pattern.  

	The four new patterns appear below the previous three in the NMAP
	product generation "Fill_pattern" pop up.  For GEMPAK programs, the
	parameter FLINE specifies the fill pattern.  See the GEMPAK help on 
	FLINE for additional details. 

    C.  NSHARP Profiles from NMAP2 Cursor Point File (AWC)

	A new option has been added to NSHARP to generate sounding profiles
	from reading a location saved from a NMAP/NMAP2 cursor point 
        file (CPF).  

	The NMAP cursor position is saved to a CPF by using the Seek function.
	Click the "Save CPF" button to save the most recently written cursor
	position to the CPF.  Any of the methods available in the Seek function
	can be used to write and subsequently save the cursor position to the 
	CPF.  For example, to save a cursor selected location to a CPF, click the
	"Click Point" button.  Then move the cursor to the desired location
	and click the left mouse button.  Click the "Save CPF" button to save
	this location to the CPF.  The function automatically creates the CPF
        (called nmap2.cpf) in the local directory.  The CPF contains one
	latitude and longitude that is overwritten each time the "Save CPF"
	button is clicked. 

	The CPF is automatically read by the NSHARP program each time a data
	set is selected.  Its location is plotted as a yellow x in the map 
	window for observed, PFC and ACARS data types.  Click on the yellow 
	x marker to plot the sounding corresponding to the location in the 
	CPF.  For the model sounding data type, click the "CPF" radio button 
	to use the location from the CPF to generate the sounding.

    D.  NWX Decoded TAF Display Improvement (AWC)

	NWX now displays the most recent decoded TAF found for the selected
	station(s).  Previously, only TAFS that fell within the "Time Covered"
	hour specified in the "Data Selection" GUI were listed.  Note that
	in addition to NWX, the TAF decoder, DCTAF, was modified to support
	this change.  Therefore, data sets decoded from the 5.6.k version
	of DCTAF MUST be in the data base. 

    E.  New Grid Diagnostic Functions (HPC)

	Two new grid diagnostics have been written in collaboration with
	the HPC.

	The first new diagnostic is a vector function (DSUB), that computes the 
	north relative direction difference between two vectors.  The second 
	new diagnostic is a scalar function (PAUB), that combines 
	probabilities.  This diagnostic can be used to combine 12 hour 
	probabilities of precipitation.

    F.  Heat Index Calculation Improvements (HPC)

	The heat index calculation was corrected for discontinuities that
	occurred around 77 degrees.  

V.  Bug Corrections 

    A.  Roam Hot Keys Problem on Linux (ALL)

	Corrected the problem where the roam hot keys (key pad arrow
	keys) did not work on Linux platforms with RedHat version 7.3.

    B.	GIF Device Driver Problem (AWC)

	Corrected the GIF device driver problem where the output GIF image
	size was incorrect when the driver was invoked more than once
	from a GEMPAK program.

    C.	NMAP2 Fatal Problems on AWIPS Linux Platforms (AWIPS)

	Fatal errors on AWIPS Linux platforms found by the AWIPS Program Office 
	testing have been corrected.  The fatal error loading 1/4 KM radar
	imagery has been fixed.  Also, the fatal error associated with empty
	radar and satellite directories has been corrected.  This error
	also occurred on 24-bit platforms if NMAP2 was run without invoking
	NTL.

    D.  Button Press Response Problem (HPC)

	Corrected a problem introduced in version 5.6.j where product 
	generation buttons did not activate when the mouse button was
	pressed.  This problem occurred when the cursor was moved off of the 
	product generation button before releasing the mouse button.

    E.  GDCROSS Problem With Central Longitudes (EMC)
	
	Corrected a problem detected by the EMC where GDCROSS did not properly
	plot a cross-section along the central longitude of a high resolution
        grid.

    F.	Corrected Time-Matching of Analysis Grids (SPC)

	The NMAP2 time matching function has been corrected to allow analysis
	grids to properly match imagery as it auto-updates.

    G.  Outlook Product Problem with Layers (SPC)

	Corrected the problem in NMAP/NMAP2 product generation where 
	the outlook product generation action did not take into account
	layers.  The action now properly produces the text product for the 
	active layer. 

    H.	SPF Restore Problem with Miscellaneous Data Types (SPC)

	Corrected the problem in restoring a Stored Procedure File (SPF)
	when a SPF containing miscellaneous data types is restored multiple 
	times.

    I.  Roam Control Box Popping and Closing Behavior (SPC, ALL) 

	The "Roam Control" GUI no longer re-pops up after an auto-update if
	it has been closed by the user.  In addition, it does not re-pop
	after switching back to a loop where it has been closed by the user. 

    J.	Corrected Display of 10-bit GOES Imagery (TPC)

	The display of 10-bit GVAR imagery has been corrected.  This data
	type is now properly displayed in GEMPAK and NMAP/NMAP2 programs.
	In addition, the temperature retrieval in the NMAP cloud height function
	now works properly for 10-bit imagery.

    K.  Compile errors using SunOS 7.0 and Linux gcc 3.2 Compilers (Unidata)

	Corrected compile errors that occur on some versions of Sun and Linux 
	compilers.  Earlier versions of these compilers only generated 
        warnings. 

VI. Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Upper-air Forecast Data Set Problem with SPFs (ALL)

	Upper-air forecast data set attributes are not properly saved
	to the Stored Procedure Files (SPFs).

    C.  Significant Weather Chart BUFR Message Encoder Problems (AWC)

        Several problems have been detected in the generation of BUFR
        messages from high-level significant weather charts.  Most
        of the problems are associated with the jets at locations that
        cross the international date line or zero degrees longitude.
        These problems will be addressed as soon as possible.  Out of cycle
        releases of the BUFR programs are anticipated to correct these
        problems.

    D.  Temporary Grid Naming Problem  (Unidata)

        The capability to name grid diagnostics in the GEMPAK parameters
        GFUNC and GVECT does not work.  This capability, specified by using
        the "//" characters, should allow a computed grid to be named for later
        use in a diagnostic function in a grid program.

    E.  Inherit Map Attributes for Un-Remapped Images (SPC, TPC)

    	The "Apply Settings" and "Get Settings" functions do not work
        properly for satellite images that are in their native projections.

    F.  TAV and TDF Grid Diagnostic Function Errors (ALL) 

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

VII. Map and Table File Updates

    The following summarizes significant table changes.  See 
    $NAWIPS/versions/tables.log and nawips.log for a complete list of all 
    table and map file changes. 

    A.  Prefs.tbl Update (ALL)

	A new flag, RESTORE_POPUP, has been added to the 
        $GEMTBl/config/prefs.tbl.  This flag controls whether the SPF 
	"Restore Confirmation Window" is invoked.  If the entry is 
	not included in the table or if it is set to FALSE, then
	the window does not pop up.

    B.  Updated International Sigmet Station Table (AWC) 

	Eight reporting stations have been added to the international
	Sigmet station table $GEMTBL/stns/intlsig.tbl.  They include
	six Russian stations and Taipei, Taiwan and Melborne, Australia.	
     
    C.  Setting.tbl Updates (AWC, SPC)

	Two changes have been made to the $GEMTBL/pgen/setting.tbl.

	A new text object, SPTX, sub-type number 15 was added to specify the
	default attributes for the mid-level cloud text box.

	New columns, MRKTYP, MRKSIZ and MRKWID, have been add to the 
        CLASS_WATCHES entries to specify the default marker attributes
	for watches drawn in product generation.  These columns MUST be in the
	table to properly set the defaults.

    D.  Geog.tbl Updates (AWC, HPC)

	Two changes have been made to the $GEMTBL/stns/geog.tbl.

	Several ICAO areas used by the AWC have been added.  Also,
	the Alaskan QPF area has been added.

    E.  Miscset.tbl and Datatype.tbl  (SPC)

	The tables $GEMTBL/config/miscset.tbl and $GEMTBL/config/datatyp.tbl
	have been modified to add the WCN and WOU entries.  The miscset.tbl
	table specifies the default display attributes.  The datatype.tbl
	defines the WCN and WOU data set locations and file name templates.

    F.  Clo.tbl and Locator.tbl Updates for Hurricane Break Points (TPC)

	The tables, $GEMTBL/config/clo.tbl and $GEMTBL/nmap/locator.tbl
	have been modified so that the hurricane break points can be
	accessed by the NMAP2 locator and seek functions.

    G.  Imgtyp.tbl (TPC)

	The table $GEMTBL/sat/imgtyp.tbl has been modified to support the 
	proper display of two-byte satellite imagery.

VIII.   Calling Sequence Changes

    A.  **** Developers, Important, Please Note ******
	 
	The SUBA area in DGCMN.CMN has been eliminated as part of the
	grid diagnostic re-engineering effort.  In addition, the subset
	flag array, SUBFLG,  has been removed from the calling sequence of
        PD library routines given below.  See delivery 22-a32 in the 
        nawips.log for additional details.

	$GEMPAK/source/gemlib/pd/pdctot.f, pddden.f, pddrct.f, pddwpt.f,
                        pdheat.f, pdinmm.f, pdkinx.f, pdknms.f, pdmixr.f,
                        pdmmin.f, pdmskn.f, pdprcp.f, pdprcr.f, pdrelh.f,
                        pdrhdp.f, pdsduv.f, pdshmr.f, pdsped.f, pdswet.f,
                        pdthta.f, pdthte.f, pdthwc.f, pdtmcf.f, pdtmck.f,
                        pdtmfc.f, pdtmfk.f, pdtmkc.f, pdtmkf.f, pdtmpk.f,
                        pdtmst.f, pdtmwb.f, pdtotl.f, pdtvrk.f, pduvsd.f,
                        pdvpmr.f, pdvtot.f

    B.  A new parameter IJSKIP has been added to the GEMPAK grid programs
	to allow grid sub-setting by skipping grid points.  See Section
	IV A. for additional details.
 
	$GEMPAK/source/gemlib/dg/dgcxgp.f, dgsubg.f
        $GEMPAK/source/programs/gd/gdcntr/gdninp.f
	$GEMPAK/source/programs/gd/gdcross/gdxinp.f
	$GEMPAK/source/programs/gd/gdmap/gdminp.f
	$GEMPAK/source/programs/gd/gdplot/gdbinp.f
	$GEMPAK/source/programs/gd/gdplot2/gdbinp.f
	$GEMPAK/source/programs/gd/gdstream/gdsinp.f
	$GEMPAK/source/programs/gd/gdwind/gdwinp.f

    C.	$GEMPAK/source/cgemlib/cgr/cgrsegdist.c

    D.	$GEMPAK/source/programs/gd/grphgd/grginp.f

    E.	$GEMPAK/source/bridge/wc/wcdecd.f, wcout.f, wcghdr.f, wcvtec.f

    F.	$GEMPAK/source/bridge/ws/wsout.f, wssgmt.f

    G.	$GEMPAK/source/bridge/hc/hcdecd.f, hcfvld.f, hcout.f, hcghdr.f

    H.	$GEMPAK/source/bridge/wo/woout.f

    I.	$GEMPAK/source/gemlib/gh/ghrdbd.f, ghrdfv.f

    J.	$GEMPAK/source/gemlib/im/imbtot.f, imttob.f

    K.	$GEMPAK/source/gemlib/gg/ggmisc.f

    L. 	$GEMPAK/source/gemlib/gg/ggwwcr.f

See the nawips.log and changes.log for additional details concerning
these routines.


*****************************************************************************


The necessary compiling and linking instructions are contained in
the following file:

     patch_build_5.6.k 

To execute the script and save its output in a file type:

     cd $GEMPAK/build
     patch_build_5.6.k >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.
