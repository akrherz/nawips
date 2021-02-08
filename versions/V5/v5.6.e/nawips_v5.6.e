 	
		     NAWIPS 5.6  CHANGE DESCRIPTION LOG

	( * indicates a change that makes this version of NAWIPS
	    incompatible with the previous version )

NOTE:  Affective 2/15/01, the initals in () signifies who approved the delivery.
	Previously these initials signified who made the delivery.


001.	ASCII Decoders

a	a. Changed the DCAIRM, DCNCON and DCWTCH decoders (airmets, 
	   non-convective sigmets, and watches/watch status, respectively) to
	   use the new C routine clo_dddec to retrieve locations using the vor
	   and anchor tables.  Done, DKW, (TP), 9/18/00.

a	b. Added checks for key words 'NR', 'STNR', 'STATIONARY', and the 
	   three type of MOV descriptions.  Also, removed unused variables.
	   Done, AH, (TP), 9/20/00.

a	c. Bug fix for watch decoder DCWTCH to increase maximum number of 
	   points allowed in status line.  Done, DKW, (TP), 9/27/00.

a	d. Created two new decoders, DCMOSA and DCMOSM, which decode the new
	   AVN MOS and the new MRF MOS, respectively.  Done, DKW, (TP), 9/29/00.

a	e. Fixed bugs in DCMOSM relating to (a) storing text report and (b)
	   change in MRF MOS data parm name.  Done, DKW, (TP), 10/6/00.

a	f. Modified international sigmet decoder DCISIG to fix a bug which
	   occurred when decoding a thunderstorm included as part of a 
	   tropical cyclone report.  Modified non-convective sigmet decoder
	   DCNCON to handle additional phenomena abbreviations.  Done, DKW,
	   (TP), 10/16/00.

a	g. The aircraft decoder dcacft is being modified to accept an
	   expanded set of bulletin headers for AIREPS and to improve time
	   checks and error checks.  Done, DKW, (TP), 10/23/00.

b	h. Cleaned up error handling for non-convective sigmet decoder DCNCON.
	   Fix for flight level processing in DCNCON and airmet decoder DCAIRM.
	   Done, DKW, (TP), 11/21/00.

b	i. Corrected a problem with the month and year of the end time.  If the
	   end time date was in the next month, the start time month and/year
	   was incorrectly used in the decoded $OBS/warn text file.  Simplified
	   WNSTSM, WNTORN, WNFFLD into a single routine to decode the starting
	   and stopping time and the counties for the warning decoder DCWARN.
	   Done, AH, (TP), 11/29/00.

b	j. Added check for VTEC (Valid Time Event Code) line in DCWARN.  (This
	   line will be implemented as a test in severe thunderstorm and 
	   tornado warnings issued by Charleston, WV, beginning 1/3/01.)
	   Done, AH, DKW, (TP), 12/6/00.

b	k. Added tropical storm abbreviations, T.C., S.D., and SD as valid
	   phenomena to the DCISIG decoder.  Done, AH, (TP), 12/7/00.

b	l. Added the Severe Local Storm Decoder DCSVRL.  Done, FY, DKW, (TP),
	   12/13/00.

b	m. Prototyped bridge library and all decoder programs.  Done, TP, AH,
	   (TP), 1/18/01.

c	n. Restructured the Severe Local Storm Decoder DCSVRL to disregard the
	   '$$' delimeter since there may be more than one county string between
	   delimeters.  Also, the county string may be missing before the first
	   delimeter.  Increased the maximum number of markers to be plotted
	   from 25 to 125 in GGWARN.  When more than the maximum number is 
	   reached, added code to stop plotting for that bulletin and print 
	   message.  Done, FY, (TP), 2/1/01.

c	o. Added parameters station name and issuing station name to  DC_STNS.
	   Replaced SVRTBL, WNRTBL, and associated common blocks with modified
	   DC_STNS in the Severe Local Storm Decoder DCSVRL and Warning Decoder 
	   DCWARN.  Updated calls to DC_STNS in DC_OSFC, DC_OSND, DC_OSNM, and
	   DC_OSFR.  Done, FY, (TP), 2/1/01.

c	p. The upper air decoder dcuair was modified to a) handle corrected data,
	   b) store parts PPAA and PPCC separately, c) decode and store 
	   tropopause and max wind data as separate parts, d) store raw text
	   (undecoded data), and e) skip duplicate reports which are not flagged
	   as corrections.  Snlist was modified to display parts PPAA and PPCC
	   and raw text.  Other sn programs were modified to handle parts PPAA 
	   and PPCC. Assorted minor modifications and bug fixes to mr (merge)
	   library.  Updated documentation.  Done, DKW, (SJ), 2/22/01.

c	q. The upper air decoder dcuair was modified to improve handling of
	   miscoded tropopause data.  Tropopause and max wind data is now 
	   included with merged upper air data, and snlist now displays parts
	   of TRPA, MXWA, TRPC and MXWC.  Done, DKW, (SJ), 3/2/01.

c	r. The upper air decoder dcuair was modified to decode dropsonde data.
	   Seven stations were added to the upper air table.  Done, DKW, (SJ),
	   3/15/01.

d	s. Fixed subscripting error in dcwtch decoder routine and nwx routine
	   wwcrnr.c which was flagged by -n32 switch.  Done, DKW, (SJ), 4/9/01.

d	t. The bridge directory ua and its contents are being removed.  Done,
	   DKW, (SJ), 4/10/01.

d	u. Minor changes bassed upon IRIX 6 -n32 compiler.  Done, TP, (SJ),
	   4/12/01.

d	v. Added the decoding of Coast Guard reports.  Done, FY, (DKW), 4/18/01.

d	w. Added the watch state abbreviation to the header line of the decoded
	   file in the Severe Local storm Decoder.  Done, FY, (DKW), 4/20/01.

d	x. This change to the metar decoder, dcmetr, allows the
           decoding of U.S. and Canadian stations which have the
	   same 3-character station identifier (e.g., KWST for the
	   U.S. and CWST for Canada).  (The U.S. data will continue
	   to be identified by the 3-character id, while the 
	   Canadian station with the same 3 characters will have a
	   'C' prepended in the decoded output.). Done, DK, (SJ) 
	   5/17/01.

d1	y. The upper air decoder dcuair was modified to decode ship (UU)
           data, and to improve precision in wind speed unit conversion.  
	   Table drop_parms.tbl is being added to enable station model
   	   editing for dropsonde data. Ship reports are treated as 
	   additional stations in the decoded output file.  Currently, 
	   the maximum number of additional stations allowed is 25. Done,
	   SC, DK, (SJ), 5/30/01.

e	z. Added Coast Guard reports with bulletin header SXUS86 to the marine 
	   surface decoder, DCMSFC.  Done, FY, DKW, 6/25/01.

e	aa. Added the decoding of WSPF21 international sigmet reports from NTAA 
	    to decoder, DCISIG.  Done, FY, (DKW), 6/27/01.

e	bb. Allowed for sigmet numbers with the prefix "NR" when decoding
	    international sigmet reports from NTAA, RJAA, and EGGY in decoder
	    DCISIG.  Done, FY, (SJ), 7/2/01.

e	cc. The marine surface decoder DCMSFC was modified to:  1)  not decode
	    reports from International SeaKeepers vessels (call sign of form 
	    'SKxxx', where xxx is any three numbers) unless the bulletin 
	    originator is KWUM.  2)  correct the calculation of the length for 
	    each section.  3)  ignore report IDs having the characters 'TEST'.  
	    4)  check for invalid values for the indicator of units of wind 
	    speed.  Done, FY, CCM, JA, (SJ), 7/6/01.

e	dd. Modified hurricane advisory decoder dchrcn to ouput additional
	    fields needed by the new TCM (Tropical Cyclone Marine) graphic.
	    Modified gg_hrcn to handle the additional fields.  Corrected help 
	    for parameter HRCN.  Done, DKW, (SJ), 7/17/01.

e	ee. Allowed for multiple phenomena without a terminator character in a
	    single NTAA international sigmet record and added search for " TS," 
	    as a valid phenomenon in decoder DCISIG.  Done, FY, (DKW), 7/20/01.

e	ff. The upper air decoder dcuair was modified to allow the decoding of
	    dropsondes from the NASA CAMEX4 project, which is scheduled for 
	    Aug. 15 to Sept. 24, 2001.  Done, DKW, (SJ), 7/26/01.

e	gg. Corrected code errors reported by Steve Chiswell, Unidata in several 
	    routines: Included GEMPRM.PRM in macgpt.f and macgwn.f which 
	    referenced RMISSD. Deleted setting local variable rtmp to RMISSD in 
	    macgwd.f. Replaced the variable length with lensf(1) in macgwa.f. 
	    Included GEMPRM.PRM in routine strlch.f which referenced RMISSD. 
	    Corrected testing for missing value of label frequency in intaxs.f. 
	    Corrected conversion of wind speed in knots to meters per second in 
	    SNEDIT routine snep2s.f.  Done, FY, (DK), 7/26/01.

e	hh. The upper air decoder dcuair was modified to handle a single digit 
	    observation number or zero value observation number for dropsondes.  
	    This is being done in anticipation of the NASA CAMEX4 project, which 
	    is scheduled for Aug. 15 to Sept. 24, 2001.  Done, DKW, (SJ), 8/13/01.

e	ii. Replaced the decoding of WND and WSP and added the decoding of WDR 
	    in the new MRF MOS decoder due to formayt changes.  Done, FY, (DKW), 
	    8/16/01.

e	jj. Expanded test for multiple phenomenon delimeter and expanded 
	    termination criteria for movement information for NTAA, RJAA, and 
	    EGGY international sigmet records in decoder DCISIG.  Done, FY, 
	    (SJ), 8/29/01.

e	kk. Fixed the international SIGMET decoder, DCISIG, to properly decode
	    New York Firs for tropical cyclones.  Fixed the label display for 
	    pressure and max winds if either one is not available for decoding.  
	    This bug was reported by the AWC.  Done, AH, (SJ), 9/14/01.


002.	GRIB Decoder


003.	Grid Diagnostics

a	a. Fixed two GDGRIB problems:  removed redundant success message and
	   allow a constant field with missing values.  Done, KB, (TP), 9/20/00.

e	b. Added checks in the graph-to-grid code for excessive intersections 
	   which would adversely affect gridded results.  Done, DP, (SJ), 9/18/01.


004.	Parameter Calculations


005.	Image Processing


006.	GPLT Changes

a	a. Removed gsdatt.f per AWC.  SD, SS, (TP), 9/12/00.

a	b. Fixed problem #375:P1 - model streamlines killing NMAP/NMAP2 on
	   IRIX5.  Done, MLI, (TP), 9/25/00.

a	c. Updated GTXSY and DTXSY to change a line feed to a carriage return.
	   Just like for GTEXT/DTEXT and GTEXTC/DTEXTC in delivery 006d.
	   Done, SJ, (TP), 9/29/00.

a	d. Added the ability to clip contours drawn to a VG output file.  The
	   clipping is done based on the graphics area defined.  This fixes a
	   problem reported by the MPC that the contour algorithm would not
	   clip contours from a graphics area that crossed the grid break for
	   a CED grid like the AVN or MRF.  Done, SJ, (TP), 11/1/00.

b	e. Added McIDAS computation of the radar navigation for local NIDS
	   radar images (from Jim Cowie).  Done, SJ, (TP), 12/20/00.

c	f. Fixed labelling of the 0 latitude and the 0 and 180 longitude lines.
	   When using the format that appends N, S, W, E to the lat/lon lines,
	   the Equator, Greenwich Meridion and the International Date Line
	   should not have the directions appended.  (Test report 425,
	   observations 1&2)  Done, SJ, (TP), 2/6/01.

d	g. Added logo IDs to allow potential logo selection and placement to be
	   loop specific in the future.  Done, JW, (SJ), 4/10/01.

d	h. Created a new (APPL/UTILITY, GPLT/UTILITY) function GFLBND to fill
	   a bound area.  Done, MLI, (DP), 4/20/01.

d	i. Corrected error return message when invalid bound is requested.  
	   Added missing Canadian island to world_bnds vgf, bnd, info files.  
	   Added last point to polygon array when drawing outline in gplt/gflbnd.
	   Created README file for mapfile-to-bounds conversion.  Done, DP, 
	   (SJ), 4/25/01.

d	j. Fixed CCLIP to stop turning closed lines near the edge of the plot
	   area into multiple lines.  Done, SJ, (DP), 5/10/01.

d1	k. Fixed a problem with plotting some Miscellaneous data types, e.g., 
	   watches.  Long segements were drawn incorrectly when overlayed on 
	   the local radar images. (This problem was reported by the SPC.)  
	   Done, SJ, (DP), 5/31/01

d1	l. Corrected an error introduced by previous delivery when plotting 
	   lat/lon and map lines on un-remapped images.  The routine was not
	   properly checking for missing values before calls to DLINE.  Also,
	   removed check for lines that "wrap" in the y-direction.  This
	   check was not necessary.  Done, SJ, (DP), 6/5/01.


007.	Device Drivers

a	a. Added the ability to output satellite images to the TIFF device
	   driver. The output uses 16 grays for the image.  To have the image
	   written to the TIFF file, the DEVICE parameter value is 
	   "tiff|prod_name||g".  The "g" flag sets the device to use the gray 
	   shades.  Done, AH, (TP), 9/27/00.

a	b. Modified the base date/time parameter in the RBK driver to allow the
	   use of the full GEMPAK date/time string.  Any missing parts of the
	   string will be supplied by the current system time.  Done, AH,
	   (TP), 9/27/00.

a	c. Corrected a few routines in the new GIF2 driver.  Also reconfigured
	   so that GIF is now called GDR and moved to the inactive area.  The
	   GEMPAK version, GIF2, is renamed GIF and remains in the active area.
	   Done, TP, (TP), 10/6/00.

a	d. Fixed GIF driver bug where background color improperly set for
	   satellite images.  Done, TL, (TP), 10/11/00.

a	e. Added a check when reading NIDS mosaic images for when an encoding
	   error has occurred and the data run is too long for the line of 
	   pixels in the image.  Done, SJ, (TP), 10/19/00.

b	f. Added check for DISPLAY in xinita.c.  Removed unused XW routines
	   (xsattbl.c & xsatdebug.c) and the corresponding include file
	   (satimg.h).  Done, TP, (TP), 11/13/00.

b	g. Added a check for the header string length in the fax driver.  It
	   will only allow 30 characters in the header description field.
	   Done, AH, (TP), 12/6/00.

b	h. Added the ability to display local radar images that have a WMO
	   header and/or is compressed using the ZLIB library.  Updated the 
	   necessary link scripts to include the ZLIB library.  Done, SJ,
	   (TP), 12/7/00.

b	i. Changed the color number of satellite image from 128 to 95 for
	   GIF driver.  Done, TL, (TP), 12/18/00.

b	j. Prototyped drivers and removed compile warnings found using the
	   new prototype header files.  Done, TP, (TP), 1/9/01.

b	k. Fixed an error in the vg driver which restricted the number of winds,
	   symbols, hash marks, and marks which could be written to a vg file
	   in a single operation.  Done, ES, (TP), 1/19/01.

c	l. Modified the GF driver so that when a new filename is given, the
	   current file is closed before the new one is opened without having to
	   exit the program.  Changed modified output filename so that the first
	   file  will not have a numerical extention enless a file is created 
	   with the same name.  Allow for the gf image size to be larger than
	   the geometry of the screen.  Done, AH, (TP), 2/12/01.

c	m. CVG library cleanup (Part 6 - additional).  Done, JW, (SJ), 2/21/01.

c	n. Created an XWP include file to hold global variables common to both
	   the PS and XW drivers.  This eliminates arnings on the SGIs.  Also
	   cleaned up some xw routines.  Done, TP, (SJ), 3/7/01.

c	o. Added CHNULL to end of filename in the GF driver.  Done, AH, (SJ),
	   3/26/01.

c1	p. Fixed the VG driver to close an open file if the user has requested
	   a new output file name. Done, SJ, (DP), 4/2/01.

d	q. Fixed the use of the parameter LENHDR in AEGRP and ACLOSP in the RBK
	   device driver.  Done, SJ, (DP), 4/9/01.

d	r. Added drawing of the NWS logo.  Added this to GPTEXT.  Fixed the 
	   color used for "white" in the NOAA logo for PostScript output.  
	   Done, SJ, (DP), 4/12/01.

d	s. Fixed a memory leak in crnexz.c.  Done, SC, SJ, (ES), 4/26/01.

e	t. Fixed VTEXT to save the appropriate text type value based on the
	   border type value from the text attributes.  Fixed a bug in computing 
	   the y-offset when plotting text at lat/lon locations in GPTEXT.  
	   Done, SJ, (DP), 7/19/01.

e	u. This release adds a reset of the pgen palette (if up) after canceling 
	   the map window (bug 470:P1).  It also includes the initialization of 
	   the delay value for loop animation.  This is a general cleanup item, 
	   but it may bear on the occasional rapid animation problem that has 
	   been observed from time to time on the sunos5 platform.  Done, ES, 
	   (DP), 7/31/01.

e	v. This release is a cleanup to the xmloop_loopSet routine for nmap2.  
	   Nmap is unaffected by this change.  Xmloop_loopSet used to include a 
	   parameter named pxmarry which was an array of ints which corresponded 
	   to the order of the pixmaps.  This is always in the order of 0 to the 
	   number of pixmaps.  It was included as a carry-over from the 
	   corresponding nmap routine xmloopSet(), where the pxmarry was probably
	   designed as a means to provide flexibility in loop layout.  Since we 
	   always build  animation loops 1 to n, the pxmarry[] parameter did not 
	   do anything other than add complexity.  Done, ES, (SJ), 8/14/01.

e	w. This release fixes bug report 476:P1.  A fatal crash resulted if pgen 
	   was active and the user loaded data and then hit the stop button.  
	   This problem has existed since version 5.6.d.  Done, ES, (SJ), 8/22/01.

e	x. This release fixes a data load problem in nmap2, which the sp file 
	   loading routines exposed.  Done, ES, (SJ), 9/21/01.


008.	Documentation

a	a. Updated the help file for DEVICE to include a statement that CLEAR
	   has no effect in the VG driver.  Done, SJ, (TP), 11/1/00.

a	b. Updated WhatsNew Help for nmap for release notes for 5.6.a.  Done,
	   SS, (TP), 11/6/00.

b	c. Updated WhatsNew Help for nmap and release notes for 5.6.b.  Done,
	   SS, (TP), 1/23/01.

c	d. Updated WhatsNew Help for nmap and release notes for 5.6.c.  Done,
	   SS, (TP), 3/26/01.

c1	e. Updated WhatsNew Help for nmap and release notes for 5.6.c.1.  Done,
	   SS, (TP), 4/3/01.

d	f. Updated WhatsNew, HotKeys Help for NMAP and release notes for
	   5.6.d.  Done, SS, (SJ), 5/22/01.

d	g. Updated release notes and WhatsNew help to better document
	   table changes.  Done, SS, (SJ), 5/23/01.

d1	h. Release notes for version 5.6.d.1.  Done, SS, (TP), 6/12/01.

e	i. Modified help text for the program CPCGSTN.  Done, SJ, (SS), 9/17/01.

e	j. Added procedures help to NMAP2 help.  Done, SS, (SJ), 9/20/01.

e	k. Minor corrections to NMAP2 procedures help.  Done, SS, (SJ), 9/24/01.

e	l. Updated WhatsNew Help for nmap and release notes for 5.6.e.  Done, 
	   SS, (SJ), 9/24/01.


009.	Scripts/NTS files

a	a. New MPC NWW3_gfdl restore files.  Done, JP, SJ, (TP), 10/4/00.

b	b. Added 543 dam thick contour in the a Nmap restore file.  Done, TL,
	   (TP), 11/29/00.

b	c. Added restore files used on the SP to create metafiles to the 
	   GEMPAK directory tree.  Done, SJ, (TP), 1/10/01.

b	d. Updated the test VG file.  The current file has not been able to be
	   loaded since at least version 5.5.c.  Done, SJ, (TP), 1/19/01.

d	e. MPC changes to nww3 sig_wave restores.  Done, JP, SS, (SJ), 5/10/01.


010.	General GEMLIB/CGEMLIB Changes

a	a. Added second phenomenon, pressure, max winds, phenomenon name,
	   latitude, longitude, and free text to sigmet info structure.
	   Increased MAX_SIGSTR.  Done, FY, (TP), 8/18/00.
	   
a	b. Updated N-AWIPS to version 5.6.a.  Done, TP, (TP), 9/12/00.

a	c. Created a function (CV_MDFY) which accepts a set of points to be
	   graphically modified, along with a set of points that have already
	   been clicked, and returns the resulting line set of points.  
	   Done, JW, (TP), 9/12/00.

a	d. Wrote new routine GG_NCON to be used to display non-convective
	   sigmets in GPMAP using the new GEMPAK variable NCON.  Done,
	   DKW, (TP), 9/12/00.

a	e. Modified clo_dddec.c function to check for an invalid distance
	   string.  Done, AH, DKW, (TP), 9/12/00.

a	f. Modified clo_dddec.c function to allow the user to specify the
	   maximum number of lat./lon. pairs to be returned.  Done, AH,
	   (TP), 9/15/00.

a	g. Modifed DUMPVGF and TESTVGF for handling previous VGF versions.  
	   Updated CVGDUMP for international sigmets and added unused1 and 
	   unused2.  Added swapping of missing pressure and max wind data 
	   which are not currently used in cvg_rdsig.  Done, FY, (TP), 9/20/00.

a	h. Fixed bug in IMCBAR.F for the horizontal color bar found during
	   RADMAP development.  Done, TP, (TP), 9/20/00.

a	i. Added the netCDF library to GEMPAK.  Done, RC, SJ, (TP), 9/22/00.

a	j. Added sort of CLO type by long. prior to performing calculations.
	   Done, DP, (TP), 9/25/00.

a	k. Fixed bug in GGCBAR.F with regards to resetting attributes found
	   during RADMAP development.  Done, TP, (TP), 10/2/00.

a	l. Fixed CCFP display bug.  Done, RC, (TP), 10/5/00.

a	m. Added smoothing levels to CV_MDFY function.  Done, JW, (TP), 10/6/00.

a	n. Removed unused files from cgemlib/cgr and removed all references
	   to cgr.h.  Done, ES, (TP), 10/10/00.

a	o. Adjusted the modification rules for open lines.  Done, JW, (TP),
	   10/11/00.

a	p. Created a common file to store the unit file number and the debug
	   option. Added FL_SWOP to AW_READ.  Created two new subroutines, 
	   to display several model's thickness and rh products.  Done, AH,
	   (TP), 10/11/00.

a	q. Fixed problem with the anchor or VOR end points that had '0-'
	   for the distance and direction, which would appear in the final
	   text product.  Done, AH, (TP), 10/23/00.

a	r. Fixed bug where hash marks in an input file are saved to another vg 
	   file, the hash marks in the output file did not have the same width
	   or line spacing as those in the original vg file.  Done, AH, (TP),
	   10/23/00.

a	s. Fixed the RECT navigation from a McIDAS file in IM_AR2GM.  Added
	   the calculation of the central longitude for use in the GEMPAK
	   MCD projection.  Done, SJ, (TP), 10/24/00.

a	t. Fixed bugs in CV_MDFY function (#390:P1&P4):  added line type as 
	   an input parameter to preserve the original line attributes and 
	   fixed indices of ghost line for modifying closed lines.  Done, JW,
	   (TP), 10/26/00.

a	u. Fixed #399:P1 & 393:P1 - the problem with undo and watches, and 
	   Delete All.  Done, ES, (TP), 11/1/00.

a	v. Fixed 404.P1. Originally, the ghost line may reduced to a single
	   crosshair while modifying a closed line.  Done, JW, (TP), 11/3/00.

b	w. Updated to version 5.6.b.  Done, TP, (TP), 11/13/00.

b	x. Adjusted the modification rules for CVMDFY function.  Originally,
	   the ghost line jumped to the original line (OL) when the last click
	   point (LCP) is within the tie distance (10 pixels) since LCP was
	   projected to OL. Now, if LCP is within the tie distance, the ghost
	   line will always follow the cursor and then ties to OL.  Done, JW,
	   (TP), 11/16/00.

b	y. Added coordinate system abbreviation variables to gemprm.h.  These
	   variables will be used in place of coordinate systems declared
	   locally in the C functions.  Done, AH, (TP), 11/17/00.

b	z. CVG library cleanup:  Removed unused substructures 'CntrType' &
	   'CentroidInfo' in vgstruct.h and the related CONTOUR_ELM case in
	   all corresponding functions.  Converted 'SymData' & 'WindData' 
	   substructures in vgstruct.h from multi-object elements to single 
	   element object.  Loops to process multiple symbols & winds were
	   also removed in 'cvgsvwnd.c' and 'cvgsvsym.c' functions.  These
	   represent CVG plans 1 and 2.  Done, JW, (TP), 11/17/00.

b	aa. CVG library cleanup:  Uncoupled cvg_cp from the crg library & 
	    revised error checking.  This reprsents CVG plan 7.  Done, JW,
	    (TP), 11/28/00.

b	bb. CVG library cleanup:  Expanded the function of cvg_rdele to include 
	    symbols, winds, and circles because after converting symbols and 
	    winds into single element objects (cvg cleanup part 1), they could 
	    be loaded in a single read operation.  All unnecessary read routines 
	    in the cvg library (cvg_rdsym, cvgrd_wnd, cvg_rdcir) could be 
	    removed now.  This reprsents CVG plan 4.  Done, JW, (TP), 11/28/00.

b	cc. New parameter PR24 and function PR_PR24 will be used to get the
	    observed 24-hour precip in inches by adding four successive 6-hour 
	    precip amounts.  Done, DKW, (TP), 11/28/00.

b	dd. Modified cgemlib routines in anticipation of adding fill ansi-C 
	    prototypes.  Modified three (3) compile scripts to change from
	    standard C compile (CC) to ansci-C compile (AC).  Done, TP, (TP),
	    11/30/00.

b	ee. Changed any device coordinate system abbreviations from local
	    declarations to global ones found in gemprm.h.  Added gemprm.h to
	    any files that required it.  Done, AH, (TP), 12/4/00.

b	ff. This represents the first phase of implementing full ansi-C
	    prototypes in our C code.  Done, TP, (TP), 12/6/00.

b	gg. Cleaned up compile warnings in the VF library found using the new
	    prototype header files.  Done, AH, (TP), 12/12/00.

b	hh. Cleaned up compile warnings in the CGEMLIB library found using the
	    new prototype header files.  Done, TP, (TP), 12/12/00.

b	ii. Fixed a problem in the cvg library when attempting to read a line or
	    front class element which contained greater than MAXPTS number of 
	    points was fatal on linux.  With this release the first MAXPTS of 
	    elements containing more than MAXPTS number of points are read, 
	    loaded and displayed on all platforms.  This release also adds some 
	    cleanup, reducing the duplicate reads, and restraining cvg_rdele 
	    from reading the entire element (including the header) as it used 
	    to do.  Done, ES, (TP), 12/13/00.

b	jj. Modified the search path for GEMPAK tables. Added two new 
	    environment variables $NCSITE and $NCDESK.  These will point to
	    directories maintained by the National Centers.  Done, AH, (TP),
	    12/13/00.

b	kk. Created a new routine cvg_writelm() in the cvg library to perform
	    the writing of any element of type VG_DBStruct to files.  Also,
	    changed VG driver accordingly to use this new routine by
	    constructing elements of type VG_DBStruct and passing into
	    cvg_writelm(), replacing the original calles to cvg_sv???() routines
	    which required passing of a clunky list of arguments.  This is
	    CVG library cleanup part 3b.  Done, JW, (TP), 12/13/00.

b	ll. Added the ability to have the lat/lon labels be displayed with either
	    a '-' for S and W values or to have the characters N, S, E, W
	    appended after the value.  Also, it is now possible to select
	    where to place the lat/lon labels.  Done, AH, (TP), 12/15/00.

b	mm. Modified functions in the GB library to remove warnings
	    associated with adding the C function prototypes.  Added the public
	    unctions to proto_gemlib.h and all of the private functions to 
	    gbcmn.h.  Done, SJ, (TP), 12/19/00.

b	nn. Moved setting the left, top, right and bottom values for a NIDS
	    radar image to above the first use of the variables.  SJ, (TP),
	    12/21/00.

b	oo. Removed check for "5" after "SDUS" for the NIDS radar products
	    with a WMO header.  Done, SJ, (TP), 12/21/00.

b	pp. CVG library cleanup (part 3c):  Modified pgen to use the new 
	    cvg_initelm() and cvg_writelm() routines and removed all calls to
	    old cvg_sv*() and cvg_writ() in pgen.  Done, JW, (TP), 12/22/00.

b	qq. Removed the checks in TG_RANG for 1 input time and for the
	    beginning and ending times equal. The first case occurs when
	    data in "forecast hour files" results in the range generating
	    only one time for the list of input times. The second occurs
	    when the data is not complete for the cycle and user has a
	    time range that is intended for the entire cycle. For example,
	    if the data is only out to F12 and GDATTIM=F12-LAST-12, then
	    the check would have caused an error.  Done, SJ, (TP), 12/22/00.

b	rr. Fixed bugs in modifying an unsmoothed open line. Originally,
	    modifying an unsmoothed open line may get unexpected or wrong
	    results.  Done, JW, (TP), 12/22/00.

b	ss. Added the include file AREAFL.CMN to IM_NIDH. This file stores the
	    McIDAS header information needed for operations such as zooming.
	    Done, SJ, (TP), 1/3/01.

b	tt. Removed the N value from the WIND and TYPE parameters.  Done, TP,
	    (TP), 1/4/01.

b	uu. Updated gpmap using SVRL parameter and nmap2 to display Severe Local 
	    Storms (SLS) watches.  Corrected the help file for the WARN 
	    parameter.  Done, FY, (TP), 1/4/01.

b	vv. CVG library cleanup (Part 5a/5b):  standardrize translation of old
	    VG element versions.  Done, JW, (TP), 1/9/01.

b	ww. Added the ability to change the text font, size, width and
	    software/hardware flag for the color bar label attributes.  Done,
	    AH, (TP), 1/9/01.

b	xx. Changed calling sequence for CTB_PLLIST to include a maximum # of
	    parameter aliases to return.  Reversed the order of the cycle times
	    presented in the data selection window (NMAP2) for grid and 
	    surf_fcst data.  Changed the data selection window to remain
	    managed when "Accept" is selected.  The Accept button applies the new
	    or changed data set, the Close button closes the window.  Done, SJ,
	    (TP), 1/10/01.

b	yy. Removed remaining warnings in our software.  Done, TP, (TP), 1/11/01.

c	zz. Updated N-AWIPS to version 5.6.c.  Done, TP, (TP), 1/30/01.

c	aaa. Created new routines dealing with clustered counties.  Done, DP,
	     (TP), 2/1/01.

c	bbb. Corrected an error in cvg_open and cvg_qkopen.  Changed the 3rd
	     parameter in cvg_open and the 2nd in cvg_qkopen to a pointer to
	     type FILE.  Done, AH, (TP), 2/6/01.

c	ccc. CVG library cleanup (Part 6):  Revised the CVG file access
	     paradigm for PGEN & VG driver.  Created two new functions cvg_write
	     & cvg_writef to replace the old cvg_writ & cvg_writelm.  Done, JW,
	     (TP), 2/12/01.

c	ddd. Created a new function to determine whether a given point is above
	     or below and left or right of a line (set of points).  Done, DP,
	     (TP), 2/12/01.

c	eee. Bug fix - change table opening routine in ctbccrd to cfl_tbop.
	     Done, DP, (SJ), 2/15/01.

c	fff. Changed Watch Status Message "from" line distances to statute miles.
	     Done, DP, (SJ), 2/21/01.

c	ggg. CVG library cleanup (Part 5c):  standardrize translation of old VG 
	     element versions.  Removed cvgrdwbx.c and cvgrdsig.c.  Created a 
	     package cvgrdoldele.c to be used in cvg_rdele() to ficilitate the 
	     reading of old version VG elements.  The translation from an older 
	     version to a later one is encapsulated and streamlined with a set 
	     of private functions such as cvg_v0_to_v1, which converts a version
	     n VG element to a version n+1 element.  Also detached the swapping 
	     functions for old version VG elements from cvgcrall.c and packaged 
	     into cvgoldswap.c.  Done, JW, (ES), 2/21/01.

c	hhh. CVG library cleanup (addtional):  In VG_DBStruct, "unused1" and 
	     "unused2" are actually used to represent the smooth level & version 
	     number.  So they are now renamed to meaningful "smooth" and 
	     "version."  All related library functions (CVG/CDS/CES/VG/PGEN) are
	     modified to facilitate this renaming in VG structure.  Done,
	     JW, (ES), 2/22/01.

c	iii. Fixed a bug in the last delivery of TI_FORM.  The check on the
	     string length of the input date/time was fixed.  Done, SJ, (DK),
	     2/27/01.

c	jjj. Added a group type column into setting.tbl and now get group type
	     attributes for vg elements from table instead of in the C codes.
	     Done, HZ, (DP), 3/6/01.

c	kkk. Standardized the extra space definitions within CRG library as a
	     larger EXTRA_SM (100) for lines/fronts/circles and a smaller
	     EXTRA (10) for other objects. Originally, these definitions
	     scattered inconsistently throughout the CRG library and were
	     smaller than needed.  Done, JW, (ES), 3/6/01.

c	lll. Moved group type related functions from nmap_pggrpw.c to CES 
	     library.  Done, HZ, (DP), 3/12/01.

c	mmm. Allowed the text size in a NMAP VGF to be modified correctly via
	     GPMAP.  Done, JW, (SJ), 3/12/01.

c	nnn. Fixed IRIX6 compiler warnings.  Done, TP, (SJ), 3/13/01.

c	ooo. Fixed logic for reading a station table with comments.  Done, SJ,
	     (DP), 3/13/01.

c	ppp. Minor changes to new ces routines - corrected return codes and 
	     values.  Added group table read check to test routine.  Added dump 
	     for SIGMET elements.  Done, DP, (SJ), 3/14/01.

c	qqq. Added the ability to load data from grid files that contain a storm
	     or volcano in the file name. This involved changing the method used
	     to read mod_res.tbl and increasing the size of the template string
	     in all necessary routines.  Added two new routines to the NGD
	     library to get a list of the storm/volcano names from the files in 
	     the data directory.  Added a new function, ST_SORT, to perform
	     various sorting options on an arbitrary array of strings.  Modified
	     datatype.tbl to add in new model data aliases (of note are the
	     VAFTAD and GHM). Reorganized and commented the table.  Done, SJ, 
	     (ES), 3/14/01.

c	rrr. Minor mods to grptyp.tbl processing code to increase readability.  
	     Done, DP, (ES), 3/16/01.

c1	sss. Updated N-AWIPS to version 5.6.c.1.  Done, SJ, (SJ), 4/2/01.

d	ttt. Updated N-AWIPS to version 5.6.d.  Done, TP, (TP), 4/9/01.

d	uuu. Removed cpg directory.  Done, TP, (SJ), 4/10/01.

d	vvv. Additions to the CLO library to accomodate future bounds ploting.
	     Done, DP, (SJ), 4/11/01.

d	www. Set the NAGRIB GRIB decoder to disregard PDS extension.  Done,
	     DP, (SJ), 4/13/01.

d	xxx. Added four CLO routines to uscore.h.  Done, DP, (TP), 4/17/01.

d	yyy. Added stronger error ckeck to clo_bstype when an invalid bounds 
	     name is input.  Done, DP, (TP), 4/20/01.

d	zzz. Added <eol> check to cst_wrap.  Done, DP, (TP), 4/20/01.

d	a1a. Made bug fixes and adjustments to the new bounds processing.  Added
	     the new bounds processing to GPMAP.  Done, DP, (SJ), 4/23/01.

d	a1b. Corrected bug in GG_WARN to handle corrections by allowing a start 
	     time diference of 15 minutes for warnings and 60 minutes for SLS 
	     watches for matching of correction reports.  Done, FY, (DKW), 
	     4/25/01.

d	a1c. Added two new grid diagnostics: BETA and DIVT(S,V). BETA is the
	     derivative of the Coriolis force wrt the y direction.  DIVT is
	     the divergence tendency.  Done, DM, SJ, (DP), 4/26/01.

d	a1d. Changed the check for finding the file to start searching for the
	     MISC data types from "gt" to "ge".  Done, SJ, (DKW), 4/27/01.

d	a1e. Fixed problems in the cloud height module.  Done, TL, (SJ), 5/1/01.

d	a1f. Added macro conversions for degrees-minutes to degrees-decimal
	     in gemprm.h.  Applied new macros to the CLO_FROM function.  Also
	     fulfilled AWC request that the order of points for line Intern.
	     Sigmets must be north to south or west to east.  Done, DP, (SJ),
	     5/1/01.

d	a1g. Added capability to plot CCf pgen elements in background as a 
	     single color.  Done, DP, (SJ), 5/1/01.

d	a1h. Added the "?" as a flag in the title to add the day of the week
	     to the time part of the title string.  Done, SJ, (DP), 5/1/01.

d	a1i. Modified gpmap and nmap2 to plot the ATCF tracks in the new format.
	     Done, FY, (DKW), 5/10/01.

d	a1j. Fixed problem where map files are inadvertently smoothed.  This was
	     noticed on the new Kelly Graphic.  Done, TP, (SJ), 5/10/01.

d	a1k. Fixed a typo in DP_TERM. The return code -2 should have been -5.
	     Fixed IN_PRMF to check for a packing table before trying to read
	     it.  This fixes a problem reported by the SPC that the error 
	     messages were not helpful when there was a problem with the file 
	     contents.  Done, SJ, (SS), 5/14/01.

d	a1l. Created a new routine, GG_ARC, to compute the points along an arc
	     of a circle.  Done, SJ, (DP), 5/14/01.

d	a1m. Fixed error in TESTGG for call to GG_ARC.  Fixed help for TITLE.
	     Done, SJ, (DP), 5/16/01.

d	a1n. Added needed system includes in scandir.c.  Done, TP, (SJ), 5/16/01.

d	a1o. Created a new routine (both Fortran - FL_TINQ - and C - CFL_TINQ)
	     to check for the existence of a table file and return the path to
	     a table.  Modified FL_TBOP and CFL_TBOP to call the new routines.
	     Fixed a bug in a previous change to IN_PRMF by using FL_TINQ. 
	     (Test report #441:p1)  Modified NGD_DSPL to look for the restore 
	     file in the table directories before using the default location.
	     Done, SJ, (DP), 5/16/01.

d	a1p. Fixed error in read statement in TESTGG for testing GG_ARC.
	     Done, SJ, (DP), 5/16/01.

d	a1q. Watches within 90 minutes of expiration time are now
	     displayed in NMAP2 and gpmap using a different (short
	     dashed) line type than other watches.  Valid time for 
	     watches is displayed by default in NMAP2.  Done at
	     request of SPC. Done, DK, (SJ), 5/17/01.

d1	a1r. Updated to version 5.6.e.  Done, SS, (SS), 5/30/01.

d1	a1s. Cleaned up unused parameters and intialized return variables
	     in the VF library which is used to generate SPC watch products.
	     This clean-up does not affect functionality.  Done, AH, (SJ),
	     5/30/01.

d1	a1t. Modified the ATCF plotting routine used by GPMAP and NMAP2 to
	     plot the latest storm name given by the CARQ field in the 
	     ATCF file.  Previously, the plotting routine did not use the
	     storm number initially assigned.  Done, FY, (DK), 5/31/01.

d1	a1u. Wrote a new string function which gets tag data from a string
	     containing many tags.  Tag names are enclosed by < > characters
	     and the tag data immediately follows.  The new function has
	     been added to the test program testcst.  Done, DP, (SJ), 
	     5/31/01.

d1	a1v. Improved error processing for string function that processes
	     tag data.  Done, DP, (SJ), 6/5/01.

d1	a1w. Changed version to 5.6.d.1 for mini patch.  Done SS, (SS),
	     6/7/01.

e	a1x. Updated to version 5.6.e.  Done, TP, (TP), 6/25/01.

e	a1y. Modified gpmap and nmap2 to plot tracks for all forecast hours in 
	     the ACTF file.  Done, FY, (DKW), 6/25/01.

e	a1z. Added the ability to change the colors in the track/warning graphic,
	     swath graphic, probability graphic and the wind speed graphic in 
	     program GPTPC.  Done, AH, (DKW), 6/25/01.

e	a2a. Built a new library for handling stored procedures files (SPF),
	     which will provide a mechanism to save and reload data and map
	     settings for NMAP2.  Part I.  Done, JW, (ES), 6/25/01.

e	a2b. Initialized variable before read.  This eliminates over 62,000
	     purify warning messages.  Done, TP, (ES), 6/27/01.

e	a2c. Separated the reading of the watch files from the drawing of the
	     elements in GG_WTCH.  The files are read into common using 
	     GG_WCUR.  Created GG_INFO to find the watch information for a 
	     given watch number.  Done, AH, (DP), 6/28/01.

e	a2d. Per AWC request, change definition for ordering of points of SIGMET 
	     line type "from" lines.  Points within the "from" line should always 
	     be ordered in a north-to-south direction, unless all points are 
	     within 0.1 degrees lattitude of one another in which case the points 
	     should be ordered west-to-east.  Done, DP, (SJ), 7/2/01.

e	a2e. Corrected a bug found in problem report #449:P1. Modified the code
	     so that the red pixel value can be set to 0 as a color setting.
	     Done, AH, (SJ), 7/2/01.

e	a2f. Added functionality in NMAP2 to save data settings into an SPF
	     file for later user-specific restoring. (part II)  Done, JW, (ES),
	     7/3/01.

e	a2g. Corrected the calling sequence protoype for GG_WTCH.  Done, AH, (TP),
	     7/9/01.

e	a2h. Changed the length of 4 character variables from 48 to 160 in
	     inoutt.f so that longer output names may be used in SFLIST.
	     Increased the output filename length in SFEDIT. In the cds functions,
	     changed the symbol size and the arrow head size comparisons from 
	     integer to real numbers.  Done, AH, (SJ), 7/10/01.

e	a2i. Added a check for a time string which is not in standard GEMPAK
	     format.  Done, AH, (SJ), 7/12/01.

e	a2j. Revised the computation of the divergence tendency to use the first
	     principles of the divergence tendency equation.  Done, AH, (SJ), 
	     7/12/01.

e	a2k. Removed unused code from the routine GH_WGRF.  It caused a 
	     compilation warning as reported by Steve Chiswell.  Done, AH, (SJ),
	     7/12/01.

e	a2l. Changed GPTPC to: a) correct problem with track error envelope when 
	     adjoining track lines have almost identical slopes; b) remove space 
	     after filename type in cfl_tbop call for color table; use cfl_tinq 
	     to determine file byte size.  Done, DKW, AH, (SJ), 7/17/01.

e	a2m. Added checks for minutes (NN) in the file name templates to the file
	     name generation routines, FL_MFLS and FL_MFIL.  Done, SJ, (DP), 
	     7/18/01.

e	a2n. Fixed a bug in two CLO routines, where they would return, if 
	     possible, one more item than the input maximum would specify, 
	     thereby possibly overwriting data.  Done, DP, (SJ), 7/19/01.

e	a2o. Created a subroute that uses a table, channel.tbl, to translate the
	     satellite channel string to a channel number.  Done, AH, (SJ), 
	     7/20/01.

e	a2p. Wrote new routines GG_TC.. to be used to generate tropical cyclone
	     marine graphics in GPMAP using the new GEMPAK variable TCMG.
	     Done, DKW, (SJ), 7/23/01.

e	a2q. Added plotting of the QuikScat wind data to GPMAP and NMAP2.  
	     Added popdown of the color selection palette when the misc data edit
	     box is popped down.  Done, SJ, ES, (DKW), 7/24/01.

e	a2r. Changed the routine IM_NIDH to use the Scan date/time instead of a
	     mix of the Product time and the Scan date. (Fix in response to 
	     attached e-mail from Unidata.)  Done, SJ, (DKW), 7/24/01.

e	a2s. This release updates the group table information in the dumpvgf 
	     program as noted in Observation 1 of 021a2g delivery.  Done, ES, 
	     (SJ), 7/27/01.

e	a2t. Added a check to GG_WARN for the total number of warnings.  The
	     number of warnings processed is now limited to 1000 (NW).  
	     Decreased NW from 5000 to 1000 and NC from 125 to 100.  The 
	     original dimensions caused a stack overflow error and a crash
	     during execution on HPUX 11. This problem was noted in Purify
	     on HPUX 10, but did not cause a crash.  Done, SJ, (DKW), 8/13/01.

e	a2u. The PGEN watch element was changed to explicitly include the county
	     FIPS code.  Done, DP, (SJ), 8/22/01.

e	a2v. Fixed CTB_ASTN to be able to read station tables that have four
	     character station IDs. Also, allow for blank station IDs.  Done,
	     SJ, (ES), 8/27/01.

e	a2w. Fixed bug in recent watch upgrade - increment watch version number.
	     Done, DP, (DP), 8/27/01.

e	a2x. Fixed garbage in mean storm motion vector with old watches problem.
	     (#479:P2)  Done, DP, (SJ), 8/29/01.

e	a2y. Forced "imbswp = 0" in functions where byte swapping is not per-
	     formed.  This fix is in response to an SPC encounter with swapped 
	     satellite data followed by loading of radar data.  The subsequent 
	     load resulted in a memory allocation error.  Done, DP, (ES), 9/5/01.

e	a2z. Increased length of "states" string in watch element to allow for 
	     more states (at least 25).  Similar increase in watch post-processing
	     include file.  These changes will allow for correct processing of 
	     watch element information when the watch covers more than 6 states.
	     Done, DP, (ES), 9/6/01.

e	a3a. Fixed problems when reading GEMPAK station tables using the C
	     function CTB_ASTN. Fixed the formatted read in CTB_ASTN.  Also,
	     modified some station tables to standardize the entries to have
	     all columns of information filled.  (Test report 480: P1, P2, O1, 
	     O2, O3).  Done, SJ, (DP), 9/12/01.

e	a3b. Added a new parameter conversion function, PR_QUOT, to compute the
	     ratio of two numbers.  This will be used for the HPC Winter Weather 
	     Desk products.  Done, KB, SJ, (DP), 9/12/01.

e	a3c. Added new wind chill temperature function to PR library.  Added 
	     two unit conversion functions to PR library.  Removed an errorneous 
	     PR function from PR library.  Done, TL, (SJ), 9/14/01.

e	a3d. Converted user input cycle into a standard GEMPAK time to allow
	     1 cyle to be plotted in grid applications.  Done, TL, (SJ), 9/17/01.

e	a3e. Set wind chill temperature no greater than air temperature.  Done,
	     TL, (SJ), 9/20/01.


011.	General GEMPAK Program Changes

a	a. Fixed a bug which caused GDPLOT2 to crash on IRIX and HPUX when
	   GAREA is set to be blank.  Done, TL, (TP), 10/5/00.

a	b. Modified RADMAP so that it now links to the GEMPAK version of the 
	   GIF driver.  Done, TP, (TP), 10/6/00.

a	c. In SFCHCK, modified arrays "string" and "head" from 132 to 512
	   characters.  Done, RC, (TP), 10/19/00.

a	d. Output grids with the default value to a grid file if the contour
	   file contains no data in graph-to-grid applications.  Done, TL, 
	   (TP), 10/23/00.

a	e. Added a second header line to sfchck output to allow display of
	   hours, days and hours, or hours and minutes, depending on time
	   intervals for surface data.  Done, DKW, (TP), 10/24/00.

b	f. Cleaned up radmap.  Done, TP, (TP), 11/15/00.

b	g. Retrieve map projection from the grid navigation block when garea
	   is set to grid or dset, and projection is blank.  Done, TL, (TP),
	   11/28/00.

b	h. Fixed bug on IRIX5 for GDINFO applications.  The problem occurred
	   when gdfile was set to blank or any grid data.  Done, TL, (TP), 
	   12/6/00.

b	i. Increased input string length for GDPLOT2 applications per AWC's
	   request.  Done, TL, (TP), 12/18/00.

b	j. Final operational RADMAP tweaks delivered.  Done, TP, (TP), 1/5/01.

b	k. Added computation of extended zoom area to GEMPAK and all GUIs.
	   Reset central longitude for CED/MER/MCD projection.  Done, TL, (TP),
	   1/9/01.

b	l. Fixed problem report #421:O1.  Added a check for a blank grid file
	   name in GDINFO.  Done, SJ, (TP), 1/18/01.

c	m. Prototyped avnbul, busy, freecolors, sfcsplt, and spctxt.  Done,
	   TP, AH, (TP), 2/8/01.

c	n. Updated all GD display programs, GDDIAG, GDCFIL and CPCLIST to
	   allow the use of the single time forecast grid files through an
	   alias. Also made a small fix to DG_MFIL to allow the following
	   format of the input: GDFILE=eta|010305/0000.  Done, SJ, (DP), 3/7/01.

c	o. Fixed bugs from test report #428. Properly declared correct strings
	   in GDPLOT and CPCLIST.  Done, SJ, (SJ), 3/22/01.

d	p. Added PDSEXT parameter to the NAGRIB program.  Done, DP, (SJ), 5/4/01.

d	q. Restructured SFGRAM in a way that multiple files can be accessed
	   and displayed on a single plot.  Done, TL, (SJ), 5/15/01.

d	r. Wrote new program GPTPC generates five hurricane graphics for the TPC.
	   They are:
	   (1)  Track error watch/warn plot
           (2)  Wind swath plot
	   (3)  Strike probability plot (Atlantic storms only)
	   (4)  Wind intensity graph
	   (5)  Wind speed table

           Done, AH, DK, (SJ), 5/17/01.

d	s. Added a flag to GPTPC to check if GEMPAK color purple has been
           changed to grey. If so, then it will be changed back to it's 
	   original color before GPTPC exits. Done, AH, (DK), 5/17/01.

d	t. Fixed a bug in GDPLOT2 reported by Fiona H. at the TPC. The
           bug is that GDPLOT2 would not display data when a double
	   time was input for GDATTIM, such as:
	   GDATTIM = 010511/0000F000:010517/0000F000
	   Done, SJ, (DP), 5/17/01.

d1	u. Changes to GPTPC (hurricane graphics for TPC), to:
	
	   a) Correct problems found with stationary or near-stationary
	   storms; b) improve calculation of map area and placement of
	   legend box and track labels; c) handle dissipating storms;
	   d) display breakpoints for sounds and bays; e) add a storm name 
	   file; f) correct other minor bugs and clean up code; 
	   g) rename GPTINP and GPTOPT to GPPINP and GPPOPT respectively, 
	   to avoid name duplication with GPTEXT routines.  Done, DK, AH,
	   (SJ), 6/7/01.

e	v. Added capability of plotting special symbols as an option in the HILO 
	   parameter when countouring gridded data.  Done, DP, (SJ), 6/25/01.

e	w. Restructured GDCNTR in a way that multiple and single grid files
	   can be fully accessed.  Done, TL, (SJ), 6/27/01.

e	x. Restructured GDCROSS and GDDIAG in a way that multiple and single
	   grid files can be fully accessed.  Added time loop and enabled keyword
	   inputs, e.g., first, all, for GDCROSS grid time.  Done, TL, (SJ),
	   7/6/01.

e	y. Restructured GDLIST and GDMAP in a way that multiple and single
	   grid files can be fully accessed.  Added time loop to GDLIST.  
	   Done, TL, (SJ), 7/17/01.

e	z. Restructured GD applications in a way that multiple and single grid 
	   files can be fully accessed.  Done, TL, (SJ), 8/13/01.

e	aa. Fixed a problem which caused segmentation fault in SFLIST when
	    trying to list text or special report from a station which is not
	    found in the station table.  Done, TL, (SJ), 8/27/01.

e	bb. Fixed a color fill problem which does not fill a contoured interval
	    when only one contour is to fill in the grid domain.  Done, TL, (SJ),
	    8/30/01.

e	cc. Created a new GEMPAK text interface program, CPCGSTN, that lists 
	    all stations in the data file, and indicates which stations are 
	    located inside of the specified area.  The stations are retrieved 
	    from an input station data file.  The area is specified by an input 
	    vg file which contains one or more polygons drawn in the line type 
	    with tick marks.  The tick mark indicates which side of the line 
	    exhibits the given area.  If the polygon is open but intersects with 
	    the border of US, create the US bounds file, and construct a new 
	    closed polygon from the original polygon plus a portion of the US 
	    border.  The output include the stations id number, GEMPAK time, the 
	    flag indicating if the station is inside (1) or outside (0) of the 
	    polygon, and the polygon color.  Done, MLI, (SJ), 9/10/01.


012.	General GUI Modifications

a	a. Modified NxmBxmBtn_createMulti to change Button Release event to 
	   ButtonPress event.  Fixes problem where edit box was over drawing 
	   pallete, which led to inadvertent triggering of a PG buttton.
	   Done, ES, (TP), 9/25/00.

b	b. Cleaned up compile warnings in the NMAPLIB library found using the
	   new prototype header files.  Also, added prototypes for the NXMLIB
	   library and the XW driver library.  Modified existing prototype 
	   includes.  Done, TP, (TP), 12/14/00.

b	c. Cleaned up and standardized include files and removed compile
	   warnings in NPROGS found using the new prototype header files.
	   Done, TP, (TP), 12/20/00.

b	d. Cleaned up and standardized include files and removed compile
	   warnings in GUI programs found using the new prototype header files.
	   Also removed remaining pesky warnings from clo and pgen.
	   Done, TP, (TP), 1/2/01.

b	e. Fixed timing conflict with busy program on fast machines.  Done,
	   ES, (TP), 1/12/01.

b	f. Added extended zoom to option pull-down menu on Nmap/Nmap2.  The
	   default is "ON" for extended zoom.  No extended zoom for NSAT.  Bug
	   fix for extended zoom computation.  Done, TL, (TP), 1/17/01.

c	g. Prototyped NALARM, NCOLOR, NTL.  Done, TP, AH, (TP), 2/1/01.

c	h. Moved private functions from proto_nxmlib.h to their respective
	   files and cleaned up.  Done, TP, (TP), 2/7/01.

c	i. Fixed the damage wrought by the 2/13/2001 change to the parm list
	   in NxmExit_create.  Done, ES, (SJ), 2/26/01.

c	j. Modified naltxt.c to eliminate linker warning on HP.  Done, TP,
	   (SJ), 3/7/01.

d	k. Minor changes to NXMLIB based upon IRIX -n32 compiler messages.  
	   Done, TP, (SJ), 4/9/01.

d	l. Minor changes to NTL based upon IRIX -n32 compiler messages.  Done,
	   TP, (SJ), 4/10/01.

d	m. Minor changes to NCOLOR based upon IRIX 6 -n32 compiler.  Done, 
	   TP, (DP), 4/18/01.

d	n. Minor changes to BUSY based upon IRIX 6 -n32 compiler messages.
	   Done, TP, (DP), 4/20/01.

d	o. Fixed bugs in Busy reported by Steve Chiswell (Unidata).  Done, SJ,
	   (ES), 5/2/01.

d	p. Removed some old_protypes found by the SUN compiler.  Done, TP, (SJ),
	   5/10/01.

d1	q. Updated NTRANS, NWX, NFAX, and NALARM routines with string frees
	   for XmString and XmStringTable calls to avoid memory leaks.  This
	   update does not affect functionality.  Done, JW, (ES), 5/30/01.

d1	r. Fixed naltxt.c memory allocation/free bug.  Done, TP, (ES), 6/26/01.

e	s. Fixed core dump on HPUX11.  Done, TP, (SJ), 8/13/01.

e	t. This release bumps the maximum number of available lines for the Help 
	   window in nmap/nmap2 from 500 to 2000.  Last release the release notes 
	   (the What's New menu selection) exceeded 500 lines, causing some FUD 
	   related issues.  Done, ES, (TP), 8/29/01.


014.	NTRANS

a	a. Increased the number of files per directory in NTRANS from 100 to
	   200.  Done, GG, SJ, (TP), 10/17/00.

c	b. Prototyped NTRANS.  Done, TP, AH, (TP), 1/31/01.

d	c. Minor changes based upon IRIX -n32 compiler messages.  Done, TP, (SJ),
	   4/10/01.

d	d. Fixed printing of multi-panel frames when each panel needs different
	   byte flipping flag values set.  Also, fixed a problem with the check 
	   for the max number of files per directory.  Done, SJ, (ES), 4/26/01.

e	e. This release fixes problem 447a:P1, a fatal ntrans bug.  NTRANS 
	   segfaulted after selecting "Arrange/Auto-Group" and then clicking in
	   the main canvas area.  This fix makes the "Arrange" menu unavailable 
	   until data is selected.  Done, ES, (SJ), 7/10/01.


015.	NSAT

b	a. Changed county map designation in NSAT, hicnus.gsf is no longer 
	   supported.  Done, TP, (TP), 11/21/00.

b	b. Fixed a memory leak in nsat that was identified by Mike Kay (SPC).
	   Done, ES, (TP), 12/4/00.

b	c. Request from the SPC to change the y-location of the data
	   selection popup in NSAT to be higher on the screen.  Done, SJ,
	   (TP), 12/22/00.

c	d. Prototyped NSAT.  Done, TP, AH, (TP), 1/30/01.

d	e. Minor changes based upon IRIX -n32 compiler messages.  Done, TP, (SJ),
	   4/10/01.

e	f. Fixed core dump on HPUX11.  Done, TP, (SJ), 8/13/01.


016.	NWX

b	a. Modified NWX to remove NULL characters from the middle of a report.
	   Also fixed the calling sequence to dttm_cpy to have the output
	   parameter be a pointer.  Done, SD, SJ, (TP), 12/6/00.

c	b. Prototyped NWX.  Done, TP, AH, (TP), 1/31/01.

c	c. Increased REPMAX from 20000 to 80000 per the SPC. The limit on the
	   number of characters in a bulletin received by NOAAPORT will be 
	   rising to 80000.  Removed an unnecessary array of strings.  The
	   extra array was used to reorder a set of watch bulletins.  The 
	   reordering is now done in the same array of strings.  Done, SJ, (DP),
	   2/26/01.

d	d. Minor changes based upon IRIX -n32 compiler messages.  Done, TP, (SJ),
	   4/10/01.

d	e. Fixed bug in NWX.  Done, TP, (SJ), 4/26/01.

d	f. Fixed srchw.c per Steve Chiswell.  Also, updated NWX tables based
	   upon his e-mail.  Done, SC, TP, (DKW), 4/27/01.

e	g. "Purified" NWX.  Fixed memory leaks and uninitialized memory warnings.
	   Done, TP, (ES), 6/28/01.

e	h. At the request of the SPC:  1. In NWX, reordered the special 
	   observations so that they are in reverse chronological order, like the
	   METAR observations.  2. Removed the leading spaces on the special obs 
	   so that they are aligned with the METAR obs.  Also, fixed the display 
	   of the specials to not break the report at 80 characters.  The full 
	   report is put back together before display. This was changed in NWX 
	   and SFLIST.  Done, SJ, (DP), 8/29/01.


017.	NSHARP

e	a. Added the program NSHARP, from UNIDATA, to the nprogs source tree.
	   Done, SJ, (SS), 7/20/01.
   

018.	NMAP

a	a. Found and fixed bugs of unzoom failing after 'clear data'.  Done,
	   MLI, (TP), 9/15/00.

a	b. Added DEFAULT column to table mapovl.nmap for default overlay
	   settings.  Made corresponding changes to functions reading this
	   table.  Done, MLI, (ES), 9/18/00.

a	c. Fixed a bug when plotting the map without any data in NMAP2.
	   When switching between some map areas, the panel would get set to
	   the bottom of the display instead of the entire display.  The string 
	   representing the panel was not initialized if no data was plotted.  
	   Done, SJ, (TP), 9/18/00.

a	d. Created a new subroutine nmpdspl.f and the test file testnmp.c
	   in a new library NMP for map handling.  The new function can display
	   a map, lat/lon lines, and the stations.  Done, MLI, (TP), 9/19/00.

a	e. Fixed bug #382:P1, where hitting unzoom when no zoom is active 
	   while seek is up removes the seek line(s).  Done, ES, (TP), 9/25/00.

a	f. Fixed bug #377:P1, reload of blank (map only) frame is incorrectly
	   reloaded with one of the frames of data.  Done, ES, (TP), 9/27/00.

a	g. Ensure backward compatibility with the out of date version of
	   mapovl.nmap.  Done, ES, (TP), 9/27/00.

a	h. Fixed problems #366:P1&P2 where hide/show flag got out of sync
	   with XW driver.  Done, ES, (TP), 10/2/00.

a	i. Fixed NMAP to reset the area to DSET when an invalid area is
	   chosen for an image, #355:P1.  Done, SJ, (TP), 10/6/00.

a	j. Fixed a bug in NMAP2 (#385:P1) that caused a crash when "Set
	   Time" was selected for SHIP data.  Done, SJ, (TP), 10/11/00.

a	k. Fixed bug where hitting cancel in data window after switching loops
	   after a reprevious load confused NMAP2.  Done, ES, (TP), 10/16/00.

a	l. Removed parameter MXTIME, replaced with MXNMFL.  Done, RC, (TP),
	   10/19/00.

a	m. Fixed problem where if the latest frame of a loop was tagged bad,
	   new frames that were added via auto-update were also considered to 
	   be bad.  Done, ES, (TP), 10/24/00.

a	n. Fixed a fatal roam bug in nmap2.  If non-sequential roam values 
	   were added to the nmap_roam.tbl (i.e., the table contained 2,3,4,
	   5,10,15) and the roam value was set to the larger values, a crash 
	   occurred when the data window was opened after the data was loaded.
	   Done, ES, (TP), 10/26/00.

a	o. Fixed 391:P1 by rolling back from the change in 09/00 which caused
	   problem.  This returns us to an earlier problem in nmap where wiping
	   the data from a zoomed image results in being unable to unzoom.  Also
	   ncluded is an nmap2 fix to a timeline bug, which becomes apparent
	   when he vgf is dominant, and the data window is re-opened after the
	   data has been loaded. The one time will not be selected automatically,
	   and hitting the load button results in no data loading.  Done, ES,
	   (TP), 11/2/00.

b	p. Combined "LOAD" and "Accept" buttons in the map window of NMAP/NMAP2.
	   Also, fixed a map problem in NMAP, where after popping up the data
	   window, pop-up the map window, select a non-US map, pop-down the
	   data window, click "Accept" on the map window and the selected map
	   did not display.  Done, MLI, (TP), 11/17/00.

b	q. Fixed problem #409:P1 in NMAP2 where if the data window and map
	   window are active simultaneously and the user cancels the data window,
	   selecting "Load" in the map window will load the requested map and 
	   reload the data.  Done, ES, (TP), 11/28/00.

b	r. Created four new subroutines for NMP library: nmp_govlattr,
	   nmp_govlflg, nmp_govlnms and nmp_govlnum.  Done, MLI, (TP), 11/29/00.

b	s. Changed any device coordinate system abbreviations from local 
	   declarations to global ones found in gemprm.h.  Added gemprm.h to
	   any files that required it.  Done, AH, (TP), 11/30/00.

b	t. Created three new subroutines for NMP library: nmp_sovlattr,
	   mp_savovl, and nmp_restorovl.  Done, MLI, (TP), 12/13/00.

b	u. Created six new subroutines for NMP library.  Done, MLI, (TP),
	   12/22/00.

b	v. Fixed the set time related problems in nmap2.  Known problem
	   reports include:  394:P1, 385:P1, and TPC 13.  Done, ES, (TP),
	   12/22/00.

b	w. Fixed bug where quickly double-clicking the Accept button in the
	   data selection window caused multiple instances of the selected
	   data to be loaded.  Done, ES, (TP), 12/22/00.

b	x. Fixed two set time bugs.  Set time is now available for all data 
	   sources except grid and surface forecast types.  The time line for 
	   misc sources (watches, warnings, etc) is started at the current
	   time rounded to the last 10 minute period.  Done, ES, (TP), 1/4/01.

b	y. Fixed two NMAP2 problems.  The first problem is related to expose
	   events that occur while the user is actively drawing a line or front.
	   The problem was that the ghost line would disappear and the user 
	   would then be unable to see what the resulting figure.  The second
	   problem was recently introduced in the latest cvg library cleanup.
	   On Linux a multi-select and edit would result in a crash.  Done, ES,
	   (TP), 1/9/01.

b	z. Fixed the encoding of the day into a string for the "Set Time"
	   popup window. (Reported by Steve Chiswell, Unidata)  Removed a
	   debug print statement from NTRANS regarding byte flipping.
	   (Reported by HPC forecasters)  Done, SJ, (TP), 1/11/01.

b	aa. Fixed Linux only compile warnings.  NULL was used for non-char*
	    variables.  Done, TP, (TP), 1/12/01.

b	bb. Fixed a bug when loading more than one of a type of data in NMAP2.
	    For example, select a METAR data set and a SHIP data set, the bug was
	    that 2 data sets would be plotted, but they would be the same; i.e.,
	    2 SHIP titles and data.  Done, SJ, (TP), 1/12/01.

b	cc. Removed prototype warnings in NPROGS and a few other remaining
	    places.  Done, TP, (TP), 1/16/01.

b	dd. Reversed the order of the cycle times presented in the data
	    selection window, in NMAP, for MODEL and MOS data.  Done, SJ, (TP),
	    1/17/01.

b	ee. Removed changes that allowed the data selection window to remain
	    visible after selecting a data type in NMAP2.  Done, SJ, (TP), 
	    1/17/01.

b	ff. Fixed a bug reported by the HPC in NMAP2. The "Skip Factor" text
	    box and arrows would disappear after selecting certain grid
	    restore files. This only occurred on Linux and IBM RS/6000
	    workstations, which use Motif 2.1.  Done, SJ< (TP), 1/17/01.

b	gg. Prototyped NMAP2.  Removed aftext and nafos from build scripts.
	    Moved private PGEN functions from proto_nmaplib.h back to their
	    respective PGEN routines.  Moved some private NXM functions from
	    proto_nxmlib.h back to their respective NXM routines.  Done, TP, 
	    AH, (TP), 1/30/01.

c	hh. Fixed bugs for invalid input problems for NMP library (#413:P1&2, S1
	    and #419:P1, S1).  Done, MLI, (TP), 2/1/01.

c	ii. Prototyped NMAP.  Done, TP, (TP), 2/6/01.

c	jj. Fixed problem 407:P1, the resize problem in nmap2, where loops were
	    often ending up with no base map.  Done, ES, (TP), 2/6/01.

c	kk. Fixed the time matching in nmap2 for the case when an old cycle is
	    selected for GRID or MOS data, as the dominant data source for the
	    time line, then other data is matched to it.  Done, SJ, (TP), 2/6/01.

c	ll. Fixed a crash in NMAP when MOS data is selected, but there is no
	    MOS data or directory.  Done, SJ, (TP), 2/6/01.

c	mm. Fixed too many times in a grid file problem found by Unidata.  Done,
	    SC, TP, (TP), 2/8/01.

c	nn. Fixed a printing bug in NMAP2. The HPC reported that NMAP2 would
	    not print the contents of a VG file opened in product generation
	    if there was no data loaded.  Done, SJ, (TP), 2/12/01.

c	oo. Moved all file-related actions to a new panel in the pgen palette.
	    Cleaned up the palette actions for Undo, Redo, and Delete All, 
	    returning the palette state to previous action.  Moved private
	    function prototypes to nmap_pgpalw.c.  Done, HZ, ES, (SJ), 2/15/01.

c	pp. Fixed an nmap2 problem with the roam control box reported by the 
	    HPC.  The roam control box is popped down and back up during an
	    auto-update operation.  When it pops back up, it appears in the 
	    user's current workspace, even that is not nmap2's workspace.
	    Done, ES, (SJ), 3/8/01.

c	qq. Implemented multiple products displays on a single time to NMAP2.
	    Done, TL, (ES), 3/8/01.

c	rr. Increased maximum frame source from 10 to 20 to accommodate multiple
	    products displays on a single time.  Done, TL, (ES), 3/19/01.

c	ss. Fixed an SPC problem, where users may select a roam from the main 
	    menu when the data window is open.  Selecting any roam factor forces
	    a load, but the data window looses track of the loaded sources in 
	    the process.  This quick fix is to disable the roam menu on the main
	    window while the data window is up.  Done, ES, (SJ), 3/21/01.

d	tt. Fixed NMAP2 to only use mandatory level data when plotting 
	    standard levels for UAIR.  Done, AH, (SJ), 4/9/01.

d	uu. Cleaned up save and restore functions for roam and single time
	    mode.  Done, TL, (ES), 4/9/01.

d	vv. Added "Size of Image" as a roam option in nmap2.  Done, ES, (SJ), 
	    4/10/01.

d	ww. Switched the location of the empty base map from the end of an
	    animation loop to the beginning of the loop for NMAP2.  Done,
	    HZ, (ES), 4/10/01.

d	xx. Added the ability for NMAP2 to read a local restore file without
	    having to modify the entry in mod_res.tbl.  Done, SJ, (DP), 4/13/01.

d	yy. Fixed the roam and clear bug in NMAP2.  Done, ES, (SJ), 4/13/01.

d	zz. Minor changes based upon IRIX 6 -n32 compiler messages.  Done, TP,
	    (DP), 4/19/01.

d	aaa. Added a stop load function to NMAP2.  Done, HZ, (ES), 4/20/01.

d	bbb. Made the H/h keys hotkeys to toggle any loaded data on/off.
	     Done, JW, (ES), 4/20/01.

d	ccc. Increased the number of data types shown in the user interface
	     of NMAP2 for the observational data categories.  Done, SJ, (DP),
	     4/25/01.

d	ddd. Added a check for an illegal symbol code in miscset.tbl for the
	     WARN data type.  Updated the documentation for the table.  Done,
	     SJ, (SS), 4/25/01.

d	eee. Enabled logo selection and placement to be loop specific in NMAP2
	     Also fixed problem T434.P1.  Done, JW, (ES), 4/25/01.

d	fff. Added navigation keys for Roam in nmap&nmap2.  Done, HZ, (ES),
	     4/26/01.

d	ggg.  Fixed a bug for stop function in Nmap2.  Done, HZ, (ES), 4/26/01.

d	hhh. Fixed the time problem in NMAP with image data.  SPC #8.  Also 
	     fixed illegal file name problem.  HPC P19.  Done, ES, (SJ), 4/30/01.

d	iii. Added U/u, R/r as hotkeys to UNDO and REDO actions.  Done, JW, (ES),
	     4/30/01.

d	jjj. Added I/i as hotkeys to toggle the image fading in NMAP/NMAP2.
	     Done, JW, (ES), 5/1/01.

d	kkk. Moved all map related record keeping from nmap2 to the nmp library.
	     Done, ML, ES, (SJ), 5/2/01.

d	lll. Fixed some bugs and problems with the recent nmp release including:
	     the prototype compilation warning from nmap_mapw.c, the compilation
	     error in testnmp.c, the change loop from data window w/map window 
	     up problem, and nmap2 core dumps w/missing data problem.  Done,
	     ES, (TP), 5/4/01.

d	mmm. Added NWS logo to NMAP/NMAP2 in addition to NOAA logo.  Done, JW,
	     (TP), 5/7/01.

d	nnn. Fixed some errors in the new nmp library and interaction with nmap2.
	     The custom window's changes are now retained and applied to drawn 
	     maps.  After selecting an image source, the initial map selection
	     is switched to SAT for satellite and Custom if radar.  Changing
	     between loops no longer resets to image defaults (using DSET for
	     the garea).  A fix for a frame reload problem is also included.
	     Done, ES, (SJ), 5/8/01.

d	ooo. Fixed a bug, in NMAP2, where an environment variable other than
	     $SAT or $RAD could not be used for image data. The AWC reported
	     this bug as they use $NMAP_SAT for satellite imagery.  Done, SJ,
	     (ES), 5/8/01.

d	ppp. Modify to update the lat/lon values when using navigation keys in
	     roam.  Done, HZ, (ES), 5/8/01.

d	qqq. Fixed problem report 436:P1, auto update was adding extra frames 
	     to a loop in nmap2.  Also included is a tweak to nmap_dsp.c to 
	     report any errors encountered during a data load.  Done, ES, (SJ), 
	     5/10/01.


d	rrr. Adjusted the behavior of the source and dominant source pulldown
	     menus in the data window in nmap2.  The size of these menus is
	     now fixed, not dynamically sized.  Tis fixes an HPC request.
	     Done, ES, SJ, 5/14/01.

d	sss. Fixed problem #2 from Test Report 440:  Modified the actions taken
	     by the "Clear Data" button to not reset the fade controls for the
	     image coors.  Fixed another bug when using "Clear Data."  Fixed the
	     check for the type of data being cleared to determine whether to
	     reset the map projection to the default.  Done, SJ, (ES), 5/16/01.

d	ttt. Fixed a pgen problem where data is loaded and the pgen exited, the
	     last frame of the visible loop would have the pgen graphics burned 
	     into it.  Done, ES, (SJ), 5/16/01.

d	uuu. Fixed a recent problem with image data which occurs when auto-update
	     has been running long completely replaces the files in the selected 
	     image directory.  When this happens error messages claiming a 
	     specific image file does not exist start popping up.  Done, ES, 
	     (SJ), 5/16/01.

d	vvv. Corrected some additional problems with multiple loop auto-updating
	     as a result of CDB testing.  A navigation bug occured when two or
	     more loops are auto-updating with one or more zoomed.  Over time,
	     one or both loops would reset themselves inproperly to the default
	     area.  Also disable autoupdate when set time function is active.
	     Done, ES, (SJ), 5/17/01.

d	www. This release fixes 2 more navigation bugs in nmap2.  Loading an 
	     non-viewed loop that has been zoomed failed both initially and 
	     via auto-update.  Done, ES, (SJ), 5/17/01.

d	xxx. This release fixes 2 more map related bugs in nmap2.   The first 
	     bug results in an error message when the user selects a national 
	     regional radar (not local), loads, then modifies the source to 
	     national radar.  The second bug is that the custom map edit window 
	     was only ever using the top level garea, ignoring any zoom area.
	     Done, ES, (SJ), 5/18/01.

d	yyy. This release corrects an error introduced by the 018xxx that
	     disabled the use of pre-defined areas for imagery.  Done, ES,
	     (SJ), 5/18/01.

d	zzz. This release corrects the problem where the base map could
	     not be turned off.  Done, ES, (SJ), 5/22/01.

d1	a1a. This release prevents the user from invoking the stop button
	     during a resize of NMAP2.  Stopping while resizing led to
	     erroneous results.  Corrects TR 445P3. Done, HZ, (ES), 5/30/01.

d1	a1b. This release corrects two NMAP2 map window problems.  The first,
	     TR 445P4, corrects the problem where main window's data is 
	     not exposed while moving around the map window.  The second
	     problem is the case where two maps appear in the map window.
	     This happens when looping, bringing up the map window, 
	     canceling the map window, switching loops, and bringing up the
	     map window again.  Done, ES, (SJ), 5/30/01.

d1	a1c. This release corrects TR445P1, which is a problem with zooming
	     when the custom window is open in the map window in NMAP2.
	     The garea was set incorrectly.  Done, ES, (SJ), 5/30/01.

d1	a1d. This release corrects the problem where VG elements are
	     put into the background if data is loaded from product
	     generation using the single time mode.  This problem was
	     detected by the HPC.  Done, HZ, (ES), 5/30/01.

d1	a1e. Updated NMAP/NMAP2 routines to properly free XmString and
	     XmStringTable strings to avoid memory leaks.  This update
	     does not affect functionality.  Done, JW, (ES), 5/30/01.

d1	a1f. This release corrects another map window problem, TR4454O1, 
	     in NMAP2.  The problem was with the map overlay button(s) 
	     getting out of sync with what is displayed in the main
	     window.  This resulted when opening the map window from
	     the data window and de-selecting an overlay, accepting
	     and then canceling the data window.  Done, ML, (SJ), 5/30/01.

d1	a1g. This release modifies the map window to make the map drawing
	     area the size specified in the Nmap resource file.  Previously,
	     the map drawing area stretched in the vertical to match the
	     shape of the entire map window taking into account the widgits
	     along the sides, e.g., the map overlays.  This caused the problem
	     of the map drawing area not having the same aspect ratio as the 
	     NMAP main drawing window.  Therefore, the extended zoom did not 
	     work properly when zooming from the map window.  Resource files 
	     have also been provided with this release to better document
	     the relationship between the map window drawing area and the
	     main window drawing area.  The height and width of the map
	     window (map_canvas.height/width) should be 2/3 the value of
	     the main window height and width (mainw_canvas.height/width).
	     Done, ES, (SJ), 6/4/01.

d1	a1h. This release corrects some problems with NMAP2 when fading with
	     more than one loop.  The program now properly keeps track of
	     the image fade level as a function of loop.  Previously, it
	     did not save the fade level for each loop and in certain cases
	     the fade would not work when switching loops.  Also, corrected
	     a problem where overlay attribute edits were not working.  This
	     problem was introduced in patch e only.  Done, ES, ML, (SJ),
	     6/5/01.

d1	a1i. Corrected problem with the hide/show function getting out of 
	     sync when switching loop.  Previously, when switching loops,
	     hide/show would sometimes not work at all forcing the user
	     to advance the loop to make the data visible again.  Now,
	     when switching loops, the data is always shown.  Done, HZ,
	     (ES), 6/5/01.

d1	a1j. Corrected problem where the show image function in the map
	     window would get out of sync when popping the map window for
	     loops 5-8.  Done, ML, (ES), 6/6/01.

d1	a1k. Corrected two problems with the hide/show loop function.  First,
	     the function now works properly when re-loading data.  Upon
	     reload, the loop is set to show.  Also corrected a problem
	     where autoupdate and cancelling the data window caused the
	     hide/show to get out of sync.  Done, ES, (SJ), 6/6/01.

d1	a1l. Corrects problem with hide/show getting out of synch when looping
	     and hiding data aftering popping up and down the data window.
	     Done, ES, (SJ), 6/7/01.

e	a1m. This release scales the map window drawing area to 2/3rds the size 
	     of the main window's drawing area.  The size of the map window is
	     no longer a function of the height and width specified in the
	     resource file.  Done, ES, (SJ), 6/25/01.

e	a1n. This release fixed zoom problem after cancelling loading image data.
	     Done, MLI, (ES), 6/25/01.

e	a1o. This release fixes the nmap/nmap2 error associated with the main 
	     window when the resource file specifies a canvas area greater than
	     955 in height.  Done, ES, (SJ), 6/27/01.

e	a1p. This release fixes the minor problem with logos and pgen in nmap2.
	     If a logo was added after product generation was started, the logo
	     appeared and then immediately disappeared.  Done, ES, (SJ), 6/27/01.

e	a1q. This release fixes a fatal error in the timeline that has been 
	     present at least since v.5.5.c.  Clicking anywhere in the timeline 
	     box before selecting any data sources is fatal in nmap2.  Done,
	     ES, (SJ), 6/27/01.

e	a1r. Added a push button to the data windows in nmap2, which enable
	     one to select, but not load sources.  The selected non-loaded data 
	     will be removed from the dominant source menu and "(off)" will be
	     prepended to the source path in the data source menu.  The button
	     has two possible values, "Turn Source Off" or "Turn Source On".
	     If a source is turned off, the modify and edit button will be 
	     disabled.  Done, MLI, (ES), 6/27/01.

e	a1s. This release fixes the main canvas location.  On a previous release
	     the layout of the main window was adjusted to move the main canvas
	     out of a frame (which retricted the maximum height).  In so doing,
	     the starting location of the main canvas ended up at 0,0 in the 
	     main window, placing the first inch or so of the main canvas under
	     the menu and button bars.  Done, ES, (DP), 6/28/01.

e	a1t. This release fixes the resize problem with nmap/nmap2 introduced 
	     with a recent fix to the max canvas size restriction.  Done, ES, 
	     (DP), 6/29/01.

e	a1u. This release fixes some problems with the data selection window in 
	     nmap2 reported by Brett.  With a datatype.tbl of only a small number 
	     of sources, this sequence of events is fatal: 1)  select source, 2)  
	     load, 3)  open data window, 4)  hit modify source btn -- kaboom!  
	     Also the width of the data source window was often getting much 
	     wider when popped to modify a source.  Done, ES, (SJ), 7/2/01.

e	a1v. This release fixes an auto-update related problem in nmap2.  The
	     problem occurs with an image source updating in one loop and the
	     viewed loop having a set-time older than any available image file.
	     Done, ES, (SJ), 7/5/01.

e	a1w. This release adds a check to the size of the canvas on the main 
	     window.  If the resource file has specified width and height that are
	     below the minimum size of 800x300, increase the dimensions to the 
	     minumums.  This is problem 453:P1.  Also included is a tweak to the
	     map window size.  Its drawing area is to be created with a size 
	     proportionate to the main window's drawing area.  This will either
	     be 2/3rds the size of the main window, or the full size if the main
	     window's drawing area is small enough to fit on the map window.
	     These same changes have been applied to nmap as well,  which 
	     addresses 453:01.  Done, ES, (SJ), 7/5/01.

e	a1x. This release fixes a fatal nmap2/pgen bug.  Resizing the nmap2
	     window with a selected vg element produces a crash on all platforms.
	     Done, ES, (SJ), 7/6/01.

e	a1y. This release fixes another fatal error in the timeline.  The problem
	     is related to the one fixed with rel06_22.  It can is reproduced 
	     thusly:  start the data window, select a source, clear the source, 
	     click in the empty timeline area.  Done, ES, (SJ), 7/6/01.

e	a1z. Added checks to data source status and category before the data
	     settings were saved into an SPF file. Also fixed a  crash bug caused
	     by dataw_removeSrc(), in which only the dominant source within the
	     given loop could now be removed.  Done, JW, (SJ), 7/9/01.

e	a2a. This release fixes a burn-in problem in nmap2.  The sequence of
	     events which resulted in a burn-in were: 1)  Open the map window,
	     select one (or more) overlays and load. 2)  start pgen. 3)  draw 
	     something. 4)  change to another loop. 5)  load data. 6)  exit pgen 
	     -- last frame of the loop in view has the vg element burned in.
	     Done, ES, (SJ), 7/9/01.

e	a2b. Fixed problem #452:P1&P2 - Segmentation fault occurs when single time
	     function is evoked: select two grid data and set one to "OFF", load
	     and SG occurs.  This release added a check for the "OFF" grid data 
	     to the dsp_loadSingleTime function. Subtracted the "OFF" data source 
	     number from ndata in dsp_getSingleTmOrdr.  Done, MLI, (ES), 7/12/01.

e	a2c. This release fixes a fatal bug in the single time mode of data 
	     display (463:P1).  The problem was introduced earlier this month in 
	     conjunction with the turn source off feature.  The method of tracking
	     "off" data sources when in single time mode left a key variable 
	     uninitialized at times.  Done, ES, (SJ), 7/17/01.

e	a2d. Added functionality to restore data settings from an SPF file.  
	     Also fixed crash bug in T460.P1.  Done, JW, (ES), 7/18/01.

e	a2e. Fixed 459.P1,  which is described as follows:  Select image data in 
	     one loop and leave it unloaded. Go to another loop to load and "stop"
	     the loading. (The idea is to try not to load the data on the image 
	     loop.) Back to the image loop and pop up the data window. Click 
	     "skip" arrows and Nmap2 crashes.  Done, HZ, (ES), 7/19/01.

e	a2f. Allowed data settings from an SPF file could be restored into the
	     data selection window temperarily. Originally, a restoring would 
	     wipe out all current settings permanently even if the user cancels 
	     the restoring.  Done, JW, (ES), 7/19/01.

e	a2g. Added the ability to NMAP2 to recognize GDATTIM from a grid
	     restore file, and use its value to set the timeline.  Done, SJ,
	     (ES), 7/20/01.

e	a2h. Fixed 465.P2, where "Zoom" and "Unzoom" incorrectly activated PG
	     hint strings when PG was activated.  Done, HZ, (ES), 7/24/01.

e	a2i. Removed the call to gmpk_initTxt from the mapw module. Added the
	     call to gmpk_init so that any text that does not have specific
	     attributes will be plotted as Courier.  Done, SJ, (ES), 7/25/01.

e	a2j. Created a custom confirmation window to display a summary of SPF
	     file contents prior to the actual restore. Originally, the user
	     did not know the actual contents until the restore was done.
	     Also fixed a bug to allow access to read-only SPF files under other
	     users' directory and restore them.  Done, JW, (ES), 7/26/01.

e	a2k. Fixed 466.P1, where a click on "Cancel" button of data window with 
	     PG active does not bring back current oper function.  Done, HZ, 
	     (ES), 7/27/01.

e	a2l. Added GQTEXT and GSTEXT to set the image and map font attributes
	     in NMAP2.  This prevents the radar color bar and lat/lon labels
	     from being changed when other font size data are loaded.  Done, 
	     AH, (SJ), 7/27/01.

e	a2m. Added validations to data source selections before restoring.  If
	     a source stored in a SPF file is not available, it will not be
	     listed in the confirmation window and will not be restored.  Done,
	     JW, (ES), 7/31/01.

e	a2n. Updated the error message when invalid sources were found at
	     restoring. Also fixed the T467.P1 to number sources in SPF files
	     consectively.  Done, JW, (ES), 8/2/01.

e	a2o. Fixed 460.P2, where on LINUX2, popup the data selection window, 
	     "Modify source" button is ON.  Done, HZ, (ES), 8/13/01.

e	a2p. This release adds a new nmp routine which will be used in the future
	     to validate map information in .spf files.  The release also makes 
	     the testnmp function more useful by having it reference the internal
	     nmp structures for preset information rather than continually asking
	     the user to provide it from the command line.  Done, ES, (SJ), 
	     8/14/01.

e	a2q. Added the functionality to restore/save the roam factor in NMAP2.
	     Fixed the long-existing basemap disppearing problem associated with
	     roam.  Fixed T473.P1 & T473.P2 associated the consistancy between
	     dominant source, frame numbers, skip factor, and the validality of 
	     data source for restoring an SPF file.  Done, JW, (ES), 8/14/01.

e	a2r. This release addresses problem 465:P1, the "Product Generation 
	     Inactive" string at the bottom of the main window is missing the "P"
	     when run using the default window size.  Also included is a fix for 
	     465:P3.  The location of the map window on linux boxes is such that 
	     the control buttons are initially out of the work space.  Done, 
	     ES, (SJ), 8/14/01.

e	a2s. This release fixes bug 463:P2.  The problem was the current frame 
	     (with or without data) disappeared from view after moving the main 
	     window, then starting and exiting pgen.  Done, ES, (SJ), 8/14/01.

e	a2t. Added in NMAP2 the functionality to restore/save the auto update
	     status and the map settings (name, projection, area).  Done, JW,
	     (ES), 8/15/01.

e	a2u. Created a new nmp library function (nmpsdefmap.c) and added it to
	     testnmp.c and dataw_clearLoop.

e	a2v. This release cleans up the functionality of the "Ungroup All" action.
	     Once the user selects OK, and all groups have been broken up, the 
	     pgen palette returns to Select.  Before it remained at Ungroup All, 
	     which made little sense from a functional standpoint.  Done, ES, 
	     (SJ), 8/17/01.

e	a2w. Added in NMAP2 the functionality to restore/save the map overlay
	     selections.  Done, JW, (ES), 8/20/01.

e	a2x. Fixed some small bugs and added some enhancements to SPF restore.  
	     Matching the map names and map overlay names case-insensitively.  
	     (T477:O3)  Signaling errors for invalid dominant source index, skip,
	     frames, roam, and auto-update. (T477:P3) Updating loop # in data 
	     window while restoring. (T477:O2)  Done, JW, (ES), 8/20/01.

e	a2y. Fixed bug 477:P1 where a fatal crash occured if a load request was
	     made with data in 3 or more loops, and the stop button was hit 
	     during the first loop load.  If the user attempted to then load 
	     data into one of the other loops the crash ocurred.  Done, ES, 
	     (SJ), 8/23/01.

e	a2z. Fixed Dave's problem with losing roam settings.  Done, ES, (SJ),
	     8/23/01.

e	a3a. Fixed some small bugs and added some enhancements to SPF restore.  
	     Resetting roam values to FIT_TO_SCREEN before restoring. (477:P2)  
	     Allowing comment lines in SPF file.  A line whose first character 
	     (other than white space) is "!" is ignored as comments. (477:P4) 
	     Reporting invalid overlay settings. (478:P2) Done, JW, (ES), 8/23/01.

e	a3b. Cleaned up bugs associated with spf overlays by simply setting the
	     default maps. (478:P1, 478:P3)  Done, JW, (ES), 8/27/01.

e	a3c. Fixed the fake error reports when restoring twice an SPF or two
	     SPFs which have image data source in at least one loop. Also fixed
	     the bug that the loaded overlays in a loop could not be reset to
	     default overlays if the restore SPF has no data sources in that
	     loop.  Done, JW, (ES), 8/28/01.

e	a3d. Fixed the occasional time line disppearing which happens when the
	     total number of frames in all loops exceeds 80 (see 478:P4 and
	     477:O1).  Done, JW, (ES), 8/30/01.

e	a3e. Fixed 483:P2(b): NMAP2 crashes when clicking on the skip factor
	     "UP" arrow while no times are selected on the time line.  Also 
	     fixed a bug for "Clear Source": except when the dominant source is
	     the first source in a loop, clearing other non-dominant sources
	     leads to incorrect reindexing of the dominant source.  In this
	     case, the dominant source is removed or changed inadvertently and
	     the time line may also be cleared.  Done, JW, (ES), 9/10/01.

e	a3f. Fixed a fatal bug in NMAP2 that caused a crash when certain RUCS
	     restore files were selected with a cycle time earlier than the
	     current run. This fix was in NGD_TLST. The correct counter for the
	     number of times found was not being checked.  Also, fixed a problem 
	     with the time used for analysis grids.  The routine now returns all 
	     times found for analysis grids.  Done, SJ, (DP), 9/17/01.

e	a3g. Modified the functions in the NIM library that get the list of file
	     names to ignore the part of the file name before the date/time part.
	     This fixes a problem reported by the AWC where some radar file names
	     had "NN" in the part of the file name before the date/time.  This 
	     substring was mistakenly used to get the minutes for the time array. 
	     Done, SJ, (DP), 9/18/01.


019.	MAP FILES

a	a. Updated the table, zones.tbl, with new boundary names for the
	   Puerto Rican and Virgin Islands zones.  Also, incorporated portions 
	   of WY Zone 64 in WY Zone 15 making Zone 15 encompass all of Natrona 
	   County.  Corrected the boarder between CA Zones 48 and 55 in SGX.
	   Done, AH, (TP), 9/15/00.

a	b. Updated the County Warning Areas maps and tables.  Portions of WY
	   Zone 64 are now incorporated into WY Zone 15.  Thus, all of 
	   Natrona County is in Zone 15.  Done, AH, (TP), 9/15/00.

a	c. Updated the County maps and tables.  In accordance with NIST
	   change notice 5, 22 July, 1999, the name of Dade County, FL was
	   changed to Miami-Dade, new FIPS code 12086.  Done, AH, (TP), 9/15/00.

a	d. Created new lake and waterbodies map files for the CONUS and Alaska.
	   The original map source is from the USGGS National Atlas of the US.
	   Done, AH, (TP), 9/25/00.

a	e. Created new Public Zones Forecast maps and zones.tbl for changes in
	   zone responsibility in Montana.  The reconfigured zones are BYZ, GGW,
	   and TFX.  This change comes from SCN 0069, effective October 4, 2000.
	   Done, AH, (TP), 9/27/00.

a	f. Created new Public Zones Forecast maps, County maps and County
	   Warning Area maps due to corrupted shapefiles at NWS.  The re-
	   configured zones BYZ, GGW, and TFX in Montana were restored to these
	   new maps.  Also added to the PZF maps, a portion of CO Zone 74 was
	   merged into CO Zone 73.  Done, AH, (TP), 9/29/00.

a	g. Created new Marine Zones maps and updated the zones table.  This
	   change is in response to SCN 0080 which affects zones ANZ250 and 
	   ANZ255.  Done, AH, (TP), 10/11/00.

a	h. The Public Forecast Zones were changed in response to SCN 0097,
	   reconfiguring zones in AFC;  SCN 0098 reconfiguring zones in AFG
	   and SCN 0099 which changed the names of AK zones 23, 25, 26, 27.
	   Marine zones ANZ250, ANZ 254, ANZ255 and ANZ270 had their boundaries
	   modified at the request of BOX and with the concurrence of OM.
	   Done, AH, (TP), 10/20/00.

a	i. The FIPS code for Miami-Dade County was changed back to the original
	   FIPS code of 12025  (when the county was called Dade County).
	   Since the UGC for this county was not changed by NWS with the FIPS 
	   code, it is necessary for consistency.  Done, AH, (TP), 10/20/00.

a	j. Updated the Mid Atlantic River Basin map.  Done, TP, (TP), 10/24/00.

a	k. The Public Forecast Zones were changed to add the missing AK zone
	   185 and to correct AK zones 101/121.  Done, AH, (TP), 11/1/00.

b	l. Fearea information for the Tennesee counties in MRX was changed
	   from ee to the new ea abbreviation for EAST.  The timezone for Wayne 
	   County, KY in JKL was changed to E at the request of JKL and in
	   accordance with the Department of Transportation 49 CFR Part 71,
	   effective 29 October, 2000.  Done, AH, (TP), 12/22/00.

b	m. Updated the flight information map files received from the AWC.
	   The ZNY/ZOA map boundary segments in the map file were removed.
	   Done, AH, (TP), 1/4/01.

b	n. Updated the North American map correcting the Mexican, Canadian and 
	   U.S. borders so that they match the U.S. county map borders.  Added
	   more major lakes to lakes.ncp.  Done, AH, (TP), 1/9/01.

c	o. In response to SCN 01-04, Public Forecast Zones in MLB were
	   reconfigured, by splitting existing FL zones 41, 44, 47 to create
	   three new zones, 141, 144 and 147.  Corrected an error in FL zones 12
	   and 14.  There was a "gap" in  the border between Bay and Gulf 
	   Counties, FL, from the Gulf to East Bay.  This error has been fixed 
	   in the other files that cover this area (counties, CWA boundaries, 
	   States, Marine Zones ).  Done, AH, (TP), 2/8/01.

c	p. Created new map file containing bounds of DC VAAC ( Volcanic Ash
	   Advisory Center) area of responsibility.  Done, DP, (SJ), 2/26/01.

c	q. In response to SCN 01-09,  Public Forecast Zones in BOU were realigned
	   in north central and north east Colorado.  Also, numerous map topology
	   errors were fixed in PR zones 1 and 2.  Done, AH, (TP), 3/20/01.

d	r. Added Europe, Asia, and Australia to the world bounds (locowo) vgf,
	   tbl, and info files.  Done, DP, (TP), 4/27/01.

d	s. Minor adjustments to the dcvaac map file.  Done, DP, (SJ), 5/1/01.

d	t. MWO boundary map file per SAB/VAAC request.  Done, DP, (TP), 5/10/01.

e	u. Changes were made in response to SCN 01-27.   Marengo County, AL was
	   transferred from MOB (Mobile AL) to BMX (Birmingham, AL).  Done, AH,
	   (TP), 7/6/01.

e	v. Changes were made in response to SCN 01-26.  Marine zones in several
	   offices were updated. In addition, a few marine zone names were 
	   modified.  Also, an offshore zone name was modified, ANZ088.  Done,
	   AH, (TP), 7/17/01.

e	w. Upgrade adjacent coastal bounds definitions per AWC request.  Done, 
	   DP, (SJ), 7/24/01.

e	x. In response to SCN 01-41, zones for GRB (Green Bay, WI) were updated.
	   Done, AH, (TP), 9/18/01.


020.	UTILITIES 

b	a. Fixed compile errors in the avnbul which occured after the most
	   recent change to the VG_DBStruct definition. Done, ES, (TP), 11/28/00.

b	b. Prototyped syslib/unix and removed compile warnings found using the
	   new prototype header files.  Done, TP, (TP), 1/9/01.

c	c. Fixed inconsistencies in the input for PLOTSYMS.  Done, SJ, (TP),
	   2/1/01.  

c	d. Changed cpg_fndgrp calls to ces_gtgid.  Added call to ces_gtrtbl for 
	   initialization.  Done, DP, (SJ), 3/26/01.

c	e. Replaced calls to cpg_fndgrp with ces_gtgid in AVNBUL.  Done, SJ, 
	   (DP), 3/26/01.

d	f. Created a program to convert a VGF file into a bounds file.  Done,
	   DP, (SJ), 4/12/01.

d	g. Added capability to the VGF-to-bound program to process the text tag
	   as name | info.  Done, DP, (TP), 4/18/01.

d	h. Removed unused variables from avnbul.  Done, TP, (SJ), 5/15/01.

e	i. Changed all bounds info strings to <tag>value format.  Done, DP,
	   (SJ), 8/22/01.

e	j. Created a new program to decode an ASCII file containing line 
	   coordinates and date information tp produce a VGF file with line and
	   text elements.  Done, DP, (SJ), 9/10/01.

e	k. Fixed TR#486:O1-4 and made cosmetic changes to the new Flood Outlook 
	   Product ASCII-to-VGF decoder per HPC request.  Done, DP, (SJ), 9/12/01.

e	l. Corrected the parameter in CPCGOUT.F.  Done, MLI, (SJ), 9/14/01.

e	m. Add capability to Flood Outlook Product (FOP) ASCII-to-VGF decoder 
	   to handle ASCII files which indicate that no flooding is expected.  
	   Done, DP, (SJ), 9/18/01.

e	n. Fixed FOP bug report #491.  Done, DP, (SJ), 9/20/01.

e	o. Added CV_PRMT to the function cpcg_rdln to perform the parametric
	   curve fitting.  Done, MLI, (SJ), 9/21/01.

	   
021.	PRODUCT GENERATION

a	a. Added volcanic ash to the international sigmet.  Done, FY, (TP),
	   9/12/00.

a	b. Fixed a bug with function label, where test was not grouped.
	   Done, HZ, (TP), 9/12/00.

a	c. Fixed a bug of function save, where no pop-up box appears.  Done,
	   HZ, (TP), 9/19/00.

a	d. Fixed fatal watch box error, #384:P2.  Done, HZ, (TP), 9/28/00.

a	e. Fixed #352:P1&P2.  Nmap and the xw driver were getting confused 
	   over the current_window when pgen was started while the map
	   window was up.  Done, ES, (TP), 10/2/00.

a	f. Added Tropical Cyclones to the International Sigmet prodoct 
	   generation.  Implemented lat/lon location entry boxes for 
	   volcanic ash and TCs.  Done, FY, (TP), 10/6/00.

a	g. Fixed #354:P2, modified the fmline array from 256 to 1500 in
	   the pgsigw_setFrom module.  Done, RC, (TP), 10/6/00.

a	h. Calculated watch area from square statue miles to square
	   nautical miles per SPC's request.  Done, TL, (TP), 10/11/00.

a	i. Added new modify routine cv_mdfy() in the modify pgen GUI.  Done,
	   HZ, (TP), 10/11/00.

a	j. Changes to the watch box VG structure to accommodate anchor point
	   info.  Done, DP, (TP), 10/11/00.

a	k. Corrected watch box anchor point problem where the anchor points
	   at issue time differ from the anchor points when drawn.  Done,
	   DP, (TP), 10/16/00.

a	l. Changed the Modify function so that only clicks of left mouse
	   button count for the final modified line/front.  Fixes #390:P2.
	   Done, HZ, (TP), 10/17/00.

a	m. Fixed bugs in recent watch box delivery bug report #392.  All items 
	   except item 5, which could not be reproduced.  The Linux problems
	   noted in the previous delivery are also fixed.  Done, DP, (TP),
	   10/17/00.

a	n. Added more features and re-organized the GUI for the 'track'.  
	   Made the track attributes box expandable.  Allow users to select or
	   enter more values than just 30 and 60 minutes for the intervals.
	   Allow user to select the font type, size and style for the text
	   label.  HOUR and HALF-HOUR options are added for the labeling of
	   the forecast track points.  Made the result dialog box expandable.
	   Done, MLI, (TP), 10/18/00.

a	o. Fixed #395:P2&4, O2&3, Assorted watch format problems.  Done, DP, 
	   (TP), 10/23/00.

a	p. Changed how watch is first drawn, the endpoints are "snapped" and
	   the resulting anchor points are calculated and saved with the 
	   element.  Fixes #396:S1.  Done, DP, (TP), 10/24/00.

a	q. Fixed #384:P1 - multiple watch problem with undo.  Done, DP, (TP), 
	   10/24/00.

a	r. Fixed 392.P2, where single point produced if after a single click
	   off line, the middle mose button is clicked.  Done, HZ, (TP),
	   10/26/00.

a	s. Changed the International SIGMET Edit Attribute Ordering.  Done,
	   HZ, (TP), 10/26/00.

a	t. Fixed modify bugs:  even when the modify operation was canceled 
	   ( using mousebutton 2), the unmodified element was resaved.  The
	   internal point array used to store smoothed ghost points has been
	   increased from MAXGHOST (500) to LLMXPT (10,000).

a	u. Fixed problems: 400:P2, S1, & O1.  The check for 1440 (24 hours)
	   limit was removed.  The output for the interval "Other" option was
	   changed to HH:MM format.  And the initial location of track attribute
	   popup window was changed.  Done, MLI, (TP), 11/1/00.

a	v. Fixed problems in test report #403 (P1&P2). Used the correct
	   variable to represent the user input interval time as a string.
	   Done, SJ, (TP), 11/2/00.

a	w. Fixed 393:P1 & 399:P2 (really!), all undos work correctly now in 
	   conjunction with watches.  The county list is wiped if the watch is 
	   moved, copied, or resized.  Initial color changes are preserved now 
	   after the counties are added.  he watches now snap correctly after 
	   they are moved or copied.  Done, ES, (TP), 11/2/00.

a	x. Fixed 402.P1, P3 & P4, corections to interbnational sigmets.  Done,
	   HZ, (TP), 11/2/00.

a	y. Fixed 390:P4, eliminated overlapping on ghost lines when modifying
	   closed lines and 401:P1, click did not find smooth line.  Done, 
	   JW, HZ, (TP), 11/2/00.

a	z. Corrected fatal crash with sigmet of over 42 points (397:P1).
	   Done, TP, (TP), 11/6/00.

b	aa. Corrected fatal crash with sigmet of over 42 points (406:P1&P2).
	    Done, TP, (TP), 11/13/00.

b	bb. Changed the file naming in the case of append and delete all 
	    according to HPC23 & HPC24 such that when file1 is open and file2 
	    is appended to it the file name will remain file1.  Done, ES, (TP),
	    11/14/00.

b	cc. Changed new vg append functionality (released 11/13/2000).  In 
	    product generation, after a file append operation, the "Save"
	    button initially responds as a "Save As".  Done, ES, (TP), 11/17/00.

b	dd. Fixed Problem Report #408:P1 - convective sigmet line type with
	    many points.  Done, TP, (TP), 11/21/00.

b	ee. Redesign UNDO function to eliminate the .UNDO.vgf file.  Done,
	    HZ, (TP), 11/28/00.

b	ff. Fix the known instances of too many arguments in calls to cvg_rdrec.
	    Done, HZ, (TP), 11/30/00.

b	gg. CVG library cleanup (part 3a):  Moved the coordinate transformation
	    functionality from the cvg_???sto routines to the  pgvgf_saveNewElem
	    routine (in nmap_pgvgf.c).  All cvg_???sto routines are removed.
	    Done, JW, (TP), 11/30/00.

b	hh. Changed any device coordinate system abbreviations from local
	    declarations to global ones found in gemprm.h.  Added gemprm.h to 
	    any files that required it.  Done, AH, (TP), 12/1/00.

b	ii. This represents the second phase of implementing full ansi-C
	    prototypes in our C code.  In this phase the NMAPLIB prototypes
	    are included as well as the remainder of the CGEMLIB prototypes.
	    Done, TP, AH, (TP), 12/7/00.

b	jj. Fixed a number of type warnings in PGEN, by cleaning up
	    questionable variable and parameter type usage.  Done, ES, (TP), 
	    12/18/00.

b	kk. UNDO redesign step 2: allow multiple undo steps.  Done, HZ, (TP),
	    12/21/00.

b	ll. Added a conversion of all Carriage Returns, in a text element, to
	    Line Feeds for the GUI widget. Any multi-line text generated by a
	    GEMPAK program has CRs. The CRs do not produce multiple lines in 
	    the Text Attributes widget.  Done, SJ, (TP), 1/3/01.

b	mm. Added color for each label item in table grptyp.tbl. Modified the
	    group table structure to read the label colors, and made the labels
	    display in the specified color in PG. If the label selected was 
	    "Other", used the same color of front/line/symbol.  This also
	    includes Ed's cleaning up of group table structure (12/21).  Done,
	    MLI, ES, (TP), 1/3/01.

b	nn. Removed special line type dependencies in the severe weather 
		outlook product maker.  Done, DP, (TP), 1/9/01.

b	oo. Moved state info. from watch format window to county list window.
	    Done, HZ, (TP), 1/10/01.

b	pp. Modify nmap_pggrpw.c to read more general table (grptyp.tbl) which
	    may or may not have color entries for the label items; And the color
	    list may be in any order.  For LINE, set the default for "Use LINE 
	    color" to ON.  If "Use LINE color" is On, when a label is chosen,
	    change the line color to whatever is specified in the table.  If no
	    color is specified, no color change is made.  Done, MLI, (TP), 
	    1/12/01.

b	qq. Hardwired 3 additional special line types (SPLN6, SPLN20, and SPLN21)
	    to have OUTLOOK as the default group type when drawing.  Done,
	    DP, (TP), 1/12/01.

b	rr. Fixed the initial popup location of the text and symbol edit boxes.
	    On linux platforms the starting location of these windows is not 
	    entirely in the user's current workspace.  Done, ES, (TP), 1/16/01.

b	ss. Added group type widget to 'FORMAT OUTLOOK' window, changed the 
	    format of the output filename according to the selected group type.
	    Added a text widget to the line edit window.  If selected line
	    belongs to a group, the name of the group type is displayed in this
	    new text widget.  The group type cannot be changed in this window.
	    Done, MLI, ES, (TP), 1/18/01.

b	tt. Correct a problem that the text widget is too small to view text
	    on text edit window.  Done, HZ, (TP), 1/18/01.

b	uu. Unlabelled lines processed by the outlook product maker for types
	    other than OUTLOOK are assigned the string "SIGNIFICANT SEVERE"
	    instead of "GENERAL THUNDERSTORMS" (which remains the same for the
	    standard outlook).  In the grouping module, remove hard-wiring of
	    group type number.  This should allow the grptyp.tbl more 
	    flexibility, specifically, groups may be moved around in the table
	    or removed from the table entirely.  Done, DP, (TP), 1/19/01.

b	vv. In this release, the line in PG always gets the color from the
	    grptyp.tbl no matter the "USE LINE color" is ON or OFF. Initially,
	    the line color is set by setting.tbl. Once the label toggle button
	    is clicked or the label item is changed, the line will get the color
	    from table grptyp.tbl as long as the color is specified.  If the
	    "USE LINE color" is turned ON, the label gets the color from the
	    line.  Done, MLI, (TP), 1/19/01.

b	ww. Added "..." to the end of the "ATTN...WFO" line.  This will prevent 
	    the AWIPS bulletin search function from not finding WFOs listed on
	    the end of this line (searcher for "...wfo...").  Done, DP, (TP),
	    1/19/01.

b	xx. Fixed the initial popup location of the wind edit box.  On Linux
	    platforms the starting location of this window is not entirely
	    within the user's current workspace.  Done, ES, (TP), 1/23/01.

b	yy. Added "FORMAT OUTLOOK" group type.  Fixed the line color setting 
	    problem for line 22 & 23.  If the label toggle button was already 
	    ON, the line color was still RED (settings.tbl), instead of its 
	    proper, grptyp.tbl, color.  Done, MLI, (TP), 1/23/01.

c	zz. Fixed problem with not being able to move or copy circles.  Done,
	    ES, (TP), 2/12/01.

c	aaa. Fixed problems #426:P1 &P2 - Line color and label/table colors not
	     matching.  Done, MLI, (DP), 2/15/01.

c	bbb. Cleaned up two pgen palette and action issues.  In nmap2 the 
	     selected palette action is now retained when switching loops.  All 
	     moves, vertex drags, and point delete operations require a mouse 
	     click and/or drag to begin very close to an actual vertex.  
	     Formerly these actions used the "nearest" vertex, even if no vertex 
	     was near the location of the cursor.  Done, ES, (SJ), 2/15/01.

c	ccc. Add a "clustered counties" option which automatically turns one
	     or more counties on or off whenever a nearby county is turned on
	     or off.  Done, HZ, (DP), 2/21/01.

c	ddd. Completed the elimination of large displacements on element
	     selection with the addition of the element displacement fix to the 
	     partial delete tool.  Done, ES, (SJ), 2/21/01.

c	eee. Bug fix for long descriptive county names.  Done, DP, (TP), 2/21/01.

c	fff. Fixed the select function, eliminating the large vertext 
	     displacement problem with watches.  Done, ES, (SJ), 3/1/01.

c	ggg. Addressed changing loops in the middle of of modify operation.
	     Done, ES, (SJ), 3/1/01.

c	hhh. Minor changes to the watch staus message requested by the SPC.
	     Done, DP, (DP), 3/5/01.

c	iii. Added an exit for actions on NMAP/NMAP2 via the middle mouse
	     button, except SELECT, MULTISEL, GROUP, LABEL, and SHOW ALL GROUPS.
	     Done, JW, (ES), 3/5/01.

c	jjj. Standardized the process of drawing watches with all other elements.
	     Originally, a handle bar was put on the watch after it was drawn
	     and a "Specification" window would popped up when the user
	     selected the watch object from pgen palette. Both of these features
	     are removed now to make drawing watches consistent with the
	     process of drawing all other VG elements.  Done, JW, (ES), 3/14/01.

c	kkk. Added an internal mapping array of group name and group type pairs.
	     Removed the group number column from group type table.  Done, HZ,
	     (DP), 3/15/01.

c	lll. Added the complete set of line and text attributes from grptyp.tbl.
	     Done, HZ, (DP), 3/23/01.

c	mmm. Fixed the recent problem whereby lines are always grouped.  Done,
	     ES, (SJ), 3/27/01.

c1	nnn. This release fixes the group type problem introduced in patch c.
	     Instead of using the ces default group type for all elements, the
	     pgvgf_save() routine uses the passed in grptyp and grpnum values.
	     These values are now supplied by the appropriate attribute window.  
	     Allow the correct editing of symbols and fronts. Done, ES, (SJ),
	     4/2/01.

c1	ooo. SPC requested changes to outlook product.  Filled lines that are
	     not grouped with a text element are now indicated as "SIGNIFICANT
	     SEVERE" regardless of whether the group type is OUTLOOK or 
	     something else.  Done. DP, (SJ), 4/3/01.

c1	ppp. Fixed the ces grptyp problem where the grptyp was overwritten 
	     during the edit of most elements.  Done, ES, (SJ), 4/3/01.

c1	qqq. Changed the Excessive Rain text product generation to ignore the
	     group type of the lines in the VG file.  Done, SJ, (TP), 4/3/01.

d	rrr. Added a new front type for a front with no pips.  It is a solid
	     line and uses the front code 809.  Done, SJ, (ES), 4/9/01.

d	sss. Redeclaration of variables for determing file permissions.  Done,
	     TL, (SJ), 4/10/01.

d	ttt. Changed the pgen palette button layout from vertical to horizontal.
	     Done, ES, (SJ), 4/11/01.

d	uuu. Changed the new pgen palette horizontal layout implementation to
	     accommodate the idiosyncrasies of the linux 2.2 kernel.  Done,
	     ES, (SJ), 4/12/01.

d	vvv. Add list of affected WFOs to the end of the county list when 
	     editing a watch.  Done, DP, (SJ), 4/13/01.

d	www. Updated watch status message so text is now converted to all upper
	     case and lines automatically break at 80 characters per SPC.
	     Done, ES, (DP), 4/16/01.

d	xxx. Added capability to include the Great Lakes and adjacent coastal
	     waters to convective SIGMETs per the AWC.  Done, DP, (TP), 4/18/01.

d	yyy. Increased VERTEX_TIEIN and LINE_TIEIN to make vertex selection
	     less restrictive.  Done, TP, (SS), 4/18/01.

d	zzz. Apply the newly delivered cst_wrap function for the watch status 
	     message.  Done, DP, (SJ), 4/23/01.

d	a1a. Re-worked line wrap and EOL marker for Watch Status Message text
	     product.  Done, DP, (TP), 4/26/01.

d	a1b. Minor changes based upon IRIX 6 -n32 compiler massages.  Done,
	     TP, (SJ), 4/30/01.

d	a1c. Removed "#" from "... See Mesoscale Discussion" text string for the
	     watch status message.  Updated outlook table by commenting out "SEE 
	     TEXT."  Done, SS, GG, (DP), 5/1/01.

d	a1d. Fixed a problem with the 4/30 release of nmap_pgfilw.c which
	     contained an error in the vg file save mechanism.  Done, ES, (SJ),
	     5/1/01.

d	a1e. Added checks to "Product Generation". This allows UNDO/REDO
	     hotkeys to work only when "Product Generation" is up.  Done, JW,
	     (ES), 5/7/01.

d	a1f. Added capability to International SIGMETs to output as either AFOS
	     or non-AFOS format.  This is achieved by setting the SIGMETFMT 
	     environment variable:  setenv SIGMETFMT AFOS.  Any value other than
	     "AFOS" (upper case) will result in a standard WMO format.  Done, 
	     DP, (TP), 5/7/01.

d	a1g. Created new SPC outlook points text product - "Areal Outlook."  
	     Handle name changes for HPC surface products.  Previously, the text 
	     product file (.dat) name was generated with the first three letters 
	     of the VG filenmame, now it uses the first four letters.  Done, DP, 
	     (SJ), 5/8/01.

d	a1h. Modified the behavior of the vertex drag within the Select function
	     in PGEN.  When the highlighted object is a CLASS_LINE element, the
	     required proximity to a vertex is now 300.0 pixels, whereas the
	     required proximity for any other element class remains 20.0.
	     Done, ES, (SJ), 5/8/01.

d	a1i. Allow sfc prog product to process HIGH and LOW group types in
	     addition to LABEL group type.  Done, DP, (SJ), 5/10/01.

d	a1j. Change default of "Use Line Color" toggle to off (FALSE) per HPC 
	     request.  Done, DP, (SJ), 5/10/01.

d	a1k. Removed the recently added WFOs list from the county list display.
	     Display WFOs list on the watch edit GUI whenever counties exist.
	     Done, DP, (SJ), 5/10/01.

d	a1l. Added capability to automatically compute whether a watch box 
	     intersects one or more Great Lakes a/o adjacement coastal waters.  
	     Present the results as defaults in the Watch Format GUI; allow 
	     these "Adjacent Areas" buttons to remain editable.  Done, DP, 
	     (SJ), 5/10/01.

d	a1m. Assigned the output of the function "XmTextGetString" to a variable,
	     used the variable, then freed it. This will avoid the memory leak.
	     Done, MLI, (SJ), 5/14/01.

d	a1n. Added a check on the outlook VG file for elements with group types 
	     other than the expected group type.  If found, a warning message 
	     pops up to ask confirmation before proceeding.  JW, (DP), 5/14/01.

d	a1o. Modified nmap(2) to create the hurricane track text product in the 
	     new ATCF format.  Modified gpmap and nmap2 to plot a default storm 
	     name if none is given in the ATCF file.  Done, FY, (DP), 5/14/01.

d	a1p. Fixed bug in sfc prog.  Added Low symbol to the settings table.
	     Done, DP, (SJ), 5/14/01.

d	a1q. Made outlook product checking more understandable.  Done, DP, (SJ), 
	     5/15/01.

d	a1r. Added a label into "Watch Format" window to list all state names
	     included in the selected watch.  Done, JW, (DP), 5/16/01.

d	a1s. Made a new palette function called "Change Groups" which will 
	     allow users to change all user assignable groups in the current
	     VG work file to a specified group type.  Done, HZ, (ES), 5/16/01.

d1	a1t. Made emergency modifications to the hurricane track product maker.
	     The code no longer inserts 0 for lat/lon for missing forecast
	     points less than 5.  The storm ID filled into the GUI has been
	     corrected to properly read the storm ID from the input VGF file.
	     Done, DP, (SS), 6/6/01.

d1	a1u. Corrected an address error in the use of an xmstr when writing to a
	     scrolled list.  Done, ES, (SJ), 6/11/01.

d1	a1v. Fixed the file save permissions check in pgen.  Done, ES, (SJ), 
	     6/13/01.

d1	a1w. Fixed crashes related to the order of operation with XmString
	     creation and subsequent freeing in PGEN, NMAP, and NTRANS.  Done,
	     ES, (SJ), 6/20/01.

e	a1x. Added initial time option menu for Watch Format Window.  Done,
	     HZ, (DP), 6/25/01.

e	a1y. Changed the end-of-line definition per SPC request.  Done, DP, (AH),
	     6/27/01.

e	a1z. Added "Toggle Anchor Pts" button for Watch Format Window.  Done,
	     HZ, (DP), 6/27/01.

e	a2a. Upgraded SIGMET formatting per AWC request.  Changed format GUI 
	     label from "Distance" to "width", added "-none-" as a TREND option 
	     to sigmetinfo.tbl, added chk for "-none-" as a TREND opt in SIGMET 
	     formatting.  Done, DP, (SJ), 7/2/01.

e	a2b. Fixed 450.P1, where if more than 5 numbers are typed in for the 
	     initial time, NMAP/NMAP2 crashes.  Done, HZ, (ES), 7/5/01.

e	a2c. Fixed the label function problem in PGEN. The problem was: select a
	     element, puch the Label button, enter the text information and place
	     the text. The text and the object do not group as group type label.
	     Done, MLI, (ES), 7/6/01.

e	a2d. These changes close the browse window if the file selection window
	     is closed using "OPEN/SAVE/SAVE AS" in NMAP2 product generation.
	     This fixes report #457:O1.  Done, AH, (ES), 7/6/01.

e	a2e. Fixed 458.P1, where it was possible to set the minutes of the 
	     expiration time to >59, which caused the watch duration pop-up to 
	     show 0 hour for the duration or on HPUX a negative hour for the 
	     duration.  Done, HZ, (ES), 7/12/01.

e	a2f. Bug fixes; found and reported by SPC.  Currently, the watch status 
	     message "from" line points are inadvertently re-ordered by accessing 
	     code meant for SIGMET lines.  This fix bypasses the re-order code 
	     and is the same fix currently applied at the SPC.  Watch status 
	     lines drawn roughly south-to-north should now remain in the order 
	     drawn.  Also, the watch status message incorrectly lists the 
	     affected states when the number of states exceeds 7.  This is a 
	     string length problem which is corrected.  Done, DP, (DP), 7/17/01.

e	a2g. This release fixes bug report 462:P1.  The problem was that using 
	     the labeling action button did not always result in the object and 
	     text ending up as group type LABEL.  They were grouped correctly, 
	     but the group type was whatever group type was last used.  Also 
	     included is an unrelated code improvement for cvg_write().  At the 
	     end of the function it frees allocated memory, but if it exits 
	     with an error condition the memory was not freed up.  Done, ES, 
	     (SJ), 7/19/01.

e	a2h. Fixed minor problems with wording of convective SIGMETs over 
	     coastal waters.  Done, DP, (SJ), 7/24/01.

e	a2i. Corrected the rare occurrence where a watch anchor point is chosen 
	     by the "snap" routine and subsequently falls outside of the box.  
	     Done, DP, (SJ), 7/26/01.

e	a2j. Automatically generate list of continuing watches in watch format 
	     GUI.  If no watches are active, the list should be "0000".  Done, 
	     DP, (SJ), 8/14/01.

e	a2k. Fixed core dump during creation of clustered counties in watch.  
	     (#479:P1)  Done, DP, (SJ), 8/28/01.

e	a2l. This release corrects the attribute behavior for lines.  If the 
	     label toggle is off, the attributes (most importantly the color) for
	     the line are taken from the settings table (setting.tbl).  If the 
	     label toggle is on, then the attributes are taken from the grptyp.tbl
	     using the group type and label name as keywords. Note that this fix 
	     applies only to lines.  The defined attributes in the grptyp.tbl are 
	     line specific and no mechanism is in place to translate these to 
	     other types of objects which can be labeled (fronts, circles, and 
	     symbols).  Done, ES, (SJ), 8/28/01.

e	a2m. Cleaned up some lingering compiler warnings in PGEN library.  Done,
	     JW, (ES), (DP), 9/4/01.

e	a2n. Cleanup on PGEN watch cancel:  (1) renaming nmap_pgwcnl.c to 
	     nmap_pgwcnsl.c since all routines in it begin with pgwcnsl_.  (2) 
	     eliminating the unmatched type warning.  Done, JW, (DP), 9/4/01.

e	a2o. Cleaned up some lingering compiler warnings in PGEN library.
	     Done, JW, (ES), 9/10/01.

e	a2p. This release fixes a problem the HPC (Korty) was having with line 
	     editing.  In some circumstances lines grouped with text (group type 
	     LABEL) do not have the label string displayed in the line attribute 
	     box when the line is selected.  The problem is caused by too small 
	     an array size for the indexes to the grouped  elements.  Done, ES, 
	     (SJ), 9/12/01.

e	a2q. Added a new special symbol for Nuclear Fallout. Added the symbol to
	     the Special symbol group in the device library and plotsyms. Added 
	     the new symbol to the PGEN palette.  Done, SJ, (ES), 9/17/01.


022.	NFAX	

c	a. Prototyped NFAX.  Done, TP, AH, (TP), 2/1/01.

d	b. Minor changes based upon IRIX -n32 compiler messages.  Done, TP, (SJ),
	   4/10/01.


023.	Icons

024.	AWC Convergence

c	a. Multiple changes from the results of differences between the CDB 
	   source tree and the AWC source tree.
	1.  Changed the shape of two turbulence symbols.
	2.  Added a new machine type number for Linux (MTLNUX).
	3.  Added ability to specify which THTA to use for the BVSQ diagnostic.
	4.  Fixed a bug in checking the limits of an array in ER_INIT.
	5.  Initialized variables in GD_WPGD used as input to another routine.
	6.  Increased the size of the string cbelv in GG_STTL.
	7.  In ST_NULL, made sure that a blank string gets a NULL added.
	8.  Added an error check to SF_WSDD to return if writing the column 
		header failed, and before trying to write the data.
	9.  Allow TI_FORM to convert an input string with the century to a 
		standard GEMPAK date/time string.
	10. Fixed a bug in checking the number of grids against MMHDRS to
		check MMHDRS-1 in NAGRIB.
	11. Changed SFMPLT to allow the missing sky cover symbol to be plotted.
	12. Fixed a typo in RS_HHDE. The variable "code" changed to "temp".
	13. Increased the parameter MAXTYP from 200 to 300 for use in NWX.
	14. Increased the parameter MAXNOPT from 30 to 50.
	15. Increased the parameters MAXFNC, MAXTMP, and MAXPM from 300 to 400.
	   Done, SJ, SS, 2/23/01.

c	b. Increase MAXFCSTR from 32 to 40.  Use XStringToKeysym conversion.
	   Eliminate probable memory leak in xgsdat.c.  Done, ES, (SJ), 2/26/01.

c	c. Removed all references to the LDM ulog utility from the decoders.
	   All messages logged by the utility do not provide any useful
	   information that cannot be obtained elsewhere.  Done, SJ, (DKW),
	   2/26/01.


---------------------------------------------------------------------------------

	DKW - Duane Kidwell		CCM - Chris Caruso Magee
	DP - Dave Plummer		GG - Greg Grosshans	
	FY - Fee-Jing Yen		JA - Jeff Ator	
	SJ - Scott Jacobs		JC - Jim Cowie	
	SS - Steve Schotz		JG - Joanna Green
					JH - Jon Hoopingarner
					JP - James Partain	
	AH - Andrea Hardy		
	ES - Edward Safford		JYC - Joey Carr	
	HZ - Harris Zeng		KB - Keith Brill
	MLI - Michael Li	
    					RS - Russ Schneider	
	TL - Tiros Lee			SC - Steve Chiswell	
	TP - Tom Piper			SD - Steven Danz	

