			N-AWIPS 5.6.h Release Notes
				6/20/02

Patch 5.6.h covers development from March 22 to June 20, 2002.  


*****************************************************************************

I.  Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements 

        1. Product Generation Layer Product Files  (ALL)

	   Layer Product Files (LPFs) have been added to facilitate the use
           of layering in NMAP product generation.  An LPF is an ASCII file
           that specifies product generation layers and their attributes.
	   When an LPF is selected, layers and their associated attributes are 
           read from the LPF and automatically loaded into product generation 
           allowing layer operations.  A maximum of ten layers can be specified 
           in an LPF.  

	   The following layer attributes can be specified in an LPF:

	        a.  Layer name
       		b.  VGF name
        	c.  Group name
       		d.  Layer toggle, i.e., on/off
        	e.  Color mode, i.e., all colors or monochrome display
        	f.  Monochrome color number
        	g.  Fill toggle, i.e., on/off

	   Click the "OPEN PROD" button on the main product generation palette 
           to open an LPF.  After selecting the desired LPF, the layers and 
           attributes specified in the LPF are loaded into product generation.  
           The "Layer Control" GUI is invoked allowing layer operations.  See 
           the NMAP Product Generation-LPF Help for additional details.  An
	   example LPF and its format description is provided in 
	   $GEMTBL/pgen/example.lpf.

	2. Grouping Improvements (ALL) 
	   
	   The following improvements have been made to the "GROUP" action.

	   	a. Line Labeling Now Available when the "GROUP" Action is Active

	      	   The line and front labeling option in the "Line Attributes" 
	           and "Front Attributes" GUI is now available while in the 
                   group mode.  However, the group type is set and controlled by 
                   the "GROUP" action.  To change the group type in the 
                   attributes GUI, the user must select it in the "VG Group 
                   Selection" GUI associated with the "GROUP" action.   The
                   line labeling function is unchanged from previous versions
                   if the "GROUP" action is not active.

		b. Group Action Highlighted

		   The "GROUP" action button on the product generation palette 
                   is now highlighted when grouping is active instead of the 
                   select action.

		c. Group Name Management Improvements

		   Several problems where the group name was not being properly
                   retained have been corrected.

		d. Grouping Retained When Generating A VGF from GPMAP

		   Grouping information is now properly retained when 
                   generating a VGF file from GPMAP or changing its attributes
                   when using the uattribd.tbl.

	3. Volcano Symbol Improvement (AWC)

	   The volcano symbol placement has been improved to allow the selection
           of a volcano name from a GUI to place and label the symbol.  Click
	   the volcano symbol button.  Select the desired volcano from the
           "Volcano List" GUI.  Upon clicking the "Place Symbol" button, the
           volcano symbol is placed at the volcano's location.  The
           "Text Attributes" GUI is automatically filled in with the volcano
           name and latitude and longitude properly formatted.  The text is 
           grouped with the volcano symbol with the "Label" group type. 

	4. Watch Improvements in Support of the Watch By County Program (SPC)

	   Several changes have been made to support the upcoming testing
           phases for the Watch By County (WBC) Program.  These changes 
           specifically affect the production of the WCL and WOU products.

	   The WCL production has been moved to where the watch is drawn and
           edited in NMAP.  The "WCC" button has been renamed "WCC/WCL" in 
           the "Watch Specifications and County List" GUI.  A new 
           pop-up has been added to specify the watch letter designation.
	   The WCL text message is generated for forecaster review in an 
           editable text window.  Specific format changes to the WCL have
           been made at the request of the SPC.  These are:
	
		a. The "COORDINATION COUNTY LIST..." string is on a separate 
                   line.

		b. The file name uses the WMO product ID in support
                   of the Product Distribution System (PDS) dissemination to
                   AWIPS.

	  The WOU format has been updated in accordance with SPC and WBC 
          requirements.  These format changes include:

		a. "WT" is used for tornadic watches and "WS" is used for severe
                   thunderstorm watches.

		b. A space is added in the WOU header between WT or WS and the 
                   watch number.

		c. Independent cities and their FIPS codes are added to the 
                   product using the same format as the SEV product.

		d. WFO names and state IDs included in the watch are added to 
                   the product. The table, $GEMTBL/stns/wfo.tbl, is used to
                   generate the WFO name from the WFO ID.  The WFO names in
                   the table were obtained from the names listed in the
                   WFO zone forecasts product.

	5. Generic Watch Products Changes (SPC)

	   The following changes were made to all watch products, where
           applicable:

		a. The valid time is now equal to the issue time.  The time
                   is obtained from the system clock plus 5 minutes rounded
                   to the nearest 5 minutes.  The time is assigned when
                   "OK" button is clicked in the "Product Save" GUI.  The
                   "Initial Time" widget has been removed from the
                   "Format Watch" GUI because it is no longer needed.  Note
                   that the "ISSUE TIME" and "VALID TIME" strings are padded
                   with the "X" character since they are not assigned until
                   the products are saved in the "Product Save" GUI.

		b. "DISTRICT OF COLUMBIA" is used instead of "WASHINGTON DC" 
                   for independent city designation.

		c. All control characters are removed from each text line except
                   the new line character.

		d. A trailing "..." is added to the last WFO in the ATTN line.

		e. The "NWS" string is added in front of the 
                   "Storm Prediction Center" string.

		f. The "City_Of" string is removed from the county.tbl
                   and thus the watch verification file (ww.txt) for 
                   independent cities.

	6. Watch County Handling Improvements (SPC)

	   The watch generation software has been improved to better 
           manage the counties included in a watch.  The maximum number
           of counties has been increased from 200 to 400.  Also several
           problems associated with the county add/delete function have
           been corrected.

	   IMPORTANT PLEASE NOTE:  The above changes necessitated a change
           in the watch element structure.  NMAP is backward compatible
           with previous versions of VGFs.  However, a watch generated
           in v5.6.h cannot be read in earlier versions.

	   The county cluster table, $GEMTBL/stns/countyclust.tbl has been
           modified to treat enclosed independent cities as clusters if
           they are entirely surrounded by a county boundary.  This change
           allows surrounded independent cities to be turned on/off.
           County clusters that were previously in the table have been
           commented out at the request of the SPC. 

    B.  Product Generation Pre/Post-Processing Programs
	
	1. New Programs to Decode Significant Weather Chart BUFR Messages (AWC)

	   A new program, SIGBUFR, reads a series of high level significant 
           weather charts in BUFR format for a single date/time and forecast 
           hour, and writes out a single ASCII file using the UKMET data set 
           format.  The second new program, SIGAVGF, reads the ASCII file
           and generates a VGF for display in NMAP.  Currently, because the
           BUFR file has no location information associated with cloud and
           turbulence labels, the program positions the label at the center
           of each cloud or turbulence area.  The label positioning will be
           improved in a future release of the program.

	   Help files provide instructions on how to run each program.  To
           view the program help, type in the program name without command 
           line inputs.
	
	2. New Program, GPFAX, to Create Standard Formats from 6-bit Fax (AWC)

	   A new program, GPFAX, reads a 6-bit FAX file and creates an output 
           product in either the PostScript, GIF, or TIFF format.  The program 
           can also display the 6-bit FAX product as image using XW device 
           driver.  See the GEMPAK help for the program for additional details.

        3. New Program to Generate Mesoscale Discussion Graphic Locations (SPC) 

	   A new program, MDP, has been written to generate a text file with
           latitude and longitude points from an enclosed area in a VGF.
	   This program is used to generate a portion of the Mesoscale 
           Discussion Product (MCD).  See the GEMPAK help for this program
           for additional details.
	   
	   Also, a new group type, MESO_DISC, has been added for mesoscale 
           discussion graphics products.

        4. VGF Clipping Program Improvements (SSA)
            
           Two enhancements have been added to the CLIPVGF program.  
           
           First, the program now automatically labels a line if after being 
           clipped the line has no labels.  The program-created label is 
           located midway between the first and second points of the clipped 
           line. 

	   Second, there is a new option to do more precise, "exact" clipping
           against the clipping boundary.  A new parameter, clip_accuracy,
           has been added to the end of the program's command line.  If it
           is set to "exact", then a more accurate clipping algorithm is
           applied.  The result is that linear objects are clipped precisely at 
           the bounds' edges.  If the clip_accuracy flag is set to "rough" or
           not specified, then the simple clipping algorithm is used that was
           available in the previous release.  Note that in both cases, the 
           line's unsmoothed points are used to determine the clip edges. 
           Therefore if the line has a smoothing factor, the resulting line 
           may not have precisely the same curvature as the original, unclipped
           line when the smoothing factor is re-applied.  Improvements will
           be made to the line point reduction algorithm in a future release
           to address the smoothing issues.

	5. Hurricane Graphics Products Improvements (TPC, PR)

           Improvements and corrections to programs GPKGRF (watch/warning
           hurricane graphic) and GPTPC (four panel hurricane graphic) have
           been made in response to TPC requests.  

           For GPKGRF, placement of the legend box and track labels has been 
           modified to eliminate overlapping.  Improvements have been made for 
           breakpoint locations, color fill for sounds and bays, and default 
           colors.   New breakpoints for 2002 (US - Brunswick (Altamaha Sound), 
           GA and Mexico - Rio San Fernando, MX) were added.

	   For GPTPC, unnecessary detail in the strike probability graphic has 
           been eliminated, and the wind swath graphic has been modified to 
           taper the wind display at the end of a swath when required.  Both 
           programs now use an improved bounds file for land areas so that 
           there is a good match between the coastlines and the fill.

II.  NMAP2 Display Improvements 
 
    A.  Stored Procedure File (SPF) Improvements (ALL)

	1. Overlay Attributes and Data Set Edit Attributes Added to SPFs  

           NMAP2 now has the capability to save and restore map overlay 
           attributes and data set edit attributes.  All map overlay attributes 
           that appear when clicking on an overlay name in the "Map Selection" 
           GUI, e.g., color, line type, line width, etc are now stored and 
           retrieved from SPFs.   Data set plotting attributes that can be 
           edited when clicking on the "Edit Source" button in the 
           "Data Selection Window" GUI can now be saved and retrieved from an 
           SPF.  These attributes include station model options for surface and 
           upper-air data sets and plotting attributes for miscellaneous data 
           sets.  See the NMAP "Procedures" help for additional information.

	2. Single Time Mode Added to SPFs
	
	   The single time mode for accessing gridded data sets can now be 
           stored and retrieved from an SPF.  In addition, the desired frame 
           number for single time mode is saved and retrieved.  This capability 
           allows an SPF to retrieve the same forecast hour for a given model 
           for comparison purposes.

    B.  Added Capability to Access Surface/Sounding Obs Before Top of Hour (HPC)

        NMAP2 is now able to access surface and upper-air data if observations 
        become available before the top of the hour.  Previously, data tagged 
        with the next nominal hour could not be displayed until after the top
        of that hour. 

    C.  International SIGMET Decoding and Display Improvements (AWC) 

	The international sigmet decoder DCISIG has been enhanced to better 
        handle EGGY and NTAA reports.

III.  General Improvements

    A. 	New Eta MOS Added to NWX  (ALL) 

       	The new Eta MOS has been added to the NWX tables so that the product can
       	be displayed in NWX.  The LDM pattern action table, pqact.conf must
       	be modified to add the Eta MOS entry.  The pqact.conf file in 
      	$NAWIPS/ldm/etc is provided for guidance. 

    B.  METAR Decoding of Special METAR Reports Improved (ALL)

	The METAR decoder, DCMETR, has been modified so that special
	METAR observations are displayed in the correct order in NWX
        and SFLIST.

    C.  NTRANS Rectangular Shaped Metafile Capability Added (AWC)

        The NC device driver has been modified to allow the generation of
        rectangular shaped metafiles in addition to the square shaped
        (CGM standard) files.  This new capability allows metafiles to fill more
        of the NTRANS display window.  The metafile dimensions are specified
        using the xsize and ysize parameters in the DEVICE parameter.  Their
        values must be > 0 and < = 1.  If both values are less than 1, then the
        larger value is set to 1 and the smaller value is increased
        proportionally to maintain proper aspect value.  To closely match 
        the dimensions of the NTRANS display window, set xsize and ysize to
        1 and 0.73, respectively.  If the xsize and ysize parameters are not
        specified, a square shaped metafile is generated.  See the GEMPAK DEVICE
        help for additional details.

        NTRANS has been modified to read the dimensions from the metafile header
        and set up the display appropriately.  The program assumes the
        standard square shape for any metafiles generated before this patch.

IV.   Bug Corrections 

    A.  International Sigmet Lat/Lon Computation Error (AWC)

	Corrected the computation of latitude/longitude in degrees and minutes
	that is used for the international Sigmet product.

    B.  AIRMET Decoder Problem (AWC)

	Corrected a problem that occasionally prevented some AIRMETs from 
        being properly decoded.  Also improved the handling of amendments, 
        cancellations and corrections.

    C.  Product Generation Palette Problem (AWC)

	Corrected the problem where the class buttons do not operate properly
	when rows are eliminated in the $GEMTBL/pgen/classbtn.tbl table.

    D.  Template Problem for NMAP2 Datatype.tbl (AWC)

        Image data set templates specified in the table 
        $GEMTBL/config/datatype.tbl now allow the translation of the wild card 
        character, "*", at the end of the image file name, e.g., 
        YYYYMMDDHHNN.*.  

    E.  VGF Append Problem (HPC) 

        Corrected the problem where a VGF could not be saved if it is 
        appended with a file that is located across the network. 

    F.	Watch Decoder Modified to Properly Handle Station "AND" (SPC)

	The watch decoder, DCWTCH, was modified to properly decode the
        station identifier "AND".

    G.  Continuing Watch County Problem (SPC)
 
	Corrected the problem where a large number of continuing watches
        overflowed a watch GUI.

    H.	Outlook Points Product Generation Problems (SPC)

	Improved the program, DAT2PTS, that generates the outlook points 
	product to better handle invalid entries in the input file.

    I.  GDCROSS Problem Crossing Zero Degree Longitude (TPC)

	Corrected the problem where GDCROSS did not work properly when 
        cross-sections transversed the zero degree longitude line for
	the AVN model grids.

    J.  SFLIST String Limitation (Unidata)

	Corrected a string limitation with the TEXT variable that prevented
        the entire MOS message from being listed.

V.   Known Bugs  

    A.  Default Button In Custom Map Definition GUI (ALL)

        The "DEF Content" button in the "Custom Map Definition" GUI
        does not work.  It is supposed to list the default map
        projection for selected geographic regions.

    B.  Print Offset Problem  (HPC)

        There are some occasions when printing product generation
        graphics from NMAP/NMAP2 creates a "double" print of each
        element with a small offset.  This problem is not reproduced
        on a consistent basis.

    C.  Temporary Grid Naming Problem  (Unidata)

        The capability to name grid diagnostics in the GEMPAK parameters
        GFUNC and GVECT does not work.  This capability, specified by using
        the "//" characters should allow a computed grid to be named for later
        use in a diagnostic function in a grid program.

    D.  Inherit Map Attributes for Un-Remapped Images (SPC, TPC)

	The "Apply Settings" and "Get Settings" functions do not work
        properly for satellite images that are in their native projections.

    E.  Contour Kink Problem (MPC)

	Contour lines occasionally are kinked after the point reduction 
        algorithm is applied and smoothing is done.  This occurs when
        there are too few points in the line for the smoothing to retain
        the contour shape.  An improved point reduction algorithm will be
        implemented in a future release to address this problem.

VI. Map and Table File Updates
    
    (Note:  See $NAWIPS/versions/tables.log and nawips.log for a detailed
            list of all table and map file changes.  )

    A.  Station Model Table Updates (SDM)
	
	New station models were added for surface and upper-air observations
        to include plotting models requested by the SDMs.

    B.  SSA Map and Boundary Updates (SSA)

	Several maps and boundary files were created or updated.  These include
        the Pacific and Atlantic offshore forecast boundary files and the
        TPC forecast boundary file.

VII. Documentation Updates (ALL)

    The documentation for several NMAP/NMAP2 help files and table files
    has been improved.  Note that help files are accessed by clicking
    the "Help" button in the main NMAP/NMAP2 window and selecting the
    desired topic from the "Help" GUI.  Also note that the latest version 
    of the release notes is available in "What's New" help.

    A.  NMAP2 Main Help Update

 	The main NMAP help was updated assuming the functionality of NMAP2.
	In addition, new helps were written for the "RELOAD", "Stop" and
        wipe functions.	

    B.  NMAP Seek and Locator Help and Tables Updates

	NMAP help for the seek function was updated.  A new help was written
        for the locator function.  This help describes the functionality 
        associated with the cursor position that is displayed in the lower
        right hand corner of the main NMAP2 window.  The documentation for
        $GEMTBL/nmap/locator.tbl and $GEMTBL/config/clo.tbl tables was also
        updated.  These tables are used by the locator and seek functions.

    C.  NMAP Stored Procedure Files (SPF) Help Update

	The "Procedures" help was updated to reflect the new capabilities
        to store and retrieve overlays and data set edit attributes, and
        the single time mode.

    D.  Selected Product Generation Help Files and Table Updates

	1.  Product Generation-LPF

	    A new help has been added to describe the layer product file
	    capability.  The "Product Generation-Layer" help was updated
            to reference this help.  Also, an example LPF, 
            $GEMTBL/pgen/example.lpf has been written that describes the LPF 
            format and gives an example.

	2.  Product Generation-Group

	    This help was updated to describe the new capability to label
            lines while the "GROUP" action is active.

VIII.  Calling Sequence Changes

    A.	$GEMPAK/source/cgemlib/ces/cesgtggrps.c
    B.  $GEMPAK/source/driver/active/nc/minita.c, msdatt.c
    C.  $GEMPAK/source/gemlib/gh/ghkgfl.f, ghkgip.f, ghkglb.f
    D.  $GEMPAK/source/cgemlib/crg/crgclearlayer.c
    E.  $GEMPAK/source/gemlib/gh/ghkgip.f, ghwrel.f
    F.  $GEMPAK/source/gemlib/pd/pdslvp.f, pdswet.f
    G.  $GEMPAK/source/bridge/is/isegts.f
    H.  $GEMPAK/source/gemlib/vf/vfwwcl.c
    I.  $GEMPAK/source/nmaplib/nim/nimflnm.f, nimftot.f

See the nawips.log and changes.log for additional details concerning
these routines.

IX. IRIX 5 Support for N-AWIPS to be Terminated  

    This is the last release of N-AWIPS that will include support for
    the IRIX 5 operating system.  IRIX 6 will continue to be supported.
    Please contact the NCEP Computing Development Branch if there is
    a requirement to support IRIX 5.

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.h 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.h >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.
