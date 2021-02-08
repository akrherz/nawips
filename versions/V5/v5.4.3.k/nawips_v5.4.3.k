
                           NAWIPS 5.4.3+ Change Description Log

	( * indicates a change that makes this version of NAWIPS
	    incompatible with the previous version )



001.	ASCII Decoders

d	a.  Wrote new decoder for Aircraft (AIREP, PIREP, RECCO, 
	    AMDAR) bulletins.  The decoder creates ship-type 
	    GEMPAK surface files.  Done, JA, DKW, (SS), 10/28/97.

e	b.  Cleaned up the marine decoder.  Error logging, and 
	    documentation were improved.  A simplified interface
	    format was introduced.  Updated packing, error, and
	    station tables.  Done, DKW, (SS), 11/20/97.

e	c.  Updated decoder link scripts to accommodate SunOS 5.
	    Done, SJ, (SS), 11/26/97.

e	d.  Several new routines have been added to the dc library.
	    These routines will eventually replace common code used
	    by more than one decoder.  Also, updated the dc error table.
	    Done, DKW, (SS), 12/2/97.

f	e.  Corrected two originating stations in the flash flood decoder
	    to reflect changes made by OSO to WMO headers on November
	    18th.  Also modified date/time handling to process times
	    sent in as local instead of UTC.   Done, DKW, (SS), 12/8/97.

f	f.  The marine decoder has been modified to use the new dc
	    library routines instead of the decoder-specific routines
	    used previously.  Also the binary search algorithm  used
	    for finding Great Lakes buoy elevations has been replaced.
	    The station table (msfstns.tbl) no longer needs to be sorted.
	    Done, DKW, BH, (SS), 12/8/97.

f	g.  The aircraft decoder has been modified to use the new dc
	    library routines instead of decoder specific routines.
	    Done, JA, (SS), 12/8/97.

f	h.  Modified the routine that writes log messages to write a
	    maximum of 44 characters per line instead of 132 in cases
	    where no error group is specified.  Done, JA, (SS), 12/23/97.

f	i.  Corrected minor decoder problems in the marine decoder. 
            Corrected error in decoding swell wave direction when 
            direction is 360 degrees.  Corrected a pointer when the 
            3 hour pressure change is not 5 characters.  Done, BH, (SS), 
            12/23/97.

g	j.  Updated flash flood decoder to set a special time stamp for a
	    stations most recent data.  This will allow the display of
	    the most recent flash flood guidance from stations that have
	    different reporting times.  Done, DKW, (SS), 1/7/97.

g	k.  Made some improvements to the SCD decoder.  Added a simplified
	    interface and cleaned up the code.  Added new parameters and 
            updated help.  Modified the packing table.  Done, AH, (SS), 
            1/8/98.

g	l.  Corrected problem in the Marine decoder where the 20, 21,
	    22, and 23Z reports were not properly decoded on the 
	    22nd of each month.  Done, RH, (SS), 1/27/98.

g	m.  Wrote new decoder for land synoptic data (headers: SI, SM,
	    SN).  Done, DK, AH, RH, (SS), 2/3/98.

g	n.  Corrected limits for CBAS in the marine packing table to
	    correspond with the WMO Code Table 1600.  Also, allowed
	    the character '/' to be recognized as a valid category
	    for CBAS.  Done, AH, (SS), 2/4/98.

g	o.  Corrected a problem with the synoptic decoder where the
	    snow depth was not being written to the GEMPAK file.
	    Done, DK, (SS), 2/5/98.

g	p.  Decreased the value used to check for minimum bulletin length
	    in the synoptic decoder, dclsfc.  Some bulletins with only a 
	    single report were not being decoded.  Also, renamed LS_SC1B to
	    LS_SEC1 for consistency.   Done, BH, DKW, (SS), 2/24/98.

h	q.  Created two new routines in the DC library to write all
	    character and real interface array values that are not
	    missing to the decoder log at user-specified verbosity
	    levels.  Done, JA, (SS), 3/10/98.

h	r.  Modified the synoptic decoder so that the report time is 
            rounded to the nearest 3 hours before data are written.  
            Corrected code so that daily max/min temperatures are only 
            saved for 24 hr periods.  Added 24 hour surface pressure 
	    change to the output file.  Done, DKW, (SS), 3/16/98.

h	s.  Added Data Management and Quality Assurance Branch core code
            for the upper air decoder into the bridge library.  This code 
            is not yet integrated into N-AWIPS decoder structure.  
            Done, JA, AH, (SS), 3/18/98.

h	t.  Updated aircraft decoder to take into account change on 4/7/98
	    to ids within RECCCO being encoded with string following "RMK"
	    rather than within the second line of the WMO bulletin header.
	    This change can be delivered prior to 4/7/98 and should have
	    no effect on current decoding.  Done, JA, (SS), 3/25/98.

h	u.  Added a check for files that fail to open properly to DC_FCYL.
	    Done, SD, (SS), 3/31/98.

h	v.  Made some corrections to the Aircraft decoder.  Corrected the 
	    decoding of lat/lon for certain cases.  Also, cleaned up the
	    time checking in afdcod.f routine.  Added new WMO header 
	    identifiers into afbltp.f.  Created a new generic weather
	    verification routine that can be used by the various decoders.
	    Done, DKW, AH, (SS), 4/3/98.

h	w.  Modified an Aircraft Decoder routine so that certain types of 
	    reports won't be misidentified.  This corrects a previous 
            delivery modification.  Done, AH, (SS), 4/6/98.

h	x.  Modified the synoptic decoder to not decode relative humidity 
	    directly from the raw data.  This change will allow the 
            relative humidity to always be calculated from the dewpoint 
            and pressure.  Also, added the decoder version number to the 
            log output.  Done,
	    DKW, (SS), 4/14/98.

h	y.  The METAR decoder has been modified to use the new common 
            interface format.  Several other modifications were also made.
            General code and prolog cleanup.  Maximum visibility in packing 
            table was changed to 101 statue miles.  Parameter name HSUN 
            was changed to MSUN to match documentation.  Remarks being 
            decoded incorrectly from Mexican stations will no longer be 
            decoded.  Cloud cover groups with appended 'CB' or 'TCU' will 
            have this information included as parameter CTYL.  Wind speeds 
            in KMH from Peru will now be decoded.  Also, fixed a bug in 
            RA_RTIM when the bulletin time is missing.  Done, DKW, (SS),
	    4/22/98.

h	z.  Modified the land synoptic decoder, dclsfc, to remove
	    wet bulb temperature (TMWC) from the packing table.
	    Its value can be derived from decoded values.  For the
	    same reason, removed relative humidity (RELH) from the
	    aircraft decoder (dcacft) packing table.  Added PRES
	    (upper air pressure value) to dcacft packing table.
	    Made changes to other tables to improve NMAP display
	    of synoptic and aircraft data.  Done, DKW, (SS), 4/24/98.

h	aa. Created a new dc bridge routine to check that a report time
	    is within a specified number of hours before or a specified
	    number of minutes after the decoder run time.  The aircraft
	    decoder is changed to call this new routine.  Done, JA, (SS),
	    4/24/98.

i	bb. Restructured the afpnbd.f subroutine which decodes the
	    latitudes and longitudes for the PIREP navigational aid
	    portion of the aircraft decoder.  These new changes allow for
	    more non-standard reports to be decoded. Also, created a 
            compass subroutine that will find the direction for the 
            16 points on the compass. Modified afalon.f to decode a 
            position given as the dateline without an 'E' or 'W' 
            designation.  Done, AH, (SJ), 5/18/98.

i	cc. The METAR decoder, DCMETR, has been modified to calculate a 
            ceiling height from sky cover data and to choose 3 levels 
            of sky cover for GEMPAK based on an FMH-1 prioritizing 
            algorithm, rather than just taking the first 3 levels given.  
            Changes have been made to the processing of present weather 
            data to handle tornados, water spouts, and funnel clouds 
            correctly, to ignore weather descriptors without weather 
            phenomena, and to allow 'PL' as a designator for ice pellets.
            Decoders DCLSFC (land synoptic) and DCMSFC (marine) have been 
            changed to use dc library routines to print decoded values at 
            a user-specified log level, and a new common mnemonic has 
            been introduced for maximum and minimum temperatures for 
            non-specific time intervals.  Function PR_CMTN is not used 
            and is being removed.  Updated help and text files to include 
            parameters P24C and CEIL.  Done, DKW, (SJ), 5/18/98.

i	dd. Modified the aircraft decoder to accept the new phase of 
            aircraft flight value UNS (unsteady) within AMDAR reports.
	    Done, JA, (SJ), 5/19/98.

i	ee. Cleaned up afpnbd.f routine  by deleting blank lines and moving
	    code out of 73rd column.  Corrected afalon.f for determining the
	    longitude at the dateline.  Done, AH, (SS), 3/36/98.

i	ff. Some clean up of the SCD decoder was done.  Replaced code to
	    call a common DC library routine in scifpt.f.  Also, modified
	    scwea3.f to call a DC routine for locating a weather string.  
            Done, AH, (SS), 5/27/98.

i	gg. Corrected METAR decoder for minor bugs relating to the 
            algorithm in selecting sky cover, when there is more than 
            three levels reported.  Also, the SCD decoder has been cleaned 
            up and a bug which prevented more than one present weather 
            group from being written to the log has been fixed.  The 
            packing table has been changed to handle present weather 
            reports of funnel clouds and tornados.  Done, DKW, AH, (SS),
	    6/15/98.

j	hh. Added ability to decode visibilities reported in km in the 
            METAR decoder.  Done, AH, (SS), 7/9/98.

j	ii. Updated decoder and gemlib routines for change from PE to
	    PL for ice pellets for METAR code.  This change will occur
	    on November 5th the code modification will not affect
	    the current decoding of ice pellets.  Also added a new
	    parameter, FELV, flight level in hundreds of feet for
	    aircraft data.

j	jj. Rewrote the decoder for the MRF MOS bulletins, dcmmos.  Ten
	    new parameter names have been assigned for "day" and 
	    "night" values of the statistics.  Day and night statistics
	    are assigned the nominal GEMPAK times of 12z and 00z, 
	    respectively.  Done, DKW, (SS), 9/10/98.

j	kk. Updated a bridge routine to accept "TS", thunderstorm
	    without precipitation, as a valid weather code.  This
	    is allowable based on the NWS Observing Handbook No. 7.
	    Done, DKW, (SS), 9/14/98.

j	ll. Corrections made to bridge routines, RA_RTIM, FF_RTIM,
	    and RS_RTIM.  Under certain conditions, errors could 
	    occur during month and year changeovers in the calculation
	    of GEMPAK times.  Also, eliminated obsolete routine
	    TI_RTIM.  Done, DKW, (SS), 9/17/98.

j	mm. Corrections made to bridge routine, WW_RTIM.  Under
	    certain conditions, errors could occur during month and
	    year changeovers in the calculation of GEMPAK times.
	    Done, DKW, (SJ), 9/30/98.

k	nn. Added latitude, longitude, elevation and corrected report
	    indicator for the scd decoder.  Done, AH, (SS), 10/5/98.

k	oo. Changed way certain variables are being intialized in
	    several decoder routines to be standard FORTRAN.  This
	    will solve compilation problems on LINUX.  Removed
	    DATA statements from include .cmn files and use
	    initialization routine instead.  Done, DKW, AH,
	    (SS), 10/16/98.

k	pp. Corrected minor bug in the intialization in the MRF
	    MOS decoder.  Done, DKW, (SS), 10/16/98.

k	qq. Rewrote the AVN MOS decoder. Revised to use day and
	    night parameters.  Daily statistics are assigned
	    a nomimal GEMPAK time of 12Z.  Now decode Alaska
	    stations.  Done, FY, (SS), 10/19/98.

k	rr. Updated METAR decoder to prevent duplicate text strings
	    from being stored in the GEMPAK output file.  This was a
	    problem mostly with the Alaskan and Canadian reports.
	    Done, DKW, (SS), 10/26/98.

k	ss. Corrected a problem with the upper-air decoder, dcuair,
	    in handling erroneous hour values greater than 24.  Done,
	    DKW, (SS), 10/28/98.

k	tt. Rewrote the NGM MOS decoder.  Replaced parameter MXMN with
	    TNTF and TDYF.  Corrected help.  Done, FJY, (SS), 11/4/98.

k	uu. Minor cleanup and documentation corrections to the AVN
	    MOS decoder.  Done, FJY, (SS), 11/5/98.

k	vv. Corrected a couple of problems found in the upper-air 
	    decoder.  Corrected problem where some Canadian mandatory
	    data above 100mb were not being decoded.  Corrected
	    problem where the level following a bad mandatory level
	    was not being decoded.  Done, DKW, (SS), 11/5/98.

k	ww. Wrote a new program, SNMODL, to convert model soundings
	    from BUFFR format to GEMPAK sounding and surface files.
	    Also, the OSO metar decoder, DCHRLY, is removed.  Done,
	    DKW, KB, (SS), 11/17/98.

k	xx. Updated SNMODL to allow giving the packing file name only
	    without specifying the full path name.  Also, added 8
	    new packing tables to accomodate various types of BUFR
	    model output.  Done, DKW, (SS), 11/19/98.

k	zz. Corrected an error in SNMODEL regarding the AVN and MRF
	    packing tables.  In addition the code has been made more
	    robust in handling packing table errors.  Done, DKW, KB,
	    (SS), 11/23/98.

k	a1a. Modified MOS decoders, dcamos, dcmmos, and dcnmos to 
	     set the time for the report text to be the same as
	     that for the data.  This eliminates the first blank
	     frame when display these data in NMAP.  Also, cleaned
	     up the display of text by eliminating some control
             characters.  Done, DKW, (SS), 11/30/98.

k	a1b. Moved the code for model sounding decoder from bridge and
	     dc areas to gemlib and na program area.  SNMODL is now
	     called NAMSND and is located under the na directory.
	     Also, modified code in two minor respects.  First, 
	     missing precip is now checked.  Second, changed the
	     bufr code's 2-digit year time window from 1911-2010 to
	     1921-2020.  Done, DKW, KB, (SS), 12/2/98.

k	a1c. Modified MOS decoder so that the climatology for
	     each time and station is read from the monthly 
	     GEMPAK climatology files, and the anomalies are
	     calculated and stored.  Ten new parameters, 5
	     for climatology and 5 for anomolies have been
	     added.  Done, DKW, (SS), 12/10/98.

k	a1d. Made several changes to the model sounding program
	     as a result of testing.  Error messages for 
	     non-existent output files were eliminated.  Now allow
	     spaces between the surface output file and auxiliary
	     file name.  Improved program documentation.  Cleaned
	     up examples and packing table.  Done, DKW, KB, (SS),
	     12/21/98.

k	a1e. Updated LDM header file for AIX.  Done, SJ, (SS), 
	     12/21/98.

k	a1f. Added secondary swell wave data to the marine decoder
	     and made parameter conversion changes at the request of
	     the TPC.  Updated parameter conversion table to add
	     several combined wave period and height and combined
	     wave direction parameters; added necessary parameter
	     conversion routines.  Done, DKW, (SS), 12/23/98.

k	a1g. Forced the year to always be "00" when reading the
	     climatology data for MRF MOS decoder.  This corrected
	     a problem accessing the data after December 25th.  Done,
	     SJ, (SS), 12/29/98.

k	a1h. Fixed a fatal error in the METAR decoder that occurs on
	     IRIX6.  The problem occurred when an invalid substring
	     reference was generated in the process of decoding 
	     runway visual range data.  Also corrected typos in
	     parameter documentation.  Done, DKW, (SS), 1/4/99.

k	a1i. Several changes were made to the aircraft decoder DCACFT.
	     The legacy logic that decodes RECCO identifiers from the 
	     second header line of WMO RECCO bulletins is no longer 
	     needed and has been removed.  Declaration and intialization
	     of variables is now done in two separate statements.  The
	     report year, month and day have been added to the common
	     interface array.  Done, JA, DKW, (SS), 1/20/99.

k	a1j. Modified Metar decoder to decode hourly precip data. Also,
	     the station model parameter list for NMAP has been updated
	     to display these data in hundreths of inches or millimeters.
	     Done, DKW, (SS), 1/22/99.

k	a1k. Fixed the state in DC_GBUL when third carriage return is 
	     encountered.  Found by UNIDATA with NOAAport.  Done, SC, SJ, 
	     (TP), 1/28/99.

k	a1l. Fixed the decoding of the mean sea level pressure for
	     METAR reports in MT_SLP.  PMSL is compared to the 
	     altimeter setting for consistency.  
	     Done, SJ, (TP), 2/8/99.


002.	GRIB Decoder

e	a. Added capability to handle cases 10, 11, and 12 for
	   pds.time_unit which will allow accumulated parameters
	   beyond 256 hours.  Done, DP, (SS), 11/10/97.

h	b. Added capability to decode TDL ensemble grids.  Done, DP, 
	   (SS), 3/11/98.

i	c. Fixed grid packed integer array length determination---
	   length did not include any extra word needed to hold
	   packed data that does not fill out a whole word.  This
	   resulted in erroneous values at the very end of unpacked
	   grids. Done, KB, (SJ), 5/18/98.

i	d. In general, GRIB does not restrict longitudes to be within
	   the -180 to +180 range.  GRIB only requires + east and -
	   west.  Therefore, -185 is as valid as 175 for a center
	   longitude.  If angles are outside of -180 -> +180, gblamb.c
	   will fail.  This change fixes that. Done, KB, (SJ), 5/18/98.

j	e. Added capability to handle new way the EMC will put out
	   native grids.  This will allow the processing of grids
	   with octet 6 set to 203.  Done, KB, (SS), 9/24/98.

k	f. Added a check early in the processing of NAGRIB to check for
	   a grid that exceeds the maximum allowable size.  If the 
	   size is exceeded, an error message is written.  Also, increased
	   the size of the maximum grid to accomodate larger grids required
	   by MPC for the ice model.  Done, SJ, (SS), 1/20/99.



003.	Grid Diagnostics



004.	Parameter Calculations


005.	Image Processing

f	a. Corrected a variable declaration in IM_UNHD that was
	   causing errors in radar image times.  Done, SJ, (SS),
	   12/11/97.

f	b. Modified IM_AR2GM to handle the new McIDAS format
	   for the Julian day that has the year as the number of
	   years since 1900.  Done, JC, SJ, (SS), 12/11/97.

f	c. Added the last set of variable name changes for the
	   IM library from Jim Cowie.  Added changes from Jim
	   Cowie and Steve Chiswell for reading and displaying
	   radar images.  Added elevation angle to title for 
	   radar images.  Added color bar for radar images.
	   Added new table for NIDS products' attributes.
	   Updated imgtyp.tbl to incorporate Jim Cowie's changes
	   and new radar imagery information.  Added NEXRAD sites
	   to NMAP overlay table.  Done, SJ, JC, SC, 12/30/97.

h	d. Modified imcbar.f and ggcbar.f so that color bars are filled
	   with the solid pattern instead of the hashed.  Done, AH, (SS),
	   4/8/98.

k	e. Fixed IM_UnHD for display of regional readar images.  The
	   image navigation was incorrect causing position errors.
	   Done, SJ, (SS), 11/16/98.

k	f. Added check in IM_ISUB for MER projections.  This corrected
	   a problem found drawing near the edge of a satellite
	   image in the mercator projection.  Done, SJ, (SS),
	   11/18/98.

k	g. Fixed line widths on the color bar for radar images.
	   Done, SJ, (TP), 2/8/99.


006.	GPLT Changes

d	a. Renamed McIDAS function ITIME to ITIMC to remove confusion
	   with FORTRAN built-in function ITIME.  Done, SJ, (SS),
	   10/28/97.

e	b. Modified the calling sequence of GSTEXT/GQTEXT.  Added
	   new parameters for border/blank fill type, rotation
	   orientation (screen or north relative) and justification.
	   Modified all routines that call GSTEXT/GQTEXT.  Modified
	   GTEXT to rotate text in either a screen relative or north
	   relative mode.  Removed GSTXSY/GQTXSY.  The border/blank
	   fill type is not implemented with this delivery.  Done,
	   SJ, (SS), 11/18/97.

*	   (  This is incompatible with previous versions because
	      the calling sequence of GSTEXT/GQTEXT has been 
	      changed. )

e	   1. Fixed the call to HSTEXT in DPTND. This was missed in
	      the initial delivery. Done, SJ, (SJ), 11/21/97.

f	c. Added a flag to the text justification to allow text to
	   be plotted without checking the clipping bounds.  This
	   is needed for titles, e.g., titles plotted by NTRANS.
	   Done, SJ, (SS), 12/9/97.

f	d. Created GQSIZD routine to handle sizes of markers, text
	   characters, wind barbs, weather symbols, arrows, and arrow
	   heads.  Currently this routine can be accessed by ATEST.
	   Done, ID, (SS), 12/11/97.

h	e. Added new set of functions to smooth lines using splines.  
	   Updated appropriate routines to accommodate smoothing
	   functions.  Done, SJ, (SS), 3/2/98.

h	f. Added a new set of functions to allow the user to set a
	   scaling factor for the line dash patterns.  Adjusted the
	   value for LPSCAL for the XW and NC device drivers.  Done,
	   SJ, (SS),  3/16/98.

h	g. Added bold font for software fonts by increasing the line
	   width if bold font is requested.  Done, SJ, (SS), 3/16/98.

h	h. Added light and heavy forms of the superstructure icing symbols. 
	   Generated two superstructure icons for NMAP.  Also, added heavy
	   rain, heavy snow, and snow with thunderstorm icons.  Corrected
	   VG driver so that correct icing symbol will be displayed when
	   more than one is specified.  Updated plotsyms utility.  Done,
	   GK, (SS), 3/18/98.

h	i. Created routines to plot directional arrows (wind arrows with no 
	   speed), hash mark attributes, and two color setting attribute 
	   routines that can eventually be used for front objects.  Done,
	   ID, (SS), 3/30/98.

h	j. Modified smoothing function to not call dcgaus which does not
	   work properly for lines with greater than 32 points.  This 
           corrects a problem found as a result of CDB testing.  
           Done, SJ, (SS), 4/9/98.

h	k. Replaced the routines that draw fronts and special lines.  Added
	   new line types requested by the SPC.  The new routine reads a 
	   table and processes the individual segments of a pattern in 
	   order to draw the different line and front types.  Modified 
	   bscalp and bscalt for each device driver.  Modified GSPLN and 
	   GFRNT to call DSCLR2 so that stationary fronts are drawn with 
	   2 colors.  Added a new function to draw an arc and now have 
	   ICIRC call this routine.  Fixed IARRW to use the fill routine.  
	   Added special lines to plotsyms.  Done, SJ, (SS), 4/20/98.

h	l. Updated dshash and ddarr for necessary changes for VG driver.
	   Done, ID, (SS), 4/22/98.

h	m. Corrected equations in DCGAUS to allow smoothing of lines with 
	   greater than 32 points.  Updated DSPLIN to allow call to DCGAUS
	   for a cyclic end point condition.  Done, ID, (SS), 4/23/98.

h	n. Corrected bug in setting colors for the special lines. This was
	   causing a problem when smoothing.  Also, fixed a bug in the
	   calculation of the end points of a text string for clipping
	   purposes.  Done, SJ, (SS), 4/23/98.

h	o. Corrected bug with drawing of directional arrows.  Done, 
	   ID, (SS), 4/27/98.

h	p. Fixed problems found with new special lines.  Allow tick mark
	   pattern to be flipped.  Fixed break points for the box and
	   X patterns.  Also, restored removal of call to DCGAUS, until
	   this routine can be fixed later.  Also, fixed problem with
	   smoothing with duplicated vertices.  Done, SJ, ID, (SS),
	   4/28/98.

h	r. Added a reset to the first color at the end of the special line
	   drawing routine.  This corrects a bug where after drawing 
	   stationary fronts sometimes causes incorrect colors to be 
	   plotted for symbols.  Done, SJ, (SS), 4/29/98.

h	s. Added a new smoothing function based on a parametric curve fit.
	   Made this the default for the product generation.  Also, added
	   resetting of the fill type to solid in the CDS routines for
	   filled and special lines to fix problem where fill pattern
	   is applied improperly.  Done, SJ, (SS), 4/29/98.

h	t. Fixed two problems with smoothing.  Short segments were not 
	   drawn properly.  Increased the difference between the amount 
	   of smoothing done by level 1 and 2.  Done, SJ, (SS), 4/30/98.

h	u. Fixed a problem with common block in ddarr.f routine.  Done, SJ, 
	   (SS), 4/30/98.

h	v. Fixed a problem with common block in dhash.f routine.  Done, SJ, 
	   (SJ), 5/4/98.

h	w. Cleaned up and rearranged some GPLT routines for consistency.
	   Removed the function GOUTP and the program GPOUT.  They are
	   no longer needed.  Modified the calling sequence for GGTPNT to
	   remove the number of points requested.  Changed the meaning of
	   the type of variable to handle points, lines and boxes.  
	   Modified calling routines. Moved GSCTBL routines from control 
	   group to the colors group.  Done, SJ, (SS), 6/11/98.

j	x. Added the ability to rotate cylindrical maps and grids to 
	   accommodate ICAO map projections.  Done, KB, SJ, (SS), 
	   7/7/98.

j	y. Fixed a typo from the earlier delivery of map rotations.  Done,
	   SJ, (SS), 7/7/98.

j	z. Added maximum number of output points to the calling sequence 
	   for the curve smoothing function, dprmtc.f.  Modified calling 
	   routines appropriately.  Done, SJ, (SS), 7/9/98.

*	   (Change in the calling sequence of function dprmtc.f )

j	aa. Added a new routine, GQCVSC that returns the curve smoothing
	    scale factor, CRVSCL.  Done, TL, (SS), 7/22/98.

j	bb. Moved the curve smoothing routine from the device to a new
	    GEMLIB library, cv, to make smoothing accessible for GUI
	    applications.  Updated calling routines.  Done, TL, (SS),
	    7/28/98.

j	cc. Added the slash symbol to special symbols.  Updated 
	    plotsyms program.  Done, GK, (SS), 7/29/98.

j	dd. Added GTEXTC to the undscr.h file for C routine access.
	    Done, SJ, (SS), 7/29/98.

j	ee. Added changes to the GVAR projection requested by AWC.
	    Added GOES-8 sounder products to imgtyp.tbl.  Done,
	    SJ, (SS), 8/27/98.

j	ff. Added special line 21, dashed line with closed arrow to 
	    special line patterns table.  Also, reformatted special
	    line display in the plotsyms program.  Done, TL, (SS),
	    8/28/98.

j	gg. Removed the check for multiple end points when drawing
	    special lines with arrow heads.  If the end points are the
	    same, no arrow head is drawn.  Done, SJ, (SS), 9/2/98.

j	hh. Changed the calling sequence to CV_PRMT to include 
	    istrt and iend.  These variables define the range of the
	    original points for the output curve.  Modified calling
	    routines for this change.  Done, SJ, (SS), 9/3/98.

j	ii. Corrected problem in GTXSY that was not allowing rotation
	    of special text.  Also, added a check not to rotate the
	    dividing line when using hardware fonts for the special
	    text.  Done, SJ, (SS), 9/10/98.

j	jj. Corrected the special line drawing routine, IPATLN to
	    draw a dot when vertices are at the same location.  Done,
	    SJ, (SS), 9/11/98.

j	kk. Corrected another typo in GTXSY that was causing problems
	    in the north rotation of special text.  Done, SJ, (SS),
	    9/11/98.

j	ll. Added blank out feature to directional arrow.   Done,
	    TL, (SS), 9/22/98.

j	mm. Force number of subboxes in contouring to be zero, when
	    CONTUR = 1.  Done, DP, (SS), 9/24/98.

k	nn. Changed all calls to GAZDRM and GDRAZM to GP_AZDR and 
	    GP_DRAZ throughout N-AWIPS.  The GAZDRM and GDRAZM will
	    be removed in the next patch.  Done, ID, (SS), 10/26/98.

k	oo. Created and modified GEMPAK routines that will now treat
	    combination symbols as one entity.  NMAP code will be modified
	    in a subsequent deleivery to accomodate these changes.
	    Done, AH, (SS), 10/28/98.

k	pp. Removed subbox code from the contour algorithm.  This simplifies
	    the contouring code in preparation for improvements to be
	    added in the future.  Done, SJ, (SS), 11/2/98.

k	qq. Added new entries to FUNCCODE.PRM and a new common CFCMN.CMN in
	    preparation for new contour line/fill routines.  Done, DP, (SS),
	    11/5/98.

k	rr. Changed the way circles are drawn.  Now a center point and
	    circumference point are specified instead of a radius in
	    N coordinates.  Done, AH, (SS), 11/5/98.

k	ss. Correct problem when contouring fields with missing data.
	    Done, SJ, (SS), 11/12/98.

k	tt. Added logic to IPATLN to compute the smallest length for blank
	    spaces and solid lines, so that more pips will fit in the total
	    distance drawn by the user.  Done, SJ, (SS), 11/30/98.

k	uu. Added underlined text with a fill box to the possible types for
	    special text.  Done, SJ, (SS), 1/8/99

k	vv. Updated WRITE statement in ATEST to take into account all 
	    special text types (1-11).  Updated prolog in itxsy.f.
	    Done, SJ, (SS), 1/13/99.

k	ww. Undo delivery 006pp in version 5.4.3.k.  Done, SJ, (TP), 2/10/99.


007.	Device Drivers

a       a. Additional corrections to computation of AFOS file creation
	   time were done.  Done, SJ, (SS), 10/3/97.

b	b. Updated the calculation of the time stamp to use a base time
	   supplied by the user.  Done, SJ, (SS), 10/14/97.

c	c. Corrected clipping problem for symbols for the UTF driver.
	   Done, SJ, (SS), 10/21/97. 

d	d. Changed the style of the line end caps from a butt end to
	   a rounded end.  This fixed the problem with some markers
	   and symbols looking like some pixels were missing.  Done,
	   SJ, (SS), 10/30/97.

e	e. Fixed DSFRNT to accept a front code of "0".  Corrected 
	   bugs that were detected by the AIX compiler.  Done, SJ, 
	   SS, 11/13/97.

e	f. Modified the xwp, xw, and ps device drivers to have color
	   consistency among these drivers.  This change allows a color
	   table to be applied to NTRANS printed output.  Also, modified
	   NXM color routines so that all RGB value changes are done
	   through call gsbrgb.  Done, SW, (SS), 11/25/97.

e	g. Fixed PTEXT to plot titles properly.  Changed the check for
	   an out-of-bounds string to work with the new text justification
	   in the PS driver.  Also fixed calling sequence error to 
	   DSTEXT in DLOGO.  Done, SJ, (SS), 11/26/97.

e	h. Fixed check for NULL string and strings with zero length
	   in csctbl.c.  This corrected a fatal bug in VG and NC
	   drivers on IRIX5.  Done, SJ, (SS), 12/3/97.

f	i. Fixed problem where the UTF driver was not plotting turbulence
	   symbols.  Done, WL, (SS), 12/9/97.

f	j. Fixed problem in PS driver where blank out text was not being
	   printed.  Also, corrected typo in CDS_TEXT.  Done, SJ, (SS),
	   12/15/97.

g	k. Added capability to changed the default colors for printing
	   by using a new table $GEMTBL/colors/cvtclr.psc.  Done,
	   WL, (SS), 1/23/98.

g	l. Corrected problem where the open statement for the table
	   cvtclr.psc had the wrong directory name.  Done, WL, (SS),
	   1/27/98.

g	m. Updated DTEXT to use the values for border/background fill
	   to plot boxes and fill around the specified text string.
	   Added ITXBOX routine to compute and draw the different 
	   box shapes.  Updated the justification for hardware fonts
	   in the XW, PS, NC and UTF drivers to make the text strings
	   fit the boxes better.  Updated NTRANS to ignore color 101
	   which is used for background fill for text when displaying
	   the color edit buttons.  Changed the size of the boxes drawn
	   by ITXSY as requested by the AWC.  Updated help files.  Done,
	   SJ, (SS), 1/28/98.

g	n. Changed dots in IDRAW to be circular.  Added FAX driver to
	   PLOTSYMS.  Changed lpscal in HINIT for the FAX driver to add
	   more space in the line patterns.  Modified hardware dot software
	   for FAX driver.  Hardware dots are currently not used.  Done,
	   SJ, (SS), 2/2/98.

g	o. Fixed error in setting of ntxhw in the FAX driver in the
	   HINIT function that was preventing text print out.   Done,
	   SJ, (SS), 2/5/98.

g	p. Fixed several bugs found as a result of CDB testing for
	   updated DTEXT changes (007m).  Done, SJ, (SS), 2/17/98.

g	r. Changed the calculation in the UTF driver to include minutes.
	   This is needed for some AFOS products produced by the AWC.
	   Done, SJ, (SS), 2/18/98.

g	s. Added the ability to plot radar/satellite colors for the color
	   bar, in the PS driver.  Done, SJ, (SS), 2/18/98.

g	t. Fixed bug created by delivery of 007p. where title was not
	   positioned properly.  Done, SJ, (SS), 2/18/98.

g	u. Fixed fatal bug in printing from GUI programs caused by not
	   properly accounting for a calling sequence change in pscolr.c.
	   Done, CL, (SS), 2/20/98.

h	v. Modified the front drawing routines to NOT fill the pips for
	   the UTF driver.  This corrects the bug of pips not being 
	   drawn in the UTF driver.  Done, SJ, (SS), 3/5/98.

h	w. Added ability to change the pattern for filled areas in the 
	   device drivers.   The fill patterns are now 1 = solid, 
	   2 = stipple, 3 = diagonal lines.  Done, SJ, (SS), 3/23/98.

h	x. Corrected bug in PS driver when trying to plot one pattern after
	   another, without changing colors.  Done, SJ, (SS), 3/24/98.

h	y. Changed ITXSY routine to use the text border and background
	   attributes for types 1-6 and new type 10 (underline text).
	   Types 7, 8, and 9 are drawn as before.  Done, SJ, (SS),
	   4/6/98.

h	z. Changed ITBOX to always set the background fill to solid.  Done,
	   SJ, (SS), 4/6/98.

h	aa. Completed the DHASH routine to draw the hash marks orthogonal 
	    to a given angle.  Done, ID, (SS), 4/6/98.

h	bb. Modified FAX processing to handle multiple subsets for a given
	    FAX product wheel number.  Also, updated FAX product table
	    for Basic Weather products.  Done, SJ, (SS), 5/13/98.

i	cc. Removed underscore declarations from xpgsvfrm.c.
	    Done, ID, (SJ), 5/21/98.

i	dd. Fixed some problems with the special line type drawing routine.
	    Fixed bugs with arrow heads when drawing special lines.  Also,
	    modified routine so that the pip size stays consistent as the
	    length of the line changes.  Done, SJ, SD, (SS), 5/26/98.

i	ee. Added the special line pattern information to the DEVCHR common
	    area.  Added reading of the table to DINIT and modified IPATLN 
	    to not read the table but use the common variables.  This was 
	    done to improve performance.  Done, SJ, (SS), 6/17/98.

j	ff. Cleanup of text handling with new capabilities.  Added north 
	    relative text.  Updated xTEXT for drivers for computation of the 
            offsets.  Changed bscalc values in hinit routines to make HW and 
	    SW text sizes more consistent.  Removed ITYPE from GTEXTC calling
	    sequence.  Removed no-clipping flag from the justification in the
	    text attributes.  Changed GG_WSTR to remove no-clip flag and to 
	    call GTEXTC.  Added the actual text size set by drivers for HW 
	    to the DEVCHR common for use by routines for plotting special
	    text and symbols.  Fixed offsets for special text with 
	    turbulence symbols.  Text size can now be referenced by a name
	    which is defined in the table $GEMTBL/config/fontsz.tbl.  Text
	    size as a name can be parsed in all GEMPAK programs.  Done,
	    SJ, (SS), 7/27/98.

*	    (This change is incompatible with previous versions because there
	     have been several routines where calling sequences have been 
	     changed.  These routines are indicated with a * next to them in
	     the changes.log.)

j	gg. Fixed two problems associated with text cleanup delivery, (007ff).
	    Fixed plotting long titles in XW driver when panels are used.  
	    Corrected NTRAN problem with plotting titles for multipanels.  
	    Done, SJ, (SS), 7/29/98.

j	hh. Corrected text plotting for XW driver when offsets are used
	    with non-standard sizes.  Done, SJ, (SS), 7/30/98.

j	ii. Changed the margin for the PostScript device driver to
	    1/4 inch margin on all sides of the page.  This is the
	    minimum margin width.  Done, SJ, (SS), 8/13/98.

j	jj. Changed the scaling parameter from bscalc to bscalw for
	    past weather symbols and cloud types for symbol size
	    consistency.  Done, AH, (SS), 8/25/98.

j	kk. Added capability to block out, draw a background filled box
	    around a wind barb or arrow.  Done, TL, (SS), 8/25/98.

j	ll. Fixed the special text with turbulence symbols to change size
	    of the symbols when the text size is changed.  Done, SJ, 
	    (SS), 8/27/98.

j	mm. Fixed problem with color 1 was not being properly set in 
	    the XWP driver for Postscript output.  Added a large
	    size paper size, 24x36 inches to the Postscript driver.
	    Done, SJ, (SS), 9/22/98.

j	nn. Created new driver, rbk, that creates a graphics file
	    in AWIPS or OSO AWIPS format.  The OSO format is 
	    different in that it has an EBCDIC format header.
	    Done, AH, (SS), 9/23/98.

j	oo. Corrected bugs in the Redbook driver found as a result of
	    CDB testing.  Driver will now display graphics properly
	    for AWNA area.  Corrected display of text names.  Done,
	    AH, (SS), 9/25/98.

j	pp. Corrected bug found where if the user did not specify
	    a PIL name for the Redbook driver, it did not have the 
	    correct default information.  Done, AH, (SS), 9/25/98.

k	qq. Corrected a problem with the centered string location 
	    calculation in the y direction for the NC driver routine, 
	    MTEXTC.  This problem was found by the AWC for text size
	    of 1.2.  Done SJ, (SS), 11/2/98.

k	rr. Changed the XsetFillRule in the XW driver from 'WindingRule'
	    to 'EvenOddRule' which is the default for X-Windows Graphics
	    Context.  This change is in preparation for the new 
	    contour/fill algorithm and should have no effect on the
	    current algorithm.  Done, DP, (SS), 11/5/98.

k	ss. Fixed a typo in DINIT.  This was causing inconsistent failure
	    of NMAP initialization.  Done, SJ, (SS), 11/16/98.

k	tt. Added checks to VLINE, VSPLN and VFILL for duplicate endpoints
	    for closed line in the VG driver.  Also, changed the element
	    type of regular text to special text type 0 in the VG driver.
	    Done, SJ, (SS), 12/16/98.

k	uu. Created and modified routines that draw circles.  Added circle
	    to underlying product generation routines.  Done, AH, (SS),
	    12/18/98.

k	vv. Corrected the regular text alignment value to the range
	    for special text when writing to the VG file.  Done, SJ, 
	    (SS), 12/29/98.

k	ww. Created a device driver for TIFF files that use Group 4
	    Fax compression.  Done, SJ, (TP), 2/2/99.

k	xx. Reduced y-offset for individual symbols for combined symbols.
	    Done, SJ, (TP), 2/8/99.

k	yy. Fixed reported problem with the TIFF driver.  Done,
	    SJ, (TP), 2/8/99.

k	zz. Increased tchar variable in dtext.f to 400.  Done,
	    SJ, (TP), 2/10/99.


008.	Documentation

d	a. Corrected prolog format in CGEMLIB and GEMLIB routines.
	   Format corrections included typos, capitalization errors,
	   errors in parameter descriptions and names. These
	   changes are in the prologs only and do not require
	   compilations.  Done, ML, (SS), 11/3/97.

e	b. Created text files for chapter introductions for programmers
	   manuals.  Reformatted text files for the FL, RA, RS, and
	   RU libraries.  Updated the text file for the CFL library.
	   Done, ML, (SS), 11/24/97.

e	c. Corrected typos in four text files for the libraries.  Done,
	   ML, (SS), 12/1/97.

f	d. Improved the documentation and spacing in station reading
	   routines.  Done, SJ, (SS), 12/10/97.

f	e. Improved documentation regarding potential vorticity (PVOR)
	   and Q-vector (QVEC, QVCL) usage.  Done, TL, (SS), 12/17/97.

f	f. Wrote new programs and supporting scripts and ancillary files
	   to generate programmers guides.  Done, ML, (SS), 12/23/97.

g	g. Made some corrections to NOTAE.HLP.  Corrected typo, added a 
	   header line, and simplified the explanation of the WINDOW 
	   function.  Done, GK, (SS), 1/7/98.

g	h. Updated help for TXTLOC parameter.  Done SJ, (SS), 2/23/98.

h	i. Updated help for device to reflect AFOS base time includes
	   minutes.  Done, SJ, (SS), 3/16/98.

i	j. Corrected prolog calling sequence and variable list for some
	   APPL routines. Done, TP, (SJ), 5/19/98.

i	k. Updated prologues and help information for map projection 
	   updates.  Done, KB, (SS),  6/15/98.

i	l. Update to GEMPLT documentation.  Numerous improvements and 
	   corrections were made to the appl prologs and associated text 
	   files in preparation for an update to the GPLT programmers 
	   guide.  No source code changes were made.  Done, DKW, AH, (SS), 
	   6/17/98.

i	m. Updated product generation help for NMAP.  Also, added a 
	   What's New help to NMAP.  Done, SJ, (SS), 6/24/98.

j	n. Improved the projection help file description of the new
	   capability to rotate cylindrical maps and grids.  Done,
	   KB, TL, (SS), 7/21/98.

j	o. Finished documenting the prolog for tb_font routine that
	   was recently delivered.  Done, SJ, (SS), 8/4/98.

j	p. Corrected parameter name in the awpsfl.hl1 file.  Done,
	   AH, (SS), 9/23/98.

j	q. Updated product generation help and the What's New help
	   for NMAP.  Done, SJ,SS, (SJ), 9/30/98.

k	r. Updated prolog documentation in CGEMLIB routines.  No 
	   compilation is necessary.  Done, TP, (SS), 10/29/98.

k	s. Updated documentation book table files for Programmers
	   Guide.  Done, TP, (SS), 11/4/98.

k	t. Updated prolog documentation in GEMLIB routines.  No
	   compilation is necessary.  Done, TP, (SS), 11/5/98.

k	u. Removed tabs from 3 PRM files.  Done, SJ, (SS), 
	   11/18/98.

k	v. Updated NMAP help files for patch K.  Done, SS, (TP),
	   2/11/99.


009.	Scripts/NTS files

c	a. Added AVNBUL and TESTCES to link scripts.  Done, SS, 
	   (SS), 10/17/97.

e	b. Corrected the link script testcgr_link.  Done, SJ, 
	   (SS), 11/24/97.

i	c. Added CONVCVG to cgemlib_link script.  Done, SS, (SS),
	   6/22/98.

k	d. Added sfmap_nc_link to sf_link and added gdplot2_vg_link
	   to gd_link.  Done, TP, (TP), 2/5/99.

k	e. Added ncolor program to nprog build scripts.  Done, SS,
	   (SS), 2/12/99.


010.	General GEMLIB/CGEMLIB Changes

a	a. Updated version number to 5.4.3.a.  Done, SS, (SS),
	   10/6/97.

b	b. Updated version number to 5.4.3.b.  Done, SS, (SS),
	   10/9/97.

c	c. Updated version number to 5.4.3.c.  Done, SS, (SS),
	   10/15/97.

c	d. Fixed some problems in the TESTPC program including
	   inconsistent argument types, output strings greater
	   than 80 columns, and improved error message handling.
	   Done, TL, (SS), 10/16/97.

c	e. Cleaned up CST library.  Removed MALLOC calls.  Eliminated
	   the remove spaces and tabs option from the CST_CLST, CST_FLST,
	   CST_RLST, and CST_ILST argument list.  Added a maximum output
	   string length limit to CST_CLST and CST_FLST.  Modified calling
	   routines for calling sequence changes, where appropriate. Done, 
	   GK, (SS), 10/20/97.

c	f. Corrected CES_RSTNG to properly read the attribute table.  Done,
	   CL, (SS), 10/21/97.

c	g. Fixed CST_CLST for multiple spaces.   Also replaced STRNCPY
	   with STRCPY.  Done, GK, (SS), 10/21/97.

d	h. Updated version number to 5.4.3.d.  Done, SS, (SS),
	   10/27/97.

d	i. Modified surface file data access routines to create,
	   read and write watch-by-county data to GEMPAK surface
	   files.  Done, TL, (SS), 10/30/97.

d	j. Fixed bugs in ST_RMST and IN_TXTN that were resetting the
	   user input for TEXT after the parsing was done.  Updated
	   GPMAP to use IN_TXTN to reset text attributes after
	   plotting VG or AFOS files. Done, SJ, (SS), 11/3/97.

e	k. Updated version number to 5.4.3.e.  Done, SS, (SS), 
	   11/10/97.

e	l. Added a new grid diagnostic function that computes wet
	   bulb potential temperature.  Done, TL, (SS), 11/12/97.

e	m. Corrected inconsistency between CST and ST libraries.
	   Added removal of blanks to routines CST_NUMB and
	   CST_CRNM.  Done, GK, (SS), 11/18/97.

e	n. Changed the dimension from 10 to MAXPRM in a variable
	   used by the PC_FTOP routine.  This changed avoids
	   a potential array overflow problem.  Done, TL, (SS)
	   11/18/97.

e	o. Added the function scandir to the CSS library for SUNOS 5
	   only.  Done, SJ, (SS), 11/26/97.

e	p. Renamed DATCHR.TBL to DATA.TBL in error messages in fl
	   routines to accurately reflect table name.  Updated
	   help files with the correct name for the table.  Done,
	   WL, (SS), 12/1/97.

f	r. Updated NAWIPS version to 5.4.3.f.  Done, SS, (SS),
	   12/5/97.

f	s. Longitudinal boundary checks that set the longitude to 
	   -180 and 180 degrees were removed from GR_FIXA.  These
	   checks were causing the plot to be split into two pieces
	   when garea was set to grid.  Done, ID, (SS), 12/5/97.

f	t. Created a new function, TI_TZDF to convert the time
	   from one time zone to another.  Done, SJ, (SS), 
	   12/5/97.

f	u. Modified searching for restore files.  The searching order is 
	   now: local file as given; local file with .nts file extension;
	   file in the path given; file in the path given with .nts file
	   extension; file in $GEMNTS/path; file in GEMNTS/path with the
	   .nts added.   Done, SJ, (SS), 12/15/97.

f	v. Added a check for blank input file name to IP_REST.  Done,
	   SJ, (SS), 12/16/97.

f	w. Corrected typo in format statement of TESTPT.  Done, AH, 
	   (SS), 12/17/97.

f	x. Added three new variables to IN-TXTN, (ibrdr, irrotn, and
	   ijust) for border, rotation, and justification of text.  
	   Updated calling routines for calling sequence change.  Done,
	   ID, (SS), 12/22/97.

f	y. Added check for missing wet-bulb temperature in its calculation.
	   Done, TL, (SS), 12/31/97.

f	z. Fixed typos in a calling sequence in testpc.f.  Also added 
	   FL_MFIL calls where appropriate.  Done, TL, (SS), 12/31/97.

f	aa. Fixed IP_REST when trying to restore a local NTS file.
	    Done, SJ, (SS), 12/31/97.

f	bb. Made order of printed variables the same as input in
	    TESTIN for the in_txtn function.  Corrected typos
	    in intxtn.f comment lines.  Updated text.hl2 to reflect
	    newly added attributes.  Done, ID, (SS), 12/31/97.

g	cc. Updated to version 5.4.3.g.  Done SS, (SS), 1/7/98.

g	dd. Modified some FL routines to allow for accommodating 
	    forecast hours in the model name template.  Done, DP, 
	    (SS), 1/27/98.

g	ee. Corrected a bug in DG_CLOS and DG_CLAL.  Internal grids
	    were not being checked and reset properly if the file
	    was being closed.  This fix eliminated a problem in 
	    RUC2 grid file access.  Also, DG_OFIL was modified to
	    call DG_CLOS directly removing duplicate code.  Done,
	    DP, (SS), 2/2/97.

g	ff. Fixed bug associated with FL_MFLS.  Also modified
	    GDGTMF to process file names with templates containing
	    forecast times, fFF.  Wrote a new routine, GDGCYC.f to
	    determine which cycles are available given a filename or
	    template.  Done, DP, (SS), 2/3/98.

g	gg. Corrected the calling sequence in cst_nocc to return the
	    string position as an integer.  This function is currently
	    only called by the test program testcst.  Done, SJ, (SS),
	    2/5/98.

g	hh. Corrected problems with new functions to handle forecast
	    hours in the file template as a result of CDB testing,
	    010dd.  Done, DP, (SS), 2/18/98.

h	ii. Updated nawips version number to 5.4.3.h.  Done, SS, (SS),
	    2/27/98.

h	jj. Updated testcrg for new crg function names and cleaned up.  
	    Done, FY, (SS), 2/27/98.

h	kk. Updated DG library routines to accommodate model data in 
	    multiple forecast files.  Done, DP, (SS), 3/3/98.

h	ll. Simplified logic of cfl_trln routine.  Done, DP, (SS),
	    3/4/98.

h	mm. Corrected typo in write statement in TESTSN that caused a
	    fatal error.  Done, SJ, (SS), 3/5/98.

h	nn. Corrected a bug created when cfl_trln was simplified.
	    Also updated error codes.  Done, DP, (SS), 3/5/98.

h	oo. Corrected a bug in DG_UFIL.  Removed unnecessary call to 
	    GD_CLOS.  Done, DP, (SS), 3/10/98.

h	pp. Added new CTB routines which read the GEMPAK parameter list
	    table, prmlst.tbl, and store the information in an internal
	    structure.  Done, DP, (SS), 3/12/98.

h	rr. Updated new CTB routines that read the GEMPAK parameter list
	    table, prmlst.tbl.  Made these routines more generic so that
	    the table can be modified without requiring code changes.  
	    Also, added FILTER and TEXT to the prmlst.tbl table.  
	    Done, DP, (SS), 3/17/98.

h	ss. Added new CTB routines to handle access to data.tbl table.
	    Also, added a new CFL routine to determine the number of valid
	    entries in a GEMPAK table.  This function should eliminate 
	    duplicate code in a variety of locations.  Done, DP, (SS),
	    3/25/98.

h	tt. Added 925mb label on the vertical axis for sounding and 
	    cross-section plots.  Done, TL, (SS), 3/31/98.

h	uu. Fixed a leap year problem in tiitoc.f.  The old code did
	    not recognize the leap year for year 2000, 2400, 2800, etc.
	    Done, TL, (SS), 3/31/98.

h	vv. Added a new CTB function to reset the default for datatype
	    alias parameter combinations.  Done, DP, (SS), 3/31/98.

h	ww. Corrected bug where parameter tplate was not defined as LOGICAL
	    in FL_TMPL.  Done, DP, (SS), 4/3/98.

h	xx. Removed working buffer array from the calling sequence of
	    CFL_TBNR function.  Updated all routines that call this 
	    function.  Done, DP, (SS), 4/7/98.

h	yy. Corrected several bugs that caused the AIX compiler to fail.
	    Done, SJ, (SS), 4/7/98.

h	zz. Added new CLO functions and a test program.  These functions 
	    compute distance, compass direction, etc.  Done, DP, (SS), 
	    4/8/98.

h	aaa. Corrected bugs in testclo test program as a result of CDB 
	     testing.  Done, DP, (SS), 4/14/98.

h	bbb. Added capability to convert surface visibility from KM to 
	     statute miles and wind gust speed from m/s to knots.  Also 
	     modified tables in preparation for display of synoptic and 
	     aircraft data in NMAP.  Done, DKW, (SS), 4/15/98.

h	ccc. Added checks in DM library for swapping bytes for the key STD2.
	     This takes care of incompatible platforms for this word.  Done,
	     SJ, (SS), 4/15/98.

h	ddd. Corrected problem in DG_CLOS found by the AWC.  Also, corrected
	     problem where dgset should not be set to false.  Done, SD, DP,
	     (SS), 4/21/98.

h	eee. Corrected a typo in TESTDG. Done, GK, (SJ), 5/1/98.

h	fff. Fixed a small error in TESTCFL when trying to use CFL_RDIR
	     to read a directory. One of the user input strings was not
	     being read correctly. Done, SJ, (SJ), 5/4/98.

i	ggg. Updated to NAWIPS version 5.4.3.i.  Done, SS, (SS), 5/11/98.

i	hhh. Added Directional arrow and hash mark to testcvg, testces, 
	     and dumpvgf test programs.  Done, FY, (SS), 5/11/98.

i	iii. Removed underscore declarations from cfl, cpg and cgr 
	     libraries and added them to undscr.h.  Done, ID, (SS), 5/14/98.

i	jjj. Removed underscore declarations from ctb library.
	     Done, ID, (SS), 5/14/98.

i	kkk. Removed underscore declarations from cds library.
	     Done, ID, (SJ), 5/18/98.

i	lll. Removed underscore declarations from utf library.
	     Done, ID, (SJ), 5/18/98.

i	mmm. Removed underscore declarations from cvq, crg, ces and clo 
             library.  Done, ID, (SJ), 5/18/98.

i	nnn. Removed underscore declarations from the utf driver.
	     Done, ID, (SJ), 5/18/98.

i	ooo. Removed underscore declarations from im library and NAFOS.
	     Done, ID, (SJ), 5/18/98.

i	ppp. Removed underscore declarations from dc_init and decoder main
	     programs. Done, ID, (SJ), 5/19/98.

i	qqq. Removed underscore declarations from avnbul routines.
	     Done, ID, (SJ), 5/19/98.

i	rrr. Removed underscore declarations from the Nxmlib routines.
	     Done, ID, (SJ), 5/19/98.

i	sss. Removed underscore declarations from cvg library.
	     Done, ID, (SJ), 5/19/98.

i	ttt. Created a new routine (CLO_DLTLN) to compute a lat-lon 
	     position given lat-lon, distance and direction.  Done,
	     SJ, (SS), 5/26/98.

i	uuu. Fixed bugs in CLO_DLTLN when the poles and international 
	     date line are involved.  Done, SJ, (SS), 5/26/98.

i	vvv. Removed cgrtangent.c, cgrintrsct.c and devcmn.h.  These
	     are no longer used.  Updated testcgr and setup_links, 
	     and remove_links for these removals.  Done, ID, (SS), 
	     5/27/98.

i	www. Reorganized uscore.h and undscr.h in preparation for 
	     combining the two files sometime in the future.  Done,
	     ID, (SS), 5/27/98.

i	xxx. Added a check to FL_TBOP for a blank table name.  Done, SJ,
	     (SS), 6/16/98.

i	yyy. Added a new function, cgr_lindist, that computes the distance 
	     from a point to a line and also returns the intersecting 
	     point.  Done, DP, (SS), 6/16/98.

i	zzz. Created a new function, TG_CRINC, to interface between C code 
	     and the function TG_RINC.   Done, SJ, (SS), 6/16/98.

i	a1a. Corrected bug where monocolor display of VG files was not 
	     working properly because color was variable was the wrong type.
	     Done, DP, (SS), 6/25/98.

i	a1b. Corrected bug where loading VG files in the background caused
	     fill to fail in product generation, fill type variable was the
	     wrong type.  Done, DP, (SS), 6/25/98.

j	a1c. Fixed the check for identical levels above 100 mb to insert any
	     previous data for the correct level.  The problem occurred for
	     cases when significant wind data is on pressure surfaces.  
	     Done, SJ, (SS), 7/6/98.

j	a1d. Added land/sea mask arrays to the dg common in preparation for 
	     adding land/sea mask functionality.  Done, DP, (SS), 7/7/98.

j	a1e. Added two new grid diagnostics for masking scalar and vector
	     grids.  The new diagnostics are MASK (s1, s2) for scalar grids, 
	     and VMSK (V, S) for vector grids.  These mask functions are 
	     generic and thus can be used with other GEMPAK diagnostics.
	     To compute diagnostics over just land or over just the sea specify:
	     MASK/VMSK ( s/v, LAND ) , MASK/VMSK ( s/v, SEA ), respectively.
	     The land/sea mask is $GEMTBL/grid/landsea.tbl.  It has a half 
	     of a degree resolution.  Done, DP, (SS), 7/16/98.

j	a1f. Modified how the function fl_mfls handles a blank GDDATIM.
	     It now searches back more than one model cycle time, up to
	     two days back in time.  Done, DP, (SS), 8/5/98.

j	a1g. Wrote new function to determine whether a given GDDATIM
	     is a range, and if so, what type of range, i.e., forecast
	     sequence or analysis (cycle) sequence.  Done, DP, (SS),
	     8/5/98.

j	a1h. Added new ST functions to parse long strings into sub-strings.
	     Added new FL functions  to scan a directory and find the
	     latest file in that directory. Modified GDCNTR to not 
	     display the line attribute information for each contour.
	     Also modified it to use FL_FFIL instead of FL_MFIL to get
	     latest model file.  Also fixed a problem in GDCNTR where 
	     the range and contour interval were not computed properly
	     when data was missing for the first frame in a loop.  Done,
	     SJ, (SS), 8/27/98.

j	a1i. Fixed CTB_ASTN to make sure that a NULL is placed at
	     the end of the state string.  Done, SJ, (SS), 8/27/98.

j	a1j. Added GD_FLTM to testgd test program.  Done, ID, (SS),
	     8/27/98.

j	a1k. Created TESTCV for testing the parametric curve smoothing
	     routine.  Done, SJ, (SS), 8/27/98.

j	a1l. Created a new string routine, ST_ATOE, to convert from
	     ASCII to EBCDIC.  Updated TESTST routine.  Done, AH,
	     (SS), 9/3/98.

j	a1m. Updated TESTCST to include csttime.c.  Done, TL, (SS),
	     9/3/98.

j	a1n. Fixed a problem in the calculation of CAPE so that a 
	     missing height at the top level can be properly 
	     handled.  Also, returned a value of zero for CAPE if
	     the LFC is missing.  Done, TL, (SS), 9/8/98.

j	a1o. Added SPLN20 and SPLN21 to testces.  Added SPLN5 - SPLN21
	     to dumpvgf.  Done, FY, (SS), 9/8/98.

j	a1p. Increased the array size for the list of file names from
	     100 to 200 in FL_FFIL routine to correct problem found as
	     a result of CDB testing.  Also, corrected typo in ST_CLSL
	     prolog.  Done, SJ, (SS), 9/11/98.

j	a1q. Cleaned up the TI library.  Added new function TI_ITOJ that
	     date to day of the year.  Also, changed the computation 
	     method in TI_DAYW.  Done, ID, SJ, (SS), 9/14/98.

j	a1r. Corrected a problem with the smoothing routine, CV_PRMT
	     where clicking multiple times in the same place was
	     not being handled properly.  Done, SJ, (SS), 9/14/98.

j	a1s. Corrected problems with ST_ETOA as result of CDB testing.
	     Corrected error in processing a negative number in the
	     test program.  Correct string declaration in ST_ETOA.
	     Done, AH, (SS), 9/14/98.

j	a1t. Changed long int to int for all GRIB decoding functions and
	     for any C function called by Fortran.  The long int is
	     a problem on 64-bit platforms since on these platforms
	     it is 8 instead 4 bytes.  Done, SJ, (SS), 9/14/98.

j	a1u. Added error checking for negative minute input in 
	     TI_ADDM and TI_SUBM.  Updated comments in TI_DAYW.
	     Done, ID, SJ, (SS), 9/15/98.

j	a1v. Reordered subroutines in the TESTTI test program.  Corrected
	     problem with the read statement in the call to TI_SORT.
	     Done, ID, (SS), 9/15/98.

j	a1w. Fixed the curve fitting routine, CV_PRMT to not smooth
	     the line if there are less than or equal to two unique
	     points.  Done, SJ, (SS), 9/17/98.

j	a1x. Added routines to allow plotting the current severe
	     thunderstorm and tornado watches from the SPC.  This
	     required an increase in the size of the path length variable
	     from 15 to 25 bytes in the fl and ctb libraries.  Also,
	     a new bridge library was written to decode the watch
	     and warnings.  Done, SJ, DKW, (SS), 9/22/98.

*	( This change is incompatible with previous versions of NAWIPS.
	  The table, $GEMTBL/config/data.tbl, now has 15 characters 
	  reserved for the path instead of 15.)

j	a1y. Corrected FL_MFLS to return only the number of files requested.
	     Done, DP, (SS), 9/22/98

j	a1z. Corrected problem in time processing routine where model 
	     analysis loop times were not being setup properly.  
	     Done, DP, (SS), 9/22/98.

j	a2a. Made various corrections in the GD library.  Changed GD_GTIM
	     check the maximum number of times requested before returning
	     the list of times.  Added user input for the max number of
	     times to TESTGD.  Fixed the call to GD_GTIM in GD_FLTM.
	     Also, declared variable darvld as LOGICAL in IN_TYPE and
	     TESTIN.  Updated documentation in some gd and gdplot2 routines.
	     Done, SJ, (SS), 9/23/98.

j	a2b. Corrected a declaration in GR_TLST.  Used LLMXGT instead
	     of LLMXTM.  Done, TL, (SS), 9/24/98.

k	a2c. Updated to N-AWIPS version 5.4.3.k.  Done, SS, (SS),
	     10/5/98.

k	a2d. Changed number of days in TI_DIFD from integer to real
	     to correct fatal error in sn_cross and sf_gram.  Done,
	     ID, (SS), 10/16/98.

k	a2e. Increased number of characters from 80 to 160 for
	     METAR special or off-time report for writing to
	     a GEMPAK file.  Many of these reports were being
	     truncated.  Also, sflist and NWX were modified so
	     that special reports are indented 2 spaces for
	     improved readability.  Also, NWX was modified
	     to display these reports in first in first out
	     rather than last in, first out order.  Done,
	     DKW, (SS), 10/16/98.

k	a2f. Added two new GEMLIB functions which are copies of
	     GPLT functions GAZDRM and GDRAZM to fix problem where
	     GPMAP could no longer be linked due to call from a
	     crg function.  Done, SJ, (SS), 10/22/98.

k	a2g. Corrected problem in GD_GCYC that was causing the
	     retrieval from grid files generated by OA from
	     observational data to fail.  This problem was 
	     found by the SPC.  Done, DP, (SS), 10/29/98.

k	a2h. Added a new CGEMLIB library to open, read and close a
	     BUFR file.  Done, SJ, (SS), 11/2/98.

k	a2i. Cleaned up the CPG library.  Removed unused routines.
	     Moved routines only used by VIEWFAX to its directory.
	     Done, SJ, (SS), 11/30/98.

k	a2j. Corrected various problems in the AW library that were
	     causing AIX compilation errors and warnings.  Done, AH,
	     (SS), 12/2/98.

k	a2k. Corrected a problem that was occuring in GDPLOT2 with
	     grid files with large number of times not being processed.
	     This problem was due to in correct dimension of arrays.
	     Done, DP, (SS), 12/7/98.

k	a2l. Fixed array size and typos found when compiling and linking
	     on AIX.  Done, SJ, (SS), 12/8/98.

k	a2m. Fixed various problems in the GEMLIB and programs code
	     found by the LINUX compiler. Done, TL, (SJ), 12/24/98.

k	a2n. Removed AIX subdirectories from st, mv and syslib 
	     directories because they are no longer required to
	     support AIX.  Done, SS, (SS), 12/28/98.

k	a2o. Major modifications have been made to the CLO library.  
	     Calling routines have been modified where calling 
	     sequence changes have been made.  clotinltln.c replaces
	     cloancin.c, clocntyin.c and clovorin.c.  clotinpoly.c
	     replaces cloancinpoly.c, clocntyinpoly.c, and 
	     clovorinpoly.c.  CLO read routines renamed to clord*.c
	     for consistency.  CLOCMN.h is moved to clo library source
	     with clo type definitions moved to gemprm.h.  clorolseg
	     renamed to cgrrolseg.c in the CGR library.  Done, DP,
	     (SS), 1/13/98.

k	a2p. Removed the use of an equivalence for getting the BUFR
	     message length in CBF_READ.  This did not work properly
	     on the Linux platform.  Done, SJ, (SS), 1/13/99.

k	a2q. Modified the bufr code used by program NAMSND to work
	     properly on the Linux platform.  Also, removed the
	     ebcdic translation feature from this code.  Done,
	     DKW, (SS), 1/14/99.

k	a2r. Bug fix in clo_lonin.c and added this function to testclo.c.
	     Done, DP, (TP), 1/21/99.

k	a2s. Updated FL_MFLS routine to handle model data stored in separate
	     model forecast times.  Also, updated GDPLOT2 routine to handle
	     this situation for GDPLOT2 and NMAP.  Done, DP, (SS),
	     1/25/99.

k	a2t. Updated GG_SDEV to have default product name for the TIFF driver.
	     Done, SJ, (TP), 2/2/99.

k	a2u. Bug fix in clo_lonin.c from 010a2r.  Done, DP, (TP), 2/3/99.

k	a2v. Fixed bug with multiple forecast hour files.  Done, TL, (TP),
	     2/5/99.

k	a2w. Fixed error code in tijtoi.  Corrected terminology from julian
	     day to "days since 1 January."  Done, DK, (TP), 2/5/99.

k	a2x. Bug fix, dgmfil failing for gdfiles with true filenames.
	     Done, DP, (TP), 2/10/99.

k	a2y. Bug fix in flmfls with a range of times.  Done, DP, 
	     (TP), 2/10/99.

k	a2z. Added conversion program to convert version 5.4.3.k VGF
	     files to 5.4.3.j.  Done, FJY, (TP), 2/11/99.

k	a3a. Fixed a problem with the input and output record sizes.
	     Done, SJ, (TP), 2/12/99.


011.	General GEMPAK Program Changes

c	a. Added plotting of AFOS graphics files to GPMAP.  Done,
	   SJ, (SS), 10/16/97.

c	b. Added check for blank AFOS file name in GPMAP.  Also
	   added checking for invalid AFOS file name.  Done,
	   SS, (SS), 10/17/97.

d	c. Changed the color for THTA labels in GDCROSS to be the
	   same as the border color.  The color was previously 
	   undefined.  Done, SJ, (SS), 10/29/97.

d	d. Modified GPMAP to save the text attributes before plotting
	   vg or afos files to ensure the attributes are correct for
	   the title.  Done, SJ, (SS), 10/30/97.

d	e. Added code to plot turbulence (TBSY) and icing (ICSY) 
	   symbols in sfmap for use with new aircraft decoder.
	   Updated help and added entries for aircraft and ship
	   to the data.tbl table.  Done, DKW, (SS), 11/4/97.

e	f. Corrected a loop index error in an GDDIAG routine,
	   gdwrt.f that caused problems with multiple in-line
	   parameters in GRDNAM.  Also, updated help for GDDELT.
	   Done, KB, TL, (SS), 12/1/97.

g	g. Increased color buffer size for 11 to 12 for surface plots.
	   Done, TL, (SS), 1/21/98.

g	h. Created a new program GPTEXT to display ASCII text files.
	   Done, TL, ID, (SS), 2/4/98.

g	i. Added color coding capability to sfmap program.  Also, updated
	   nmap to reflect changes in sfmap calling sequences.  Done,
	   DKW, (SS), 2/17/98.

h	j. Corrected bug in color coding where setting the color code
	   to zero was not being handled properly.  Done, DKW, (SS),
	   3/10/98.

h	k. Increased array sizes to 12 in SFMCOF and SNMCOF to allow for 12
	   parameters to be plotted at a station model.  Done, AH, (SS),
	   4/23/98.

h	l. Modified code and tables to use recently-implemented directional
	   arrow routines (GSDARR, GDARR) to plot wind direction parameter
	   "DARR" and new swell wave direction parameter "DAWV".  Also,
	   fixed a bug in SFGRAM which prevented plotting of a valid 
	   parameter when another parameter could not be computed. 
	   Updated help and text files for "DAWV". Done, DKW, (SJ), 5/5/98.

h	m. Added directional arrow plotting to GDPLOT2.  Done, DP, (SS), 
	   5/11/98.

i	n. Modified the calculations of the text start location, the number
	   of lines per column and the text line spacing for the program
	   GPTEXT.  Done, SJ, (SS), 5/14/98.

i	o. Fixed bugs with the calculations of the start location.
	   Done, SJ, (SJ), 5/20/98.

i	p. Added text attributes to STNPLT so that text size, and other 
	   text attributes can be changed.  Done, TL, (SS), 6/11/98.

*	   This change is incompatible with previous versions of N-AWIPS
	   because text attributes have been added to the STNPLT variable.

i	q. Fixed the objective analysis to properly use the first guess 
	   field.  The analysis now keeps the first guess values for grid 
	   points outside the search radius.  Done, SJ, (SS), 6/16/98.

*	   This change added a new parameter to oa_barn calling sequence.

i	r.  Corrected an error in a calling sequence parameter to in_line
	    in a gdcross routine.  The first parameter is now properly 
	    declared as a character string.  Done, KB, (SS), 6/17/98.

j	s.  Corrected problem in GDPLOT2 where the skip parameter was not
	    working properly.  Done, DP, (SS), 7/14/98.

j	t.  Changed the parameter NDVCHR from 27 to 28, increasing the 
	    number of words passed out of the devchr.cmn common block.  
	    Moved the curve scaling factor in this common block so it 
	    can eventually be accessed by NMAP.  Done, TL, (SS), 7/16/98.

j	u.  Changed the parameter NDVCHR from 28 to 27 so that the 
	    device name will not be passed from the device driver to
	    GPLT.  Done, TL, (SS), 7/20/98.

j	v.  Wrote new GEMPAK program, GRPHGD for graphics-to-grid
	    conversion.  The program takes a text file created by
	    NMAP that contains the lat/lon positions of line vertices
	    and creates a grid.  Done, DP, (SS), 9/3/98.

j	w.  Created a new library to decode AWIPS file to be used by
	    GPMAP.  Updated GPMAP to use new library.  Also, updated
	    GPMAP to plot SPC watches and tornado warnings.  Done, 
	    AH, SJ, (SS), 9/22/98.

j	x.  Corrected problems in plotting watches in GPMAP.  Fixed
	    problem when there was more than one report per file.
	    Added check for the start time.  A watch will not be
	    plotted if the requested time is before the start
	    time for the watch.  Done, SJ, (SS), 9/29/98.

j	y.  Corrected problems in plotting watches in GPMAP.  Fixed
	    a problem that only occurred on the SUN workstations.
	    Done, SJ, (SJ), 9/30/98.

k	z.  Added capability to plot the NOAA logo in GPTEXT.  Also
	    added capability to plot in map coordinates.  The map
	    projection must be specified by another GEMPAK program,
	    such as GPMAP, to use map coordinates.  Done, TL, 
	    (SS), 10/28/98.

k	aa. Removed TAE references from all PDF files and processing
	    and simplified.  Also removed TAE references from all
	    hl1 files and simplified.  Made appropriate code changes
	    in the IP library.  Done, TL, (SS), 11/17/98.

*	    ( This change is incompatible with previous versions.
	      The format of all PDF and .HL1 files has changed.
	      PDFBLD and HLPBLD must be run. )

k	bb. Fixed an inproper comparison of a logical variable in
	    a gdplot2 routine that caused a fatal compilation error
	    on AIX.  Done, SS, (SS), 11/30/98.

k	cc. Declared two logical variables in grphgd.f that were
	    causing a fatal AIX compilation error.  Done, SS, (SS),
	    12/1/98.

k	dd. Fixed various problems throughout the system in response to
	    compile failures and warnings on LINUX platform.  Most of
	    these problems were due to the use of the NULL pointer.
	    To be strictly correct, the NULL must be cast when doing
	    comparisons to strings and structures.  Also, setup
	    appropriate subdirectories for LINUX where required.
	    Done, SJ, (SS), 12/28/98.

k	ee. Created a new GEMPRM.PRM for Linux.  Done, SJ, (SS), 
	    12/31/98.

k	ff. Added automatic grouping of station model data to SFMAP 
	    and SNMAP and added the new group type STNMDL to grptyp.tbl.  
	    Done, AH, (SS), 1/6/99.

k	gg. Increased MAXDIM dimension in program GRPHGD from 542 to 626 
	    to accomodate larger grids.  Done, DP, (SS), 1/6/99.

k	hh. Added smoothing to GDCNTR, GDPLOT, and GDPLOT2.  Also added
	    capability to plot labels for contours without breaking
	    the contour line.  Added this feature by allowing the user
	    to set the line frequency to negative values.  Labels are
	    now grouped with contours for VG driver.  Done, SJ, (SS),
	    1/19/99.

*	( This change required changing the calling sequence of IN-LINE.
	  A new parameter smooth was added to allow the user to smooth
	  contours. )

k	ii. Changed the grid time dimension in time arrays in GRID programs
	    from LLMXTM to LLMXGT to properly account for the maximum 
	    number of grid times.  Done, TL, (SS), 1/21/99.

k	jj. Modified plotsyms so that it will save a gif file.
	    Done, AH, (TP), 1/21/99.

k	kk. GRPHGD is modified to write out a grid with missing values if
	    there are no input contour lines.  Previously, no grid was
	    written.  Done, DP, (SS), 1/26/99.

k	ll. Fixed bug where gdplot2 crashed on AIX4 if wind parameter
	    left blank.  Done, DP, (TP), 2/3/99.
	    
k	mm. Fixed line smoothing problems in gdplot and gdplot2.
	    Done, TL, (TP), 2/3/99.

k	nn. Added parameter 'datout' so users can specify different dates
	    and times in the output.  Done, AH, (TP), 2/4/99.

k	oo. Added a check for <= 10 lines of text so that the text
	    attributes for the border or background fill can be 
	    applied to the entire file as a single string.  Done,
	    SJ, (TP), 2/8/99.

k	pp. Changed an error code in snsstm.  Updated sntdat to call 
	    ti_find so that all possible user input for dattim will 
	    work properly.  Done, SJ, (TP), 2/8/99.


012.	General GUI Modifications

c	a. Wrote a new GUI test program, guitst which can assist
	   programmers to test their GUI modules before integration
	   into GUI applications.  Done, SW, (SS), 10/16/97.

c	b. Renamed NxmControlBtn.c to NxmCltBtn.c.  Renamed 
	   NxmControlBtn to NxmCtl_create.  Cleaned up modules
	   and modified affected calling routines.  Done, GK, (SS),
	   10/16/97.

d	c. Added version number display to GUI programs and check
	   for resource file.  Done, GK, (SS), 10/30/97.

e	d. Changed NxmPromptPopup.c to NxmPrompt.c and cleaned up.
	   Fixed a memory link.  These changes only affect NTRANS.
	   Done, GK, (SS), 11/17/97.

e	e. Miscellaneous fixes for the AIX platform.  Done, SJ, (SS),
	   11/26/97.

f	f. Renamed NxmHelpPopup.c to NxmHelp.c.  Cleaned up function and
	   renamed routines within the file.  Updated calling routines.
	   Done, GK, (SS), 12/22/97.

i	g. Created a file undscr.h to handle underscore declarations.  
	   Removed underscore declarations from NSAT and GUITST routines
	   and call the new include file instead.  Done, ID, (SS),
	   5/13/98.

i	h. Removed underscore declarations from NTL and NTRANS routines and
	   added them to undscr.h.  Done, ID, (SS), 5/13/98.

i	i. Removed underscore declarations from NWX routines and added them
	   to undscr.h.  Done, ID, (SS), 5/14/98.


013.	NTL

e	a.  Corrected NTL problem with new color changes in NXMLIB.
	    Done, CL, (SS), 11/26/97.

k	b.  Removed tabs from the string displayed in the EXIT dialog
	    box.  On some systems, these tabs were being displayed
	    as control characters.  Done, SJ, (SS), 12/29/98.

k	c.  Added new program Ncolor to NTL suite.  Ncolor alters colors for
	    all applications that use the NTL shared colors using the color
	    bar functionality similar to NTRANS.  Done, ES, (SS), 1/8/99.

k	d.  Fixed some problems with the Ncolor program.  The background
	    color is now reset when "Reset Colors" is selected.  The
	    arrangement of the Reset and Exit buttons has been changed
	    to place them in line with the color bar.  Some code clean up
	    in the Nxm color bar routines was also done.  Done, ES, 
	    (SS), 1/12/99.


014.	NTRANS

c	a. Added check for missing resource file.  Done, CL, (SS),
	   10/16/97.

c	b. Corrected problem where if the X environment variable
	   for resource files is not defined, and the resource
	   file is local, the application core dumps.  Done, CL,
	   (SS), 10/20/97.

d	c. Added capability to disable stop button so that the 
	   user may click ahead if desired.  Done, SW, (SS),
	   10/29/97.

e	d. Corrected NTRANS for short titles.  Done, PB, CL, (SS),
	   12/1/97.

i	e. Corrected an error message; changed reference from GTEXTC
	   to GTEXT.  Done, SJ, (SS), 6/15/98.

j	f. Added logging of metafile usage to NTRANS.  The log file
	   records the file and frames that the user selects.  The
	   logging is added at compile time by using the -DLOGGING
	   in the Makefile.  The log file is called:
	   .NTRANS.LOG.YYYYMMDD.processid and is located in the
	   directory where NTRANS is executed. Done, SJ, (SS), 8/27/98.

k	g. Changed the order of the header files in a NTRANS routine to
	   correct a bug created by a change to one of the definitions.
	   Done, SJ, (SS), 1/13/99.
	   




015.	NSAT

g	a. Corrected bug where if the map attributes were modified without
	   images loaded, NSAT would generate a segmentation fault.  Also,
	   modified the Make file to use a compile script and nsat 
	   object library similar to NMAP.  Done, CL, (SS), 2/24/98.

i	b. Fixed problem in NSAT where time string did not clear when 
	   images were updated.  Added stat boundary to county map display.
	   Removed "check New File" from print out.  Done, CL, (SS), 6/2/98.





016.	NWX

h	a. Created nwx_compile and modified NWX Make file to utilize it.
	   Done, AH, (SS), 3/11/98.

j	b. Added plotting of active SPC watch boxes to NWX.  Each active
	   box can be selected to display the corresponding text message.
	   Done, SJ, (SS), 8/6/98.

k	c. Fixed some errors in NWX that were causing fatal errors on 
	   Linux.  Removed cases where the file was being closed more
	   than once, which causes a fatal error on Linux.  Removed
	   the setting of a value to a freed string.  Changed the
	   print command to not check the type of workstation, but
	   to use the environment variable for the print command.
	   Done, SJ, (SS), 1/4/99.



017.	AFOS

e	a. Corrected bug in NALARM program where the function listsize
	   was not being called properly.  Also correct errors in this
	   function.  Done, ES, (SS), 11/14/97.

e	b. Fixed two problems in the NALARM program.  Replaced lp with
	   $LP in the print command.   This allows printing from SGI
	   and SUN workstations.  Also corrected the problem where the
	   program was not flashing when new products arrive.  This problem
	   was appearing on HPUX10 and was due to not NULL terminating
	   a string.  Done, SJ, (SS), 11/19/97.

k	c. Increased the size of arrays in NAFOS to allow for greater 
	   (up to 300) entries in NAFOSMAP.TLB.  Done, SJ, (SS), 
	   11/16/98.

k	d. Increased the string size in NAFOS for reading the overlay
	   attribute table.  This size was too small.  This error was
	   detected on the LINUX platform.  Done, SJ, (SS), 12/23/98.



018.	NMAP

a       a. Corrected lat/lon display when in the roam mode.  Done, 
	    CL, (SS), 10/3/97.

b	b. Added marker attribute editing module to NMAP.  Added
	   a marker attribute module to the Nxm library.  Done,
	   SW, (SS), 10/8/97.

b	c. Changed NxmConfirm to NxmConfirm_show.  Changed _NxmConfirm
	   CancelCallback to _NxmConfirm_cancelCb.  Updated to new
	   source code format and fixed a compiler warning bug.  Done,
	   GK, (SS), 10/8/97.

b	d. Combined the contents of NxmSetLabel.c and NxmFrameLabel.c.
	   into NxmLabel.c.  Renamed NxmSetLabel to NxmLabel_setStr.
	   Renamed NxmFrameLabel to NxmLabel_createFrameLbl.  Done,
	   GK, (SS), 10/8/97.

c	e. Fixed bugs in calling sequences in front pop-up and station
	   editing pop-up.  Done, CL, (SS), 10/23/97.

d	f. Removed extra "*" from scaling factors for such parameters
	   as VSBY and P03I which was causing erroneous values 
	   to be plotted.  Also added P24I to the list of parameters
	   for NMAP.  Done, SJ, (SS), 10/27/97.

e	g. Increased the maximum number of product groups for models
	   from 10 to 25.  Done, GG, (SS), 11/13/97.

e	h. Fixed a bug where the turbulence text type is not set 
	   properly.  Done, CL, (SS), 11/20/97.

e	i. Removed the function GSMARE from NMAP.  Replaced the call
	   to the function with calls to LC_GARE, GQMPRJ and GSMPRJ.
	   Done, SJ, (SS), 12/1/97.

f	j. Added the capability to display radar data in NMAP.  Cleaned
	   up the layout of the enhancement popup and added functionality
	   to handle both satellite and radar data.  Done, CL, (SS),
	   12/15/97.

f	k. Added options for "marker only", "marker + text", and
	   "text only" for marker overlays.  Changed size range of
	   marker from 1 to 10 to .5 to 3.0.  Changed width range of
	   maker from 1 to 10 to 1 to 5.  Done, WL, (SS), 12/16/97.

f	l. Corrected some NMAP bugs.  Fixed color initialization problem
	   when running NMAP outside of NTL.  Fixed the problem where
	   the time interval could not be set after radar data is
	   selected anytime during the session.  Fixed the problem
	   where the RAD data dominant button was set insensitive.
	   Also, removed watch type selection option and replaced with
	   watch box color selection palette.  Done, CL, (SS), 
	   12/16/97.

g	m. Changed calling sequences in surface and upper air plotting
	   routines.  Selected files to open is now based on the data
	   type and time.  Files are now closed each time data are
	   plotted.  Done, TL, (SS), 1/22/98.

g	n. Fixed the problems associated with displaying dashed lines
	   after zooming, moving, etc.  Also cleaned up NMAP code to
	   remove unnecessary extra VG file loading.  Removed the saving
	   to common of dash line pattern in idash.f.  Done, CL, ID, (SS),
	   1/27/98.

g	o. Fixed the problems with loading radar look-up tables.  Done, 
	   CL, (SS), 1/28/98.

g	p. Fixed the problem with radar time matching.  Also fixed problems
	   with setting projection when unzooming image and model data.
	   Done, CL, (SS), 2/3/98.

g	q. Fixed the problem with radar lut when switching back and forth
	   to satellite images.  Done, CL, (SS), 2/18/98.

g	r. Added Flash Flood Guidance display capability to NMAP.  Added
	   default filter value into surface station tables, sfc_stn.tbl,
	   ship_stn.tbl, ffg_stn.tbl.  Fixed enhancement table name problem
	   when model data are selected.  Done, CL, (SS), 2/19/98.

g	s. Improved the color-coded display of surface data in NMAP by 
	   adding the color bar and making title more descriptive.  Changed
	   tables to allow display of FFG guidance parameters individually.
	   Also, corrected filter default value and alias name for 
	   ship data.  Updated GEMPAK help files for color coding.  
	   Done, DKW, (SS), 2/23/98.

g	t. Fixed problem where NMAP was not printing radar images properly.
	   Done, CL, (SS), 2/23/98.

h	u. Fixed problem with lat/lon labels between frames in a loop.  
	   Done, CL, (SS), 2/27/98.

h	v. Redesigned the station model editing module.  The table 
	   prmlst.tbl is now read into memory upon entering NMAP.  Station 
	   models are keyed by the data type, e.g, METAR and alias, e.g, 
           SUMMER.  There is a auxiliary table associated with each data 
	   type, e.g, metar_parms.tbl.  If the table exists, the user can 
	   select parameters from this table for the station model.  
	   Otherwise, the user can only turn on/off parameters.  Done, CL, 
	   (SS), 3/31/98.

h	w. Corrected error in the calling sequence to SN_CLOS in 
	   nmap_snmap.f routine.  Done, SS, (SS), 4/7/98.

h	x. Corrected problems found with station model editing as a result 
	   of CDB testing.  Done, CL, (SS), 4/7/98.

h	y. Added capability to display synoptic and aircraft data.  
	   Modified the data display and cleanup.  Each data source is 
	   now identified by its name.  Display mode and selection mode 
	   have been added to each data source.  Adding new surface data, 
	   can now be done by just editing tables.  Fixed bug found with 
	   time matching when OBS is dominant with image data.  Done, CL, 
	   (SS), 4/21/98.

h	z. Corrected some bugs.  Added warning popup when product 
	   generation cannot be invoked because there is currently another 
	   session accessing the VG file.  Fixed the station model editing 
	   problem so that the last level is remembered.  Corrected a 
	   problem in station model editing that prevented text input 
	   editing.  Done, CL, (SS), 4/22/98.

h	aa. Corrected problem where local radar data could not be overlaid
	    onto observational data when it was dominant.  Done, CL, (SS),
	    4/27/98.

h	bb. Fixed the problem when model data is missing and NMAP hangs.
	    Done, CL, (SS), 4/30/98.

h	cc. Fixed problems relating to missing model data found as a result
	    of CDB testing.  Done, CL, (SS), 5/6/98.

i	dd. Added mandatory levels above 100 mb to the NMAP station model 
	    edit popup for upper air data. Done, SJ, (SJ), 5/20/98.

i	ee. Removed underscore declarations from NMAP routines and added 
	    them to undscr.h.  Done, ID, (SJ), 5/21/98.

i	ff. Modified the data access for satellite data making it like the
	    radar data where only the latest set of images are selectable
	    when satellite data is dominant.  This change will allow the
	    display of irregularly spaced satellite images.  Also, 
	    corrected a product generation bug associated with moving an 
	    object close to a fill area.  Done, CL, (SS), 5/26/98.

i	gg. Modified NMAP to display the last frame instead of the first 
	    when loading.  Also, rearranged the ROAM window to save space.
	    Done, CL, (SS), 5/27/98.

i	hh. Removed 00 and 12z time checking in the NMAP routine that was 
	    preventing the proper extraction of sounding times from 
	    datasets that have finer increments than 12 hours.  Also, 
	    adjusted the time increment in the nmap master table to a 
	    3 hour increment.  Done, TL, (SS), 5/28/98.

i	ii. Fixed problems with displaying the last frame as a result of
	    CDB testing.  Fixed problem with stepping forward after the
	    data is loaded.  Also, changed NMAP so that the first frame of
	    model data is displayed.  Done, CL, (SS), 5/28/98.

i	jj. Added displaying of time information of the current frame to
	    next to the current frame number in the data window border.
	    Dominant data time is displayed.  For images, the time is 
	    obtained from the image header.  For models, the time is the
	    valid time.  Done, CL, (SS), 6/4/98.

i	kk. Added text size selection (GUI part only) for station plot map
	    overlay in nmap.  Necessary underlining changes will be made
	    in a subsequent delivery.  Done, WL, (SS), 6/8/98.

i	ll. Implemented text size selection for station plot map overlay.
	    Done, WL, (SS), 6/12/98.

i	mm. Made the border time label bigger for improved readability.  
	    Done, CL, (SS), 6/15/98.

i	nn. Removed unnecessary calls to GG_SPLT from NMAP routines.  Done, 
	    SJ, (SS), 6/16/98.

i	oo. Added capability to access earlier model runs in NMAP.  Also,
	    now allow for models that have irregular spaced forecast times.
	    (Missing frames will be displayed as a blank frame.) Done, CL,
	    (SS), 6/17/98.

i	pp. Corrected problems found as a result of CDB testing.  Fixed 
	    problem with IRIX4 display of time information in the border.  
	    Fixed problem of getting incorrect time when loading a new 
	    dominant data type.  Done, CL, (SS), 6/17/98.

i	qq. Corrected problems found as a result of CDB testing.  Fixed 
	    problem related to station model editing for text sizes less 
	    than 0.8.  Fixed the time matching problem for the 
	    ECMWFT/ECMWFG model.  Fixed the warning when there is no model 
	    data available for a selected category. Done, CL, (SS), 6/23/98.

j	rr. Fixed conversions between two and four digit years so that 
	    they will work properly past the year 2000.  Done, SL, (SS), 
	    7/16/98.

j	ss. Updated NMAP and supporting routines to read the text size
	    table, fontsz.tbl, instead of using hard codes.  Re-designed
	    font size handling at the GUI level.  Station model editing,
	    text in product generation, and map overlay now all deal
	    with font size the same way.  Done, CL, (SS), 8/6/98.

j	tt. Model data access was re-engineered to properly handle
	    previous cycle times.  The underlying GEMPAK as well as
	    NMAP code was modified.  Changes include, gempak/tables/
	    config/data.tbl format has been modified.  The forecast
	    column has been removed.  The cycle information is now
	    passed down from the application level to low-level 
	    routines that determine the valid time for each frame.
	    Three RUCS restore files have been modified to properly
	    handle previous runs.  Done, DP, CL, (SS), 8/11/98.

*	    (The data.tbl table is incompatible with previous versions.
	     Also the calling sequences of gemlib/gd/gdgtmf.f and
	     gemlib/gr/grtmfl.f have been changed)

j	uu. Rewrote the time line function for NMAP.  The time-line can
	    now properly handle the various data types.  Done, SL, CL,
	    8/28/98.

j	vv. Corrected problems and made improvements to the time line
	    as a result of CDB testing.  Done, SL, (SS), 9/17/98.

j.	ww. Additional correction of problems and improvements to the
	    time line as a result of CDB testing.  Corrected problems
	    when changing the skip factor.  Allow the box to grow
	    when clicking outside of it.  Fixed problem of undesired
	    box shrinking when moving it.  Improved labeling of
	    time line.  Done, SL, (SS), 9/23/98.

j	xx. More corrections and improvements to the time line as
	    a result of CDB testing.  Correct time mis-match problem
	    if cancel is clicked.  Corrected problem of selecting outside
	    the slider box.  Corrected problem with model data with open
	    time box.  Set the time to the most recent when using the
	    skip factor.  Done, SL, (SS), 9/25/98.

k	yy. Some clean up of NMAP data display routines.  Removed
	    def_interval from dsrc_t data structure.  Changed name
	    from tm_sh to tm_base in dsrc_t data structure.  Removed 
	    some routines that are no longer used.  Done, CL, (SS), 
	    11/12/98.

k	zz. Added capability to display MOS data to NMAP.  Done, SJ,
	    (SS), 11/19/98.

k	a1a. Added checks when accessing data files for no data files
	     found or invalid data files found.  Previously, under
	     these scenerios, NMAP would crash as was found by the
	     AWC.  Done, SL, (SS), 11/19/98.

k	a1b. Removed a debug statement in nmap_mapw.c.  Done, TP, 
	     (SS), 11/19/98.

k	a1c. Added include Xm/Label.h to nmap_dslw.c to fix compilation
	     error on AIX.  Done, SS, (SS), 11/30/98.

k	a1d. Added capability to swap in a "blank" frame with only the
	     map and any VG objects in the foreground.  This allows the
	     user to quickly "toggle" on/off the background data.  Done,
	     ES, (SS), 12/3/98.

k	a1e. Time line information is now saved when switching between 
	     dominant datasets.  Done, SL, (SS), 12/7/98.

k	a1f. Fix some problems with frame refreshing for the data
	     loop.  Also, increased maximum number of frames from
	     50 to 51 to accomodate the blank frame.  New versions
	     of the hide and show icons have been added.  The
	     "-" key accelerator is fixed.  Also, fixed a product
	     generation bug associated with moving a group with
	     text elements.  The group ghost box is now correct.
	     Done, ES, (SS), 12/16/98.

k	a1g. Corrected some bugs concerning remembering previously 
	     selected times for different data types.  Added a button
	     to return the times to their default values.  Done,
	     SL, (SS), 12/28/98.

k	a1h. Corrected fatal problems with NMAP on the AIX system. These
	     include: 1) vector drawing; 2) displaying the county list;
	     3) printing; 4) color palette sizing; 5) display of the
	     outlook product; 6) identifying the version of Motif as
	     2.1 vs 1.2 vs 1.1. Done, ES, (SJ), 12/30/98.

k	a1i. Corrected a fatal bug on Linux.  The problem was with the
	     Hide/Show button and occured after loading data. Done,
	     ES, (SS), 1/4/99.

k	a1j. Added logic to get latest times from a surface or upper-air
	     file if the number of times in the file exceeds 30.  Done,
	     SS, (SS), 1/6/98.

k	a1k. Fixed fatal bug on AIX with the Undo/Redo button in product 
	     generation.  Also fixed the size of check boxes on the data
	     window for AIX and Linux platforms.  Done, ES, (SS), 1/6/98.

k	a1l. Added preliminary capability of auto update of imagery.
	     This release works under limited circumstances.  The dominate
	     data must be satellite or radar imagery with no skip factor. It
	     does not auto-update if the Frame Set Definition (Data Select)
	     window is active.  Also, this release reloads all the images.  
	     A future release will re-shuffle the frames without loading 
	     all the data.  Done, ES, (SS), 1/26/99.

k	a1m. Fixed two auto update of image problems.  Frames were sometimes 
	     loaded out of sequence and metar data was not updated in synch 
	     with new images.  Done, ES, (TP), 1/29/99.

k	a1n. Added a function to seek the nearest city/station/VOR/anchor
	     /county.  Done, SL, (TP), 2/3/99.

k	a1o. Added a check for mandatory level data in NMAP.
	     Done, SJ, (TP), 2/8/99.


019.	MAP FILES

h	a. Updated some maps and tables based on latest information from
	   NWS HQ.  Also added city tables that are generated from the
	   HQ information.  Done, GK, (SS), 4/24/98.



020.	UTILITIES 

g	a. Wrote a new X-based utility, freeColors, that returns 
	   information about the number of colors are available on the 
	   system.  Done, WL, (SS), 1/8/98.

g	b. Modified HLPBLD and PDFBLD to search for input files locally
	   before searching in the $GEMPAK tree.  Updated the link scripts.
	   Done, SJ, (SS), 2/4/98.

k	c. New utility programs to process/scan the city information tables
	   and create parallel information tables.  These tables  allow
	   quick access to the city information.  The new tables have
	   the same name with the addition of the .info suffix.  Done,
	   DP, (SS), 12/18/98.

k	d. Corrected and simplified map creation program, SSFGSF.  Done,
	   GK, (SS), 1/6/99.

k	e. Replaced FORTRAN code checking script, ptypcmpf.sh.  Modified
	   ndirect utility to display each command line when desired.
	   Done, GK, (TP), 2/3/99.

021.	PRODUCT GENERATION

a	a. Added line color editing in product generation portion of
	   NMAP.  Also, fixed the special line fill problem.  Done,
	   CL, (SS), 10/6/97.

b	b. Cleaned up and corrected error codes in cvq.err.  Also
	   corrected error code numbers in several cvq routines and
	   added a file close in cvqgetinf.c.  Done, FY, (SS), 10/8/97.

b	c. Fixed counting the number of points when a closed line
	   is drawn in the product generation. Done, DP/CL, (SJ),
	   10/10/97.

b	d. Fixed font pop-up menu to display the Courier font everytime
	   the dialog box is opened. In the dialog box, the font
	   remained set to the last font used, but the font in the
	   graphics window would be reset to Courier. Done, ES, (SJ),
	   10/10/97.

c	e. Reorganized and cleaned up product generation code in NMAP.
	   Also, fixed the delete all bug where deleted elements re-appear.
	   Fixed bug when marker size is changed, the handle bar vertices
	   change size.  Fixed bug when grouping symbols and winds makes
	   them disappear.  Added existence of resource file logic to NMAP.
	   Also, changed the NMAP resource file to move the product 
	   generation palette up to top of NMAP window.  Done, CL, (SS), 
	   10/20/97.

c.	f. Added fill/nofill option to NMAP and product generation.  
	   Done, CL, DP, (SS), 10/21/97.

c.	g. Reorganized and cleaned up text handling in product generation
	   software.  Some bugs were also fixed.  Software text can now
	   be left, right or center justified.  Corrected bug where text
	   could not be selected in the lower left hand area of the screen.
	   Left and right justified text is no longer converted to centered
	   when moved.  Done, ES, (SS), 10/22/97.

c	h. Corrected problem with fill/nofill option in NMAP.  Done,
	   CL, (SS), 10/23/97

d	i. Added watch-by-county capability.  Also corrected bug in
	   move/select when zooming or roaming.  Done, CL, DP, (SS),
	   10/29/97.

d	j. Additional clean-up to the NxmTxtA function and corrected
	   the memory leak.  Also corrected the range errors for
	   non-centered special text.  Done, ES, (SS), 10/29/97.

d	k. Corrected bug in setting group type and number in NMAP
	   and testcvg.  Added listing of closure and fill flags
	   to cvg_dump.  Done, FY, (SS), 10/29/97.

d	l. Corrected problem where some operations in NMAP were not
	   properly refreshing, for example when moving text in some
	   cases.  Done, CL, (SS), 10/31/97.

e	m. Additional cleanup and some bug fixes.  Corrected some
	   calling sequence errors in cvgsvlin.c and cvgtxsto.c.  Corrected
	   a calling sequence error in nmap_pgpalw.c that would sometimes
	   cause the wrong class to be displayed in the mouse help.
	   Corrected bug found by AWC where text object movement was
	   not being properly handled if other objects were deleted.
	   Changed move, so that the closest point is selected when
	   moving an object.  Shortened the product generation 
	   palette title.  Done, CL, (SS), 11/10/97.

e	n. Created new color selection module which is used by both
	   NxmTxtA and nmap_pgline routines.  Done, ES, (SS), 11/10/97.

e	o. Modified NMAP so that front width and wind width defaults
	   can be read from the table newdraw.tbl.  Also modified
	   the table to add these attributes and changed some
	   attribute values as requested by the HPC.  Done, CL,
	   (SS), 11/14/97.

*	( This is incompatible with previous versions because the 
	  format of newdraw.tbl has changed for fronts and winds)

e	p. Corrected calling sequence error in call to GSFRNT in 
	   cdsfrnt.c.  Done, WL, (SS), 11/17/97.

e	q. Modified avnbul program for calling sequence changes in
	   cgr_polyint.c and cgr_segint routines.  Fix bug when
	   there are no parameters as input.

e	r. Added the capability to edit parts of line and front 
	   objects in NMAP product generation.  Done, ES, (SS),
	   11/24/97.

e	s. Added computations for VOR and anchor points in NMAP.
	   Done, DP, (SS), 11/25/97.

e	t. Remove call to udmbnd in clo library routines.  Done,
	   DP, (SS), 11/26/97.

e	u. Created a new program, DUMPVGF that reads, searches and
	   dumps a VG file.  Also, added help and cleaned up testcvg
	   program.  Also, replaced " " with NULL as default directory
	   in calls to cfl_inqr  in cvg routines.  Done, FY, (SS), 
	   12/1/97.

e	v. Modified cds_text to call GTEXT instead of GTEXTC.  Done,
	   SJ, (SS), 12/4/97.

f	w. Corrected initial text color setting in text attribute
	   editing popup.  Done, WL, (SS), 12/5/97.

f	x. Added SAVE/SAVE_AS/RESTORE into NMAP product generation for
	   VG files.  Renamed .DEFAULT.vgf into .DEFAULT.vfg.save when
	   exiting product generation.  Added the name of the VG file
	   to the title bar of the main window in NMAP.  Redesigned the
	   layout of the file selection popup and cleanup.  Done,
	   CL, (SS), 12/9/97.

f	y. Added capability to edit attributes of lines, fronts and winds 
	   after they are drawn.  Done, ES, (SS), 12/10/97.

f	z. Modified NMAP code for icon size change from 32 to 24.
	   Updated icons.  Also created a script for generating
	   NMAP icons.  Done, CL, GK, (SS), 12/10/97.

f	aa. Fixed some bugs in NMAP product generation.  Fixed problem
	    where symbols and winds did not show up properly on top of
	    a filled area.  Fixed problem in NMAP where text alignment
	    was not working correctly.  Also, added confirmation dialog
	    to RESTORE function.  Done, CL, SJ, ES, (SS), 12/17/97.

f	bb. Mapped values of text alignment in VG read and write
	    routines to be consistent with values used internally.
	    Done, CL, (SS), 12/18/97.

f	cc. Add capability to edit text attributes after text is
	    drawn in NMAP product generation.  Done, EW, (SS),
	    12/19/97.

f	dd. Added ability to select which piece of modified closed
	    area to be saved after modification.  Also, fixed modify
	    tool in the ROAM mode.  Done, ES, (SS), 12/23/97.

f	ee. Wind symbol drawing has been modified to allow the user
	    to rotate the wind barb/arrow when he/she places it.
	    Also, the wind barb thickness will not be reset to the
	    default value after each operation.  Done, ES, (SS),
	    12/30/97.

f	ff. Updated mouse help for wind element placement and
	    element rotation.  Done, ES, (SS), 12/30/97.

f	gg. Corrected error where front direction was not being
	    properly saved when editing front attributes.  Done,
	    ES, (SS), 1/5/98.

g	hh. Added append capability to opening of VG files.  Also,
	    corrected some problems with the open/save functions.
	    The active file is now cleared when exiting product 
	    generation or deleting all objects.  Also if the open or
	    save function is canceled, the active file name is not
	    changed.  Also, changed the open function to require VG
	    files to have the vgf extension to be seen in the scroll
	    list.  Done, ES, (SS), 1/9/98.

g	ii. The line object modification tool was modified to not
	    close to the nearest vertex if the last vertex of the
	    modified line is not near by.  This was done for modification
	    of such objects as fronts.  Also, fixed a bug where restored
	    files where not properly initialized after objects have
	    been modified.  Done, ES, (SS), 1/21/98.

g	jj. Corrected problem where changing the line dash pattern
	    caused a core dump in product generation.  Done, CL, (SS),
	    1/21/98.

g	kk. Changed the line modification tool so that if the last
	    vertex is the starting point, it will add to the line.
	    Done, ES, (SS), 1/22/98.

g	ll. This fixes the problem with the modification tool where
	    the user desires to connect the ends of a contour.  Previously,
	    the code did not handle this case properly.  Done, ES, (SS),
	    1/27/98.

g	mm. Enhanced the modification tool.  When modifying, the existing
	    segment prior to the starting vertex is highlighted indicating
	    the direction of transversal.  The user may change the 
	    direction of transversal before dropping the first point by 
	    dragging the mouse.  Done, ES, (SS), 1/28/98.

g	nn. Changed the color of the product generation palette to
	    black text with the vanilla background.  Done, GK, (SS),
	    2/3/98.

g	oo. Fixed fatal error when VG element length exceeds the maximum,
	    500.  Done, GK, (SS), 2/4/98.

g	pp. Changed cds_line to always draw a bounding polygon around
	    the filled area with a regular line.  Changed the UTF driver
	    to not draw the bounding polygon for the filled area.  Done,
	    SJ, (SS), 2/4/98.

g	qq. Added undo function for line and front operations.  Also
	    added a redo which reverses the undo.  Done, ES, (SS), 
	    2/5/98.

g	rr. Improved the text editing tool by separating the mouse and
	    keyboard inputs.  Also, fixed the ghost/temporary color 
	    problem.  Done, CL, (SS), 2/9/98.

g	ss. Updated Watch-By-County capabilities to allow polygon drawing
	    and formatting to a GEMPAK county file.  Several enhancements
	    to the WBC functions have been made.  Done, DP, (SS), 2/10/98.

g	tt. Major clean-up of the crg library.  Renamed functions and
	    variables and reordered parameters for clarity.  Consolidated
	    some functions.  Corrected prologues.  Deleted several files.
	    Done, FY, (SS), 2/17/98.

g	uu. Corrected problem where the text input was not properly 
	    activated when entering NMAP product generation for the first 
	    time and editing text after opening a VG file.  Also, corrected
	    problem where title strings could not be edited because the 
	    NMAP code was not decoding text justification codes of 
	    11, 12, 13, which are for the no clipping case of left, 
	    center, and right justification, respectively.  Done, CL, 
	    (SS), 2/17/98.

g	vv. Added check to ensure that the size of lines and fronts do
	    not exceed the maximum number of points, (500).  Also, 
	    corrected two problems with the modify tool.  First, 
	    the transversal direction was sometimes incorrect for the 
	    case when the start and end points are the same vertex.  
	    Second, corrected problem where the highlighted line was 
	    not correct in the roam mode.  Done, ES, (SS), 2/18/98.

g	ww. Fixed a problem with the flip function where if solid or
	    dashed lines are flipped, the line disappears.  Done,
	    CL, (SS), 2/18/98.

g	xx. Created a new function pgobj_getID which returns element ID,
	    gempak type, and sub-type to calling function according to 
	    class and object ID.  Modified NMAP routines, appropriately.
	    Done, WL, (SS), 2/18/98.

h	yy. Added text_labeling help for icons in tool palette of product
	    generation.  Also relabeled some of the button based on HPC
	    suggestions.  Done, CL, (SS), 2/27/98.

h	zz. Fixed some user-interface problems that occur on IRIX4.  
	    Corrected fronts, lines and wind editor slider bars so that 
	    they move left to right.  Fixed the wind speed text label and 
	    the wind editor's arrowhead size text field.  Done, AH, (SS),
	    2/27/98.

h	aaa. Added partial delete tool for use with lines and fronts.  Also
	     corrected some problems with the undo tool and extended it to
	     flip operations.  Done, ES, (SS), 3/3/98.

h	bbb. Extended the undo function to all element types and operations
	     except file actions.  Also, corrected a bug associated with
	     moving symbols and winds and then undoing the move.  Done,
	     ES, (SS), 3/9/98.

h	ccc. Changed the turbulence pulldown buttons in NMAP from text
	     labels to symbol pixmaps.  Done, SL, (SS), 3/9/98.

h	ddd. Corrected fatal bug when turbulence pixmaps are selected.
	     Done, SL, (SS), 3/10/98.

h	eee. Corrected a bug found by the AWC where save/save as was
	     not always properly functioning because of a misplaced
	     call to XtFree.  Done, DP, (SS), 3/10/98.

h	fff. Modified line attribute pop-up so that if the user changes
	     the line color, this change will be saved during the 
	     session.  Done, SL, (SS), 3/12/98.

h	ggg. Corrected some bugs in the modification tool and undo.
	     Made the operation of the modify tool more consistent.
	     The results of modifying a line are now the same when
	     drawing from the end point back to the line or from the
	     line to the end point.  Also, the modification tool was
	     modified so that the last new point added does not have
	     to be near a vertex on a line but rather within 6 pixels
	     of the line.  The undo button is now unavailable after
	     a Delete All operation.  Done, ES, (SS), 3/12/98.

h	hhh. Added attribute scaling capability to VG files and a way
	     to specify the scaling in GPMAP when specifying the
	     VG file name.  This will allow the scaling of attributes
	     to suit different product formats.  Done, CL, (SS),
	     3/12/98.

h	iii. Updated nmap to use new software bold font for text editing.
	     Done, CL, (SS), 3/16/98.

h	jjj. Modified VG save functions so that lines greater than
	     MAXPTS (500) vertices, are divided into pieces.  This
	     prevents truncation of long lines.  Done, GK, (SS), 
	     3/16/98.

h	kkk. Added symbol attribute editing capability; color, size,
	     and width to NMAP product generation.  Done, WL, (SS),
	     3/17/98.

h	lll. Added capability to edit wind color in NMAP.  Updated CES
	     functions and newdraw.tbl to include the size and hdsiz but
	     removed the wndtyp for the wind class.  Done, SL, (SS),
	     3/19/98.

h	mmm. Added capability to select multiple objects (multiselect) for 
	     editing purposes.  This function works ONLY on line and front 
	     objects. The unselect function has been removed.  Done,
	     ES, (SS), 3/26/98.

h	nnn. Added capability to edit the type of lines and fronts after 
	     they are drawn.  Done, SL, (SS), 3/26/98.

h	ooo. Added capability to edit symbol attributes after they are 
	     drawn.  Done, WL, (SS), 3/26/98.

h	ppp. Added light/heavy icing, heavy rain and snow, and moderate 
	     tstmsnw symbols to NMAP product generation.  Done, WL, (SS),
	     3/30/98.

h	qqq. Corrected some problems with the wind editor function.  Fixed 
	     the wind popup widget from being too small. Set the color 
	     properly when modifying wind attributes.  Fixed the problem 
	     where in some cases, the wind direction was not correct in 
	     the text box.  Removed the word "barb" from the wind popup 
	     widget.  Done, SL, (SS), 4/1/98.

h	rrr. Added a new class ALL which allows the selection of any object
	     despite its class.  Extended multi-select to WINDS, TEXT, and 
	     SYMBOLS.  Cleaned up nmap_pghdlb.  Removed unused functions
	     from drwids.h and associated .bxm files.  Fixed bug that
	     prevented selection of icing symbols.  Done, ES, (SS), 
	     4/1/98.

h	sss. Created new combination weather symbol icons which will 
	     eventually be used by NMAP.  Done, GK, (SS), 4/1/98.

h	ttt. Added group type and group number to range records in CRG 
	     library.  Done, CL, (SS), 4/2/98.

h	uuu. Changed class ALL to Class ANY and fixed some problems 
	     associated with this function with single Select, 
	     Modification, Flip, Move and Partial Delete.  Partial delete 
	     is improved by eliminating all handle bars and by using only 
	     one refresh.  Done, ES, (SS), 4/3/98.

h	vvv. Redesigned grouping in NMAP.  Done, CL, (SS), 4/3/98.

h	www. Added new combination weather symbol ICON that will be
	     used for these symbols.  Done, GK, (SS), 4/6/98.

h	xxx. Corrected some bugs with the handle bar display.  Corrected
	     the problem where there are no handle bars displayed on items
	     selected for deletion.  Also, corrected problem where handle
	     bars were left on selected objects when terminating an 
	     operation by clicking on another palette button.  
	     Done, ES, (SS), 4/7/98.

h	yyy. Added interface to smoothing into NMAP product generation.  
	     Done, SL, (SS), 4/7/98.

h	zzz. Fixed the problem where exiting from NMAP with another NMAP 
	     session active, cleared out the working file, .DEFAULT.vgf.  
	     Also, now prevent more than one session of product generation 
	     to be active when NMAP is run from the same directory.  Also, 
	     fixed a bug associated with smoothing.  The value of the 
	     smooth associated with a selected line was not being displayed 
	     correctly.  Done, CL, (SS), 4/8/98.

h	a1a. Fixed the byte count at the end of a FAX product schedule 
	     information for use in the VIEWFAX program.  Done, SJ, (SS), 
	     4/9/98.

h	a1b. Various corrections to problems with the wind editor and 
	     rotate function found as a result of CDB testing.  
	     Done, SL, (SS), 4/9/98.

h	a1c. Added DARR_ELM and HASH_ELM to the list of available drawable
	     elements for directional arrows and front hash marks, 
	     respectively.  Done, ID, (SJ), 4/10/98.

h	a1d. Added selection of fill pattern to NMAP.  
	     Done, WL, (SS), 4/14/98.

h	a1e. Made necessary changes to save hash mark to VG and AFOS file.
	     Also, added appropriate scaling for hash mark in device 
	     drivers.  Also, added case for directional arrows in vswind 
	     and vwind VG driver routines.  Done, ID, (SS), 4/16/98.

h	a1f. Made additional necessary changes to properly account for 
	     objects containing more than the maximum allowed.  These lines
	     are now properly divided up into smaller segments and stored.
	     Done, GK, (SS), 4/16/98.

h	a1g. Added underlined text to NMAP product generation.  Done, WL,
	     (SS), 4/21/98.

h	a1h. Increased the range size for wind barbs and arrows.  Done,
	     FY, (SS), 4/21/98.

h	a1i. Corrected bug where the color editor will not recall the 
	     color of the selected object if the user clicks OK without
	     selecting the color.  Also, set the line width and stroke size
	     scale increments to unity.  Also added proper borders to line
	     attribute popup window.  Done, WL, (SS), 4/21/98.

h	a1j. Fixed cvg_cp to compute the record size before the check for
	     a delete flag.  This allows the routine to skip deleted records
	     properly.  The routine used to end as soon as a deleted record
	     was encountered and the user's save file was incomplete.  Done,
	     SJ, (SS), 4/22/98.

h	a1k. Created new icons for new special lines.  These icons will
	     eventually be used in NMAP.  Done, SJ, (SS), 4/22/98.

h	a1l. Added VG type to the range record so that this information can
	     be obtained from the range record.  Done, DP, (SS), 4/22/98.

h	a1m. General cleanup of group and multiselect functions.  Also, 
	     added ungroup function.  Done, SL, (SS), 4/23/98.

h	a1n. Added new special lines to NMAP.  Also added combination 
	     weather symbols to NMAP.  With this delivery, combo symbols 
	     cannot be edited or moved yet.  Gray out stroke attribute in 
	     front and line editing windows.  Fixed a bug where the front 
	     attribute did not popup with single select function.  
             Done, CL, (SS), 4/23/98.

h	a1o. Corrected several bugs found as a result of CDB testing.
	     Multi-select smoothing of lines is now functioning properly.
	     Flipped lines/fronts no longer revert to default state when
	     editing is done.  More consistency has been brought to
	     the attributes from instance to instance when editing.
	     Selecting but not editing line/front elements will no longer
	     change the default values of the attribute edit window.
	     Fixed the problem with partial delete on filled lines.
	     Done, ES, (SS), 4/24/98.

h	a1p. Added a new LABEL icon that will be eventually used.
	     Done, GK, (SS), 4/24/98.

h	a1q. Cleaned up CES library.  Renamed functions and variables
	     for clarity.  Introduced -99 as the default value for
	     vgtype and subtype in newdraw.tbl.  REFORMATTED newdraw.tbl.
	     Added CLASS_TEXT and more features to newdraw.tbl.  Updated
	     NMAP, testces, and avnbul to account for changes in CES
	     library and newdraw.tbl.  Done, FY, (SS), 4/27/98.

*	     This change is incompatible with previous versions because
	     the format of newdraw.tbl has changed.

h	a1r. Added offset scaling for combination symbols.  Oriented the 
	     symbols at an angle with a longer slash mark.  Fixed 
	     inconsistency between combo buttons and symbols actually 
	     plotted.  Done, TL, (SS), 4/28/98.

h	a1s. Added capability to delete groups including combination 
	     symbols.  Also, fixed the bug with line fills.  Also, changes 
	     wording to justification instead of alignment.  Also fixed the
	     color displayed in the text edit window from black to white.  
	     Done, ES, (SS), 4/28/98.

h	a1t. Added the copy function to NMAP product generation.  
	     Done, SL, (SS), 4/28/98.

h	a1u. Added ability to draw stationary fronts in 2 colors in NMAP.  
	     Done, SJ, (SS), 4/28/98.

h	a1v. Added a LABEL function into NMAP product generation.  Also 
	     added some of the hooks needed for the OUTLOOK object.  
	     Done, CL, (SS), 4/28/98.

h	a1w. Corrected the combination symbol icon for Ice Pellets/Slight 
	     Freezing rain.  Done, GK, (SS), 4/29/98.

h	a1x. Corrected problem with wind head size.  Also, cleared Vg_type
	     in the range record properly.  Done, FY, (SS), 4/29/98.

h	a1y. Added capability to generate SPC outlook product.  Done, DP,
	     (SS), 4/29/98.

h	a1z. Added directional arrow and hash line to range elements.  Done,
	     FY, (SS), 4/29/98.

h	a2a. Fixed a fatal error when changing line types that occurs on
	     HPUX9/10.  Done, SL, (SS), 4/29/98.

h	a2b. Added directional arrow and hash mark to NMAP product 
	     generation.  Done, WL, (SS), 4/30/98.

h	a2c. Fixed several bugs found by CDB testing.  Modification of 
	     group elements is no longer possible.  Undo has been disabled 
	     for group functions.  Multi-select of single and combo symbols
	     no longer results in a fatal error on sgi platforms.  
	     Unintended copying of symbols and winds has been eliminated.  
	     Done, ES, (SS), 4/30/98.
h	a2d. Used 10 as the directional arrow base speed to calculate the 
	     range.  Done, FY, (SJ), 5/1/98.

h	a2e. Cleaned up the MOVE/COPY drag function and added a group 
	     "ghost" box when moving/copying. Done, SL, (SJ), 5/1/98.

h	a2f. Removed line stroke size from CLASS_LINE in the product 
	     generation.  Done, WL, (SJ), 5/4/98.

h	a2g. Removed pip stroke size from the VG fronts editor box. Cleaned
	     up and reorganized nmap_pgfrtw.c. Renamed _gemTyp to _subTyp.
	     Done, FY, (SJ), 5/4/98.

h	a2h.  Fixed angle problem with pgevt_rotateDrop. Cleaned up 
	      deselect all elements process. Done, SL, (SJ), 5/4/98.

h	a2i.  Changed product generation palette from 2 columns to 
	      3 columns.  Renamed the "wind" class to "vector". Changed all
	      default front pip sizes to 1. Done, CL, (SJ), 5/4/98.

h	a2j.  Reorganized the SPC outlook code and corrected several 
	      problems found as a result of CDB testing.  Added capability 
	      to generate HPC basic weather product.  Done, DP, (SS), 
	      5/5/98.

h	a2k.  Renamed newdraw.tbl to setting.tbl.  Done, SJ, (SS), 5/5/98.

h	a2l.  Fixed two bugs.  The types of grouped lines and fronts can
	      no longer be modified.  Pieces of grouped lines were left
	      on the screen after deselecting.  This has been corrected.
	      Done, ES, (SS), 5/6/98.

i	a2m.  Fixed problems with drawing of fat arrows.  Also, fixed the
	      problem with filled areas covering other objects.  Done, CL,
	      (SS), 5/11/98.

i	a2n.  Reduced the number of calls to ces_get/set during popup 
	      events for fronts, lines, and vectors.  Some clean-up.  
	      Done, SL, (SS), 5/11/98.

i	a2o.  Combined various operation functions into a single function 
	      and cleanup.  Done, SL, (SS), 5/11/98.

i	a2p.  Overhaul of Undo function.  It now uses a temporary file, 
	      UNDO.vgf to store elements.  Undo is now available for all
	      operations including group functions.  Undo will store and
	      undo up to MAX_EDITABLE_ELEMS (presently defined as 2000).
	      Done, ES, (SS), 5/13/98.

i	a2q.  Fixed two errors found as a result of CDB testing.  Fixed
	      segmentation fault problem associated with DELETE.  
	      Corrected problem associated with chopped fat arrows.  
	      Done, CL, (SS), 5/13/98.

i	a2r.  Fixed some problems with the attribute editing for vectors
	      and cleaned up the code in nmap_pgpwndw.  Done, WL, (SS), 
	      5/14/98.

i	a2s.  Cleaned up the palette structure, added highlighting, and
	      fixed the wind and group messages.  Done, SL, (SS), 5/14/98.

i	a2t.  Increased the range size for wind elements.  Done, TL, (SS),
	      5/14/98.

i	a2u.  Fixed line attribute value settings. Set initial position of 
	      vector attribute popup. Done, WL, (SJ), 5/18/98.

i	a2v.  Fixed a bug when displaying radar images and observations,
	      when roaming and zooming. The images would become blank after
	      unzoom is executed. Done, CL, (SJ), 5/18/98.

i	a2w.  Refined palette structure and moved cpg_getmnuid into 
	      nmap_pgpalw.  Done, SL, (SJ), 5/18/98.

i	a2x.  Fixed two bugs: multiselect would not delete the old object 
	      after an accept; a horizontal line would not be partially 
	      deleted correctly.  Done, ES, (SJ), 5/20/98.  

i	a2y.  Fixed various bugs with the group/ungroup and CLASS_ANY.  
	      Done, SL, (SJ), 5/20/98.

i	a2z.  Fixed problems with moving objects and locating objects.
	      Done, SL, (SJ), 5/21/98.

i	a3a.  Changed the string "Line Size" to "Pattern Size" in the line
	      attributes popup. Done, WL, (SJ), 5/21/98.

i	a3b.  Adjusted some array sizes in nmap routines and removed 
	      unnecessary '\0's.  These problems were detected by the AWC.
	      Done, SL, (SS), 5/27/98.

i	a3c.  Cleaned up cvg_scan and corrected problem with changing fron 
	      and line types.  Done, SL, (SS), 5/27/98.

i	a3d.  Added parameters w_orient and w_hafwid to watch information 
	      in the vg structure.  Done, DP, (SS), 5/27/98.

i	a3e.  Cleaned up the CDS library.  Removed pip and special line 
	      stroke.  Renamed some functions.  Incorporated cds_spln into 
	      cds_line.  Deleted cds_cntr.  Removed error codes.  
	      Done, FY, (SS), 5/28/98.

i	a3f.  Rearranged the text popup window and text windows in NMAP.  
	      Consolidated text buttons and added text types to attribute 
	      settings.  Cleaned up underlying code.   Done, SL, (SS), 6/5/98.

i	a3g.  Fixed problems with text display in outlook and surface prog 
	      products found as a result of CDB testing.  
	      Done, SL, (SS), 6/8/98.

i	a3h.  Restructured the nmap_pgevt.c module into 11 new files for 
	      cleanup and maintainability issues.  Done, ES, (SS), 6/9/98.

i	a3i.  Changed the pip size from an integer to a real variable in 
	      the underlying software.  The GUI will be modified 
	      appropriately in a subsequent delivery.  
	      Done, SJ, (SS), 6/9/98.

i	a3j.  Made several bug fixes detected by the AWC.  Fixed crg_inpoly 
	      calling sequence in testcgr.  Modified testcvg and removed
	      unused cvgctdsto.c, and cvgsvctd.c.  Use Xtfree instead of
	      free where appropriate.  Added XmNprocessingDirection for
	      all scale widgets.  Corrected bug in nmap_mapw.c.  Use
	      xmotion fieldin XEvent structure to for roam control and
	      time line window.  Done, CL, (SS), 6/9/98.

	      Fixed small problem with nmap_pgwlst. Done, CL, (SJ), 6/10/98.

i	a3k.  Fixed some bugs found as a result of CDB testing.  Fixed
	      the problem where selected elements were not continuing to
	      show as selected when moving between background frames.
	      Fixed problem where after grouping operation, single select
	      instead of multiselect was set.  Fixed problem where an
	      incorrect message was displayed after finishing a line/
	      front draw.  Done, ES, (SS), 6/11/98.

i	a3l.  Fixed problem with label not working.  Fixed various
	      bugs found with text as a result of CDB testing.  These
	      include not being able to change text box type within
	      multiselect.  Problems with switching from HW to SW
	      font and not being able to rotate.  Problems with text
	      when in the roam mode.  Done, SL, (SS), 6/11/98.

i	a3m.  Added line dashing pattern icons to NMAP.  Done, GK, (SS),
	      6/11/98.

i	a3n.  Added capability to draw new line dashing patterns.  Done,
	      CL, (SS), 6/11/98.

i	a3o.  Added check for arrow drawing at the end of lines to 
	      eliminate endpoints that are within 15 pixels of a vertex.  
	      These points were causing the arrow head to be drawn in 
	      unexpected directions.  Done, TL, (SS), 6/12/98. 

i	a3p.  Updated SPC outlook product capabilities.  Added label 
	      location to the ASCII file.  Created a table, 
	      $GEMTBL/nmap/outlook.tbl to read outlook categories.  Rounded
	      off points inside 7.5 miles to the VOR.  Done, DP, (SS), 
	      6/12/98.

i	a3q.  Move and copy have been streamlined to eliminate unnecessary 
	      screen refresh operations and duplicate VG file reads.  
	      Software text may now be rotated on initial placement.  
	      Note that text associated with turbulence symbols may not be 
	      rotated even if is uses software fonts.  Done, ES, (SS), 
	      6/15/98.

i	a3r.  Added new routine to generate the QPF text product.  GUI 
	      interface will be added in a future delivery.  
	      Done FY, (SS), 6/15/98.

i	a3s.  Corrected one of the dashed line icons to match line type.  
	      Done, GK, (SS), 6/15/98.

i	a3t.  Added ability to flip the arrow head from the end to the 
	      beginning of the line.  Added a check to ITXSY to not rotate 
	      the dividing line in the text for high-level turbulence 
	      symbols at the request of the AWC.  Done, SJ, (SS), 6/15/98.

i	a3u.  Made some minor corrections to the surface text product 
	      generator as a result of HPC testing.  Limit message to 
	      80 characters/line, changed format of first message line, and
	      changed OCCL to OCFNT.  Done, DP, (SS), 6/15/98.

i	a3v.  Corrected label text for outlook product as a result of CDB 
	      testing.  Done, DP, (SS), 6/15/98.

i	a3w.  Corrected problems found as a result of CDB testing.  
	      Corrected problem with NMAP crashing after the text box type 
	      is changed multiple times.  Corrected problem with the text 
	      popup not remembering which box type was used last.  
	      Done, SL, (SS), 6/15/98.

i	a3x.  Removed w_havwid from watch information in the VG structure.
	      Done, DP, (SS), 6/15/98.

i	a3y.  Added interface to generate QPF text product.  
	      Done, FY, (SS), 6/16/98.

i	a3z.  Corrected problem that was causing a compiler error on IRIX4 
	      for a NMAP routine.  Done, DP, (SS), 6/16/98.

i	a4a.  Added capability to generate a parallelogram watch to product
	      generation.  Done, DP, (SS), 6/16/98.

i	a4b.  Changed the pip size of fronts from integer (1-10) to 
	      float (0.1-5.0) in product generation.  Done, WL, (SS),
	      6/17/98.

i	a4c.  Corrected bugs found as a result of CDB testing.  Fixed 
	      problem where rotation was attempted when placing labels 
	      with some line types.  Fixed problem where text following 
	      labels being treated as labels, not text.  With multiple 
	      labels, fixed problem where only last label was being grouped
	      with intended object.  Fixed problem where no text attribute 
	      box was being popped up the first time label is selected.
	      Fixed problem where group box was popping down when 
	      deselecting a newly formed group.  Corrected problem where 
	      line type could not be changed upon selection.  
	      Done, ES, (SS), 6/17/98.

i	a4d.  Corrected bugs as a result of CDB testing.  Fixed the 
	      following: Rotation of software text was not updating the 
	      text attribute window.  Text following labels was being 
	      treated as labels instead text.  Fixed drag/drop on move 
	      and copy for non-grouped objects to ignore the range.  
	      Done, ES, (SS), 6/17/98.

i	a4e.  Modify cvg_cpy routine to allow opening of a VG file with 
	      read-only permission.  This is being done in preparation for 
	      allowing users to open VG files from other directories for 
	      editing.  Done, CL, (SS), 6/17/98.

i	a4f.  Correct problem where symbol attributes where not updated as 
	      the slider bar is being used.  Done, WL, (SS), 6/18/98.

i	a4g.  Modified the function crg_settxt to make the range area 
	      smaller for text objects to improve screen refresh time.
	      Done, SJ, (SS), 6/18/98.

i	a4h.  Corrected several bugs found as a result of CDB testing.  
	      Corrected incorrect modification of three point lines/fronts.
	      Fixed, class switching to "ANY" after symbol placement.  
	      Corrected erratic resizing to lines/fronts that are 
	      selected, then zoomed.  Changing types of fronts now retains 
	      pip size.  Also, added a check on lines for close starting 
	      vertices in the case of flipping for arrowhead placement.  
	      Done, ES, (SS), 6/18/98.

i	a4i.  Added ability to open VG files for editing from other 
	      directories other than the local one.  Also can save a VG 
	      file to another directory where the user owns it and has 
	      write permission.  A browser has been added.  
	      Done, SL, (SS), 6/18/98.

i	a4j.  Wrote a VG convert program to convert 5.4.3.i VG files to 
	      5.4.3.h VG files.  This is needed to take into account 
	      changes in the pip scaling and the fact that regular text 
	      are stored as special in h.  Done, DP, (SS), 6/18/98.

i	a4k.  Changed the pip size range from 0.1 -- 5.0 to 0.4 -- 5.0.  
	      Fixed real value setting problem in testces.c.  
	      Done, WL, (SS), 6/22/98.

i	a4l.  Fixed text problems related to changing attributes for 
	      different box types without popping down the text window and 
	      having the settings forgotten.  Done, SL, (SS), 6/22/98.

i	a4m.  Corrected a problem found in the VG convert program where 
	      special text not consisting of regular text was not being 
	      processed.  Done, DP, (SS), 6/22/98.

i	a4n.  Changed the text box buttons (on the text attribute window), 
	      from text labels to icons.  Reduced size of this window.  
	      Also, fixed front editing to reset set front strength to the 
	      default when a new front type is selected.  
	      Done, ES, (SS), 6/22/98.

i	a4o.  Added special lines that were missing to testces program.  
	      Done, WL, (SS), 6/23/98.

i	a4p.  Bug fixes as a result of CDB testing.  Line type changes now 
	      will maintain the attributes of the original line.  The 
	      object palette is now refreshed on zoom operations.  
	      Done, ES, (SS), 6/23/98.

i	a4q.  Changed cds_symb to read the correct value for the marker 
	      code.  Done, SJ, (SS), 6/23/98.

i	a4r.  Modified the avnbul program to properly handle the special 
	      text type of 0.  Done, FY, (SS), 6/23/98. 

i	a4s.  Repositioned dashed lines and renumbered classes of objects 
	      in drwids.h.  Done, FY, (SS), 6/23/98.

i	a4t.  Fixed problem when copying/moving text that sits on top of 
	      huge combination symbols.  Done, CL, (SS), 6/23/98.

i	a4u.  Added check to account for pip size scaling difference 
	      between i and h.  This will allow patch i to properly plot 
	      front pips generated in h.  Done, SJ, (SS), 6/23/98.

i	a4v.  Cleaned up file selection functions so that display name is 
	      NULL if the function is OPEN and there is no write 
	      permission, saveas always starts browsing in the cwd, and the
	      display string no longer includes the cwd or $HOME.  
	      Done, SL, (SS), 6/23/98.

i	a4w.  Made the convert program, concvg more robust.  Added check 
	      for proper usage.  Added check for existence of input and 
	      output filenames.  Added check that input VG file is proper 
	      version.  Make sure the output VG file has the proper file 
	      version.  Done, DP, (SS), 6/24/98.

i	a4x.  Fixed problem where save was not working properly.  Done,
	      SL, (SS), 6/24/98.

i	a4y.  Fixed a bug with the surface prog generation code when
	      saving the text file.  Done, DP, (SS), 6/24/98.

i	a4z.  Fixed a bug with the version i to version h convert 
	      program for symbols.  Done, DP, (SS), 6/25/98.

i	a5a.  Fixed another bug with conversion program where text
	      was not being properly converted.  Done, DP, (SS),
	      6/26/98.

j	a5b.  Fixed problems that sometimes occur with screen refresh when
	      moving grouped and combination symbol objects.  
	      Done, ES, (SS), 7/6/98.

j	a5c.  Fixed problem where use of group after move placed duplicate
	      elements instead of grouping them.  Also, fixed problem where
	      dashed line patterns other than type 5 were not properly 
	      saving line attributes.  Done, ES, (SS), 7/6/98.

j 	a5d.  Added capability to clear text window by using the control 
	      backspace keys.  Done, SL, (SS), 7/6/98.

j	a5e.  Fixed problem with fill pattern was not being set properly 
	      after it was changed.  Done, WL, (SS), 7/6/98.

j	a5f.  Improved the bottom window hints.  Made them more consistent 
	      and improved readability.  Done, GK, (SS), 7/7/98.

j	a5g.  Corrected problem where model generated contours cannot 
	      sometimes be selected.  This was due to an error in the 
	      calculation of the distance to a line.  
	      Done, ES, (SS), 7/9/98.

j	a5h.  Corrected two subroutine name typos in testcvg.c help
	      section.  Gave more descriptive names to the special line 
	      types in testces.c and in the setting.tbl.  
	      Done, AH, (SS), 7/9/98.

j	a5i.  Improved the format of the hints in NMAP.  
	      Done, GK, (SS), 7/13/98.

j	a5j.  Added capability to undo the delete all function.  
	      Done, ES, (SS), 7/14/98.

j	a5k.  Corrected bug in the outlook product generation for 
	      GENERAL THUNDERSTORM groups.  Added LABEL -1 -1 and corrected
	      problem with CONT areas.  Done, DP, (SS), 7/14/98.

j	a5l.  Improved the ghosting of closed lines when moving and 
	      selecting.  Move operations of closed lines will now ghost as
	      closed figures.  Select operations will now ghost three 
	      points.  Done, ES, (SS), 7/15/98.

j	a5m.  Text strings for particular text types are now preserved when
	      switching from one type to another.  The maximum number of 
	      characters saved is 19.  Done, WL, (SS), 7/15/98.

j	a5n.  Added capability to edit front color in NMAP product 
	      generation.  Done, WL, (SS), 7/22/98.

j	a5o.  Added a ghost box when placing and moving text to provide
	      guidance for the size of the text string.  Also, fixed the
	      problem with disappearing combo symbols during moves and copies.
	      Done, SL, (SS), 7/24/98.

j	a5p.  Added past weather thunderstorm symbol to product generation in 
	      NMAP.  Done, WL, (SS), 7/29/98.

j	a5q.  Enabled symbol width editing for combo symbols.  Corrected 
	      problems with clicking on the symbol size or width slider
	      bars and value not updating properly.  Done, WL, (SS), 
	      8/4/98.

j	a5r.  Ghosting now takes into account smoothing of lines and
	      fronts in move, copy, vertex drag, modify and partial
	      delete operations.  Also, closed lines (both smoothed
	      and non-smoothed) now ghost as closed figures after
	      the second point is placed.  Done, ES, (SS), 8/6/98.

j	a5s.  Changed the slash line in combo symbols to a special 
	      symbol.  This corrects the problem for combo symbols
	      not plotting properly when the map area or projection
	      is changed.  Done, TL, (SS), 8/6/98.

j	a5t.  Updated a text product generation routine to read the
	      text size table.  Done, CL, (SS), 8/7/98.

j	a5u.  Added capability to generate hurricane track text product.
	      Done, DP, (SS), 8/10/98.

j	a5v.  Made some corrections to nmap as a result of problems 
	      found by the AWC.  Corrected bugs and initialization
	      problems in NxmTxtA.c.  Correct potential memory leaks
	      associated with using cst_clst.  Renamed "Auto Text Label"
	      to "Icon Tips" in the NMAP Options menu.  Done, Cl,
	      (SS), 8/10/98.

j	a5w.  Corrected the outlook product for cases when the outlook
	      line is flipped.  Done, DP, (SS), 8/11/98.

j	a5x.  Added first step for graph to grid processing.  Added
	      capability to generate contour information to a text
	      file.  Done, DP, (SS), 8/11/98.

j	a5y.  Fixed a problem with product generation exiting,
	      re-entering problem with object windows.  Upon
	      re-entering the object window was not active.
	      Done, WL, (SS), 8/11/98.

j	a5z.  Fixed some problems with NMAP product generation.  Changed
	      the "GRAB" to "DRAG" in the MOVE/COPY mode.  The user
	      must drag the selected object.  Also improved the jiggling
	      problems.  The user must be close to the object in order
	      to drag it.  For consistency, the vector/symbol/combysmbol
	      can no longer be moved in the select mode.  Also, fixed
	      the ghosting problem associated with the MOVE/COPY
	      group.  Done, CL, ES, (SS), 8/24/98.

j	a6a.  Removed the checking for close vertices for the special
	      lines with the arrow head.  Done, CL, (SS), 8/24/98.

j	a6b.  Added three new symbols, storm center, tropical 
	      depression, and tropical cyclone to NMAP and GEMPAK.
	      Done, GK, (SS), 8/25/98.

j	a6c.  Fixed problem with ungroup.  Now after ungroup, the
	      class goes back to ANY and the object menu is 
	      disabled.  Before, it was not disabled.  Also,
	      Rotate will now work with the ANY class.  Changed
	      the flip function so that if flip is selected,
	      and the middle mouse button is clicked, the program
	      will remain in the flip function instead of going
	      back to the select function.  Done, CL, (SS), 
	      8/27/98.

j	a6d.  Cleaned up the hints and made them more consistent.
	      Done, CL, (SS), 8/27/98.

j	a6e.  Created two new icons, dashed open arrow and dashed closed
	      arrow for NMAP.  Done, TL, (SS), 8/27/98.

j	a6f.  Updated the graph to grid product generation text 
	      output.  Added check for closed curves.  Done, DP,
	      (SS), 9/1/98.

j	a6g.  Added a new function to delete a single point from a
	      line or front.  Done, SL, (SS), 9/2/98.

j	a6h.  Improved the group and ungroup operations.  For group
	      the user clicks on group, and the program automatically
	      goes to the ANY class.  Then select objects and group
	      type and click the OK button.  To group another set
	      of objects, click the middle mouse button and proceed.
	      The ungroup operation now automatically goes into
	      the ANY class when selected.  Select the group and
	      confirm ungrouping with the left button.  Select
	      a new group and proceed.

	      Treat the combination symbols as a special object.
	      Combination symbols can no longer be grouped or 
	      ungrouped with other objects.  Done, CL, (SS), 
	      9/2/98.

j	a6i.  Improved the ghosting of smoothed lines and fronts in
	      new draw, vertex drag, modify and partial delete operations.
	      Ghosting is now reduced to partial drawing to avoid
	      overruning ghost point space and improve performance.
     	      Done, ES, (SS), 9/3/98.

j	a6j.  Added capability to generate the HPC excessive rainfall
	      potential outlook product.  Added interface to use the
	      two new dashed arrow lines.   Done, FY, (SS), 9/8/98.

	      Note:  The excessive rainfall product uses a sorted
	      metar station table, $GEMTBL/stns/xrainsort.tbl.  This
	      table must be updated when the metar station table
	      is updated.

j	a6k.  Fixed a bug in the partial delete.  Partial delete on
	      smoothed lines with large distances between points
	      would not always place the starting partial delete
	      point on the smoothed line.  Done, ES, (SS), 9/8/98.

j	a6l.  Updated undo/redo operation to now act on the group and
	      ungroup operations.  Also, the undo/redo now un-highlights
	      the selected object palette type.  Done, ES, (SS),
	      9/8/98.

j	a6m.  Added north relative rotation option to text and turbulence.
	      Done, WL, (SS), 9/9/98. 

j	a6n.  Added a new function to connect two line or front elements
	      into one element.  Done, SL, (SS), 9/9/98.

j	a6o.  Corrected problem where line and front types could not
	      be changed.  Also, corrected an error where an extra 
	      null character was placed after the end of the hint
	      string.  This sometimes corrupted the hint string.  Done,
	      ES, (SS), 9/10/98.

j	a6p.  Additional improvements to grouping operation were made.
	      Now the middle mouse button can be used in addition to
	      the OK button to create the group.  Done, CL, (SS),
	      9/10/98.

j	a6q.  Added ghost veiling to NMAP text and symbol objects.  This
	      change blanks out ghosting when the mouse is not on the
	      canvas.  Also, this change corrects the problem of lagging
	      text ghost found as a result of CDB testing.  Done,
	      GK, (SS), 9/14/98.

j	a6r.  Added function to ungroup all grouped elements.  Done,
	      SL, (SS), 9/14/98.

j	a6s.  Added the smoothing level to the setting.tbl to allow
	      control of the default value for line and front objects.
	      Done, CL, (SS), 9/14/98.  

*	      ( This is incompatible with previous versions because
		because a column for the smoothing level has been added
		to the table setting.tbl )

j	a6t.  Fixed problem with improper ghosting after objects are
	      moved.  Done, GK, (SS), 9/15/98.

j	a6u.  Added the option to blank out behind vector objects in
	      NMAP product generation.  Done, WL, (SS), 9/15/98.

j	a6v.  Fixed problems with ungroup all function found as a result
	      of CDB testing.  Done, SL, (SS), 9/15/98.

j	a6w.  Greyed out rotation for turbulence symbol since they cannot
	      be rotated.  Done, WL, (SS), 9/15/98.

j	a6x.  Corrected some problems with the speed and direction 
	      processing for vectors.  Corrected problems with entering
	      values greater than 200m/sec for wind arrows.  Added checks
	      for entering invalid values for speed and direction.  Made
	      direction value independent among the vector types.  Done,
	      WL, (SS), 9/17/98.

j	a6y.  Added capability to edit objects within a group.  There is
	      now a group and object radio button.  When the object
	      radio button is selected, objects within groups can
	      be edited.  Done, ES, (SS), 9/17/98.

j	a6z.  Corrected problem with connect function where flip direction 
	      was not being saved properly during connections.  Also,
	      removed unnecessary refreshes during operation.  Done,
	      SL, (SS), 9/22/98.

j	a7a.  Corrected some problems as a result of CDB testing.  Ungroup
	      all was corrected so that exiting other than using the middle
	      mouse button will no longer cause errors.  Also, corrected
	      line/front ghosting for modifying and connecting a 2 point
	      line with smoothing.  Also, corrected toggling between 
	      object/group modes to properly reset the drawing state.
	      Done, ES, (SS), 9/22/98.

j	a7b.  Corrected fatal error for hurricane track product, if the number
	      of points entered exceeded the maximum allocated.  Done, DP,
	      (SS), 9/22/98.

j	a7c.  Corrected minor problems in graph to grid program as a result of
	      CDB testing.  Improved gradient calculation for some cases.
	      Renamed the output file to grphgd.info.  Added glevel and 
	      gcoord as output variables.  Done, DP, (SS), 9/22/98.

j	a7d.  Wrote new program, SFCSPLT, that splits a surface analysis VG file
	      into  front VG and pressure VG files.  Done, FY, (SS), 9/23/98.

j	a7e.  Corrected some problems found as a result of CDB testing.  
	      The class now defaults to ANY upon initial entry into product
	      generation.  Also, corrected the hint message when finishing
	      the UNGROUP_ALL operation.  This operation now resets to 
	      SELECT upon completion.  The group window now pops down when
	      a selection to the class palette is made.  Done, ES, (SS),
	      9/23/98.

j	a7f.  Made corrections to multiple watches operations.  Corrected
	      problem of attributes being transferred such as orientation
	      from one watch to another.  Corrected problem where sometimes
	      editing corner points caused undesired box shapes.  Done,
	      DP, (SS), 9/23/98.

j	a7g.  Fixed problem found as a result of CDB testing.  When
	      opening a VG file after entering product generation
	      select was not activated.  This has been corrected.
	      Done, ES, (SS), 9/24/98.

j	a7h.  Fixed some errors in the hint messages.  There were a few
	      cases where select was indicated after an action, but 
	      select was not active.  Also, made messages upper-case if
	      a few cases where they were not.  Done, GK, (SS), 9/24/98.

j	a7i.  Fixed problem where combination symbols could be labeled
	      and thus ungrouped.  They can no longer be labeled. 
	      Done, ES, (SS), 9/24/98.

j	a7j.  Fixed problem found in watch generation where attributes
	      were not being properly saved between watches.  Done,
	      DP, (SS), 9/24/98.

j	a7k.  Fixed additional problems in graph to grid program.
	      Increased array to handle avn grid.  Added more robust
	      handling of cpyfil variable.  Changed GPARM to GFUNC
	      as a user input variable.  Done, DP, (SS), 9/24/98.

j	a7l.  Modified the excessive rainfall outlook product to 
	      include endpoints when the line is open.  Done, FY,
	      (SS), 9/28/98.

k	a7m.  Added ghost box for north relative text placement and
	      movement.  Done, WL, (SS), 10/5/98.

k	a7n.  Modified GROUP action so that the cancel button works
	      properly.  The group selection pop-up now disappears
	      when clicking the cancel button and the program activates
	      the SELECT action.  Done, GK, (SS), 10/6/98.

k	a7o.  Removed "OK" button on the color palette in nmap product
	      generation.  Color selection is now set by just clicking
	      the desired color on the palette.  Done, WL, (SS),
	      10/6/98.

k	a7p.  Corrected problem with ghost box rotation with north 
	      relative text not properly taking into account negative
	      angles.  Made angle increment 10 deg when clicking on
	      the direction widget.  Done, WL, (SS), 10/6/98.

k	a7q.  Corrected some problems with the file handling, i.e,
	      save/save as.  An initial SAVE will now be treated as
	      a SAVE AS.  DELETE ALL  will change the 
	      default vg file back to .DEFAULT.vgf file instead of
	      leaving it pointed to the vg file that came from OPEN.
	      Permission checks are now consistent between save and
	      save as.  Done, ES, (SS), 10/7/98.

k	a7r.  Corrected problems with color editing associated with
	      delivery 021a7o.  Multi-select and select on symbols 
	      and vectors now works properly when changing the
	      color.  Done, WL, (SS), 10/8/98.

k	a7s.  Renamed the functions pgdel_erase and pgdel_eraseAll to
	      pgdel_delet and pgdel_deletAll. Done, WL, (SJ), 10/13/98.

k	a7t.  Fixed problem with value of text rotation angle being 
	      incorrect in some situations for north relative text.
	      Also, changed angle increment from 10 to 5 degrees for
	      consistency.  Done, WL, (SS), 10/19/98.

k	a7u.  Fixed problem in handling selection of text with offsets.
	      Problem was found by the AWC.  Done, ES, (SS),
	      10/19/98.

k	a7v.  Added new element for the combination weather symbol
	      to the VG file structure.  Done, AH, (SS), 10/19/98.

k	a7w.  Fixed the problem where entering the values for front
	      pip size or line pattern size directly in the text
	      string box did not work properly.  This problem was
	      found by the AWC.  Done, WL, (SS), 10/21/98.

k	a7x.  Fixed problem selecting north relative text with
	      offsets in cases where rotation was significantly
	      different than screen north.  Done, ES, (SS),
	      10/21/98.

k	a7y.  Fixed problem of moving text with offsets.  Ghosting
	      box is not used for offset text.  Instead a crosshair
	      is used.  Done, ES, (SS), 10/22/98.

k	a7z.  Fixed problem where if the data pop-up was activated
	      in product generation while drawing a line or front,
	      the type of line or front would get changed.   Now,
	      anytime the data pop-up is activated, the product
	      generation function must be reactivated.  For example,
	      the line type must be re-selected if the data pop-up
	      is activated.  Done, ES, (SS), 10/26/98.

k	a8a.  First stage of clean up of the cvg library.  cvg_load
	      now does a 3 stage load operation, drawing filled
	      objects first, and text and wind items last, regardless
	      of their order in the VG file.  Cleaned up 
	      cvg_rdsel and cvg_rdrec had nearly identical functionality.
	      They have been cleaned up and now cvg_rdsel calls
	      cvg_rdrec.  Cleaned up cvg_fndhl.  Updated calls in
	      nmap/vgf to account for calling sequence change in
	      cvg_rdrec.  Done, ES, (SS), 10/26/98.

k	a8b.  Fixed problem where outlook text product was not ordered
	      properly with multiple continued outlook areas.  Done,
	      DP, SJ, (SS), 10/30/98.

k	a8c.  Cleaned up code in vector handling routine, nmap_pgwndw.c.
	      Done, WL, (SS), 11/2/98.

k	a8d.  Cleaned up cvg open routines and removed cvg library routines
	      that are no longer used.  Improved error processing.  Done,
	      ES, (SS), 11/2/98.

k	a8e.  Corrected selection and move problems associated with the offset
	      text.  The user is now forced to drag from the handlebar not
	      from the offset text itself.  Also, a bug with text move is fixed.
	      The ghosting of non-offset text was not a box when the class
	      ANY was selected.  Now, non-offset text is always ghosted as a box.
	      Done, ES, (SS), 11/4/98.

k	a8f.  Added flame symbol to GEMPAK and NMAP.  Done, GK, (SS),
	      11/4/98.

k	a8g.  Moved hint strings into a header file to simplify hint modifications.
	      Also, remove right mouse button status from NMAP_MBOTW because it
	      was not being used.  Done, GK, (SS), 11/4/98.

k	a8h.  Modified product generation to use new GEMPAK combination symbols.
	      Combination symbols are now treated like other symbols.  They
	      are no longer internally grouped.  Combination symbols that
	      were previously created as groups will still work properly.
	      Done, ES, (SS), 11/4/98.

k	a8i.  Corrected improper selection error of offset text introduced
	      in delivery 021a8e.  Done, ES, (SS), 11/6/98.

k	a8j.  Updated parallelogram watch box for editing.  Added handle-
	      bar to the sides of the parallelogram for editing.  By
	      selecting these, the side will be dragged leaving the other
	      side fixed.  Added the "snap" capability while editing.
	      The final placement of the parallelogram will reflect
	      the location at 5 mile multiples to the closest watch
	      anchor point.  The location will be exactly along a 
	      16 point compass axis eminating from the closest watch
	      anchor point.  Done, DP, (SS), 11/12/98.

k	a8k.  Added capability to select text and increment or decrement
	      its value.  Done, WL, (SS), 11/16/98.

k	a8l.  Made watches a class outside of products and cleaned up
	      some of the code.  Also, watch attributes can now be
	      edited after a watch is created.  Done, SL, (SS), 
	      11/18/98.

k	a8m.  Added multi-selection by drag capability.  When in the
	      function multi-select, group, or increment/decrement, element 
	      selection can either be done via mouse button1 click-release 
	      (on or near an element), or by pressing button 1 and dragging.  
	      A drag box is produced this way and all elements within the 
	      described area that match the selected class will be selected.
	      Also, the ability to edit grouped elements while in object 
	      mode has been restored. Done, ES, (SS), 11/19/98.

k	a8n.  Made watch box color selection a single button to pop up
	      color palette to be consistent with other widgets.  Also,
	      corrected problem with the disappearing color selection
	      area found in CDB testing.  Done, SL, (SS), 11/23/98.

k	a8o.  Changed appearance of the selected elements for INC/DEC
	      function from the white dot to cyan octogon.  Also, fixed
	      problem where the Inc/Dec window would not appear when
	      selecting single vgf elements.  Done, ES, (SS), 11/23/98.

k	a8p.  Corrected problems found as a result of CDB testing.
	      Prevent editing of objects while in group mode.  Also,
	      retain current selection when changing classes during
	      grouping.  Done, SL, (SS), 11/24/98.

k	a8q.  Reordered the "Show Cnty" display to give watch information
	      first as requested by the SPC.  Also corrected improper
	      display of counties for the watch by county function.
	      Done, DP, (SS), 12/3/98.

k	a8r.  Added virtual line extensions for labelled lines while
	      performing graph-to-grid product generation.  This 
	      technique enables users to elimimate line intersections
	      that are prohibited during graph-to-grid calculations.
	      Done, DP, (SS), 12/3/98.

k	a8s.  Separated number editor from NxmTxtA routine and
	      cleaned up.  Set the default values in the number
	      editor popup to Incr and 1.  Removed Apply and
	      Cancel buttons and added Deselect and Exit buttons.
	      Added middle mouse button Apply function.  Added
	      logic to exclude character selection in number
	      editor.  Done, WL, (SS), 12/14/98.'

k	a8t.  Added a button to the watch box popup to show/hide
	      the county list.  Removed the ability to format
	      a newly created watchbox's list.  Done, SL, (SS),
	      12/15/98.

k	a8u.  Clean up and improve appearance of the increment and
	      decrement function.  Check to make sure that selected
	      object is a number.  Change the name from NUMB_EDI to
	      Inc_Dec in hint and icon names.  Upon exiting this 
	      function, the action and class are changed to "Sel"
	      and "Any".  Shortened labels to Inc and Dec.  Moved
	      the Inc/Dec window below the product generation palette.
	      All types of appropiate text can now be selected.  Done,
	      ES, (SS), 12/17/98.

k	a8v.  Corrects problems with clearing product generation graphics
	      upon exiting product generation or opening a VG file.
	      Done, ES, (SS), 12/18/98.

k	a8w.  Renamed clo_direct to clo_tdirect to allow a new 
	      clo_direct to be written in the future.  Updated
	      calling routines.  Done, DP, (SS), 12/21/98.

k	a8x.  Updates to the CLO library.  Added number of items
	      to return into calling sequence of clo_closest and
	      modified calling routines accordingly.  Added structures
	      to read city tables and added new routines to read them.
	      Done, DP, (SS), 12/21/98.

k	a8y.  Fixed several problems with increment/decrement function.
	      Made exit button for this function consistent with the 
	      mouse exit.  The inc/dec window will now popup when in 
	      OBJ mode but not in GRP mode.  Changed hint for middle
	      mouse button from Done to Exit.  Corrected an unintended
	      creation of .DEFAULT.vgf file when outside product 
	      generation.  Done, ES, (SS), 12/22/98.

k	a8z.  Modified the excessive rainfall potential outlook product
	      to accept any fill pattern.  Replaced the text associated
	      with filled areas with string:"TOATAL RAINFALL AMOUNTS OF
	      FIVE INCHES".  Done, FY, (SS), 12/22/98.

k	a9a.  Corrected problem with text edit window improperly disabling
	      the keyboard input of loop commands.  Also, reduced the 
	      size of the refresh area when objects are modified.  Done,
	      ES, (SS), 12/23/98.

k	a9b.  Changes and improvements made to some of the CLO routines.
	      NMAP calling routines have been updated to take these
	      changes into account.  Changed the clocmn.h file to 
	      include the storting of cities by latitude and size.
	      Updated the utility routines that generate the cities
	      tables.  Done, DP, (SS), 12/31/98.

k	a9c.  Modified text edit to allow the selection of which attributes
	      to be edited when in multiple select mode.  For example, the
	      user can now change the color of selected text objects without
	      changing the font.  Done, WL, (SS), 1/6/99.

k	a9d.  Added a check for special line type 20, dashed arrow line in the
	      outlook product processing.  Done, DP, (SS), 1/6/99.

k	a9e.  Removed the watch formatting from the Watch Count List popup.  The
	      formatting is now accessed from the product classs.  The buttons
	      at the top of the Watch County List popup now allow switching between
	      the watch box specs and the county list.  Also, the user must now
	      select the box shape before drawing the box.  Done, SL, (SS),
	      1/8/98.

k	a9f.  Moved code from NxmTxtA.c into existing nmap_pgtxt.c routine.  Also,
	      fixed multiselect text attributes problem where the text string is
	      blank.   In this case after the APPLY button is given, all selected
	      attributes are changed and a warning message is generated.  Done,
	      WL, (SS), 1/11/99.

k	a9g.  Fixed some problems with the watch box as a result of CDB testing.
	      Fixed save button on watch box formatting popup.  Fixed problem
	      with moving watch box and having old points being remembered
	      during the next show display operation.  Done, SL, (SS), 
	      1/12/99.

k	a9h.  Moved define for BOX, SIZE, FONT, STYLE, ALIGN, TURB, COLOR, ROTN 
	      from Nxm.h to nmap_pgtxt.c and nmap_pgedit.c in the text edit
	      portion of NMAP.  Done, WL, (SS), 1/13/99.

k	a9i.  Added underlined text which blanks out the background to NMAP 
	      product generation.  Done, WL, (SS), 1/14/99.

k	a9j.  Added an "X" symbol, and a L with a + symbol to GEMPAK and 
	      NMAP product generation.  Done, GK, (SS), 1/19/99. 

k	a9k.  Fixed some problems with the text attribute editing.  
	      Fixed problem where if no text value is entered and the box
	      type is changed, the selected text is erased.  Fixed 
	      problem in mutli-select where changing the text box type
	      with required a text string change.  Fixed increment/
	      decrement function which was not working.  Done, WL,
	      (SS), 1/21/99.

k	a9l.  Added capability to create the front and tropical cyclone
	      text file for the Weather Depiction Chart from the Surface
	      Analysis VG file.  Created a "WxD" product button for this
	      feature.  Done, FJY, (SS), 1/22/99.

k	a9m.  Cleaned up surface prog.  Added squall lines as TROFs.
	      Done, FJY, (TP), 1/27/99.

k	a9n.  Fixed problems with text editing.  Single text edit and
	      increment/decrement work with class 'any'.  Fixed exit 
	      button on increment/decrement.  Done, WL, (TP), 1/27/99.

k	a9o.  New function - 'Show All Groups'.  Fixes to auto update.
	      Done, ES, (TP), 2/2/99.

k	a9p.  Removed the check for the LINE_ELM types from nmap_pgsfp.
	      This was a check for line types used as fronts.  This will 
	      be fixed by creating a new front element at a later time.
	      Done, SJ, (TP), 2/4/99.

k	a9q.  Response to bug report 010a2o.  Done, DP, (TP), 2/4/99.

k	a9r.  Bug fix in nmap_pqwlst.c, incorrect anchor points for
	      parallelogram watches.  Done, DP, (TP), 2/5/99.

k	a9s.  Switch default file operation from open to append.
	      Done, ES, (TP), 2/8/99.

k	a9t.  Added new front type for squall lines.  Added new combo
	      symbols and changed the names and order of the icons.
	      Updated include files, tables, and icon files for the 
	      above changes.  Updated PLOTSYMS for new front type and 
	      new combo symbols.  Modified LOW_X icon.  Done, SJ, 
	      (TP), 2/8/99.

k	a9u.  Various work on partial delete:  Added prompting for arrowhead,
	      added distance checking near end of line so that a real short
	      segment doesn't remain nor a duplicate point near an old vertex.
	      Done, SL, (TP), 2/9/99.

k	a9v.  Updated Weather Depiction text product to include new squall 
	      line front type.  Done, SJ, (TP), 2/9/99.

k	a9w.  Fixed problem 125.1, changed default for auto-update to off, 
	      and changed appearance of HIDE/SHOW button to match other
	      loop control buttons.  Done, ES, (TP), 2/9/99.

k	a9x.  Change default .info filename for the graph-to-grid text 
	      product to reflect vgfile name.  Done, DP, (TP), 2/10/99.

k	a9y.  Inc/Dec function allows values in station model to be
	      toggled on/off together.  Also fixes problem 134.1.
	      Done, ES, (TP), 2/10/99.

k	a9z.  Made changes to appending files such that 1) opening a file to
	      a blank workspace does not append the .DEFAULT.vgf.save file 
	      and 2) opening multiple files (each having groups) keeps the
	      elements in the correct groups.  Done, SL, (TP), 2/11/99.

k	b1a. Changed default vgf file open to replace.  Fixed bug with 
	     a bad error message associated with the data load window.
	     Done, ES, (TP), 2/16/99.



022.	VIEWFAX

g	a.  Fixed the display of product number in the VIEWFAX title
	    bar.  Done, SJ, (SS), 2/4/98.


023.	Icons

i 	a.  Refined the icons for the text types.  Done, TP, (SS),
	    6/24/98.

j	b.  Created a past weather thunderstorm icon and updated
	    the icon generation script.  Done, GK, (SS), 7/23/98.



	SJ - Scott Jacobs		JA - Jeff Ator
	DP - Dave Plummer		BH - Bob Hollern	
	SS - Steve Schotz
					PB - Peggy Bruehl
					JC - Jim Cowie
	GK - Gary Krueger		SC - Steve Chiswell
	TL - Tiros Lee			
					RS - Russ Schneider
	CL - Chien Lin			KB - Keith Brill
	SW - Shanshan Wang		JW - Jim Whistler
	ML - Mike Linda			RL - Robert Lindsay
	WL - William Li			JYC - Joey Carr
	ES - Edward Safford		JP - James Partain
	DKW - Duane Kidwell		JH - Jon Hoopingarner
	FY - Fee-Jing Yen		GG - Greg Grosshans
	ID - Ian Durham			SD - Steven Danz
	AH - Andrea Hardy
	SL - Scott Law
	TP - Tom Piper


