			N-AWIPS 5.6.g Release Notes
				3/21/01

Patch 5.6.g covers development from December 6, 2001 to March 21, 2002.  

*****************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 

        1. Product Generation Layering Added (ALL)

	   Layering has been added to product generation to allow the display
	   and editing of more than one product.  This capability facilitates
	   creating more than one product at a time or using multiple products 
           as guides in creating a new product.  Each layer is associated with 
           a set of objects and optionally may be associated with a VGF.  Only 
           one layer can be selected to be active at a time.  When a layer is 
           active, all product generation functions can operate on it, whereas 
           non-active layers can only be displayed.  The active layer is 
           displayed in full color with all of its fills applied.  Non-active 
           layers may be toggled on or off, displayed in full color or a 
           user-selected mono-color, and displayed with fills turned on or 
           off.  A GUI allows the user to easily switch which layer is active.  
           Up to 10 layers can be present in product generation.

	   Future versions of NMAP will allow layer attributes such as
	   layer name, associated VGF, group type, and display attributes
	   to be pre-defined using tables.

	   Layering is invoked by clicking the "START LAYER" button in the
           "Controls" section of the main product generation palette.  Note
           that product generation continues to operate as in previous 
           versions if layering is not invoked.

	   See the NMAP help, "Product Generation-Layer" for additional 
           information on product layer operations.

	2. Grouping Improvements (ALL) 
	   
	   Several improvements have been made to grouping.

	   a. "GROUP" action

	      The group type set for the "GROUP" action is now completely 
              independent from group type set for labeling using the 
              attribute GUIs.  The first time the "GROUP" action is invoked, 
              the group type is the first group name that appears in the 
              table, $GEMTBL/pgen/grptyp.tbl.  Subsequent activations of the 
              "GROUP" action use the most recent group type set by the GUI.  
              If product layering is invoked, then the "Group" action uses
              the most recent group type set for the active layer.

	      The size of the box surrounding grouped objects has been reduced
	      to improve the group identification.  The reduction has been
	      accomplished by decreasing the selection area from 100 to 
	      30 pixels around line, front, and circle objects.

	      The default location for the "VG Group Selection" GUI has been
              moved to the upper left hand corner of the data display region.
	      Previously, it was obscuring the product generation palette. 

	      The problem where the "GROUP" action did not properly
              terminate when the "Data Selection Window" is invoked has been
              corrected.

	   b. Group Setting for Attribute GUIs

	      The group type set for the attribute GUIs (line, front and
              symbol labeling) now obeys the following rules.  Initial group 
              type values for each object are obtained from the table, 
              $GEMTBL/pgen/setting.tbl.  This rule is unchanged from previous
              versions of NMAP.  However, NMAP now "remembers" the last group
	      type set for each object when an attribute GUI is invoked.  For
              example, if the group type for the arrow line type is set to 
              "LABEL" in the "Line Attribute" GUI, then next time the GUI
              is invoked for the arrow line, the group type will be set to
              "LABEL".  Previous versions of NMAP re-set the group type to
              the value specified in the setting.tbl. 

	   c. Connect Action

	      The connect ("CONN") action has been modified with respect to
              grouping in support of the Seamless Surface Analysis (SSA) 
              project.  Now if either object in the pair being connected
              is grouped, then the resulting connected object is grouped.
              All objects that are grouped with either object are included
              in the connected object's group.  If the group types are 
              different for each line, then the resultant connected line
              uses the group type of the first line that was selected.  Note
              that the connect tool applies all of the attributes of the
              first selected line to the resultant connected line.

	3. Product Generation Exit Change (ALL)

	   NMAP now checks to see if any unsaved changes have been made before
           exiting product generation.  Previous versions of NMAP did not 
           make this check.  After the "EXIT" button is clicked, the 
           "Exit Confirmation" GUI gives the user the option to save any
           unsaved changes.  If the "Yes" button is clicked, then the
           "Save VG File as" GUI is invoked allowing the user to select an
           existing or specify a new VGF for saving the current objects.  If
           the "No" button is clicked, then product generation immediately
           exits. 

           Exiting layering or product generation with layering present will 
           invoke the "Save VG File as" GUI for each layer that has unsaved 
           changes. 

	4. Increment/Decrement of Irregularly Shaped Regions (HPC)

	   Multi-select and thus the increment/decrement action has been 
           modified to allow objects to be selected inside an irregularly 
           shaped region by defining a polygon.  Press the "Shift" key and 
           click the left mouse button to define each polygon vertex.  A ghost
           line defining the polygon is drawn.  Click the middle mouse button
           to select all objects within the polygon. 

	5. Degrees Minutes Option for Symbol Placement (AWC)

	   Degrees and minutes can now be used to specify symbol locations
           in the "Symbol Attributes" GUI in addition to decimal values.
	   To specify the degrees and minutes format, the delimiter ":"
           must be used.  For example enter "75:30" to specify 75 degrees
           and 30 minutes.  After the symbol is placed, the latitude and 
           longitude values are converted to their respective decimal 
           values in the GUI.

           The minutes portion of the string MUST include two digits.  
           For example, 75 degrees and 5 minutes must be specified as "75:05".  
           The string, "75:5" will not be accepted by the GUI. 

	6. Outlook Product Improvements (SPC)

	   The "Format Outlook" GUI in the "PROD" class no longer requires
           the user to select the group type.  Instead, NMAP uses the group
           type from the first grouped line in the VGF.  The group type is
           displayed in the GUI.  If more than one type of group is found
           in the VGF, the GUI generates a warning.

    B.  Product Generation Pre/Post-Processing Programs

        1. New Time Utility Program (ALL)

	   A new utility program, datetime, has been written to facilitate
           the handling of dates and times in pre and post-production scripts.
           The program takes command line input and displays the computed
           time in the UNIX format specified by the user.  Hours and minutes
           may be added or subtracted from the input base time.  Type
           "datetime" to list the program's help for additional information.

        2. Program to Append VGF Files (AWC, SSA)

	   The utility program, vgappend, has been added to append VGF 
           files. The program uses a command line interface where the first
           file is the output file and the remaining files specified on 
           the command line are appended into the output file.

        3. BUFR Message Generation for High-Level SIG Charts (AWC)

           Two post-processing programs have been written to create
           BUFR messages for high-level significant weather charts.  These
           programs must be run in sequence to produce the BUFR messages.

           The program, sigwxcnv, converts a VGF to an ASCII file using the
           format established by the UKMET office.  The VGF objects, e.g.,
           clouds, must be properly grouped for the program to correctly 
           generate the text file.  

           The program, sigbenc, reads the ASCII file generated by the 
           sigwxcnv program as input, and generates the BUFR messages 
           following ICAO/WMO standards.

           A third program, sigbufr, converts high-level significant
           weather charts encoded as BUFR messages into the formatted ASCII
           file format.  This program can be used as a partial check of 
           the BUFR message production process using the sigwxcnv and sigbenc
           programs. 

           Help files provide instructions on how to run each program
           and rules for properly grouping objects in the high-level
           significant weather chart VGFs.  To view the program help, type
           in the program name without command line inputs.


        4. VGF to ASCII Utility Program for Line Objects (HPC)
           
           A new utility program, vgftoascii, has been written to generate a
           formatted text file for all line objects in a VGF that are 
           grouped with text.  The program generates a tagged format listing of
           the line attributes and latitude/longitude locations of each vertex
           point.  See the vgftoascii help for additional information.  To 
           access the program help, type "vgftoascii".

        5. VGF to Flood Product Format Utility Program (HPC)

           A new utility program, rfop, has been written to convert a VGF flood
           product to an ASCII NWS flood product text file.  For additional
           information type "rfop" with no command line inputs to list the
           program help.


	6. New Program to Create Outlook Points Product (SPC)

	   A program, dat2pts, has been written to generate the new outlook
           points product using the outlook verification files (.dat files)
           as input.  Type the program name, "dat2pts", without command line
           inputs to display the program help for additional information.

	7. County Centroids Improvements (SPC)

           County centroid locations are now calculated using an algorithm
           to better place them at the center of irregularly shaped counties.
           Previously, centroid locations were obtained directly from the
           NWS Shape files.  In several cases, the centroids were improperly
           located outside of their respective counties.

        8. VGF Clipping (SSA)
            
            A new program, clipvgf, has been written to clip vgf objects
            that either fall inside or outside geographic regions.  For the
            Seamless Surface Analysis (SSA) project, each center's forecast 
            area can be specified as a clipping region.  See the clipvgf 
            program for information on how to specify the desired area and 
            other program inputs.  The help is invoked by typing "clipvgf" 
            without program inputs.

            The clipvgf program currently employs a simple clipping algorithm.
            All objects that fall either inside or outside a bounds region are 
            removed.  For line objects, the line is clipped at the nearest 
            vertex to the clipping boundary regardless of its distance to the 
            boundary.  No line interpolation to the boundary is performed.  
            Also, labels associated with contours are removed if they are in 
            the clipping region.  No attempt is made to re-label clipped 
            lines.  Finally, each geographic region must be a single area, 
            i.e., it may not have multiple parts such as islands.  See the 
            clipvgf help for additional information. 

        9.  GPMAP Attribute Filtering (uattribd.tbl) Improvements (SSA) 

            GPMAP VGF attribute filtering has been enhanced to allow
            VGF objects to be changed from one sub-type to another.  For 
            example, all underlined text in a VGF can be changed to text
            with no underlines.  A new column named NEWSUBT has been added
            to the attribute table that specifies the desired sub-type to
            replace the existing VGF subtype.  See the template file
            $GEMTBL/pgen/uattribd.tbl for additional information. 

	10. Improvements to Tropical Cyclone Marine Graphics (TPC, PR)

	    GPMAP has been modified to enhance the generation of the
            marine graphics (danger area) product.  Improvements have
            been made to GPMAP variable TCMG for interpolation, smoothing,
            label placement and remnant low labels.  Also, processing for 
            CPHC and table input for radii have been added.

II.  NMAP2 Display Improvements  

    A.  Added Capability to Share Map Settings Among Loops (ALL) 
        
	Map settings including the base map, zoom area, overlay selections, 
        and roam factor can now be shared among loops.  Click the 
        "Apply Map Settings" button in the "Map Selection" GUI to apply the 
        map settings of the current loop to other loops.  This button is 
        useful for applying map settings before data sets are loaded into 
        loops.  Click the "Get Map Settings" button to acquire the map 
        settings from a particular loop for the current loop.  This button is 
        useful for loading data after map settings have been applied to loaded 
        loops.  See the NMAP "Map Selection" help for additional details.

    B.  International SIGMET Decoding and Display Improvements (AWC) 

	International SIGMETS that do not contain geographic areas or lines
        are now plotted in NMAP.  The SIGMET is plotted by positioning the
        weather symbol at the issuing centers location.

	The plotting of additional phenomena SQ, CT, IC, GR, DS, SS, and CB 
        has been added to NMAP2.  Expanded the search for phenomena TB, GR, 
        SQ, and TS to search for additional character strings TURBULENCE, 
        THUNDERSTORM(S), TSTMS, HAIL, and SQUALL(S) in the international 
        SIGMET decoder DCISIG. 

	The international SIGMET decoder DCISIG has been modified to process 
        more cancellations, including cancel WIE for CONUS.

    C.  Marine Decoding and Display Improvements (MPC)

        Modified marine surface (ship) decoder DCMSFC to decode all reported
        gusts, and ship direction and speed.  These parameters can be
        displayed in SFMAP and NMAP/NMAP2 as GUST (gust in knots) and new
        parameters DASH and SHPK (ship direction as an arrow, ship speed in
        knots, respectively).  Parameters GUM1, P06M, XS10 and ITSO were
        removed from the DCMSFC GEMPAK output file.

    D.  Hurricane Advisory Improvements (TPC)

        Modified hurricane advisory decoder DCHRCN and display routines to
        allow display of 34, 50 and 64 knot quadrant wind radii for tropical
        storm and hurricane forecast track points through 72 hours in NMAP2
        and GPMAP.

III.  General Improvements

    A. Heat Index Calculation (ALL)

       The heat index surface parameter, HEAT, was updated to use the 
       calculation specified by the NWS Southern Region SSD Technical 
       Attachment SR 90-23.  Also a new grid diagnostic, HEAT, was added
       to calculate the heat index for gridded data sets.

    B. NSHARP Map Window Improvements (Unidata)	

       The map window in the NSHARP "Observed Sounding Selection" GUI has
       been enhanced.  The map area can now be selected by clicking on the
       "Area" button and choosing the desired area from a pop up list.  The
       list of areas is obtained from the table 
       $NAWIPS/tables/nwx/mapinfo.nwx.  Previously, the map area was hard coded
       to the CONUS region.

    C. ZLIB Library Security Update (Unidata)

       The zlib compression library was updated to version v1.1.4 to address 
       security concerns.  This library is used to read compressed radar
       images.

IV.   Bug Corrections 

    A.  VGF Open Failure When Using Environment Variables (ALL) 

        Corrected the problem where opening a VGF in product generation
        failed if an environment variable is used to specify a path
        in the table $GEMTBL/nmap/vgf.nmap.

    B. 	NTRANS Logging Problem (AWC)

	Corrected a problem where the NTRANS logging option was not working. 

    C.  GPLTLN Attribute Table Use (AWC)

	Corrected a problem where GPLTLN was not able to use the VGF attribute
        filtering capability, i.e., the attribute file option for VGFILE
        parameter.

    D.  AIRMET Decoding and Display Problem (AWC)

	Corrected the problem with the AIRMET decoder, dcairm, which was
        causing AIRMETS with long bounds specification strings (> 160 
        characters) not to be decoded and thus displayed in NMAP2.

    E.	PIREP Decoding and Display Problem (AWC)

	Corrected the aircraft decoder, dcacft, to decode reports even if
        the flight level is missing.

    F.	SFGRAM Multiple Execution Problem on AIX (HPC)

	Corrected a problem where SFGRAM could not be run more than once
        inside the program on the AIX platform.

    G.  NMAP2 Fatal Error with Invalid Station Model Color (MPC)

        Corrected the fatal error which occurred when the NMAP2 station
        model edit function attempted to access a station model with an
        invalid color specification.

    H.  SPF Confirmation GUI Problem (SPC)

	Corrected the problem where the contents of the SPF "Restore
        "Confirmation" GUI were not displayed for SPFs that contained
        a large number (> 1200) characters. 

    I.  NWX Fatal Error with Large Fire Weather Products (SPC)

	Corrected the fatal NWX error when accessing fire weather products
        with greater than 80,000 bytes.

    J.  Louisiana County Identification Problem (SPC)

	Corrected the problem where a few counties in Louisiana were not 
        properly identified by the NMAP cursor functions.

    K.  Improper Error Message for Missing Restore File (SPC)

	NMAP2 now generates an appropriate error message when a model restore
        file specified in the table $GEMTBL/nmap/mod_res.tbl does not
        exist.

    L.  Warning Decoder DCWARN Handling of Expiration Times (SPC)

	Updated the warning decoder, dcwarn, to better handle invalid
        start and stop date/time strings in warning messages.  The decoder
        now substitutes reasonable values for invalid strings.  Also corrected
        a problem with processing county numbers.

    M.  GDSTAT Problem with AVN Grid Files (TPC)

	Corrected a problem with the program, gdstat, where it did not properly
        create the output grid file for global CED grids, e.g., AVN model.
	This problem prevented other applications from reading the gdstat
        generated grid.

    N.  IN Library Input String (Unidata)

	Modified the $GEMPAK/source/gemlib/in library functions to use a
        consistent string size for their input strings.

    O.  Correction to METAR Codes for Mist and Shallow Fog (Unidata)

	Corrected routines to properly assign weather code numbers for
        mist and shallow fog.

V.   Known Bugs

    A.	Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Print Offset Problem  (HPC)

	There are some occasions when printing product generation 
	graphics from NMAP/NMAP2 creates a "double" print of each
	element with a small offset.  This problem is not reproduced
	on a consistent basis.
   
    C.	GDCROSS Problem When Crossing the Zero Degree Longitude (TPC)

        The gdcross program does not work properly when a cross section spans
        across the zero degree longitude when using a global grid that has
        its break ath the zero degree longitude.
 
    D. 	Temporary Grid Naming Problem  (Unidata)

    	The capability to name grid diagnostics in the GEMPAK parameters 
       	GFUNC and GVECT does not work.  This capability, specified by using 
       	the "//" characters should allow a computed grid to be named for later
       	use in a diagnostic function in a grid program.

VI. Map and Table File Updates
    
    (Note:  See $NAWIPS/versions/tables.log and nawips.log for a detailed
            list of all table and map file changes.  )

    A.  Removed Unused Text Types from the settings.tbl (ALL)

	The text types TEXT_ELM and TEXTC_ELM were removed from the
        table $GEMTBL/settings.tbl because these object types are not
        used by product generation.

    B.  Attribute Table Format Change (ALL)

 	The format of the attribute table used to modify VGF attributes
        has been changed.  A new column, NEWSUBT, has been added to 
        specify the desired sub-type.  See the sample template table,
        $GEMTBL/pgen/uattribd.tbl for additional information. Note that
        the old format of the table can still be properly read by GPMAP.

    C.  Updated prmlst.tbl Table for New Wind Chill Parameter (ALL)

	The table $GEMTBL/config/prmlst.tbl was updated to use the
        new wind chill parameter WCHT instead of WCEQ.

    D.	NWX Tables Updated to Separate HPC Products (HPC)

        NWX tables were updated to separate the discussion products
        from the "Basic_WX" selection at the request of the HPC.

    E.  NWX Tables Updated to Remove Old SPC Products (SPC)

	The NWX tables were updated to remove the selection for products
        with the old header.  Now, SPC products are selected without having
        to click on a station location.

    F. 	New Map Files for SSA Areas of Responsibility (SSA)

       	New map files have been added for the centers' areas of responsibility
        for the Seamless Surface Analysis (SSA) project.  They are:

        $GEMPAK/maps/hpc050.ncp, mpc050_atl.ncp, mpc215_atl.ncp, mpc050_pac.ncp,
        mpc215_pac.ncp, tpc050.ncp, tpc215.ncp, pr.ncp

VII. Documentation Updates (ALL)

    The documentation for several NMAP/NMAP2 help files and table files
    have been improved.  Note that help files are accessed by clicking
    the "Help" button in the main NMAP/NMAP2 window and selecting the
    desired topic from the "Help" GUI.  Also note that the latest version 
    of the release notes is available in "What's New" help.

    A.  NMAP2 Data Selection Helps and Supporting Table Updates

	Documentation for NMAP2 help files and supporting tables associated
	with the "Data Selection Window" GUI have been updated.  These are:

	1.  Data Selection Help

	    This help describes how data sets and their display attributes
            are specified using the "Data Selection Window" GUI.

	2.  Data Access-Configuration (Site Administrators Please Note)

	    This is a new help which provides information to N-AWIPS site
            administrators on how to configure N-AWIPS tables and data sets
            for NMAP2 data access.

	3.  $GEMTBL/config/datatype.tbl 

	    The documentation for this key N-AWIPS data access table was 
            updated.

	4.  $GEMTBL/config/miscset.tbl

	    The documentation was updated for this table which specifies the
            default display attributes for miscellaneous and VGF data types.

	5.  $GEMTBL/config/prmlst.tbl

	    The documentation was updated for this table which specifies the
            station display models for observational data types.

	6.  Roam Help

	    A new NMAP help was written to describe the roam function. 

	7.  $GEMTBL/nmap/nmap_roam.tbl
	
	    The roam factor table documentation was updated.

    B.  Selected Product Generation Help Files and Table Updates

	1.  Product Generation-Layer

	    A new help was written to describe product generation layering.

	2.  Product Generation-Group

	    This help was updated to reflect the refinements made to the 
            "Group" Action.

	3.  $GEMTBL/pgen/uattribd.tbl

	    This table's documentation was re-written and updated to account
            for the new capability to change an object's sub-type. 

	4.  $GEMTBL/pgen/setting.tbl

	    This table which specifies object default attributes was updated
            to improve the documentation.

	5.  $GEMTBL/pgen/scale.fax

	    This sample table's documentation was rewritten.

    C.  Map-Selection Help

	This help was updated to account for the new capability to share map
        settings among loops.
        
VIII.  Calling Sequence Changes

    A.	$GEMPAK/source/cgemlib/crg/crgset.c
    B.	$GEMPAK/source/cgemlib/cvg/cvgload.c
    C.  $GEMPAK/source/cgemlib/cvq/cvqscangrp.c
    D.  $GEMPAK/source/cgemlib/crg/crgget.c
    E.	$GEMPAK/source/cgemlib/ctb/ctbtrkitv.c
    F.	$GEMPAK/source/gemlib/gg/ggtcmg.f, ggtcsh.f
    G.	$GEMPAK/source/cgemlib/cas/caswrhdr.c
    H.	$GEMPAK/source/gemlib/fl/flscnd.f
    I.  $GEMPAK/source/bridge/hc/hcdecd.f, hcfvld.f, hcout.f
    J.	$GEMPAK/source/cgemlib/crg/crgmvallayer.c
    K.  $GEMPAK/source/bridge/wn/wnstfs.f

See the nawips.log and changes.log for additional details concerning
these routines.


IX.   Dot File Changes  ***** IMPORTANT: SITE ADMINISTRATORS PLEASE NOTE ****

    A.  Change to the .cshrc and .profile files (ALL)

        The environment variable BUFRFLAGS in the .cshrc  and the .profile 
        files were modified to properly build the $GEMOLB/libmel_bufr.a 
        library that is used for encoding and decoding BUFR messages.  
        The variable should be defined as follows in the .cshrc file:

	setenv BUFRFLAGS "-DNO_MSG_IPC -O -ansi"

	The variable should be defined as follows in the .profile file:

        BUFRFLAGS = "-DNO_MSG_IPC -O -ansi"

	The files .cshrc_5.6.g and .profile_5.6.g are provided for guidance.

        Currently this library is only used for the high-level sig weather 
        chart BUFR encoding and decoding programs for the AWC.

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.g 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.g >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

