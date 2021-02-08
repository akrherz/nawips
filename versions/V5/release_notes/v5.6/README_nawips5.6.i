			N-AWIPS 5.6.i Release Notes
				9/24/02

Patch 5.6.i covers development from June 20, to September 23, 2002.  


*****************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 

	1. Added New "Overline" Text Types (MPC, SSA)

	   Two new text types were added at the request of the MPC to distinguish
           forecast tracks from other text types for the Seamless Surface
           Analysis (SSA) project.  They are a line over text and a line over 
	   text with the background filled.  The new text types are available
	   along with the other text types in the "Box" popup on the 
	   "Text Attributes" GUI.

	   The default attributes for overline and overline filled are
	   specified in the table $GEMTBL/pgen/setting.tbl for text sub-types
	   13 and 14, respectively.

	2. Added Symbol Labeling of Lines (SPC)

	   Added new capability to label lines with a symbol while drawing
           the line.  This feature is similar to the function to label
           lines with text.  Any symbol, combination symbol or marker can be 
           used to label a line.  

	   The default attributes of the symbol associated with a group 
           may be specified using the $GEMTBL/grptyp.tbl table in a similar
	   fashion as the text attributes are specified.  See that table
           for additional details.

    B.  Product Generation Pre/Post-Processing Programs
	
	1. Significant Weather Chart BUFR Messages Programs Improved (AWC)

	   Several improvements were made to the programs that encode and
	   decode BUFR messages for the upper-level significant weather
	   chart products.  The SIGWXCNV program now checks groups and 
	   verifies that all required elements are in each group type.
           If there are extra elements or incorrect elements in a group,
	   then the program writes out warning messages.  The error checking
	   on SIGWXCNV command line inputs has also been improved.

	   The latitude/longitude is now added to the volcano text box when
	   decoding a BUFR message into a VGF.

	   Several segmentation faults and memory errors have been corrected
	   in the BUFR encode and decode programs in response to AWC and
	   internal CDB testing.

	2. Added CCFP Post-Processing Program (AWC)

	   A new program, CREATECCFP was written to create the CCFP text
	   product in the prescribed format for dissemination.  The program
           reads input VGFs associated with each CCFP forecast and outputs an 
           ASCII file.  Type createccfp to obtain help on the program for 
           additional information.

	3. WCL Format Changes in Support of Watch by County (WBC) (SPC)

	   The following changes were made to the Watch Coordination List
	   (WCL) product:

		a. Changed WMO header to "NWUS62.

		b. Added "ARE" string after "INDEPENDENT CITIES INCLUDED"
		   string.

		c. Eliminated unnecessary extra vertical and horizontal
		   spaces.
		
		d. Added UGC codes for each state.
		

	4. WOU Format Changes in support of WBC (SPC)

	   	a. WFO IDs were removed from the beginning of the WOU text 
                   message at the request of the SPC.
	
		b. Added "ARE" string after "INDEPENDENT CITIES INCLUDED"
                   string.

                c. Eliminated unnecessary extra vertical and horizontal
                   spaces.


	5. Hurricane Graphics Products Improvements (TPC, PR)

           Improvements and corrections to programs GPKGRF (watch/warning
           hurricane graphic) and GPTPC (four panel hurricane graphic) have
           been made in response to TPC requests.   These include the following:

		a. Hard coded conversion of 115 knots to 135 miles per hour 
                   (per international agreement) for the hurricane watch/warn 
                   graphic and the wind intensity chart.

		b. Corrected spelling of country Columbia to Colombia for 
                   watch/warn graphic.

		c. Correctly labeled "Subtropical" storms and depressions in 
                   the watch/warn graphic.

		d. Corrected a table value for Atlantic wind probability table 
                   which sometimes resulted in a total probability greater 
                   than 100% at 48 hours.

		e. Fixed a bug in hurricane decoder DCHRCN which caused an 
                   error in plotting of forecast track points near the 
                   dateline in the danger area graphic.

		f. Replaced the tropical depression symbol in the danger area 
                   graphic with a Low (with x) symbol.

	6. Clipvgf Improvements (TPC, SSA)

	   The Clipvgf program now takes into account text grouped with a 
           symbol.  The text grouped with a symbol will be clipped or kept 
           along with the symbol. 

II.  NMAP2 Display Improvements 
 
    A.  Added Convective SIGMET Display (AWC) 

        NMAP2 is now able to access and display convective SIGMETS. Convective
	SIGMETS are displayed by selecting the "CSIG" data type under the 
        "MISC" category in the "Data Source" GUI.  NMAP2 can plot the various
        types of convective SIGMETS, e.g., area, line, isolated, and the outlook
        area.  These types and other display attributes can be altered by 
        clicking on the "Edit Source" button in "Data Source" GUI, which
        invokes the "CSIG Attributes" GUI.  This GUI also allows the user
        to optionally plot the convective SIGMET Sequence ID, time, 
        direction/speed, flight level and intensity.  The default display
        attributes for convective SIGMETS are specified in the table
	$GEMTBL/config/miscset.tbl

    B.  Added TAF Display (AWC)

	Terminal Aerodrome Forecasts (TAFs) can now be displayed in NMAP2.
	They are accessed by selecting the "TAF" data type under the
	"SURF_FCST" category in the "Data Source" GUI.  The following pre-
	defined station plotting models are available:

		1. standard - prevailing sky cover color coded by flight 
                   conditions:
               		magenta - LIFR (low instrument flight rules)
                	red - IFR (instrument flight rules)
                    	blue - MVFR (marginal visual flight rules)

     		2. tempo_flt_cond - temporary flight conditions color coded 
                   as above

     		3. weather - prevailing weather conditions plotted as weather 
                   symbols

     		4. tempo_weather - temporary weather conditions plotted as
		   weather symbols

     		5. winds - prevailing wind conditions color coded by wind speed:
                    	green - less than 23 knots
                    	red - greater than or equal to 23 knots
     		6. gust_winds - prevailing wind gust conditions color coded by 
                   gust speed as above

	The pre-defined station plotting models are specified in the table
	$GEMTBL/config/prmlst.tbl.  Their attributes may be changed or new
	plotting models may be added by modifying the table.  See prmlst.tbl
	for additional information.

    C.  Added Sea Ice Drift Display (AR, EMC)

	Forecasts of sea ice drift can now be displayed in NMAP2.  The data
        are accessed under the "SURF_FCST" category in the "Data Source" GUI.
	Click the "IDFT" data type to get the available cycle times.  Two
	station models have been pre-defined for the sea ice drift. The 
        "standard" model plots the value of forecast drift in nautical miles 
        and the direction.  The "idft_vect" plots a directional arrow and the 
        distance.  Sites can specify additional plotting station models by 
        editing the table $GEMTBL/config/prmlst.tbl.  See that table for 
        additional information.  Display attributes can be interactively edited
        by clicking on the "Edit Source" button in the "Data Selection" GUI and
        invoking the "IDFT Station Model Edit" GUI.
	
    D.  Added Winter Weather Watch, Warning, and Advisory Display (HPC)

	Winter weather watches, warnings and advisories generated by the WFOs
        can now be displayed in NMAP2 under the miscellaneous category.  The 
        display consists of a color-coded marker located at the zone centroid, 
        with optional time and weather type labels.  Click the "WSTM" data
        type under the "MISC" category in the "Data Source" GUI to select
        the data.

    E.  Time Before Hour Option Added for Surface Data (HPC)

	An option has been added to allow surface data that comes in before
	the hour to be displayed in NMAP2.  A new table, 
        $GEMTBL/config/prefs.tbl has been added that allows the specification
        of the number of minutes before the top of the hour that data can be 
        displayed in NMAP2.  The number of minutes is specified by setting the 
        value for "SFC_MINUTES" in the table.  For example, if SFC_MINUTES is set
        to 15, then data that comes in up to 15 minutes before the top of the
        hour can be accessed and displayed in NMAP2 before the top of the hour
        occurs.  Previously, NMAP2 did not display any surface data associated
        with an hour until after that hour occurred.  If the value is not
        set in the table or is invalid, NMAP2 uses zero minutes as its default.
	If the value specified in the table exceeds 20 minutes, it is set
	to 20 minutes.

        The intent of the prefs.tbl is to specify miscellaneous NMAP2 defaults.
	Currently, only the SFC_MINUTES parameter can be specified in the table. 

    F.  Added RDF Display (HPC)

	Regional Digital Forecast (RDF) reports	can now be displayed in NMAP2.
	They are accessed by selecting the "RDF" data type under the
        "SURF_FCST" category in the "Data Source" GUI.	A standard station
	plotting model displays several parameters including temperature,
	relative humidity, dew point, wind barb, etc.  The table 
	$GEMTBL/config/prmlst.tbl can be modified to specify additional 
	pre-defined plotting models or alter the standard one.  See that table
	for additional information.

III. Decoder Improvements

    A.  Sea Ice Drift Decoder (AR, EMC)

        DCIDFT has been written to decode sea ice reports into a GEMPAK surface
        data file.  A new GEMPAK parameter, DTNM, specifies the sea ice drift
        in nautical miles.  Any GEMPAK surface program and NMAP2 can access
        the data.  The decoder is similar to other N-AWIPS decoders in that it
        assumes a data stream with WMO headers.

    B.  Convective SIGMET Decoder (AWC)

        DCCSIG has been written to decode convective SIGMETS and
        convective outlook reports to allow GPMAP and NMAP2 access to the
        data.  DCCSIG decodes the report into an ASCII text file which is 
        treated as a miscellaneous data type.  A new parameter, CSIG, has been 
        added to GPMAP to specify convective SIGMET display attributes for 
        that program. 

    C.  TAF Decoder (AWC)
	
        DCTAF has been written to decode TAF (terminal aerodrome forecast) 
        reports.  The decoder writes the output to a GEMPAK surface file.
	NMAP2 and GEMPAK surface programs can access the decoded data as a
	surface forecast type.

	Future work includes modifying the TAF decoder as needed for new
        U.S. TAF rules, and improving handling of international reports with
        overlapping temporary time periods. 

	****** IMPORTANT, DEVELOPERS PLEASE NOTE: ******

	Several decoder routines used by the DCTAF, DCMETR and DCSCD decoders 
        were moved to the new bridge library, br, to consolidate common 
        functions.  The DCMETR and DCSCD decoders were modified to call new br 
        routines.  Several mt routines have been removed.  See the remove.log 
        for a listing.

    D.  Winter Weather Watch, Warning and Advisory Decoder (HPC)

	DCWSTM has been written to decode winter weather watch, warning and
	advisory reports to allow GPMAP and NMAP2 access to the data.  DCWSTM
        decodes the report into an ASCII text file which is treated as a 
        miscellaneous data type.  A new parameter, WSTM, has been added to GPMAP
        to specify the winter weather watch/warning/advisory display 
        attributes. 

	The decoder has the following limitations:

		1. DCWTM is based on a small sample of bulletins.  Revisions 
		   will probably need to be made as more examples become 
                   available.   Error handling needs to be made more robust.

		2. The decoder does not now decode an expiration time, if one 
                   is given.  It uses the time at the end of the zone list as 
                   the expiration time.

		3. The decoder does not attempt to decode the type of weather 
		   (snow, freezing rain, etc.) given in the message.
	

    E.  RDF Decoder (HPC) 

	DCRDF has been written to decode the Regional Digital Forecast 
        reports into surface GEMPAK files.  This release decodes the following 
        parameters: POP 12hr, TEMP, DEWPT, RH, WIND SPD, WIND CHILL, HEAT 
        INDEX, WIND DIR, OBVIS and CLOUDS.  Parameters having range values 
        such as QPF 12HR, MAX QPF, SNOW 12HR, and MX/MN will be decoded in a 
        future release.  Also the precip parameters RAIN SHW, RAI, TSTMS, 
        DRIZZLE SNOW SHWRS, SNOW FLURIES, SLEET, FRZNG RAIN, and FRZNG DRZL 
        are not currently decoded.  Reports from Amarillo, TX are changing 
        their format and therefore not being handled in this delivery.

    F.  METAR Decoder Bug Correction (Unidata)

	Corrected a problem found in DCMETR where on occasion the decoder was 
        creating a bogus surface file using the literal template name, i.e.,
	"yyyymmdd.hrly".
 
IV.  General Improvements

    A.  GEMPAK Maximum Grid Size Increased to 275,000 Points (ALL)

	The maximum number of grid points in a GEMPAK grid file has
        been increased from 97,000 to 275,000 grid points.  This increase
	is the result of several improvements made to the internal grid
        management software.  These improvements are part of the ongoing
        multi-patch project to improve the grid processing.  

	This change allows N-AWIPS to perform calculations and display fields
	from the 12 km ETA on its entire domain.

	*******  IMPORTANT PLEASE NOTE.  ******* 

        The standard kernel values for HPUX11 stack size MUST be increased 
        to the following to account for the increased grid size:

		maxssiz =   134,217,728
		maxtsiz = 1,073,741,824
		maxdsiz = 1,073,741,824

	If these parameters are not increased, NMAP/NMAP2 core dumps at start
	up. 

	Other systems tested at the Computing Development Branch (CDB) - which 
        include HPUX10, LINUX, IRIX6, AIX4, SUNOS5 - did NOT require any kernel 
        changes.

	Please contact the CDB if you encounter any problems with NMAP/NMAP2
	start up.

    B.  24-Bit Graphics Capability Added to N-AWIPS (ALL)

        N-AWIPS has been modified to operate on workstations where 24-bit
        graphics is set as the default.  The XW device driver has been enhanced
        to allow the use of 24-bit TrueColor visual setting.   Necessary changes
        have also been made to N-AWIPS GUI programs.  N-AWIPS automatically
        determines whether it is running on a 24 or 8-bit graphics workstation
        by obtaining the workstation default pixel depth.  There are no user or
        system changes required to allow N-AWIPS to operate on 24-bit graphics
        workstations.

        Some N-AWIPS functions operate differently when running on 24-bit
        graphics workstations.  Changing an enhancement color table for images,
        (e.g., selecting a LUT in the NMAP/NMAP2 "Enh-list" GUI) requires a
        re-load of the image loop. Fading in NMAP and NMAP2 is not interactive,
        i.e., the image "brightness"  does not change until after the fader
        slider bar is let go by the user. At that point images are re-loaded.
        NCOLOR and the color editing in NTRANS do not work in 24-bit mode.

        Note that each 24-bit pixmap requires three times the memory of an 8-bit
        pixmap.  Thus, GUI applications such as NMAP/NMAP2 use three times the
        memory when running on 24-bit graphics workstations.

        N-AWIPS operation and functionality are not affected on workstations
        that have 8-bit graphics set as the default with the following
        exception.  To mitigate the required re-load of imagery when loading a
        color look-up table (LUT) for 24-bit graphics workstations,  satellite
        images now use the LUT name specified in the table
        $GEMTBL/sat/imgtyp.tbl as their default.  The LUT name is specified by
        channel, e.g., IR for each satellite in the table.  Previously, the 
        default LUT for satellite images was hard-coded to gray.

    C.  Hazardous Weather Outlooks Added to NWX (ALL)

	The hazardous weather outlook product (a new product to begin
	dissemination on October 1, 2002) has been added to NWX under the
	Public Products category.

    D.  Selection by State Added to NWX (AWC)

	NWX has been enhanced to allow data selection by state for all data
        categories.  This new feature allows all data for a particular state
        to be listed if any station in that state is selected.  For example
	all TAFS issued in the state of Wisconsin are listed if any station
	in that state is selected.

	The select by state option is activated by clicking on the "state" 
        radio button in the "Data Selection" GUI.  All stations in a state 
        are highlighted in the NWX map window when a station in the state
        is selected with a mouse click.

    E.  Individual TAFs Added to NWX (AWX)

	Individual TAF reports can now be displayed in NWX.  Click the 
	"TAFs decoded" item under the "Observed Data Category".  Each 
	TAF report is displayed as a marker in the NWX map window.  Click
	the desired marker to obtain the corresponding TAF report listing.

    F.  RDF Added to NWX (HPC)

	The Regional Digital Forecast text product has been added to NWX
	under the Public Products category. 

    G.  Line Point Reduction Algorithm Replaced (MPC, ALL) 
 
	The current point reduction algorithm used to reduce points in GEMPAK 
        generated contours has been replaced. A new Adaptive Sampling of 
        Parametric Curve (ASPC) algorithm is now used.  This change was made 
        to address the problem found by the MPC where contours with few points 
        and sharp turns would form erroneous "kinks" after point reduction and
        smoothing were applied.  The new algorithm reduces the number of 
        points on a line while maintaining the shape of the line.  

	The amount of point reduction is specified in the same manner as the
        old algorithm by using the FILT qualifier on the LINE parameter.   
        For smaller values of FILT, the output line will more closely match 
        the original line.  For larger values more points will be removed. 
        The amount of point reduction for a given FILT value should closely
        match the amount of point reduction performed by the old algorithm.
	Therefore, users should not have to modify the FILT value with the
	implementation of the new algorithm.

IV.   Bug Corrections 

    A.  Open LPF GUI Problem on Linux Platforms (AWC)

	Corrected the problem where the "Edit Name" and "Exit" buttons 
        disappeared when opening a second LPF file.  This problem only occurred 
        on Linux platforms.

    B.	VG Driver Performance Problem (AWC) 

	Corrected a problem in the VG driver that caused it to slow down
        considerably when numerous elements were written to a VGF one element 
	at a time. The slow down was only noticeable when hundreds of elements
	were written to a VGF.

    C.  Volcano Symbol Text Type Problem (AWC)

	Corrected the problem where the text type associated with the volcano
	symbol was not being remembered when the symbol was re-drawn. 

    D.  Group Action Problem with Selecting Objects (AWC)

	Corrected the problem where objects were improperly grouped
	if they were close to the cursor during selection.

    E.  International SIGMET Cancellation Handling (AWC, PR)
	
	Corrected the problem when two stations issue a SIGMET with
	the same message identifier.  In this case, if one of the SIGMETS
	was canceled the other was also erroneously canceled.

    F.  Medium Range Station Plotting Problem (HPC)

	Changed the default return string in PT_TPFC from a blank
        to "M/M/M" to address medium range desk processing problem
        with min/max/pop.

    G.  NWX Problems with Coded Cities and Selected Cities Products (HPC)

	Updated tables so that NWX properly separates the Coded Cities
	and Selected Cities products.

    H.  Outlook Problems (SPC)

	Corrected the problem with the general thunderstorm generation when
	there was only one grouped line.  Also corrected the DAT2PTS program
	to properly assign PM for times between 12:00 noon and 12:59 PM.

    I.  WCC GUI Problems (SPC)

	Corrected the problem where the phone number did not appear in the
	Watch Coordination Call (WCC) text product if the watch letter was
	changed in the GUI.  Also corrected the problem where the "Expiration 
        Time" widget did not change when the time selection was changed in 
        the "Watch Coordination" GUI. 

    J.  Mesoscale Discussion Points (MDP) Program Problem (SPC)

	Fixed the MDP program where longitudes > 99.995 and < 100.0 were
        incorrectly represented in the final text product.

V.   Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Graph-To-Grid Problem  (HPC)

	If the first entry in the table $GEMTBL/grphgd/grphgd.tbl is not 
	QPF, then NMAP/NMAP2 core dumps after clicking the Graph-to-Grid
	button in product generation.  This problem will be corrected in
	the next release.

    C.  Temporary Grid Naming Problem  (Unidata)

        The capability to name grid diagnostics in the GEMPAK parameters
        GFUNC and GVECT does not work.  This capability, specified by using
        the "//" characters, should allow a computed grid to be named for later
        use in a diagnostic function in a grid program.

    D.  Inherit Map Attributes for Un-Remapped Images (SPC, TPC)

	The "Apply Settings" and "Get Settings" functions do not work
        properly for satellite images that are in their native projections.

    E.  TAF Decoder Line Feed Problem on Linux (AWC)

	The TAF decoder does not properly save the line feed character into 
        the GEMPAK file if the decoder is running on a Linux platform.  Linux-
	decoded TAF reports will appear entirely on one line when displayed 
        in NWX as an "Observed Data" type.

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

VI. Map and Table File Updates
    
    (Note:  See $NAWIPS/versions/tables.log and nawips.log for a detailed
            list of all table and map file changes.  )

    A.  Datatype.tbl Table Changes 
	
	The table $GEMTBL/config/datatype.tbl was modified to add the following
	new data types: convective SIGMETS, winter storm watch/warning/advisory,
	sea ice drift, TAF, and RDF.

    B.  Miscset.tbl Table Changes
	
	The table $GEMTBL/config/miscset.tbl was modified to add the winter
	storm watch/warning/advisory and the convective SIGMETS.

VII.  Calling Sequence Changes

    A.	$GEMPAK/source/cgemlib/cvg/cvgfscan.c
    B.  $GEMPAK/source/programs/gp/gpmap/gpminp.f
    C.  $GEMPAK/source/gemlib/gg/ggmisc.f
    D.  $GEMPAK/source/bridge/tf/tfgrpt.f

See the nawips.log and changes.log for additional details concerning
these routines.

VIII. IRIX 5 Support for N-AWIPS Terminated  

    IRIX 5 support for N-AWIPS is no longer supported.  IRIX 6 will continue 
    to be supported.

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.i 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.i >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.
