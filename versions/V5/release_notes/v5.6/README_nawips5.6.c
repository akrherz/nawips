			N-AWIPS 5.6.c Release Notes
				3/26/01	

Patch 5.6.c covers development from January 23 to March 26 2001.  


*****************************************************************************

I. Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements

	1. Palette and Action Improvements (ALL)

	   Several improvements have been made to the product generation 
	   palette and actions. 

	   All file related actions have been moved to a new panel labeled
	   "Control" at the top of the palette.  These actions include: 
	   OPEN, SAVE, SAVE AS, EXIT, RESTORE, and REFRESH.

	   The Undo, Redo, and DEL ALL actions now return to the previous
	   action after they are clicked.  For example, NMAP returns
	   to the Mod action if the UNDO button is clicked after modifying
	   a line.

	   All object moves, vertex drags, and point delete operations now
	   require that a mouse click and/or drag begin very close to a 
	   vertex.  Previously, these actions used the nearest vertex no 
	   matter how far away the cursor was from the vertex.  This behavior
	   lead to unexpected large displacements of objects in some cases.

	   NMAP2 now retains the selected palette action when switching
	   loops.  However, the selected object is deselected after
	   switching loops.  For example, if a line is selected for
	   moving, it is deselected if the loop is switched.  The
	   move action is active allowing the immediate selection of 
	   a line for subsequent moving.

	2. Group and Label Improvements (ALL)

	   Several improvements have been made to grouping and labeling.
	   Group and label attributes have been made more table-driven. 
	  
	   The default group type for an object may now be specified in
	   the table $GEMTBL/pgen/setting.tbl.  The default group will then be
	   set when the object is selected for drawing in NMAP.  The default 
	   group type has been added to setting.tbl using a new column labeled 
	   GRP.  Note that specifying a default group is optional and the 
	   software can read the setting.tbl in the old format without the 
	   group column.  

	   All line and text attribute defaults can now be specified for each
	   label associated with a group in the group table: 
	   $GEMTBL/pgen/grptyp.tbl.  After each label entry, the line 
	   attributes are separated by slashes "/" followed by a vertical 
	   bar "|", followed by the text attributes separated by slashes.  See 
	   the table documentation for additional information regarding the 
	   syntax.  Note that the text attributes use the same syntax as the
	   GEMPAK TEXT variable.  However, the width values are not 
	   implemented.

	   Group numbers are no longer associated with group names in the 
	   grptyp.tbl.  Rather, they are assigned to an internal list within 
	   the code.  New group names MUST be coordinated with the Computing 
	   Development Branch (CDB). Group names in the grptyp.tbl that
	   are not in the internal list are ignored.  Five development group 
	   names, DEV1, DEV2, ... DEV5, are provided to allow the centers
	   to develop new products.  Upon coordination with the CDB, 
	   these products will be added to the internal list and assigned 
	   permanent names and numbers.

	   The following rules apply to the default group name and label
	   specifications in the setting.tbl and grptyp.tbl tables:  
	   
	   	a. If the group name in the setting.tbl for an object does not 
		   match a valid group name in the group table, or it is 
		   missing, or the group name does not correspond with the 
		   internal list, then the object does not have a valid 
		   default group.

		b. When creating a new object, if the setting table entry for
		   that object has a valid group name, then the default group 
		   name is presented in the GUI with the label select button 
		   turned off by default.  For example, if the OUTLOOK group 
		   is set as the default for the arrow head line type 
		   (special line type 4), then when this line is selected, 
		   the OUTLOOK group with its default labels will be set by 
		   default.  The line and text attributes will be read from 
		   the grptyp.tbl table for each label that has been specified 
		   for the OUTLOOK group. If an attribute is not specified for 
		   a label, the previous value set for that attribute for the 
		   object will be used.  If the object does not have a valid 
		   group name, then the group is set to the first group name 
		   from the group table, grptyp.tbl and the LABEL option is 
		   turned off.  

		c. When editing an object, if the object's group name matches
		   a valid group name in the grptyp.tbl, then that group name 
		   is set in the GUI by default.  If the group name associated 
		   with the object is not in the grptyp.tbl, then the string 
		   "UNKNOWN" is listed in the GUI.  If the object is not 
		   grouped, then the group type in the GUI is disabled.

	3. Watch Generation County Clustering (SPC) 

	   A clustered counties option has been added to watch generation.
	   This option allows counties to be grouped together so that if
	   one county in the group is turned on/off in the watch, the other
	   counties in the group are also turned on/off.

	   The county clusters are defined in a new table:

	   $GEMTBL/stns/countyclust.tbl

	   The clustering option is invoked by setting the "County 
	   Clustering" button to "On" in the "Watch Specifications and
	   County List" GUI.  By default, this option is set to off.  

	4. Watch Creation Changes (SPC)

	   The "Watch Specifications and County List" GUI no longer appears
	   during watch creation.  The handle bars have also been removed
	   during watch creation.  These changes make the watch drawing
	   consistent with the drawing of other objects.

	5. Watch Status Message Format Change (SPC)

	   The watch status message "from" line distances have been changed
	   from nautical to statute miles at the request of the SPC.

    B.  Product Generation Bug Corrections

	1. Fatal Error With County Name Having 32 Characters (SPC) 

	   Corrected a fatal error that occurred creating watches when
	   county names had 32 characters.

	2. Text Size Truncation Error with UATTRIB.TBL (SPC)

	   Text sizes of less than one in the uattrib.tbl are now
	   properly handled.

II. NMAP Bug Corrections

    A.  Large Number of Grid Times Fatal Error (Unidata)

	Corrected error in NMAP/NMAP2 where the program crashed when 
	attempting to access a grid file with a large number of grid times.

    B.	Fatal Error When With No MOS Data in the Data Base (ALL)

	Corrected a fatal error when no MOS data files are present in the
	data base.  NMAP now displays a warning when this occurs.

III. NMAP2

    A.  NMAP2 Improvements

	1. Multiple Grid Products Valid at the Same Time (HPC)

	   Added the capability to load a loop with different grid products
	   valid at the same time.  This capability allows various forecast 
	   products from a model or different models to be loaded into a frame 
	   sequence. Each grid product is loaded into a separate frame in the 
	   loop.  Other data types, e.g., image or observational data, are 
	   time-matched and overlaid on each grid product.  To select a grid 
	   time for grid product matching, click the "Single Time" button and 
	   select the desired time from the time line.  A gridded data set 
	   must be dominant to enable the single time mode.

	2. Display of Hurricane, Volcano and Ensemble Grid Files (ALL)

	   NMAP2 is now capable of accessing grid files that contain qualifying
	   information in the file name, such as a storm name, volcano name, or
	   ensemble member name.  Specifically for this release, this feature 
	   will allow access to the GHM, VAFTAD and ensemble grid files.  
	   Note the new entries for alias names GHM, VAFTAD and ENS in the 
	   datatype.tbl table with the associated file name templates.

    B. NMAP2 Bug Corrections

	1. Time Matching Problem with GRID Data (ALL)

	   Corrected a time matching problem when an old cycle from a gridded
	   data set was selected as the dominant data source for the time
	   line.  This error occurred when the set time function was used.

	2. Resize Problem (ALL)

	   Corrected a problem when resizing NMAP2 with data loaded.  The
	   resizing would cause images to disappear in loops not visible
	   to the user after auto updates.

	3. VG File Print Problem (HPC)

	   Corrected a problem where NMAP2 did not print VG files in the case
	   when no background data was present.

	4. Roam Box Pop-up Problem (HPC)

	   Corrected the problem where the roam box popped up in the currently
	   active view space when an auto-update occurred from an NMAP2 in
	   another view space. 

    C.  NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g., satellite
           data are not implemented in NMAP2.

	3. The "size of image" function for roam is not implemented.

IV. Decoder Improvements

    A.  Severe Weather Decoder (SPC)

	Modified the severe weather decoder, DCSVRL, to disregard the "$$"
	delimiter because there may be more than one county between 
	delimiters.

    B.  Upper-Air Decoder (ALL)

	Several improvements have been made to the decoding and storing of
	upper-air data.

	The max winds and tropopause parts, TRPA, TRPC, MXWA, MXWC, are
	now decoded and stored.  In addition, the significant winds below
	and above 100mb, PPAA and PPCC, respectively, are now stored as
	separate parts.

	Currently, only the program SNLIST can list the tropopause and
	max wind data.  NMAP and the other display programs will be modified
	in the future to handle these data types.

	The raw text, (undecoded data) is now stored.  It can be listed
	in the program SNLIST by setting SNPARM to TEXT.

    C.  Upper-Air Decoder Correction Handling (SDM)

	Corrections to upper-air reports are now properly handled.

    D.  Upper-Air Decoder Augmented to Decode Dropsonde Data (TPC)

	The upper-air decoder, DCUAIR, has been modified to decode dropsonde 
	data.  The dropsonde data appears like standard upper-air reports and
	can be accessed and displayed by all GEMPAK sounding (SN) programs.
	Each dropsonde is identified by a unique station ID.  It is currently
	comprised of an observation number, observation hour, and aircraft
	number.  These parameters are obtained from the dropsonde report.
	Dropsondes are displayed in NMAP2 by selecting "DROP" under the
	"UAIR_OBS" data category.
	
	It is recommended to run a separate instance of DCUAIR to
	decode dropsonde data, that is one DCUAIR for standard upper-air
	reports and one DCUAIR for dropsonde reports.  For decoding dropsonde
	data the following is recommended:

		1. Set the maximum number of stations to add to at least
		   50 on the command line (-a 50) since all dropsonde
		   reports are treated as additional stations.

		2. Set the maximum number of times to 24 ( -m 24) to
		   create hourly files.

		3. The decoder only handles dropsonde reports with WMO
		   bulletins beginning with UZ.  Therefore, the LDM
		   pattern action table should be set to only send these
		   bulletins to the decoder in order to save dropsondes
		   separately from the conventional radiosonde reports.

    E.  Removed References to LDM ULOG Utility

	All references to the LDM ulog utility have been removed from N-AWIPS.  
	Therefore, N-AWIPS decoders no longer write to the LDM log file.  
	Useful diagnostic information can be obtained from each decoder log 
	file.

V.  General Improvements

    A. 	GF Driver Improved (ALL) 

	Several improvements were made to the GF driver.  Note that these
	changes affect GIF production scripts and may REQUIRE script 
	modifications.

	The GF file naming convention has been changed in two ways.  First, the
	file name does NOT have a numerical extension unless the file already
	exists in the directory.  In previous versions, a numerical extension
	to the file was always added. Second, the numerical extension format
	has been changed from 1,2,3, ... to 001,002,003, ... so that multiple
	files with the same name will list alphabetically in the directory.
	If GF production scripts assume the old extension format, they MUST
	be modified to account for the new format when Patch C is installed.

	The driver performance has been improved by closing the current
	output file before opening a new file, if a new file name is given.
	Previously, the program had to exit to open a new file.  This change
	means that it is no longer necessary to exit a program and call GPEND
	between each GF file production.  To take advantage of this 
	improvement, the unnecessary exits and GPENDS should be removed from 
	scripts.  These modifications, however, are not required for the 
	scripts to continue to operate properly.

	The GF driver now allows image sizes to be larger than the screen
	dimensions.  Scripts need to be modified to take advantage of 
	this feature.

    B. 	Additional GRID Programs Modified to Handle Single Forecast Files (ALL)

	All of the GD display programs, GDDIAG, GDCFIL and CPCLIST are now
	able to use an alias to access single time forecast grid files.  These
	programs include: GDCFIL, GDCNTR, GDCROSS, GDDIAG, GDGSFC, GDLIST, 
	GDMAP, GDPLOT, GDPROF, GDSTAT, GDSTREAM, GDTHGT, GDTSER, GDWIND, and
	CPCLIST.

	The following GRID programs CANNOT access single time forecast files 
	using an alias:  
	
	OABSFC, OABSND, GDDELT, GDEDIT, GDMOD, GDOMEG, GDVINT.

	These programs will be modified in the future.

    C.  NWX Maximum Report Size Increased (SPC)

	The maximum text report size was increased from 20 to 80 thousand 
	characters to accommodate future larger bulletin sizes received from
	NOAAPORT.

VI.  Map Improvements

    A.  FIR Map (AWC)

	The ZNY/NOA map boundary segments were removed at the request of
	the AWC.

    B.  Washington VAAC Boundary Map Created (VACC)

	A new map file containing the Washington Volcanic Ash Advisory Center
	area of responsibility has been created.  The map file is:

	$GEMMAPS/dcvaac.ncp

	The map can be displayed as an overlay in NMAP/NMAP2 by clicking
	on VAAC overlay button in the "Map Selection" GUI.
    
    C.  County Cluster Overlay Added (SPC)

	A new station table, $GEMTBL/stns/cnty_clst.tbl, containing the
	county clusters has been created.  The county cluster can be 
	displayed in NMAP/NMAP2 by clicking on the "County_Clust" overlay
	button in the "Map Selection" GUI.
    
VII. General Bug Corrections

    A.  Station Table Comment Handling (SPC)

	Corrected the problem where comments within the station listing
	(lines that begin with !) were not properly handled.

VIII. Calling Sequence Changes

    A. $GEMPAK/source/bridge/sv/svcntt.f, svghdr.f, svout.f
    B. $GEMPAK/source/nmaplib/nmp/nmpgmapattr.c
    C. $GEMPAK/source/bridge/dc/dcstns.f
    D. $GEMPAK/source/bridge/wn/wnout.f
    E. $GEMPAK/source/nxmlib/NxmExit.c
    F. $GEMPAK/source/gemlib/mr/mruadt.f, testmr.test
    G. $GEMPAK/source/gemlib/sn/snmman.f, snmspm.f
    H. $GEMPAK/source/programs/sn/snedit/snep2s.f
    I. $GEMPAK/source/programs/sn/snlist/snlfil.f, snllev.f, snlwmn.f, snlwsg.f
    J. $GEMPAK/source/bridge/ru/rudcd2.f, rudecd.f, rushdr.f, rustms.f,
                                rutmst.f, ruttaa.f, ruttbb.f, ruttcc.f
    

See the nawips.log and changes.log for additional details concerning
these routines.

IX.   Developers Note: ANSI C Prototypes Completed

      ANSI C prototypes have been added to the remaining N-AWIPS C code 
      in this patch.  Prototypes allow the compiler to verify that functions 
      have the proper number and type of arguments.  No FORTRAN code is 
      affected.  The introduction of prototypes does not affect
      functionality.

      If developers call routines that have been prototyped, they will get
      compiler warnings or errors if they have the wrong number or type of
      arguments.

      Prototypes have been added to the following applications:

      NALARM, NCLOLOR, NTL, NTRANS, NSAT, NWX, NMAP, NFAX


*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.c 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.c >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

