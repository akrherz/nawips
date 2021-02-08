			N-AWIPS 5.5.c Release Notes
				07/7/00	

Patch 5.5.c covers development from June 1 to July 3, 2000.  

*******************************************************************

******  IMPORTANT PLEASE NOTE  *****

N-AWIPS 5.5.c is being delivered as a complete source delivery.  See
the installation note at the bottom for special instructions.

Version 5.5.c corrects NMAP/NMAP2 problems with handling un-remapped
satellite data that have been observed at the TPC and the SPC.  Other
corrections and improvements have been made to the software indicated
in the descriptions that follow.

********************************************************************

I. Product Generation Changes


    A. NMAP Product Generation Improvements

	1. Convective SIGMET Performance Improvement

	   The performance of the states-included calculation was 
	   improved at the request of the AWC.

	2. CCFP Changes

	   Removed the vector specification and graphic from the CCFP
	   at the request of the AWC.

	3. Label Color Option

	   Added an option to have labels automatically use the color
	   of the line, front, symbol, or circle they are associated
	   with.  Click on the "use LINE/FRONT/SYMBOL/CIRCLE color"
	   button on the respective object GUI to invoke this option.

	4. Text Attribute Change

	   Modified the text so that if the box type is changed and
	   the text string has not been previously entered for that
	   box type, it will use the latest text string entered.  
	   Previously, in this case a blank text string would 
	   appear.


II. NMAP Display Improvements	

    A.  Bad Frame Deletion 

	The bad frame deletion function added previously to NMAP2 is
	now available in NMAP. Bad frames can be marked so they are not 
	displayed as part of the loop.  To mark a bad frame, display it.  
	Select the "Bad Frame" entry from the Option pulldown.  
	Upon confirmation, the bad frame will no longer be displayed.  
	To re-display the bad frame, all of the frames must be re-loaded.


III. NMAP Bug Corrections

    A. 	Solaris Problem

	A core dump error found by Unidata on Solaris platforms for
	NMAP and NMAP2 was corrected.

    B.  Graph-to-Grid 
    
        Corrected problem where graph-to-grid improperly overwrites a 
	pre-existing grid file if the projection is changed without changing 
	the file name.

IV. Decoder Improvements

    A. Hurricane Decoder

    Enhanced the hurricane decoder, DCHRCN, to decode wind and sea 
    height, and the forecast track positions in latitude and longitude.
    These new parameters are now plotted in GPMAP and NMAP2.

    B. International SIGMET Decoder

    Modified international SIGMET decoder, DCISIG, to accept bulletins
    from GUAM beginning with WSPQ, instead of WSPQ2.

    C. Warning Decoder

    Improved the header decoding logic for the warning decoder, DCWARN,
    to be able to better handle warnings sent with incorrect headers.

    D. Aircraft Decoder

    Added the capability to ingest about 400 more NAVAIDS PIREPS by
    updating a table.


V. General Improvements

    A. Unremapped Image Handling

    Corrected GEMPAK, NMAP and NMAP2 software to properly save and
    restore navigation information for unremapped images.  This 
    correction solves the problems detected by the TPC and SPC.  

    B. ATCF Tracks Added to GPMAP and NMAP2

    Automated Tropical Cyclone Forecast (ATCF) tracks can now be
    plotted in GPMAP and NMAP2.  In GPMAP, a new variable, ATCF, 
    specifies the plotting attributes for the tracks.  In NMAP2,
    ATCF has been added to the miscellaneous data type category.

    C. Map File Updates

    The CWA, county, marine zone, and land zone maps were updated.

    D. GDINFO Maximum Number of Times

    The maximum number of times was not properly set in GDINFO causing
    it to fail in some cases.  This problem was found by the SPC and
    has been corrected.


VI. Known Problems

    A.  Auto-update 

        Auto-update occasionally fails to properly update when the skip 
        factor is greater than one.

    B.  Seek Function

	1. If the data set or map background is changed, the seek function 
	   exits.  Click on the seek function icon to restore its current 
	   settings.

    C.  Add/Delete Counties 

	If counties are added or deleted, these counties are not saved 
	correctly to the product text files if either the "Apply" button
	is clicked on the "FORMAT WATCH" GUI, or the watch is saved and
	issued later in a session.


VII. Calling Sequence Changes

    A.  $GEMPAK/source/bridge/wn/wnghdr.f
    B.  $GEMPAK/source/programs/gp/gpmap/gpminp.f
    C.  $GEMPAK/source/bridge/hc/hcdecd.f, hcghdr.f, hcout.f
    D.  $GEMPAK/source/device/draw/iarc.f


See the nawips.log and changes.log for additional details concerning
these routines.


VIII. NMAP2: Evaluation Version:

**** NOTE THAT NMAP2 SHOULD NOT BE USED TO CREATE OPERATIONAL PRODUCTS. ****  

NMAP2 continues to be made available to obtain user feedback.  Many 
bug corrections and improvements have been made in response to user 
feedback and CDB testing.

    A. NMAP functions NOT implemented in NMAP2

	1. The "stop" function is not implemented.

	2. Default data set selections for specific types, e.g, satellite
	   data are not implemented in NMAP2.


    B. NMAP2 Bug Corrections

	1. Fixed various problems with the hide/show working incorrectly
	   after auto-update.

	2. Fixed problem where the locator function was not properly 
	   updated when switching between loops.

	3. Fixed several problems with the time line not properly 
	   updating.


    C. NMAP2 Improvements

	1. Modified NMAP2 so that only one extra set of pixmaps is
	   stored when product generation is invoked.  In previous 
	   versions, an extra set of pixmaps was allocated for each
	   loop.  This allocation required significantly more memory
	   resources.

	2. Added the option to display the wind and sea height radii and
	   forecast tracks to the HRCN plot.

	3. Added capability to display ATCF graphics.

    D. NMAP2 Known Bugs

	1. NMAP2 will "burn-in" the product generation graphic in the
	   following scenario.  
		
		a. Start product generation before loading data.  
		b. Load data into more than one loop where one of the
		   loops has a roam factor set and a non-roamed loop
		   is in view. 
		c. Exit product generation.

            The VG file graphic remains on the last frame of the non-roamed
	    loop.  This "burn-in" problem only happens in this scenario.
		c. 
	   has a roam.  E


***********************************************************************

        	***** IMPORTANT PLEASE NOTE *****
		Special Installation Instructions for 5.5.c

The entire source tree is provided for version 5.5.c.  Therefore,
the entire system must be re-compiled and linked.  We have modified
the reference to all FORTRAN include files.  The string GEMINC: has
been removed in all FORTRAN routines.  The soft links in $GEMINC
have been removed.  The include files have been renamed to upper-case
names.  

To build version 5.5.c do the following:

	1.  Start with a "clean" account.  Remove all files
	    except the .dot files.

	2.  Un-tar the source file for version 5.5.c.

	3.  Execute the script $GEMPAK/build/patch_build_5.5.c
	    which compiles and links the entire system.

	4.  We have added the capability to display hurricane
	    ATCF graphics in NMAP2.  If you have these data,
	    you must set a new environment variable SPDATA in
	    the .cshrc_data and .profile_data to the directory
	    above the directory where these data reside.  Then
	    create the atcf sub-directory.

**** Note ****

If you have local GEMPAK applications that you need to re-compile,
then you MUST do the following:

	1.  Search all your FORTRAN routines and include files for 
	    the string GEMINC: and remove that string.  
	    
 	2.  Re-compile and link as normal.

We have provided a perl script called $NAWIPS/bin/searcher to 
help search and/or remove the GEMINC: from your local applications.
The searcher script searches for any string down a directory tree.

To search for the GEMINC: string down a directory tree, type:

	searcher GEMINC: .

To search and remove the GEMINC: string, type:

	searcher +r'' GEMINC: . 

Use this remove command with caution.  Please run the simple search
first.

This command will remove the string from all files from your current
directory and all sub-directories.


****************************************************************
