			N-AWIPS 5.6.f Release Notes
				12/6/01	

Patch 5.6.f covers development from November 1 to December 6, 2001.  

*****************************************************************************

I.   Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements

        1. Improved GROUP Action, Eliminated LABEL Action  (ALL)

	   The GROUP action has been re-engineered in 5.6.f.  It now allows
	   objects to be grouped as they are drawn.  The GROUP action also
	   allows objects to be added to an existing group.  The LABEL action
	   has been eliminated because its functionality is now part of the
	   GROUP action.  A complete description of the new GROUP action 
	   functionality is given in Section XI of these release notes and
	   is available in the on-line NMAP help, under 
	   "Product Generation-Group".

	2. Improved Symbol Palette Handling (ALL)

	   Any GEMPAK symbol in the Present Weather, Past Weather, Icing, Sky 
	   Cover, Turbulence, Special Symbols, Cloud Type, or the Pressure 
	   Tendency category can now be put into the "Symbol" class object 
	   palette.  The table: $GEMTBL/pgen/symbolbtn.tbl controls which 
	   symbols appear in the palette.  See this table for instructions 
	   on how to modify the "Symbol" palette.

	   IMPORTANT PLEASE NOTE:

	   Product generation palette icons for symbols, markers and 
	   turbulence symbols are now all located in $NAWIPS/icons/nmap.
	   The directories $NAWIPS/icons/marker and $NAWIPS/icons/turb
	   have been removed. 

	3. Added Watch Conference Call (WCC) Product (SPC)

	   The capability to generate the WCC text product has been added
	   to watch generation.  Click the "Generate WCC" button in the
	   "Watch Specifications and County List" GUI to create the text
	   product after clicking the "Create" button.  This invokes the
	   "Watch Conference Call (WCC)" GUI that allows specification
	   of the watch type, expiration time, phone number, and forecaster
	   name.  Click the "Format WCC" button to invoke the "WCC Save" GUI,
	   which lists the contents of the WCC product in an editable text box.  
	   Additional WFOs may be added to the text box for inclusion in
	   the text product.  Click the "Save" button to generate the text
	   file which is named: KNCFNIMNAT.  An additional file called
	   KNCFNIMNAT.launch is also generated which contains the
	   appropriate launch command and WFOs obtained from the product's
	   "ATTN..." line.

	   A new table, $GEMTBL/config/WCCphone.tbl contains the phone
	   numbers listed in the WCC GUI.

	4. Improved Watch Generation Processing (SPC)

	   An error message is now sent to the "ERROR" pop-up if a watch
	   contains more than 200 counties.  In addition, the "Watch 
	   Specifications and County List" GUI now properly expands to handle
	   a watch with a large number of WFOs so that they are all visible
	   in the GUI.   Finally, the inclusion of a county in the watch is  
	   no longer a function of whether the county centroid is located
	   within the county. 

	5. Added Icing Symbols (AWC)

	   The nine icing symbols have been added to the "Text" class.  Click
	   on the "Icng" object button under the "Text" Class.  The "Text
	   Attributes" GUI is invoked with an "Icng" pull-down containing
	   the icing symbols.  The selected ice symbol is plotted with
	   input text in the significant weather chart format.

	6. Added ITCZ and "Kinked" Lines (AWC)

	   The ITCZ Line (a double line) and the kinked arrow line have been 
	   added to the "Line" class to support the production of aviation
	   significant weather products.

	7. Added Markers (HPC)

	   The "Marker" class has been added to the product generation palette.
	   It includes all 22 GEMPAK marker types.

	8. Outlook Group Name Changes (SPC)

	   The outlook group names were changed from HAILOUTL, WINDOUTL, 
	   TORNOUTL to HAILOTLK, WINDOTLK, TORNOTLK as requested by the SPC. 

	9. Setting.tbl Table Changes for New Object Types (ALL)

	   The table, $GEMTBL/pgen/setting.tbl, has been modified to add
	   default settings for new objects added in this patch which
	   are the ITCZ line, the kink line, the marker class, and the
	   mid-level icing type.  Entries for these object types must be 
	   included in the setting.tbl in order to properly display them in 
	   product generation. 

    B.  Product Generation Bug Corrections

	1. Extra Point Problem with Modify Action (AWC, MPC) 

	   Corrected the problem where modify introduced an additional
	   point when clicking near an existing vertex. 

	2. Ghost Line Problem when Roaming (HPC)

	   Fixed the problem with the product generation ghost line getting
	   corrupted when attempting to roam with the ghost line present.

	3. Objects Not Selectable After Print Problem (HPC)

	   Corrected the problem where product generation objects could
	   not be selected after printing if a VGF was loaded in the
	   background.

	4. Product Generation Burn-In Problem (ALL)

	   Corrected the problem where product generation objects were
	   erroneously put into the background of the viewed frame if
	   product generation was exited with the "Map Selection" GUI
	   active.

II.  NMAP2 Display Improvements  

    A.  Cuban International Sigmets (AWC) 
	
	NMAP2 now has the capability to display the Cuban international
	Sigmets.

III. NMAP2 Bug Corrections

    A.  Wipe Data Erroneously Sets Map Defaults (MPC)

	Corrected the problem where clicking the wipe icon in the main 
	NMAP2 window always reset the main window back to the default
	map area.  Now, clicking this icon sets the main window
	to the default map only when images are included in the loop.

    B.	Set Time Problem with Images (TPC)

	Corrected problem where the "Set Time" function did not work
	properly in the "Data Selection" GUI when images being accessed
	were more than two days old.

    C.  Lightning Data Editing Bug (AWC)

	Corrected a problem where editing the symbol attributes improperly
	changed the marker type to a filled circle.

IV.  Decoder Improvements

    A.  MOS decoders (ALL)

	The MOS decoders, DCAMOS, DCMMOS, DCMOSA, DCMOSM and DCNMOS have
	been modified so that a new report for a station will overwrite
	and existing report.  Also, corrected the AVN MOS decoder, DCMOSA, 
	to properly handle parameters for the 6 and 18z cycles.

    B.  Marine Decoder (ALL)

	The marine surface decoder, DCMSFC, was modified to retain Sea Keepers
	call signs beginning with "KS" instead of "SK" that originate from
	KWUM, the University of Miami.

    C.  Improved Error Handling for DCSCD  (ALL)

	The supplemental climate data decoder, DCSCD, has been improved to 
	better handle badly formatted data that was causing the decoder to 
	go into an infinite loop.

V.   General Improvements

    A.	HPUX11 Now Supported (ALL)

	N-AWIPS is now supported for the HPUX11 operating system.  
 	To build N-AWIPS for HPUX11, create a hpux11 directory under
	$NAWIPS/exe and $NAWIPS/lib.  Compile flags must be properly set
	in the .cshrc file for HPUX11.  The files, .cshrc_5.6.f and 
	.profile_5.6.f contain the proper compile flags.  These files
	have been included in the top-level directory of the patch
	distribution for guidance.

    B.  Grid Programs Group High/Low Symbols with Labels (HPC, MPC, TPC)  

 	The grid programs, GDCNTR, GDPLOT2, and GDPLOT now automatically
	group high and low symbols with their labels for VGF production.
	This was done in support of the seamless surface analysis project.

    C.	Fill Patterns Added to GEMPAK Contouring Programs (MPC)

	Fill patterns including solid, slanted dashed lines, and slanted 
	solid lines, can now be specified for GEMPAK contouring programs.  
	These programs include GDCNTR, GDPLOT2, GDPLOT, GDCROSS, and SNCROSS.  
	The fill type is set in the GEMPAK variable FLINE.  Fill type 
	qualifiers follow the color qualifiers separated by the "/" symbol.  
	See $GEMHLP/fline.hl2 or type PHELP FLINE in any GEMPAK program for 
	additional details.

     D. Added New Fractional Visibility Parameter, VSBC (AR)

	A new GEMPAK surface parameter, VSBC, has been added which displays
	the visibility in whole miles and fractions rounded to the nearest
	1/16th of a mile.  For visibilities less than one mile, the value
	is displayed as a fraction.  For visibilities greater than one mile,
	the value is displayed as the integer value followed by a "-", followed
	by the fraction rounded to the nearest 1/16th of a mile, e.g., 
	"5-1/16".  The existing fractional visibility parameter, VSBF, works
	the same way for visibilities less than one mile, but for visibilities
	greater than one mile, it rounds the value to the nearest integer.

    E.  Hurricane Graphics Production Programs (TPC)

	The existing hurricane graphics production program, GPTPC, has been
	split into two programs, GPTPC and GPKGRF, in anticipation of making
	GPKGRF more user-interactive.  Numerous improvements have been made 
	to the code, both to correct bugs noted by the TPC and CDB and to
	create more accurate and better-looking plots.  GPTPC will now 
	generate four graphic products for the TPC.  They are:

		1. Wind swath plot
		2. Strike probability plot (Atlantic storms only)
		3. Wind intensity graph
		4. Wind speed table

	GPKGRF will generate only the track error watch/warn plot.
	An updated operating instructions document will be sent to the TPC 
	to describe the instructions for running GPTPC and GPKGRF.  The 
	GPTPC and GPKGRF program helps contain additional details.

    F.  NSHARP Improvements (Unidata, ALL)

	Corrected a fatal bug which occurred when clicking the map window
	before selecting the data set.  Added the standard N-AWIPS window
	title at the request of Unidata.  Also, all NSHARP routines have
	been properly prototyped.

VI.  Known Bugs

    A.  Print Offset Problem  (HPC)

	There are some occasions when printing product generation 
	graphics from NMAP/NMAP2 creates a "double" print of each
	element with a small offset.  This problem is not reproduced
	on a consistent basis.

    B. Default Button In Custom Map Definition GUI (ALL)

	The "DEF Content" button in the "Custom Map Definition" GUI
	does not work.  It is supposed to list the default map
	projection for selected geographic regions.

VII. Map and Table File Updates

    A.  Added Alaskan Aviation zone and FIRS Map Files (AR)

	Created the Alaskan aviation zone map, $GEMMAPS/hiznak.ncp and the
	Alaskan FIRS map, $GEMMAPS/hifiak.ncp files.

    B.  Added Alaskan VOR Points to VOR Station File (AR)

	Added the Alaskan VOR points to the VOR point station file, 
	$GEMTBL/stns/vors.tbl.

    C.  New Maps for Seamless Surface Analysis (HPC, MPC, TPC)

	Several new map files have been created to depict Center areas
	of responsibility for the seamless surface analysis program.
	The following map files in $GEMMAPS have been created:
	hpc050.ncp, mpc050.ncp, mpc215.ncp, tpc050.ncp, and tpc215.ncp.  The 
	letters correspond to each center and the numbers 050 and 215 
	correspond to 50 minutes and 2 hours and 15 minutes after the 
	analysis time.

    D.  County Map Correction for Incorrect California Counties (SPC)

	Corrected the county map file for California counties with
	improper boundaries.

VIII. Documentation Updates (ALL)

    The documentation for several NMAP/NMAP2 help files and table files
    have been improved.  Note that help files are accessed by clicking
    the "Help" button in the main NMAP/NMAP2 window and selecting the
    desired topic from the "Help" GUI.  Also note that the latest version 
    of the release notes is available in "What's New" help.

    A.  NMAP/NMAP2 Map Help and Supporting Table Updates

	Documentation for NMAP/NMAP2 help files and supporting tables 
	associated with the "Map Selection" GUI have been updated.  These
	are:

	1. Map-Selection Help

	   This help describes the "Map Selection" GUI.

	2. Map-Selection-Custom Help

	   This help describe the "Custom Map Definition" GUI.

	3. $GEMTBL/nmap/mapinfo.nmap

	   This table specifies the pre-defined areas listed in the 
	   "Map Selection" GUI.

	4. GEMTBL/nmap/mapovl.nmap

	   This table specifies the overlays and their default attributes
	   listed in the "Map Selection" GUI

	5. $GEMTBL/config/mapfil.tbl

	   This table specifies the alias names for N-AWIPS map files.

    B.  Selected Product Generation Help Files and Table Updates

	1. Product Generation-Basic Help 

	   This help briefly summarizes NMAP/NMAP2 product generation and
	   available operations.

	2. Product Generation-Group Help

	   This help describes the Group action in detail.  As noted
	   in Section I., the Group action has been re-engineered in
	   this patch.

	3. Product Generation-Modify Help

	   This help describes the Modify action in detail.

	4. $GEMTBL/pgen/symbolbtn.tbl

	   This table controls which GEMPAK symbols appear in the "Symbol"
	   object palette.

IX.  Calling Sequence Changes

    A. $GEMPAK/source/bridge/hc/hcdecd.f, hcout.f
    B. $GEMPAK/source/programs/gd/gdstat/gdywrt.f
    C. $GEMPAK/source/gemlib/gh/ghkgat.f, ghkgip.f, ghkglb.f, ghkgph.f,
			    ghkgtb.f, ghrdad.f, ghrdbd.f, ghrhst.f, ghsprb.f,
			    ghswlb.f, ghuhst.f, ghwrel.f
    D. $GEMPAK/source/appl/contour/gcfill.f
    E. $GEMPAK/source/gplt/contour/gcfill.f
    F. $GEMPAK/source/programs/gd/gdcntr/gdndsp.f
    G. $GEMPAK/source/programs/gd/gdcross/gdxlev.f, gdxdsp.f
    H. $GEMPAK/source/programs/gd/gdplot/gdblev.f
    I. $GEMPAK/source/programs/gd/gdplot2/gdblev.f
    J. $GEMPAK/source/programs/sn/sncross/snslev.f, snsdsp.f
    K. $GEMPAK/source/gemlib/in/infill.f
    L. $GEMPAK/source/bridge/is/isegts.f, ists.f
    M. $GEMPAK/source/cgemlib/cvg/cvgload.c

See the nawips.log and changes.log for additional details concerning
these routines.

X.  AWC Convergence (AWC)

    The following AWC programs have been integrated into the N-AWIPS 5.6.f
    baseline to facilitate convergence of significant weather production
    post-processing:

    A. GPLTLN
    B. GPANOT
    C. VGMOD
    D. VGGREP

XI. Group Action Detailed Description

    A.  Functionality

	The group action puts objects into pre-defined logical groups.  Grouping
	allows actions to be performed on a set of objects, for example, 
	a group of objects can be moved.  Grouping also allows assigning 
	meteorological "value" to a set of objects, for example assigning an 
	arrow line, hash mark, and a wind barb to the JET group.  Grouped 
	objects are used by various product generation functions to generate 
	products. For example, outlook text products are created using grouped 
	line and text objects. 

	The group action allows objects to be grouped as they are drawn, or 
	objects can be assigned a group after they are drawn.

	Valid groups supported by product generation are:

	CLOUD     TURB      FRONT     JETS      HIGH      LOW 
	OUTLOOK   LABEL     TROPICL   STNMDL    MRFSTN    HAILOTLK 
	TORNOTLK  WINDOTLK  TOTL_SVR  FIREOUTL  CATG_SVR  CCFP 

	NMAP/NMAP2 accesses the group names by reading the table 
	$GEMTBL/pgen/grptyp.tbl.  Note that new group names cannot be added 
	to the grptyp.tbl but must be coordinated with the Computing 
	Development Branch.

    B.  Operation

	Click on the "Group" button to either create a new group or add objects 
	to an existing group.  In either case, clicking on the "Group" button 
	puts product generation into group mode.  The "VG Group Selection" 
	pop-up is invoked and remains visible until the group mode is terminated.

	To create a group, click the "Group" button.  The "VG Group Selection"
	popup is invoked.  Select the desired group type, e.g., "Jets" from 
	this GUI.  Draw the desired objects as is normally done by selecting
	them from the product generation palette and placing them.  As objects 
	are drawn they are put into the group listed in the "VG Group Selection" 
	GUI.   A yellow box surrounding the grouped objects with yellow 
	triangles for each object vertex indicates which objects are being 
	grouped.  The left mouse button toggles whether a selected object is 
	in/not in a group when not drawing an object.  In this way, existing 
	objects can also be added to the group by clicking on them.  Click the 
	middle mouse button to end the current group.  A new group type can 
	then be selected for other objects or the middle mouse button is clicked 
	again to exit the group mode.

	To add to a group click the "Group" button.  Select an object in the 
	pre-existing group.  The group type in the "VG Group Selection" GUI 
	will list the group name for the selected object.  Add to the group by 
	selecting the desired objects from the product generation palette and 
	drawing or placing them.  The left mouse button toggles whether a 
	selected object is in/not in a group as described above.  Click the 
	middle mouse button to end the selected group.  A new group can then 
	be selected or click the middle mouse button again to exit the group 
	mode.

	Multi-select is the default select type while in the group mode.  
	Multiple objects can be selected for grouping by pressing the left 
	mouse button and dragging a box around the desired objects.

    C.  Rules 

	1.  Objects Which Cannot Be Grouped 

	    The Track, Sigmet, Watch and CCFP objects cannot be grouped.

	2.  Object Attribute Editing

	    Object attributes e.g., color, cannot be edited when an object is
	    selected while in group mode.

	3.  Line Labeling

	    The line and front labeling option in the "Line Attributes" and 
	    "Front Attributes" GUI is not available while in the group mode.

	4.  Group Assignment

	    The first group type found when selecting objects is used as the 
	    group type for all subsequent objects while in the group mode.  
	    If an object of a different group type is selected, its group type
	    will be changed to the type set for the group mode.

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.f 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.f >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

