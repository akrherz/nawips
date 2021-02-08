			N-AWIPS 5.6.b Release Notes
				1/23/01	

Patch 5.6.b covers development from November 3, 2000 to January 23 
2001.  


USERS: PLEASE NOTE - NMAP2 READY FOR OPERATIONAL USE

NMAP2 is now ready for operational test and evaluation.  NMAP2 has  
capabilities that will not be added to NMAP including multiple loops, and the
display of various miscellaneous data types such as International SIGMETS,
AIRMETS, etc.  We plan to replace NMAP with NMAP2 in the future.  We therefore 
recommend that users evaluate NMAP2 in operations and provide us with 
feedback.  

Please note that users should exercise caution when using NMAP2 for product
generation with multiple loops loaded.  Having multiple loops with large number
of frames may exceed workstation memory and cause NMAP2 to crash.  The number
of loops and frames that can be loaded is a function of workstation memory 
as well as the amount of memory being used by other applications.

See Section III below for the most recent changes to NMAP2.

DEVELOPERS: PLEASE NOTE - PROTOTYPES ADDED TO C CODE

Prototypes have been added to some of the N-AWIPS C code.  See Section VIII 
below for important details.

*****************************************************************************

I. Product Generation Changes

    A.	NMAP/NMAP2 Product Generation Improvements

	1. Watch Generation (SPC)
	  
	   States are now turned on/off while editing the watch.  The
	   states included buttons were moved from the "Format Watch" GUI 
	   to the "Watch Specifications and County List" GUI.  The 
	   add/delete counties function now operates properly.

	2. Group Table (ALL)

	   The capability to specify a default line color based on the label 
	   value has been added to the group table:

	   $GEMTBL/pgen/grptyp.tbl

	   Directions for specifying the colors are included in the table.
	   For examples, see the settings for the outlook groups.

	   This table may now be modified to eliminate groups that are not 
	   being used locally or at a particular desk.  Remember, however, 
	   that the group name (GROUP) and the group number (GRPNUM) can not be 
	   changed in the table.  Any new group types MUST be coordinated
	   with the Computing Development Branch.

	   Note that NMAP/NMAP2 can read the old format of this table.

	3. Outlook Generation (SPC) 

	   Three changes have been made to the outlook generation to support
	   the traditional and new probabilistic outlooks:
	   
	   a) Five new group types have been defined (see above).  They
	      are TORNOUTL, HAILOUTL, WINDOUTL, TOTL_SVR and FIREOUTL.  Each
	      specifies a label list with colors.

	   b) The outlook category (group type) has been added to the 
	      "Format Outlook" GUI.  Any special lines with the specified 
	      group type will be formatted into the .dat file.

	   c) The .dat and .vgf file names reflect the specified group type
	      from the "Format Outlook" GUI.

	   d) Smoothing has been turned off by default for dashed lines with
	      arrow heads (special line type 20 and 21).

	4. VGF File Name Handling (HPC)

	   File append now uses the name of the first file by default when 
	   a second file is appended to the first.  The delete all action 
	   now keeps the name of the file after deleting its contents.  
	   Previously, the name was set to blank.

	5. Multiple Undo/Redo (MPC)

	   NMAP now keeps track of up to the latest ten product generation
	   actions.  Successive clicking of the Undo/Redo button will 
	   undo/restore up to 10 previous actions.  Note that the undo file 
	   .UNDO.vgf has been eliminated.

    B.  Product Generation Bug Corrections

	1. Text Window Problem with Multi-Select (HPC,MPC)

	   Corrected the problem where the text could not be seen in the
	   "Text Attributes" window when using multi-select editing.

II. NMAP Display Improvements

    A.  Load/Accept Buttons Combined in MAP Window (ALL)
	
	The "Load" and "Accept" buttons have been combined in the "Map 
	Selection" window.  If the window is invoked from the main NMAP
	window, then clicking the "Load" button alters the map immediately in 
	the display window.  If the "Map Selection" window is invoked from 
	the "Data Selection" window, then the clicking the "Accept" button 
	saves the new map attributes.  The new map is then loaded with the 
	data when the "Load" button is clicked from the "Data Selection" 
	window.

    B.  Model Data Selection in NMAP (HPC)

	The available model data are now sorted so that the most recent 
	cycle appears on the top of the scroll list in the "Data Source"
	GUI.

III. NMAP2

    A.  NMAP2 Improvements

	1. Maximum Number of Observation Types Increased (TPC)

	   The maximum number of observation types allowable under a category,
	   e.g., METAR, has been increased from 20 to 40.

	2. Model Data Selection (HPC)

	   The available model data are now sorted so that the most recent
	   cycle appears on the top of the scroll list in the "Data Source"
	   GUI.

    B. NMAP2 Bug Corrections

	1. Set Time Problems (ALL)

	   All known set time problems have been corrected.  Set time is
	   now available for all data types except grid and MOS.

    C.  NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g., satellite
           data are not implemented in NMAP2.

IV. Decoder Improvements

    A.  Severe Local Storm (SLS) Decoder Written (SPC)

	A new decoder, DCSVRL, has been written to decode SLS reports.  These
	reports can be displayed in GPMAP and NMAP2.

    B.  VTEC added to DCWARN (SPC)

	A check for Valid Time Event Code (VTEC) has been added to the 
	warning decoder, DCWARN.

    C.  International Sigmet Decoder (AWC)
      
	The tropical storm abbreviations, T.C., S.D., and SD have been
	added to the International Sigmet Decoder (DCISIG) as valid
	phenomena.

V.  General Improvements

    A. 	Extended Zoom Option (TPC)

    A new zoom option (extended) has been added to GEMPAK and NMAP/NMAP2 
    programs.  The extended zoom attempts to fill the entire display area.  
    It uses either the width or the height of the zoom box to define the zoom 
    area and fills the window, appropriately.  By contrast, the old zoom
    (non-extended) uses the corner points of the zoom box to define the
    zoom area which may not necessarily fill the window.  In GEMPAK programs,
    the extended zoom is enabled by setting the CURSOR variable to GAREAX before
    zooming with the box.  The extended zoom is used by default in NMAP/NMAP2. 
    It can be turned off by deselecting it under the Option pull-down.

    B. 24-hour Precipitation Accumulation for Surface Data (HPC)

    Added the capability to calculate and display 24-hour precipitation. 
    A new parameter, PR24, calculates the 24-hour precipitation.  Four 
    successive 6-hour precipitation amounts must be in the surface file to 
    calculate and display PR24.

    C.  Latitude/Longitude Label Display Options in GEMPAK Programs (MPC)

    Added the option to label latitude/longitude with N,S,E,W characters instead
    of the "-" for S and W values.  Also, added the option to specify the 
    latitude/longitude for the location of the labels.  See the help on the 
    GEMPAK LATLON for how to set these options and additional details.

    D. Compressed Radar Data Display (Unidata)

    Added the capability to display the compressed radar images that are 
    available on NOAAPORT.

    E. GIF Driver Satellite Color Allocation (AWC)

    Modified the GIF driver to use 95 instead of 128 colors for satellite 
    imagery.

    F. Fax Driver Fatal Error (AWC)

    The Fax driver was corrected to handle header strings with greater 
    than 30 characters.

VI. General Bug Corrections

    A.	Local Radar Navigation Problem (MDL)

    Corrected a small geographic displacement error when displaying local
    radar images.

    B.  NSAT Fatal Error on Linux (SPC)

    Corrected a fatal error on Linux where NSAT crashed with greater than
    50 enhancement curves.

    C.  NWX Null Character Handling (AWC)

    Corrected NWX to remove NULL characters from the middle of a text 
    report.

    D.  Date Time Processing Problem for Single Forecast Time Files (HPC)

    The GEMPAK variable, GDATTIM, is now properly processed if a range is
    specified for a single time grid file.

VII. Calling Sequence Changes

    A. $GEMPAK/source/gemlib/gr/grfixa.f
    B. $GEMPAK/source/gemlib/gg/ggdltn.f
    C. $GEMPAK/source/gplt/utility/gdrgrd.f
    D. $GEMPAK/source/appl/utility/gdrgrd.f
    E. $GEMPAK/source/cgemlib/cvg/cvgwritelm.c
    F. $GEMPAK/source/gemlib/gg/ggmisc.f, ggwarn.f
    G. $GEMPAK/source/cgemlib/ctb/ctbpllist.c
    H. $GEMPAK/source/programs/gp/gpmap/gpminp.f

See the nawips.log and changes.log for additional details concerning
these routines.

VIII.  Developers Note: ANSI C Prototypes Added 

      ANSI C prototypes have been added to some of the N-AWIPS C code to
      aid in software debugging.  Prototypes allow the compiler to verify
      that functions have the proper number and type of arguments.  No FORTRAN
      code is affected.  The introduction of prototypes does not affect
      functionality.

      If developers call routines that have been prototyped, they will get
      compiler warnings or errors if they have the wrong number or type of
      arguments.

      Prototypes have been added to the following
      libraries:
		cgemlib
		gemlib
		nxmlib
		nmaplib
		syslib
		bridge library
		all decoder programs
		all active device drivers

      Our intent is to add prototypes to the remaining C code routines in future
      patches.

      $GEMINC/gemprm.h contains the new prototype include files.  We also 
      combined undscr.h with uscore.h.  The uscore.h file is included in 
      $GEMINC/gemprm.h.  If developers have routines that include undscr.h, they 
      MUST remove that reference and replace it with $GEMINC/gemprm.h.

      $GEMINC/geminc.h MUST come before $GEMINC/gemprm.h in any routine that
      includes gemprm.h.  Note that geminc.h now includes all standard C
      libraries, e.g., stdio.h, and all Xm libraries.  (Note that Motif
      and the X windows libraries must be present on the platform for
      N-AWIPS to successfully compile).

      All N-AWIPS C code build scripts now use the ANSI-C option.  If 
      developers have their own build scripts, they MUST use the ANSI-C 
      option to compile the libraries which contain prototypes.

*****************************************************************************

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.6.b 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.6.b >&! PATCH_$NA_OS & ; tail -f PATCH_$NA_OS

The output of the script will be written to PATCH_$NA_OS.

Note that the build script removes files that have been eliminated in
this patch.  These files must be removed by hand if the build script
is not executed.  A list of removed files for each patch always appears
in the file: $NAWIPS/versions/remove.log.

