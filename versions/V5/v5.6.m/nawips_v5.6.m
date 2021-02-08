		     NAWIPS 5.6.f+  CHANGE DESCRIPTION LOG

	( * indicates a change that makes this version of NAWIPS
	    incompatible with the previous version )

NOTE:	Effective 10/01/01, v5.6.f the format of this log has changed.  
        First, unused categories have been removed and the categories 
        have been renumbered.  Second, task tracking numbers, denoted by 
        TNNN, have been added when applicable to the beginning of each entry.
	Finally, bug fixes that relate to a specific delivery are grouped with
	it and the delivery number is denoted by a "- NNN", e.g., 001a-1.

001.	ASCII Decoders  	

f	a. T012A:  Added the decoding of Cuban international sigmet reports in 
	   decoder DCISIG.  Added the dcoding of an additional cancellation 
	   report from Japan in DCISIG.  Checked for the possibility of the 
	   existence of the characters "UTC" in front of the correction flag 
	   in the header record in routine DC_GHDR called by many decoders.  
	   Done, FY, DK, 10/3/01.

f	a-1. Added the decoding of Cuban international sigmet reports having the 
	     keyword "VT" seperated from the time in decoder DCISIG.  Fixed 
	     problem #497P1 which occurred when the RJAA cancel bulletin was in a 
	     file by itself.  Fixed problem #497P2 which occurred when there was 
	     a new phrase for giving the flight level.  A search for the keyword 
	     "TOP" was added when there is no "FL" prefix for the flight level.  
	     Done, FY, (DK), 10/12/01.

f	a-2. Expanded the decoding of Cuban (MUHA) international sigmet reports:
	     allowed the valid date/time prefixed with "VT" for non-cancellation 
	     reports; added processing of reports having no area keywords;  
	     allowed for commas used as decimal points in the area definition;  
	     removed unnecessary lat/lon delimiter "/".  Done, FY, (SJ), 10/30/01.

f	a-3. Changed four pqact.conf files to allow the international sigmet
	     decoder dcisig to decode reports from more international sources,
	     and to save those reports to a flat file.  Done, DK, (SJ), 12/5/01.

f	b. Changed the decoders, DCAMOS, DCMMOS, DCMOSA, DCMOSM and DCNMOS, so 
	   that when a second report comes in, the old data will be overwritten 
	   with the new data.  Done, AH, (DK), 10/3/01.

f	c. The marine surface decoder DCMSFC was modified to keep Sea Keepers 
	   call signs beginning with 'KS' (instead of 'SK' that originate from 
	   KWUM Univerwsity of Miami).  Done, FY, CM, (DK), 10/3/01.

f	d. Added the decoding of 0600/1800 UTC AVN MOS guidance packages for the
	   same sites and in the same format as the current 0000/1200 UTC packages
	   to decoder DCMOSA.  Done, FY, (DK), 10/12/01.

f	e. Modified the hurricane decoder, DCHCRN, to decode the 12 and 36 hour
	   forecast wind radii.  Also, the max wind speed is checked and the 
	   appropriate two character storm type is placed after the forecast time
	   period's lat/lons.  Modified GG_HRCN to display the correct tropical 
	   storm symbol for the forecast periods instead of using the '+' marker.
	   Changed GG_HRCN to use the ocean id for determining when to plot the 
	   forecast track line and symbols.  Done, AH, (DK), 10/15/01.

f	f. T027B:  Modified decoder dcwtch to handle the WMO header change 
	   scheduled for Nov. 7, 2001.  The decoder will handle both old and new 
	   formats for watch and status message headers.  Done, DK, (SJ), 
	   10/22/01.

f	f-1. Modified decoder dcwtch to check for originator KWNS before
	     decoding WWUS30 watch reports and WOUS20 status reports.  Done,
	     DK, (DK), 10/29/01.

f	g. T044A:  Modified international sigmet decoder DCISIG to handle
	   ICAO-mandated format change for lat/long fields (HlatHlon),
	   scheduled to take effect November 7, 2001.  Wrote new st library 
	   routine ST_WORD to determine if string is a word, lat, long, or
	   other.  Done, DK, (SJ), 10/30/01.

f	h. T012B: Added the decoding of the remaining international sigmet 
	   reports (excluding reports from Alaska) that follow the standard 
	   format in decoder DCISIG.  Added the decoding of phenomena DS, SS, 
	   and CB for these remaining reports.  No attempt has been made yet to 
	   handle the different cancellation reports.  Expanded the search for 
	   phenomena SQ, IC, and TB.  Added the decoding of phenomenon CB to 
	   EGGY, RJAA, NTAA, and MUHA reports.  Added the decoding of phenomenon 
	   CT to CONUS reports.  Modified subroutine ggisig so that GPMAP, NMAP, 
	   and NMAP2 will ignore the new decoded reports and new decoded 
	   phenomena temporarily.  Done, FY, (DK), 11/30/01.

g	h-1. 1) Added OLBA to the list of MWO IDs having no hyphen following the
	     preamble.  Fixed case for missing MWO ID.  2) Expanded the search 
	     for phenomena CB, IC, and TB to accept additional character strings 
	     and increased search length for "other" reports.  3) Fixed starting 
	     index for station search.  4) Eliminated the detection of more false 
	     correction flags in DCISIG.  5) Handled cancellations from PANC 
	     temporarily as an "other" report.  Done, FY, (DK), 12/18/01.

g	h-2. Added the plotting of the remaining ("other") international sigmets
	     that follow the standard format and added the plotting of additional
	     phenomena SQ, CT, IC, GR, DS, SS, and CB in GPMAP, NMAP, NMAP2, and 
	     TESTGG.  Expanded the search forphenomena TB, GR, SQ, and TS to 
	     search for additional character strings TURBULENCE, THUNDERSTORM(S),
             TSTMS, HAIL, and SQUALL(S) in the international sigmet decoder
             DCISIG.  Expanded the missing keyword processing for
             reports from MUHA.  Increased the length of the string to be
             searched for a second phenomenon from NTAA.  Added the keyword
             MOVING for reports from the continental US.  Done, FY, (DK), 1/28/02.

g	h-3. Modified international sigmet decoder DCISIG to process more 
	     cancellations, including cancel WIE for CONUS.  Added code to use 
	     location of originatining station if MWO id not found in station 
	     table.  Done, FY, (DK), 3/4/02.

h	h-4. Enhanced international sigmet decoder DCISIG to better handle
	     EGGY and NTAA reports.  Done, FY, (DK), 6/13/02.

i	h-5. Problem found by the AWC: When international sigmets with the 
	     same message identifier (ALFA, BRAVO, etc.) are issued by two
	     different offices, it is not clear which sigmet came from
	     which office.

	     Modified the international sigmet decoder, DCISIG, to save the
	     originating station identifier to the decoded ASCII file.
	     Modified GGISIG to be able to plot the old ASCII files and the 
	     new ones. Done, AH, (SJ), 9/16/02.

k	h-6. Added eight more stations to the International Sigmet Decoder
	     station table, intlsig.tbl:  RCTP, URWW, ULAA, UUYP, UAFM, ULMM, 
	     UUYY, and YMMC.  FY, (SJ), 3/10/03.

l	h-7. Changed the icing symbol that is plotted for Non-convective and
	     International SIGMETS. NCON was changed from moderate(5) to
	     severe(8). ISIG was changed from moderate/severe(7) to severe(8).
	     SJ, (DK), 4/17/03.

l	h-8. Fixed the incorrect mapping between the menu widget index and the
	     actual turbulance symbols when editting a turbulance text.
	     JW, (SJ), 5/16/03.

l	h-9. Modified the NMAP/NMAP2 product generation to create Intern.
	     Sigmets issued from Guam (PGUM), Hawaii (PHFO), and Alaska (PANC).
	     Areas and isolated points are encoded using lat/lon coordinates only.
	     The WMO and AWIPS headers for Guam and Hawaii assume only one storm
	     in this delivery.  If there are more than one storm, the last digit
	     in the headers can be edited before saving the text product.
	     FY, (SJ), 6/6/03.

l	h-10. Modified the International Sigmet Decoder DCISIG to decode more
	      bulletins and fixed some bugs.  FY, (SJ), 6/10/03.

m	h-11. Enhanced the International SIGMET Decoder DCISIG to decode more
	      bulletins.  Fixed some bugs.  FY, (SJ), 9/15/03.

m	h-12. Added to the international SIGMET decoder, DCISIG, WMO headers for
	      PGUM ( WCPQ3 ) and PHFO ( WCPA3 ).  Also added saving the raw text
	      information for NWX as needed.  Modified pqact.conf. AH, (SJ),
	      9/17/03.

f	i. T063:  Fixed decoder DCMOSA to handle max and min temperatures,
	   12-hour probability of thunderstorms and 12-hour conditional
	   probability of severe weather for the 6 and 18Z new aviation MOS.
	   Done, DK, (SJ), 11/30/01.

f	j. T064:  Fixed decoder DCSCD for a bug which caused an infinite loop
	   on 12/1/01 at 00Z,  due to badly formatted data.  Done, JA, DK, (SJ),
	   12/3/01.

g	k. T087:  Fixed a problem in the AIRMET decoder, dcairm, which was 
	   reported by the AWC.  Code now handles long bounds specification 
	   strings ( > 160 characters) correctly, rather than truncating the 
	   string.  Done, DK, (SJ), 1/24/02.

g	l. T089:  Added new pr library function pr_hcdm to convert WMO code table
	   1677 value to a height in meters.  Replaced existing code in aircraft 
	   decoder dcacft with the new function.  Done, JA, DK, (SJ), 1/28/02.

g	m. T088:  Changed aircraft decoder dcacft to write report to GEMPAK file
	   even if flight level ("elevation") is missing.  Done in response to
	   an AWC query.  Done, DK, (SJ), 1/30/02.

g	n. T103:  Modified marine surface (ship) decoder dcmsfc to decode all
	   reported gusts, and ship speed and direction.  Modified display to
	   show gusts in knots (parameter GUST), ship direction as an arrow
	   (new parameter DASH) and ship speed in knots (new parameter SHPK).
	   Parameters GUM1, P06M, XS10 and ITSO were removed from GEMPAK output
	   file.  Fixed bug in wave height units for Coast Guard data.  Done, 
	   DK, (SJ), 3/8/02.

g	o. T104:  Modified hurricane decoder dchrcn and gg library display
	   routines to show 34, 50 and 64 knot forecast wind radii through 72
	   hours.  Done, DK, (SJ), 3/12/02.

g	p. T109:  Checked the validity of the start and stop date/time strings
           and substituted reasonable values when not valid in the warning
           decoder DCWARN.  Modified the procedure to obtain the starting
           position of the stop date/time string.  Fixed bug for obtaining
           the month and year from just the start day.  Added printing of log
           messages for errors and renumbered error numbers.  Since the severe 
	   local storm decoder DCSVRL was based on DCWARN, similar modifications 
	   were made to it.  Done, FY, (DK), 3/18/02.

h	q. T116:  Modified decoder dcwtch to distinguish between the station name
	   'AND' and the use of the keyword 'AND' to specify 2 status lines in
	   a single report.  Done, DK, (SJ), 4/5/02.

h	q-1. Modified decoder dcwtch to handle case of 'AND AND' (station 'AND'
	     followed by the use of the keyword 'AND' to specify 2 status lines
	     in a single report).  Done, DK, (SJ), 5/6/02.
	     
m	q-2. In the watch decoder, DCWTCH, increased 'string' variable size from
	     120 to 500 characters.  AH, (DK), 7/18/03.
	     
h	r. T121:  Modified DCMETR so that special METAR obs are displayed in the
	   correct oder in NWX and SFLIST.  Done, FY, (DK), 4/10/02.

h	s. T139:  Fixed a problem in the AIRMET decoder, dcairm, which was 
	   reported by the AWC, by improving a key word search.  Also fixed 
	   display bug which occasionally precluded display of amendments, 
	   corrections and cancellations to AIRMETs.  Done, DK, (SJ), 5/31/02.

i	t. T147:  Modified surface synoptic decoder dclsfc to fix a bug which
	   could very occasionally result in assigning incorrect units for
	   wind speed or skipping a report altogether.  Done, DK, BH, (SJ),
	   7/23/02.

i	u. T157:  Modified metar decoder dcmetr to fix a bug which prevented
	   wind gusts reported in kilometers per hour from being decoded.
	   Done, DK, (SJ), 7/23/02.

i	v. T174:  Added the N-AWIPS version to the log file for every 
	   decoder.  Done, RT, (SJ), 8/6/02.

i	w. T148: Created a new subroutine, brbnds.f, to decode the bound areas for
	   the Airmet and Non-convective sigmets. Modified ambnds.f and ncbnds.f 
	   to use the new bounds subroutine.  Created a new error file for the 
	   'br' bridge directory.  Done, AH, (DK), 8/07/02.

i	w-1. Created a new decoder, DCCSIG, and bridge functions which decode
	     convective sigmets and convective outlook reports and store the
	     information in an ASCII file.  Created a new gg subroutine, GG_CSIG,
	     to plot the current convective sigmets and convective outlooks for 
	     the lower 48 states and the adjacent coastal waters.  Done, AH, 
	     (SJ), 8/23/02.

i	w-2. Fixed decoding of exact station locations for isolated areas.
	     Added check for region id.  Shortened search string for finding the 
	     flight level and the end of the bounds for convective outlooks.  
	     Done, AH, (SJ), 8/27/02.

j	w-3. Fixed a typo for the string length to be used as a default.  Done,
	     AH, (SJ), 10/18/02.

i	x. T150: Develop a new winter storm decoder, DCWSTM, to decode the winter
	   storm warning, watch, and advisory text messages, and store the
	   information in an ASCII file.  Done, ML, (DK), 8/19/02.

i	x-1. Rewrite the county string decoding subroutine wn_cnty as BR_CNTY,
	     which will improve the logic of creating the county ID array and
	     error found in the county string line will be handled efficiently.
	     Done, ML, (AH), 8/27/02.

i	x-2. Display the winter storm warning, watch, and advisory zones in GPMAP
	     and NMAP2 as a miscellaneous data type. The display consists of a
	     color-coded marker located at the zone centroid, with optional time
	     and weather type labels.  Done, ML, (DK), 9/10/02.

i	x-3. Fixed bug in winter storm message decoder DCWSTM which had caused 
	     an infinite loop.  Done, DK, (AH), 9/30/02.

j	x-4. Improved search for zone designation string in winter storm decoder
	     DCWSTM.  (Among other problems, zone strings were not being found if
	     they were preceded by a hyphenated word.)  Done, DK, (SJ), 10/10/02.

j	x-5. Modified the winter storm message decoder DCWSTM to identify more
	     designations of winter weather messages, to get the weather type,
	     and to handle expiration information and upgraded message types.
	     Output the test indicator and define the file source.  Done, ML,
	     (DK), 10/22/02.

j	x-6. Modified winter storm decoder DCWSTM to recognize more cancellation
	     phrases and add error check for start time. Done, DK, (SJ), 10/28/02.

j	x-7. Modified winter storm display to handle cancellations on a
	     zone-by zone basis, instead of a message basis.  Added day
	     to time label.  Done, DK, (SJ), 11/1/02.

j	x-8. Fixed test report#599:P1, where the winter storm message decoder 
	     DCWSTM can now handle a local date/time string that includes a 
	     secondary local time, i.e., 330 PM CDT (230 PM MDT) MON OCT 21 2002.
	     Done, ML, (DK), 11/4/02.

j	x-9. Fixed bug in zone-based cancellation of winter storms which was
	     caused by failure to consider that some end times might have 
	     already been changed by prior cancellations.  Done, DK, (SJ), 
	     11/5/02.

j	x-10. Modified winter storm decoder DCWSTM to recognize plurals, 
	      downgraded storms, and more cancellation phrases, and to decode
	      a time string embedded in the headline.  Added checks for invalid
	      substring references in br_cnty.  DK, (AH), 11/22/02.

j	x-11. Added WSTM data type identifier to the marker symbol type pop-up
	      menu section of the code.  MG, (TP), 11/22/02.

j	x-12. Fixed marker selection pop-up problem, where the marker symbol 
	      number appeared instead of the marker symbol.  TP, (SJ), 11/27/02.

j	x-13. Modified winter storm decoder DCWSTM to only decode a time string
	      embedded in the headline if it is a cancellation.  Bug fix for 
	      local start time when day is 20; accept 'LIFTED' for a cancellation.
	      DK, (AH), 11/29/02.

k	x-14. Modified the winter storm message decoder DCWSTM to handle the
	      double headlines in the winter storm messages.  Also fixed a bug
	      caused by a blank in the zone string.  ML, (DK), 2/6/03.

i	y. T152: Wrote a new decoder, DCRDF, which decodes the Regional Digital
	   Forecast reports.  This release decodes the following parameters:
	   POP 12hr, TEMP, DEWPT, RH, WIND SPD, WIND CHILL, HEAT INDEX, WIND
	   DIR, OBVIS and CLOUDS.  Parameters having range values such as
	   QPF 12HR, MAX QPF, SNOW 12HR, and MX/MN will be decoded in a future
	   release.  Also the precip paramters RAIN SHW, RAI, TSTMS, DRIZZLE
	   SNOW SHWRS, SNOW FLURIES, SLEET, FRZNG RAIN, and FRZNG DRZL are
	   not currently decoded.  Reports from Amarillo, TX are changing
	   their format and therefore not being handled int this delivery.
	   Done, FY, (DK), 9/18/02.

i	y-1. Added plotting of the RDF decoded files in NMAP2 and SFMAP.
	     Done, FY, (DK), 9/19/02.

j	y-2. Added the decoding and plotting of additional parameters to the 
	     Regional Digital Forecast (RDF) decoder, DCRDF.  The parameters 
	     having range values such as QPF, 12HR, MAX QPF, SNOW 12HR, and MX/MN
	     were added.  Also the precipitation parameters SPRINKLES, RAIN SHW,
	     RAIN, TSTMS, DRIZZLE, SNOW SHWRS, SNOW, FLURRIES, SLEET, FRZNG RAIN,
	     and FRZNG DRZL were added.  Allowed for two time lines with different
	     time zones.  Added a forecast hour (a 6-hour synoptic time) to handle
	     the possible overflow of 12 hourly parameters in the first segment.
	     FY, (SJ), 11/25/02.

j	y-3. Increased the maximum bulletin size, DCMXBF, from 16kb to 100kb
	     for the decoder bridge library.  SJ, (SS), 12/3/02.

i	z. T117: Created a new decoder, DCTAF, that decodes TAF (terminal
	   aerodrome forecast) reports and writes the output to a GEMPAK
	   surface file. 
	
	   Important Please Note:  Moved several routines used by DCTAF, DCMETR 
	   and DCSCD decoders to the new bridge library br.  Modified DCMETR 
	   and DCSCD decoders to call new br routines.  Several mt routines
	   have been removed.  See the remove.log for a listing.
	
	   Corrected bug which was causing DCMETR to create GEMPAK file 
	   named yyyymmdd.hrly (reported by S. Chiswell, Unidata).  Corrected 
	   initialization bug in DC_GTIM and corrected prologue of ST_CLSL.
	   Done, DK, (SJ), 9/18/02.

i	z-1. Added display of TAF forecast graphics to NMAP2 as a SURF_FCST type.
	     Modified SFMAP and SFGRAM to allow display of new TAF symbol 
	     parameters BRGK, TSKC, and TWSY.  Updated help and text files.  
	     Done, DK, (SJ), 9/19/02.

i	z-2. Increased the value of GEMPARM_MAX so that all of the parameters
	     can be displayed on the station model edit window of NMAP(2).
	     Done, SJ, (DK), 9/20/02.

i	z-3. Added display of individual TAF reports to NWX as an "observed"
	     data type.  Done, DK, (SJ), 9/23/02.

i	z-4. Modified TAF decoder DCTAF to include line feeds in the output 
	     report string, for clarity when the report is displayed in
	     SFLIST and NWX.  Done, DK, (SJ), 9/23/02.

j	z-5. Fixed 'line-feed' character as a 'space' character problem with
	     Linux.  Done, MG, (SJ), 10/18/02.

j	z-6. Modified TAF decoder DCTAF to improve error checking and report
	     time checking, fix bugs in pointers, and prioritize use of
	     change indicators 'TEMPO' and 'PROB'.  Done, DK, (SJ), 10/24/02.

j	z-7. Created a new TAFs station table, tafstn.tbl, which will be used
	     by both the TAF decoder, DCTAF, and NWX.  AH, (SJ), 12/6/02.

k	z-8. Modified TAF decoder DCTAF to output a brief text string at each
	     time, giving the date/time of the original TAF report.  DK, (SJ),
	     1/28/03.

k	z-9. Displayed the original (raw) report of TAFs data which fall within
	     the time covered.  If no data falls within the time covered, the 
	     most recent TAFs data will be displayed.  Prepended time and station
	     ID to the text output of TAFs for SFLIST.  TL, (SJ), 2/13/03.

l	z-10. In NWX, disabled the "time covered" selection panel for TAFs, and
	      ensured that only the most recent single TAF for the selected 
	      station (or state) is displayed.  DK, (SJ), 4/11/03.

l	z-11. Modified decoder DCTAF and display of TAF forecast data in response
	      to AWC requirements.  Modified SFMAP and SFGRAM to allow display of
	      new TAF symbol parameters TPWS, AWSY, VWSY and WSKC.  Added
	      mountain obscuration threshold values to TAF station table, plus 40
	      new stations.  Updated help and text files.  DK, (SJ), 5/28/03.

l	z-12. Allowed 'WSCONDS' to indicate low-level wind shear in TAF decoder
	      DCTAF.  Added new reporting station KFOD to TAF station table.
	      DK, (SJ), 6/10/03.

m	z-13. Fixed a problem so that NWX is able to display TAFs data between
	      23 and 00Z as soon as the data is received.  TL, (SJ), 8/13/03.

m	z-14. Added new TAF parameters TCMS, TMOB, WCMS and WMOB and new 
	      function to calculate temporary/probability and "worst case" 
	      ceilings and mountain obscuration thresholds.  DK, (SJ), 9/2/03.

j	aa. Fixed bugs in decoding climatology values contained in new MRF MOS
	    reports.  Allowed WND or WSP as name for wind speed given in a MOS 
	    report.  Done, DK, (SJ), 10/8/02.

j	bb. T195:  Created a new decoder, DCWOU, and bridge functions which 
	    decode watch outlook reports and stores the information in an
	    ASCII file.  Done, AH, (SJ), 10/17/02.

j	bb-1. Created a new decoder, DCWCN, and bridge functions which decode
	      watch county notification reports and stores the information in
	      an ASCII file.  Done, AH, (SJ), 10/29/02.

j	bb-2. Created new program, rebun, to create a six-sided bounding box 
	      for the WBC.  Done, DP, (SJ), 10/31/02.

j	bb-3. Fixed test report #596:P1, now use proper polygon when reducing 
	      via angles.  Done, DP, (SJ), 11/4/02.

j	bb-4. Changed working projection.  Done, DP, (SJ), 11/5/02.

j	bb-5. Created a new CLO function, CLO_BGRANGE, which returns Earth 
	      coordinate range of most recently retrieved bounds area.  DP, 
	      (SJ), 11/12/02.

j	bb-6. Fixed test report #596, seg. fault.  Fixed test report #597, 
	      erroneous results when "super centroid" is not physically located
	      inside a county whose FIPS code is listed as input.  Increased
	      execution speed.

j	bb-7. Fixed test report 603 bug.  DP, (SJ), 11/20/02.

k	bb-8. Ran DCWOU and DCWCN on test WOU and WCN data sets. Fixed 
	      decoding errors found.  Added check in the VTEC line for the
	      character 'T' in brvtec.f.  AH, (SJ), 1/27/03.

k	bb-9. Added the bulletin issue time to the output ASCII file and removed
	      spaces and return characters from the county string before
	      processing it in the  WCN decoder, DCWCN.  AH, (SJ), 2/5/03.

k	bb-10. Added the bulletin issue time to the output ASCII file.  Added
	       logic to encode the correction/test flag when writing out to the
	       ASCII file.  For the WOU decoder.  AH, (SJ), 2/6/03.

k	bb-11. Modified the WCN decoder, DCWCN, so that it can decode multiple
	       VTEC lines for a single set of counties.  AH, (SJ), 2/11/03.

k	bb-12. Made corrections to the WOU decoder, DCWOU, and the WCN decoder,
	       DCWCN, based on recent test product sent out by the SPC and
	       participating WFOs. Updated help files.  AH, (SJ), 2/21/03.

k	bb-13. Added the time zone string the WOU decoder, DCWOU.  Check for 
	       'MIDNIGHT' and 'NOON' in the local time string.  Updated the 
	       DCWOU help file.  AH, (SJ), 2/27/03.

k	bb-14. Corrected problems from report 636:P1, P2, P3 and S1. Fixed
	       'TEST' check, county string error log message being printed out
	       and help file information.  Added a check to verify that the start
	       time is before the end time.  AH, (SJ), 3/4/03.

k	bb-15. Created a new stand alone program WOUPDT. This program reads the
	       most recent Watch Outline Updates (WOU) and Watch County
	       Notifications (WCN) and creates new updated WOU text files.
	       AH, (SJ), 3/10/03.

k	bb-16. Added the string '...TEST' to the watch number header line in the
	       creation of WOUs in NMAP/NMAP2.  AH, (SJ), 3/10/03.

k	bb-17. Display the active counties from the decoded watch outline update
	       (WOU) and watch county notification (WCN) bulletins in GPMAP and 
	       NMAP2.  The active county bounds for each active watch number will
	       be outlined or have a marker placed at the county's centroid.  
	       ML, (AH), 3/10/03.

k	bb-18. Added a check for an end time time extension for a watch.
	       Also, modified an error code.  AH, (SJ), 3/17/03.

k	bb-19. Modified GG_WWCN and GG_WACT to compare the date/time to the
	       issue, start and stop times for determining which reports within
	       a file are to be kept.  Added end of watch text if after a watch's
	       end time.  AH, (SJ), 3/18/03.

k	bb-20. Set colors for WOU and WCN watches.  The colors are associated 
	       with the last digit of the watch number or weather type based of 
	       the values of color code flag, and are editable in NMAP2.  The 
	       colors are table driven which can be changed in the miscset.tbl.  
	       This release also add a capability for WOU and WCN to select the 
	       marker type, marker size and width in NMAP2.  If these are not 
	       specified, use the default values.  ML, (SJ), 3/18/03.

k	bb-21. Modified GG_WWCR to return the most current watch numbers when
	       comparing the issue, start and end times to the user time.
	       Reworked the display algorithm for GG_WWOU.  Changed the local 
	       time in GG_WWTP to use the user time, converted to local, instead 
	       of the watch start time.  AH, (SJ), 3/20/03.

k	bb-22. Added ARINFO and WOUPDT to the utility program link script.
	       SJ, (SS), 3/20/03.

k	bb-23. Removed check for ITEST. This check used to force Test products
	       to always plot as a marker. Since all of the WOU and WCN
	       products are Tests until 10/2003, removing the restriction
	       will allow the user to choose to plot the county outlines.
	       SJ, (SS), 3/21/03.

k	bb-24. Fixed help for WOU and WCN parameters.  SJ, (SS), 3/21/03.

k	bb-25. Added checks on the total number of counties to the WOU, WCL,
	       and SEV creation routines. This change fixes a problem when
	       creating these products where the last few counties are
	       duplicated after the Add/Delete feature was used.  SJ, (DK), 
	       3/21/03.

k	bb-26. Added time string methodology to woupdt.hlp and dcwcn.hlp.  
	       Added filename minutes information to woupdt.hlp.  AH, (SJ), 
	       3/24/03.

k	bb-27. Fixed the fix to the last bug with the WOU creation in NMAP2 
	       product generation.  This change fixes duplicate counties in the 
	       UGC line.  SJ, (SS), 3/24/03.

k	bb-28. Changed the word "REMAINS" to the word "IS" in the initial WOU
	       creation routine, vfwoui.c.  SJ, (SS), 3/24/03.

l	bb-29. Set colors for the watches. The colors are associated with the
	       last digit of the watch number or weather type according to the
	       value of color code flag, and are editable in NMAP2. The colors
	       are table driven which can be changed in the miscset.tbl.
	       ML, (SJ), 4/2/03.

l	bb-30. Changed WMO id of the WCL product from NWUS62 to NWUS64.  SJ, 
	       (SS), 4/2/03.

l	bb-31. Fixed the bug for WOU, WCN and WATCH of not displaying the colors,
	       and the symbol correctly for watch xxx0 data in NMAP2.  ML,
	       (SJ), 4/9/03.

l	bb-32. Fixed problems for SAW and SEL output when there are replace
	       and continue watches.  RT, (SJ), 4/15/03.

l	bb-33. Corrected the comparison of the current watch number to the the
	       decoded WCN watch number for the display and the stand alone
	       routine WOUPDT.  AH, (SJ), 4/16/03.

l	bb-34. Fixed the computation of the last digit for color-coding the
	       WOU and WCN reports if the watch has less than 4 digits fot its
	       number.  SJ, (SS), 4/16/03.

l	bb-35. Added a check for decoding the watch number in DCWOU. If the number
	       is < 4 chars. long, the string will be padded out with leading '0'.
	       AH, (SJ), 4/16/03.

l	bb-36. Increased the number of hours to search in the WOU directory for
	       files from 4 hours to 1 day to match the search in GG_WWCR.
	       Fixed a bug in which the returned county array would have blank
	       values in the array before legitimate county strings.  AH, (SJ),
	       4/22/03.

l	bb-37. The watch outline update header line was hard coded to 'WS' for
	       both severe thunderstorms and tornados.  Fixed it so it reads for
	       severe thunderstorm: 'WS' and for tornados: 'WT'.  AH, (SJ),
	       4/24/03.

l	bb-38. Corrected a general time of day case. Fixed VFGTOD to handle
	       the case of 'SATURDAY NIGHT AND SUNDAY MORNING'.  Added vfgtod.c 
	       to testvf.c.  Per SPC, added the 'CAN AND OCCASIONALLY...' 
	       sentence to vfwsel.c and added the '.' for county names in the 
	       SEV product.  Eg. ST CLARA -> ST. CLARA.  AH, (SJ), 5/6/03.

l	bb-39. Made the WOU inital, VFWOUI, and WOUPDT WOU have the same spacing
	       for the 'COUNTIES INCLUDED...' line, spaces between the county name
	       columns and for the UGC line.  For WOUPDT, fixed the case when the
	       last state listed has only 1 county active the county name was 
	       appended to the previous county list and the last state was not 
	       printed in the text file.  AH, (SJ), 5/16/03.

l	bb-40. Cleaned up the table subroutine TBIDST.  AH, (SJ), 5/16/03.

l	bb-41. The SPC has changed the Watch Conference Calls to be 4 minutes
	       from the present time. Also, changed password text information.
	       GG, AH, (SJ), 5/27/03.

l	bb-42. Added 'BULLETIN - IMMEDIATE BROADCAST REQUESTED' to the WOU
	       initial text product. Adjusted the WOU decoder, DCWOU, to skip
	       over this line when looking for the local time string.  AH, (SJ),
	       5/29/03.

l	bb-43. Changed the display time for watches to begin when the watch
	       begins, instead of being displayed an hour before the start time.
	       This change was requested by the SPC.  AH, (SJ), 5/30/03.

l	bb-44. Added hail sizes '1.5' and '2.5' on the watch format gui.  Changed
	       the VF routines to accept real numbers for hail size.  Change made
	       at the request of the SPC.  AH, (SJ), 6/5/03.

l	bb-45. Add a new column to the WCCphone.tbl to specify the pass code.  
	       When the user selects the phone number in the "Watch Coordination"
	       GUI, the corresponding passcode is read from the table and 
	       inserted into the WCC text message.  The passcode does not need to
	       appear in the GUI.  HZ, (SJ), 6/6/03.

l	bb-46. When loading WOUs in NMAP2, on Linux, no WOUs would be displayed
	       and IRIX6, NMAP2 would crash.  WOUPDT would not create an updated
	       WOU.  This bug was found while trying to load WOUs for 030610.
	       Corrected a bug when the local time converted to GMT was after
	       '0000Z', the abbreviated day of the week was the next day.  AH,
	       (SJ), 6/10/03.

m	bb-47. Changed the expiration time of the watch status messages from the
	       top of the hour (H+00) to H+40.  Changed the 'Final' status message
	       to expire when the watch expires.  GG, AH, (SJ), 6/24/03.

m	bb-48. Added a "County Lock" button to the "Watch Specifications and 
	       County List" GUI.  HZ, (SJ), 6/24/03.

m	bb-49. Added the return of the time zone string to CSS_DATE for the 
	       current GMT and local time.

m	bb-50. Modified the Watch Coordination window to include a list of 
	       replacement watch numbers; Added the list and the WFOs from the 
	       replaced watches to the WCC Save window and the output product.  
	       ML, (SJ), 7/3/03.

m	bb-51. Add a warning pop-up for the same watch number in the replacement
	       and continuing lists in the 'Format Watch' windows. Also, Widen 
	       both the 'Continuing Watches' and 'Replaced Watches' text boxes.
	       ML, (SJ), 7/11/03.

m	bb-52. Reset "County Lock" button to "Off" each time the "Watch 
	       Specifications and County List" window pops up.  HZ, (SJ), 
	       7/11/03.

m	bb-53. Fixed problem #674:p1, p2 -- wfo ids splitting if there are more 
	       than 11 replacement WFO ids.  And the duplicate wfo ids problems 
	       in WCC message.  ML, (SJ), 7/24/03.

m	bb-54. Added the ability to decode WOU cancellation messages to the WOU
	       decoder, DCWOU.  Added an 'extending time' parameter to gg_wwcr. 
	       This allows a WOU to be considered 'active' for a period of 
	       minutes after the watch expires.  For displaying WOU and WCN 
	       purposes, this parameter has been hard coded to '0'.  AH, (SJ), 
	       7/25/03.

m	bb-55. Modified the format of wfo list in the WCC text.  Modifed table 
	       miscset.tbl.  ML, (AH), 7/31/03.

m	bb-56. Created a new library, TEXTLIB.  Created a new CTB function,
	       ctb_rdwou, which reads woudef.tbl.  Created a new FL subroutine,
	       fl_fpth. This subroutine finds a given file in a list of
	       directories.  Created a new CST function, cst_ncat. This
	       function concatenates two strings together.  AH, (SJ), 8/12/03.

m	bb-57. Created a new TI subroutine which creates a local time string
	       (Eg. 1000 AM EDT THU AUG 7 2003). For 12 AM and 12 PM, MIDNIGHT
	       and NOON are used instead.  AH, (SJ), 8/14/03.

m	bb-58. Added flag options '-c' and '-n' to WOUPDT. The '-c' flag checks
	       if it necessary to create a cancel WOUPDT, SEL and SAW text
	       messages. The '-n' flag checks if there have been any changes
	       to the WCN counties since the last WOU message was issued. If there
	       were changes then a new message is created, otherwise, one is not
	       created.  Fixed length problem in utlgmon.c and utlgdwk.c.
	       AH, (SJ), 8/15/03.

m	bb-59. Fixed problem report #685:P1.  Added checks for proper input for
	       latitudes and longitudes for utl_avcd.  Fixed line lengths for the
	       UGC string in utl_ugcp. Set the length limit per line at 66 
	       characters.  AH, (SJ), 8/25/03.

m	bb-60. Fixed report #686:P1 and 2. Improved error handling for checking
	       ctb_rdwou return value and added flag information to woupdt.hlp.
	       AH, (SJ), 8/29/03.

m	bb-61. Modified the WOU decoder, DCWOU, by adding a second check for the
	       local time string if the backup site has issued the WOU.  Reworked
	       the search method for finding the local time string.  AH, (SJ),
	       8/29/03.

m	bb-62. Modified TI_ELCL to be able to use a user specified time zone
	       instead of the system time zone.  AH, (SJ), 9/8/03.

m	bb-63. Added 'proto_vf.h' to ggwcvf.c.  AH, (SJ), 9/8/03.

k	cc. T228:  Increased the number of reports allowed for ship type files 
	    from 3399 to MMHDRS - 1 (currently 4999) in decoders DCACFT 
	    (aircraft) and DCMSFC (marine).  DK, (SJ), 1/2/03.

l	cc-1. Fixed bug in aircraft decoder DCACFT which caused crash when 
	      report with undecodable time field was the first report
	      processed following decoder start-up.  DK, (SJ), 4/7/03.

l	cc-2. Bug fixes to aircraft decoder DCACFT for decoding reconnaissance
	      temperatures less than 50 degrees C and for skipping leading blanks 
	      in a report.  (Both fixes per DMQA branch.)  JA, (DK, (SJ), 4/7/03.

l	cc-3. Modified aircraft decoder DCACFT to identify bulletin 'UAAK04' as
	      type pirep rather than airep.  (Problem reported by AWC 4/8/03.)
	      DK, (SJ), 4/10/03.

l	cc-4. Modified aircraft decoder DCACFT to interpret 'OCNL' in the
	      context of turbulence as denoting a range (e.g., MOD OCNL SVR
	      is now decoded as moderate to severe turbulence).  Done at
	      request of AWC.  DK, (SJ), 4/28/03.

m	cc-5. Fixed the aircraft decoder, DCACFT, to properly decode a range
	      of turbulence intensity values indicated in a PIREP report by,
	      e.g. "LGT-OCNL MOD" or "MOD-OCNL SVR".  The intensity values
	      for the parameter TURB should be 5 for 'MOD-OCNL SEV' and 3
	      for  'LGT-OCNL MOD'.  AH, (DK), 8/21/03.

l	dd. T263:  Modified non-convective sigmet decoder DCNCON to fix a bug
	    reported by AWC - failure to decode a valid phenomenon.  DK, (SJ),
	    4/17/03.


002.	GRIB Decoder

j	a. T155: Added new GB function to read in an entire grib message with 
	   one read.  Added support for GRIB2 to gbscan.  These additions and 
	   modifications are in suport of the new NDFD GRIB2 decoder.  Done, 
	   TP, (SJ), 10/21/02.

j	a-1. Added library files for mld grid2 decoder.  Changed f90 features 
	     into f77-acceptable statements, for complete list of changes see 
	     CHANGES.readme.  Done, MG, (SJ), 10/21/02.

j	a-2. Introduced new parameter LXSIZE for the size of the arrays JMIN,
	     LBIT, and NOV.  Set the parameter LXSIZE to 50000.  Introduced
	     new error code of 706 if the IS5(32) .GT. LXSIZE.  Done, MG, (TP),
	     10/22/02.

j	a-3. Created an NDFD GRIB2 decoder, ndfdg2.  Done, TP, (SJ), 10/24/02.

j	a-4. Added total snow parameter to ndfdg2.  TP, (SJ), 12/12/02.

k	a-5. Fixed ndfdg2 to properly handle missing data when decoding the 
	     entire grid.  TP, (SJ), 2/13/03.

m	a-6. Added CPC parameters to Grib 2 parameter table.  Updated gd2ndfd
	     and ndfdg2 to support new CPC parameters.  TP, (SJ), 8/29/03.


003.	BUFR

f	a. T002:  Added a new library for the decoding and encoding of BUFR
	   messages. The libarary is from the Master Environment Library
	   from the Naval Research Laboratory, Monterey, CA.  Done, SJ, (DK),
	   11/8/01.
	   
f	a-1. Changed the compile and link of the MEL BUFR library and utility
	     programs from make files to GEMPAK-style scripts.  Fixed some
	     small problems in the MEL BUFR source and header files.  Added an
	     environment variable, BUFRFLAGS, to the .cshrc and .profile files.
	     Done, SJ, (TP), 11/26/01.

g	a-2. Created a new program, SIGWXCNV, which decodes a High Level 
	     Significant Weather VG file into a formatted ASCII file.  It
	     decodes the group types, cloud, turbulence, jets, tropopause and
	     tropical, radiation and volcano symbols.  Done, AH, (SJ), 1/24/02.

g	a-3. Fixed a seg. fault on most platforms when a single symbol was in
	     a VG file.  Done, AH, (SJ), 1/28/02.

g	a-4. Created a new program, SIGBUFR, which decodes a series of High Level
	     Significant Weather BUFR files into a single ASCII format file.  It
	     decodes clouds, turbulence (CAT), jets, tropopauses, fronts and
	     tropical storm, radiation and volcano data.  Done, DK, (SJ), 1/28/02.

g	a-5. Fixed a segmentation fault for radiation symbols. If there were more
	     than 1 radiation symbols in a file, the counter was set incorrectly.
	     Initialized variable gpnum in cvgrdgtn.c to fix an uninitialized 
	     memory read.  Done, AH, (SJ), 1/31/02.

g	a-6. Fixed segmentation faults in SIG*.c which occurred if a VG file
	     contained a single grouped element.  Cleaned up a default case
	     statement in cvgsubtyp.c and changed an error return variable in 
	     cvgrdgtn.c.  Done, AH, (SJ), 2/7/02.

g	a-7. Created new CAS read functions.  These functions read a High Level
	      Significant Weather ASCII file and stores the information into the 
	      CAS structure.  Modified cas_open to used a read or write flag and 
	      changed sigwxcnv and sigbufr accordingly.  Corrected the character 
	      length for errgrp in sigbufr.  Done, AH, (SJ), 2/15/02.

g	a-8. Initialized unlabeled cloud groups' base, top distribution, and
	     type to missing.  Ungrouped flight levels are also set to missing.
	     If an incorrect forecast hour is given a new error message is
	     written out.  Added the chart level 'HIGH' to the command line.
	     Added better documentation to sigwxcnv.hlp file to explain how to
	     create and group the elements in the VG file.  Done, AH, (SJ),
	     2/25/02.

g	a-9. Fixed a bug with initializing reallocated memory in BS_Increase.c.
	     Corrected the argv array when the '-d' and/or '-t' options are used.
	     Done, AH, (SJ), 3/6/02.

g	a-10. Added checks for ungrouped or invalid text for front speed and
	      direction and cloud bases and tops.  If the values are not found,
	      they are set to missing.  If an input VG file is not found, an 
	      error message is given instead of creating an empty output file.  
	      Done, AH, (SJ), 3/12/02.

g	a-11. Created a new encoding program, SIGBENC.  This program encodes a 
	      single ASCII format file into a series of High Level Significant 
	      Weather BUFR format files.  It encodes clouds, turbulence (CAT), 
	      jets, tropopauses, and fronts.  Done, AH, (SJ), 3/18/02.

g	a-12. Fixed report #550:P1.  The cloud type and distribution numbers
	      were being set to missing instead of the values being filled in.
	      Added cas_clos to close each of the newly created output files.
	      Modified util_compile so that the programs SIGBUFR, SICWXCNV, and 
	      SIGBENC have their own GEMOLB file.  Done, AH, (SJ), 3/21/02.

g	a-13. Created a new subroutine for SIGBENC to encode tropical storm,
	      volcano and radiation information in a formatted ascii file
	      into BUFR message format.  Necessary changes to B_Put_MixArray.c
	      were made for the code to work.  Done, AH, (SJ), 3/22/02.

g	a-14. Removed the '.mine' filename extension.  Done, AH, (SJ), 3/22/02.

h	a-15. Created a new program, SIGAVGF, which encodes a formatted ASCII
	      file into a High Level Significant Weather in VG file format.
	      It encodes the group types, cloud, turbulence, jets, tropopause,
	      and tropical, radiation, and volcano symbols.
	      Made modifications to the sigwxcnv subroutines when errors were
	      found comparing the new SIG HIGH LEVEL VG files to the original
	      SIG HIGH LEVEL VG files.  Done, AH, (SJ), 5/1/02.

h	a-16. Rounded height levels to nearest 10s of 100's of feet.  Added check
	      for an ITCZ line (special line 23) to be grouped with the fronts.  
	      Flipped tropopause high and low boxes.  Check direction in which 
	      clouds are drawn.  Flip lats/lons if necessary.  Done, AH, (SJ), 
	      5/10/02.

h	a-17. Corrected the SIGWXCNV help file and error information.  Changed 
	      the error statements in sigwxcnv.err.  Updated the several error 
	      checks in sigwxcnv.c.  Done, AH, (SJ), 6/13/02.

i	a-18. Wrote a new subroutine, siggrpchk.c, which checks for specific
	      elements in a grouped set of to verify that all necessary
	      elements for the group exist.  They the elements exist, then
	      the group will be processed.  Otherwise a positive warning
	      message is given.  Done, AH, (SJ), 7/10/02.

i	a-19. Added a paragraph describing how the date/time and forecast hour
	      are used to create the alias SIGBUFff and its associated file
	      templates in sigbufr.hlp.  Added descriptions, to sigbenc.hlp and 
	      sigavgf.hlp, where input and output files are created and read.  
	      Done, AH, (SJ), 7/25/02.

i	a-20. Fixed problem report 574:P1, seg. fault/bus errors in sigjets.c and
	      sigvolcano.c.  Fixed memory errors in sigstorm.c, sigvolcano.c and 
	      cvgrdhdr.c.  Fixed group checking errors in siggrpchk.c, sigfront.c
	      and sigjets.c.  Added lat./lon. to volcano text box when creating 
	      the VG file from ASCII.  Modified error statement in sigwxcnv.err.
	      Done, AH, (SJ), 7/26/02.

i	a-21. Fixed errors found when the VG files 2002072518_24_final.vgf and
	      2002072600_24_final.vgf were used.  If more than 1 symbol for
	      tropical storms or volcanoes are grouped together, the group is
	      omitted.  Added a check for numerical values in tropopause type 
	      boxes.  Added a better check for command line arguments.  Done, 
	      AH, (SJ), 7/30/02.

i	a-22. In SIGWXCNV: Added check for cloud text array, set bases to missing
	      if equal to 0.0 for clouds and turbulence, added an error check
	      to clouds, jets, fronts and turbulence for a wrongly grouped line
	      type.  In SIGBENC: Increased the storm name string allocation
	      from 8 characters to 9.  Done, AH, (SJ), 9/9/02.

j	a-23. Commented out the BUFR warning message in SIGBUFR which displayed a
	      message that it could not find local tables.  AH, (DK), 11/21/02.

j	a-24. Added a check to sigajet.c to see if the wind speed (kts) difference
	      from the current wind to the previous wind is equal to 20 kts. If
	      it is and if the flight level is missing, a hash mark is plotted.
	      If the difference is not equal to 20 kts, a wind barb without a
	      flight level is be plotted.  AH, (SJ), 11/25/02.

j	a-25. Fixed the check for determining volcanos and radiation events.  If
	      there was an '_' in the middle of a volcano name, it was taken to
	      be a radiation event.  AH, (SJ), 12/10/02.

k	a-26. Redesigned the method used for dropping wind barbs and hash marks
	      onto the jet line in sigjets.c.  This redesign allows for a smoother
	      jet line over the 0 and 180 degree longitude lines.  AH, (SJ),
	      1/13/03.

k	a-27. Fixed problem report #622:P1.  AH, (SJ), 1/28/03.

l	a-28. Fixed original two bugs in SIGBUFR.  Changed the front direction 
	      variable to an 'int' value.  If there were empty BUFR messages of 
	      group types which would be converted prior to an existing group 
	      type being converted, multiple header lines were printed in the 
	      ASCII BUFR message.  AH, (SJ), 4/7/03.

l	a-29. Fixed bugs found in general testing.  Allow > 250 tropopause boxes 
	      for each box type when encoding (SIGBENC). Increased the number of 
	      elements for offset from 300 -> 5000 (cascmn.h)  Fixed inverted 
	      cloud lines over 0 degrees longitude (SIGAVGF).  Fixed a 
	      segmentation fault when there are missing tropopause box types 
	      (SIGWXCNV).  AH, (SJ), 4/9/03.

l	a-30. Re-designed the algorithm to decode JETs from a VG file, especially
	      the algorithm for inserting wind barb and hash mark points into a 
	      jet line.  Re-designed the wind direction calculation algorithm, and
	      fixed the problem of wrong wind direction in SIGAVGF.  RT, (DP),
	      5/27/03.

l	a-31. Took wind barbs and hash marks points out of jet points, to make
	      the jet line more smooth.  RT, (SJ), 6/6/03.

l	a-32. Fixed bug 667.  RT, (SJ), 6/10/03.

m	a-33. Fixed compiler problem on SGI82.  TP, (SJ), 8/11/03.

m	a-34. Added JET structure for future development.  JW, (DP), 9/2/03.

m	a-35. Implemented a new VG element "JET".  JW, (DP), 9/12/03.

m	a-36. Bug fix for closed line specification.  DP, (SJ), 9/16/03.


004.	GEMLIB Changes

f	a. T032:  Eliminated the possible duplicate points in line modification.
	   It happens when modifying a closed line and the first click point or
	   the last click point or both are within the "tie" distance ( =10 
	   pixels ) of one of the vortex on the original line.  Done, JW, (DP), 
	   10/3/01.

f	a-1. Eliminated the duplicate points in line modification (T501.P1).
	     It happens when modifying a closed line along its original direction
	     and the last click point is within the "tie" distance ( =10 pixels )
	     of the first point on the original line.  Done, JW, (DP), 10/25/01.

f	a-2. Reworked on the duplicate points problem in line modification.  The
	     solution in last delivery inadvently kicked away the first click
	     point (FCP) when modifying a closed smooth line.  It happened when 
	     FCP hit on the original line but not on any vertices of the original
	     line.  Done, JW, (DP), 11/14/01.

f	b. Updated to Version 5.6.f.  Done, TP, (TP), 10/11/01.

f	c. Modified tropical cyclone marine graphic routine to skip over 12 and 
	   36 hour forecast wind radii (which are being added to dchrcn hurricane
	   decoder output).  Done, DK, (AH), 10/15/01.

f	d. T008:  Split existing hurricane graphics program GPTPC into two 
	   programs.  Program GPTPC will now generate four hurricane graphics for
	   the TPC: (1)  Wind swath plot, (2)  Strike probability plot (Atlantic 
	   storms only), (3)  Wind intensity graph, and (4)  Wind speed table.  
	   A new program, GPKGRF, will generate the track error watch/warn plot. 
	   Cleaned up and streamlined code and fixed bugs and deficiencies found 
	   locally and by TPC.  Updated help and text files.  Done, AH, DK, (SJ),
	   10/22/01.

g	d-1. Corrected typo in Atlantic track error table for hurricane graphics.
	     Done, DK, (SJ), 12/18/01.
	     
f	e. T027C:  Added a new WMO header flag to distinguish between the old one 
	   and the new one, which becomes effective 11/7/01.  Changed 'MKC' to 
	   'SPC'.  
	   T029:  Removed the '#' from the watch number in the text products.
	   Done, AH, (SJ), 10/25/01.

f	e-1. Fixed the check for using the new WMO header flag to distinguish 
	     between the old one and the new one, which becomes effective 11/7/01.
	     Done, AH, (SJ), 11/2/01.

f	f. T045:  Created a new diagnostic function that checks a scalar grid
	   and return 0 if the grid point is missing and 1 if the grid point has
	   data.  Done, AH, (SJ), 10/30/01.

f	g. T047:  Removed unused variables out of PT_FQOT, PT_TICE and PT_TURB.
	   Also added out of range checks.  Done, AH, (SJ), 10/31/01.

f	h. T056:  Fixed the plotting of Airmets by increasing the array size
	   of the number of reports allowed. Also increased the array size for
	   the number of points per report. Added a check for the number of 
	   reports greater than the declared array size so that NMAP2 and GPMAP 
	   no longer crash.  Done, SJ, (DK), 11/27/01.

f	i. Fixed warnings in GEMLIB found by purify using NMAP2.  Done, TP, (SJ),
	   11/27/01.

f	j. T061:  Added the function PT_VSBC which will display the fractional
	   part of visibility for all numbers.  Also, reworked the fractional
	   computation in PT_VSBF.  Done, AH, (SJ), 12/3/01.

f	j-1. Fix a bug where visibility fractions between 0.0 and .03123 and
	     between .8125 and .9375 were set to blank.  Added for any fractions
	     greater than .8750, the visibility is rounded up to the next whole
	     number.  Done, AH, (SJ), 12/5/01.
	     
f	k. T065:  Added the ability to display any column of information from
	   a station file using the STNPLT parameter in the GEMPAK programs.
	   Done, SC, SJ, (DK), 12/4/01.

g	l. T068:  Fixed routine to map METAR codes for mist and shallow fog to 
	   the correct weather numbers.  Done, DK, (SJ), 12/18/01.

g	m. T070:  Fixed a DCWARN decoder bug where a '-' came between the
	   county id and the first county number.  Added a check to GGWARN
	   for non-existent counties.  Done, AH, (SJ), 12/18/01.

g	n. Updated to version 5.6.g.  Done, TP, (TP), 12/18/01.

g	o. T067:  Unified string character length in IN library.  Done, TL,
	   (SJ), 1/15/02.

g	p. T097:  Improvements to code used to generate TPC's tropical cyclone
	   marine graphics (danger area) in GPMAP using GEMPAK variable TCMG -
	   interpolation, smoothing, label placement, remnant low.  Added
	   processing for CPHC and table input for radii.  Done, DK, (SJ), 
	   2/21/02.

g	q. T102:  Fixed memory allocation problems in an IN routine.  Done,
	   TL, (SJ), 3/1/02.

g	q-1. Fixed another memory allocation problem in the IN routine.  
	     Initialized variables in GDCROSS.  Done, TL, (SJ), 3/19/02.

g	r. T111:  Modified the Heat Index calculation to reflect changes from
	   1990. Added a Heat Index grid diagnostic.  Done, SJ, (DP), 3/14/02.

k	r-1. Eliminated gross discontinuities in the heat index values computed 
	     using PD_HEAT and PR_HEAT in the neighborhood of 77 degrees.  KB, 
	     (SJ), 1/21/03.

l	r-2. Add new MAX and MIN heat index products to awdef.tbl.  
	     KB, (SJ), 4/14/03.

h	s. Updated to Version 5.6.h.  Done, TP, (TP), 4/5/02.

h	t. T118:  Changed GPKGRF for TPC.  Improved placement of legend box and 
	   track labels, modified colors, modified some breakpoint locations, and
	   mapped output device PS to PSC.  Done, DK, (SJ), 4/16/02.

h	t-1. Changed GPKGRF to a) regroup Bahama breakpoints; b) add Florida Bay 
	     and Lake Okeechobee; c) improve fill for Pamlico Sound; d) check 
	     placement of legend box vs. current storm location.  Changed GPTPC 
	     to a) improve appearance of strike probability graphic; b) taper 
	     wind area to zero at end of swath when required; c) map output 
	     device PS to PSC; d) correct other minor bugs and clean up code.  
	     Done, DK, (SJ), 5/1/02.

h	t-2. Changed GPKGRF and GPTPC to use bounds file name of 'hcn_bnds' 
	     instead of 'world_bnds'.  Done, DK, (SJ), 5/7/02.

h	t-3. Changes to GPKGRF (watch/warning hurricane graphic for TPC) to add
	     two new breakpoints for 2002: U.S. - Brunswick (Altamaha Sound),
	     GA; Mexico - Rio San Fernando, MX.  Done, DK, (SJ), 6/20/02.

i	t-4. Hard code conversion of 115 knots winds to 135 mph for GPKGPF label
	      display and the GPTPC wind intensity chart. This change comes at
	      the request of the TPC. There is an international agreement to
	      this conversion.  Done, AH, (SJ), 8/29/02.

i	t-5. Corrected spelling of country Colombia (not Columbia) in the
	     hurricane watch/warn ("Kelly graphic") program.  Done, DK, (SJ),
	     8/30/02.

i	t-6. Modified check for east longitudes and west longitudes for the 
	     forecast positions in the hurricane decoder, DCHRCN.  The decoder
	     was decoding eastern longitudes as western.  Done, AH, (DK), 9/3/02.

i	t-7. Modified GPKGRF and GPTPC to recognize 'SUBTROPICAL' as a storm type.
	     Removed call to GH_NOPB from ghwtbl.f.  Done, AH, (DK), 9/10/02.

j	t-8. Fixed a bug in the hurricane decoder,DCHRCN.  If the max winds
	     were '50 KT...' the '50 KT...' quadrant string, if existing for
	     forecasted times, was not being decoded.  Done, AH, (DK), 10/8/02.

k	t-9. Modified hurricane decoder DCHRCN to decode either 3-day or 5-day
	     forecast bulletins.  Modified GPMAP/NMAP2 processing for hurricane 
	     (HRCN) to display 5-day forecast, and removed "EXPERIMENTAL" label 
	     from TPC's tropical cyclone marine graphic (danger area) in GPMAP 
	     (TCMG).  (Part of TPC project requirement no. 2).  DK, (SJ), 2/24/03.

k	t-10. Modified TPC graphic programs GPKGRF and GPTPC to handle either
	      3-day or 5-day forecast input.  GPKGRF ("Kelly graphic" will plot
	      5-day forecast as default, with option for 3-day display.
	      DK, (SJ), 3/4/03.

k	t-11. Changed the y-offset for the wind intensity graphic when plotting
	      'INLAND' at the bottom.  There were instances when the label was
	      not being plotted.  AH, (DK), 3/14/03.

k	t-12. Modified TPC graphic program GPKGRF so that 4- and 5-day forecast
	      is displayed using dashed line for fill and for track, and the
	      track points themselves are plotted with a smaller symbol for days 
	      4 and 5.  Fixed bug in DCHRCN (test report #645:P3) to handle a 
	      blank line in the bulletin header.  DK, (SJ), 3/18/03.

l	t-13. Modified TPC graphic program GPKGRF to read breakpoints from a
	      table, rather than having the breakpoint values and names hardwired.
	      This simplifies the changing of breakpoints and makes it easier to 
	      align the watch/warning bands to the coast.  DK, (SJ), 4/2/03.

l	t-14. Modified TPC graphic programs GPKGRF and GPTPC and hurricane decoder
	      DCHRCN to handle either a 4-digit or a 2-digit year as part of the
	      storm identifier within the advisory message.  DK, (SJ), 4/15/03.

l	t-15. Extended forecast track of tropical cyclone from 72h to 120h.
	      Changed MPC to OPC in the miscellaneous data table.  TL, (SJ),
	      4/22/03.

l	t-16. Modified smoothing algorithm used by TPC graphic programs GPKGRF
	      and GPTPC and program GPMAP (for the tropical cyclone marine 
	      graphic) so that either a 3- or 5- point smoothing can be 
	      specified.  Decreased number of smoothing passes for GPKGRF to 
	      improve accuracy of track error display.  DK, (SJ), 5/22/03.

m	t-17. Modified the information string rturned by clo_finddesc, 
	      clo_findstn, and clo_findmatch as the <TAG>value format; changed
	      the corresponding calling functions.  RT, (DK), 7/25/03.

m	t-18. Added one point to breakpoint plotting table for U.S. Virgin
	      Islands, to bypass a logic error in code which prevented US VI
	      watch/warnings from being plotted in the Kelly graphic.  DK, (SJ),
	      7/25/03.

m	t-19. Added a new line "Potential Day 4-5 Track Area" to the TPC Kelly
	      graphic legend box.  JW, (AH), 8/12/03.

m	t-20. Modified the retrieval of date from the tropical cyclone forecast/
	      advisory messages to allow intervening characters between the storm
	      identifier and the date string.  AH, (DK), 8/21/03.

h	u. Corrected watch display to check that replacement or cancellation time
	   is before originally-specified end time.  Done, DK, (SJ), 5/10/02.

h	v. T133:  Modified the codes that generate the Watch Outline Update (WOU)
	   product to meet the SPC requirement.  Done, RT, (SJ), 6/13/02.

h	v-1. Added 'NWS' before all 'STORM PREDICTION CENTER'.  Changed 200 to be
	     MAXCNTY.  Added FIPS codes for independent cities for WOU.  Removed 
	     '\r' from vfwoui.c  Done, RT, (SJ), 6/20/02.

h	v-2. Removed '\r' from vfvors.c.  Done, RT, (SJ), 6/20/02.

i	v-3. Updated vfwoui.c.  Done, GG, RT, (SJ), 8/26/02.

i	v-4. Changed WCL WMO header to NWUS62; Added UGC codes to the WCL; Added 
	     "ARE" to the string "INDEPENDENT CITIES INCLUDED"; and Eliminated 
	     unnecessary extra vertical and horizontal spaces.  Done, SJ, (SS), 
	     9/24/02.

h	w. T134:  Modified the codes that generate the rest of the SPC product
	   to meet the SPC requirement.  Done, RT, (SJ), 6/13/02.

h	w-1. Removed the initial time input from the watch format window.
	     Implemented a new algorithm to derive issue/initial time.  Done,
	     HZ, (ES), 6/13/02.

i	x. Updated to Version 5.6.i.  Done, TP, (TP), 7/2/02.

i	y. T146:  Replaced the current point reduction algorithm with the Adaptive
	   Sapmling of Parametric Curve (ASPC) algorithm in the Graphic Gems V.
	   Done, RT, (SJ), 7/17/02.

i	y-1. Solved the problem of lines wrapping around the earth when crossing
	     180/-180 longitude.  Also adjusted scaling to be more equivalent to
	     the scaling used by the old algorithm.  Done, RT, (SJ), 8/07/02.

i	z. T166:  Modified code used to generate TPC's tropical cyclone marine
	   graphic (danger area) in GPMAP using GEMPAK variable TCMG, to use 
	   the Low (with x) special symbol to show a tropical depression.  Done 
	   at TPC's request.  Done, DK, (SJ), 7/23/02.

k	z-1. Modified hurricane decoder DCHRCN to check for subtropical systems.
	     Modified code used to generate TPC's tropical cyclone marine graphic
	     (danger area) in GPMAP using GEMPAK variable TCMG, to use the Low 
	     (with x) special symbol for all track points of a subtropical system.
	     (TPC project requirement no. 4)  DK, (SJ), 2/5/03.
	     
	aa. T170:  Wrote new ti routine ti_locl to convert a plain language
	    local date/time string (a format used in many bulletin types)
	    to a GEMPAK time.  A sample local string is "337 PM EDT THU JUL 
	    25 2002".  Done, DK, (SJ), 7/26/02.

i	bb. T172:  Changed the default return string in PT-TPFC from a blank
	    to "M/M/M" to address medium range desk processing problem
	    with min/max/pop.  Done, SJ, (DK), 8/05/02.

j	cc. T190: Added a grid diagnostic function to evaluate the cumulative 
	    standard normal distribution function given the value of the random 
	    variable, the mean of its assumed normal distribution, and standard 
	    deviation of same.  This function returns the probability of the 
	    random variable taking on a value less than or equal to the given 
	    value.  Done, KB, (SJ), 10/8/02.

j	dd. T188:  Fixed the unexpected results problem in gg_hrcn.  Done, ML,
	    (SJ), 10/8/02.

j	ee. Updated to 5.6.j.  Done, TP, (TP), 10/8/02.

j	ff. T197:  Added a new diagnostic MISS(S1,S2) to set the missing values
	    in S1 to the value of S2.  SC, SJ, (DP), 10/22/02.

m	ff-1. Added two new grid diagnostics; INT (S) and NINT (S).  INT converts
	      the scalar to an integer value and NINT rounds the scalar value to 
	      the nearest integer.  AH, (SJ), 8/25/03.

j	gg. T203:  Fixed problems in merged sounding data when significant level 
	    wind data (PPBB) is not reported from the surface level.  TL, 
	    (SJ), 11/5/02.

j	gg-1. Replaced the first level of significant temp (TTBB) as surface
	      data only when the report is at the surface.  TL, (SJ), 11/7/02.

j	hh. T210:  Modified ggcsig.f to display the lastest hour's convective 
	    sigmet lines, areas, isolated areas and outlooks which are valid.  
	    AH, (SJ), 11/27/02.

l	hh-1. For displaying isolated convective sigmets, divided the decoded
	      diameter to get the radius of the isolated convective sigmet
	      circle for plotting.  AH, (SJ), 5/12/03.

j	ii. T212:  Fixed the point reduction algorithm in CV_RDUC.  Rescaled the
	    tolerance value for checking for flatness of a segment.  Changed
	    the computation of the midpoint of a segment to be more like the
	    original published algorithm.  Added a check for points of a segment 
	    on either side of the international dateline.  SJ, (DP), 12/6/02.

j	ii-1. Further fixes to the point reduction to handle lines with less
	      than 10 points.  SJ, (SS), 12/13/02.

j	ii-2. Fixed logic in check for previous point in CV_RDUC. (613:P1)
	      SJ, (SS), 12/16/02.

k	jj. Updated to 5.6.k.  Done, TP, (TP), 12/27/02. 

k	kk. T233:  Created SMIN, SMAX, and combination of probabilities based on
	    an empirically determined dependency parameter grid diagnostic 
	    functions.  KB, (SJ), 1/13/03.

k	ll. T241:  Added a new vector grid diagnostic function to compute the 
	    north-relative direction difference between two vectors.  KB, (SJ), 
	    2/13/03

k	ll-1. Increased LLMXTG to 4000000 to allow for 2.5 km grid.  TP, (SJ),
	      3/3/03.

k	ll-2. Due to problems with executable size, reduced the value of 
	      LLMXTG from 4,000,000 back to 1,000,000.  SJ, (SS), 3/20/03.

k	ll-3. Due to problems with executable size, reduced the value of
	      LLMXTG from 1,000,000 to 750,000. This was done for all platforms
	      except AIX. The AIX value was set to LLMXGD 275,000.

l	mm. Updated to 5.6.l.  Done, TP, (TP), 3/27/03.

l	nn. T247:  Added an abililty for the Non-Convective SIGMETS(NCON) to 
	    allow the user to choose to plot the data filtered by name.  If the 
	    new-added flag is ON, then the NCON data for that name is plotted. 
	    Otherwise, if the flag is OFF, then the NCON data for that name is 
	    skipped and not plotted.  ML, (SJ), 5/30/03.

l	nn-1. Increased the string size for the misc data flags in the SPF file.
	      SJ, (AH), 6/5/03.

l	oo. T268:  Created two new grid diagnostic functions which compute Fosberg
	    index and Haines indices at low-, middle-, and high- levels for fire
	    weather detection.  TL, (SJ), 6/6/03.

m	oo-1. Implemented a new function to PR library to compute Fosberg Index.
	      Added Fosberg Index as a surface parameter.  Implemented a new 
	      function to PS library to compute Haines Index.  Added three Haines
	      Indices as an upper-air stability parameter.  Added new indices
	      to surface and MOS data in Nmap.  TL, (SJ), 6/30/03.

l	pp. T270:  Fixed the problem of time series plots for surface data.
	    TL, (SJ), 6/10/03.

m	qq. Updated to 5.6.m.  Done, TP, (TP), 6/23/03. 

m	rr. T286:  Increased maximum bangs for GDPLOT2 from 10 to 20 to 
	    accommodate ensemble members.  Done, TL, (SJ), 8/8/03.

m	ss. T288:  Added a capability to color code the SVRL watches by the last
	    digit of the watch number if the color code is set on.  The colors
	    are table driven which can be changed in the miscset.tbl.  ML, (SJ),
	    8/11/03.

m	ss-1. Fixed bug #682:O3 -- flag and color value problem.  ML, (SJ),
	      8/15/03.


005.	CGEMLIB Changes

f	a. Fixed problem: test report #493 - incorrect intersections resulted
	   from CGR_INTERSECT.  The problem was caused by the dimension of the 
	   array in testcgr.c being less than the number of intersection points.  
	   This release expanded the range of the array to 20 (intersection 
	   number).  Done, ML, (DP), 10/03/01.

f	b. T044B:  On international SIGMET format GUI, replace choice of decimal 
	   degrees vs. degrees-minutes with choice of directional format.  Also, 
	   make sure latitudes and longitudes consist of a full 4 and 5 digits 
	   respectively, in each case prepending zeros if necessary.  Done, DP, 
	   (SJ), 10/24/01.

f	c. T014:  Restructured cvg_load() & cvg_load2() calling sequences in
	   preparation for the layering, and to reduce maintenance.  Done, JW,
	   (ES), 11/21/01.

f	c-1. Removed unnecessary crg_init() and redundant geplot() calls in
	     preparation for adding the layering to PGEN.  Done, JW, (ES),
	     11/26/01.

f	c-2. Removed more unnecessary crg_init() calls in preparation for adding
	     the layering to PGEN.  This delivery also fixes T048A.  The bug is
	     that when a VG file is loaded as data and PGEN is up, after a print 
	     the PGEN elements are not selectable.  Done, JW, (ES), 11/27/01.

g	c-3. Added a layer number to the range record and loaded it whenever
	     range records were built.  Done, JW, (ES), 12/17/01.
	     
g	c-4. Separated logically the notion of rebuilding range records from 
	     redisplaying VG elements. Originally, both operations were rolled
	     into cvg_load() which was liberally called either directly or
	     indrectly.  Done, JW, (ES), 12/18/01.
	     
g	c-5. Set proper file size in crg_rebuild().  maxbytes is inadvertently 
	     undefined in last delivery.  Done, JW, (ES), 12/19/01.

g	c-6. Removed or replaced cvg_load() calls where possible in PGEN, NMAP2,
	     and NMAP.  Also fixed the bug, 524:P1,  where the VG elements become 
	     unselectable after one of some main events (MAP/RELOAD/PRINT/SEEK/
	     CLOUD HEIGHT).   Done, JW, (SJ), 1/3/02.
	     
g	c-7. Fixed the following bug (T524): the VG elements become unselectable
	     after CLOUD HEIGHT event. You must reclick on the PGEN pallette to
	     activate the selection.  Also corrected two misdefined variables in 
	     nmap_zoomw.c package.  Done, JW, (ES), 1/11/02.
	     
g	c-8. Redesigned the algorithm how the contents of a VG file are loaded
	     into Product Generation. Previously, if the VG file contains elements
	     of more than one layer, the layer information would be destroyed.
	     Now, when loading the VG elements, the building of range records is
	     separated from the setting of layer information and thus will not
	     affect the existing layer information.  Done, JW, (ES), 1/16/02.
	     
g	c-9. Modified element selection and manipulation within the established
	     PGEN actions to take layer into account. Now any selected actions
	     should be applied only to elements within the current layer.
	     Done, JW, (ES), 1/25/02.	     

g	c-10. Modified VG file save to take layer into account.  Now only the
	      non-deleted VG elements on the current layer could be saved into
	      a specified file.  Done, JW, (ES), 1/30/02.

g	c-11. Added some additional fields to the LayerInfo struct to accomplish
	      all VG file saves using layers.  Done, JW, (ES), 2/5/02.

g	c-12. Fixed the vg display in PGEN after a file load problem where the
	      revised file open failed to tell the xw driver that the display 
	      needed updating.  Done, ES, (SJ), 2/5/02.

g	c-13. Build Layer Control Window.  It will be started when the user
	      selects the new "Add Layer" button on the pgen palette.  Done,
	      HZ, (ES), 2/12/02.

g	c-14. Construct a new set of rountines in the CTB library to read and
	      return data from a table that contains information to be used in
	      the prodcut genertation layering function.  Done, TL, (SJ), 2/14/02.

g	c-15. Reconciled the pgen layering GUI and its functionality.  Done, JW,
	      (ES), 2/15/02.

g	c-16. Fixed two problems with layering.  First, the Show All Groups
	      function didn't work well with respect to layers.  Second, when 
	      exiting layering the elements were not reset to layer 1.  Done, 
	      ES, (SJ), 2/21/02.

g	c-17. Added the newest crg routine, crg_mvallayer, to the testcrg 
	      program.  Done, ES, (SJ), 2/21/02.

g	c-18. Corrected a problem with Display All Groups.  Under certain
	      circumstances all or part of the bounding box to a previously 
	      deleted group would display when Display All Groups was selected.  
	      Done, ES, (SJ), 2/21/02.

g	c-19. Implemented the correct display for each layer, using the display
	      ON/OFF check box.  Done, JW, (ES), 2/21/02.

g	c-20. Continued to build Layer Control Window.  Built associated Layer 
	      Display Window and Layer Name Window.  Fixed 539.P1, where on IRIX5
	      & IRIX6, a click on 'Start Layer' button crashes NMAP/NMAP2.   When
	      starting layering or adding a new layer, immediately open the Layer
	      Name Window to give the user a chance to put a meaningful name on 
	      the new layer.  Done, HZ, (ES), 3/4/02.

g	c-21. Implemented a new PGEN exit mechanism. Previously, the response to
	      pressing the EXIT button is to pop up a confirmation box with two
	      buttons "Ok" and "Cancel", unsaved changes are not checked before
	      exit. Now, upon exit from PGEN, unsaved layers/files are checked
	      and users are reminded of saving those changes.  Done, JW, (ES), 
	      3/4/02.

g	c-22. Added a layer processing file table.  Added a new function to get 
	      the group type in the layer table.  Made enhancements to the layer 
	      table read function.  Done, TL, (SJ), 3/4/02.

g	c-23. Implemented the correct refreshing of elements that fall within
	      a specified range. Originally, MOVE/COPY elements on one layer may
	      cause the elements on another layer to be displayed, even though
	      the "display" flag for the later layer has been turned off. Now,
	      it is fixed by adding a check to the layer information ( elements,
	      layer, display flag, and fill mode) in the range records before
	      refreshing.  Done, JW, (ES), 3/5/02.

g	c-24. Terminated any pending operations before switching the current
	      layer.  Reset the PGEN operation to "SELECT" after switching.
	      Started the layering window with only one layer instead of two.
	      Allowed more layers to be added dynamically after the layering
	      window popped up.  Redrew all VG elements upon exiting layering, 
	      including those elements on the display-off layers.  Reset 
	      changes_made flag for all layers upon exiting layering.  The first 
	      layer is set to TRUE while all others are set to FALSE.  It 
	      gurantees all unsaved changes will be asked for save when exiting 
	      product generation.  Done, JW, (ES), 3/6/02.

g	c-25. Fixed the exit related bugs in layering.  An exit from pgen is
	      now properly cleaned up.  Done, ES, (SJ), 3/7/02.

g	c-26. Set proper color and fill mode when redraw/refresh VG elements.
	      The VG elements are redrawn/refreshed with specified color mode
	      (mono or full) and fill mode (filled or non-filled) except those
	      elements on the current layer, which will be redrawn/refreshed
	      always at the end and in full color/filled mode.  Done, JW, (ES),
	      3/8/02.

g	c-27. Fixed some of bugs on Steve's 3/7 list.  The layer status window
	      is decreased in size, the layer names are re-initialized upon
	      exit, the  layer edit window is unmanaged when changing layers,
	      and the bug of two (or more) layers displaying as active 
	      simultaneously is also quashed.  Done, ES, (SJ), 3/8/02.

g	c-28. Fixed 3 errors in the layering implementation.  1)  Switching the 
	      current layer no longer resets the layer display attributes.  The 
	      current layer is always drawn in full color with fill, regardless 
	      of the layer settings.  But now, the settings are not altered, so 
	      if layer 1 is set to mono, no fill, switching the current layer to 
	      layer 2 will make layer 1 display as per its settings.  2)  The 
	      background and foreground colors of all layer buttons were 
	      inconsistent after restarting layering.  3)  Not all layers were 
	      available after restarting layering.  4)  Clicking Accept from the 
	      layer edit window makes those changes appear immediately (unless 
	      the change was to the current layer, which always displays in full 
	      color and filled).  Done, ES, (SJ), 3/12/02.

g	c-29. Added save checks when exiting layering. When exiting the layering
	      unsaved layers are allowed to be saved before exiting.  The 
	      layering window is up until the save check is complete.  A cancel 
	      leaves the user still in layering.  Also changed the settings of 
	      the "chnages_made" flag for a layer.  When a file is opened for 
	      "replace", the flag is set to False.  "Append" sets the flag to 
	      True.  Done, JW, (ES), 3/14/02.

g	c-30. Fixed 3 bugs:  1)  Current layer's check button is now sensitive.
	      It won't change the display of the current layer, but it can be 
	      set now.  2)  The name buttons are now in synch after a restart.  
	      Two or more layers should not show active at the same time anymore.
	      3)  The check buttons should correctly reset to on after a restart.
	      Done, ES, (SJ), 3/14/02.

g	c-31. Unified the mechanism for exiting PGEN and exiting layering.  Added
	      same save checks when exiting PGEN. When exiting the PGEN, unsaved
	      layers are allowed to be saved before exiting. The PGEN palatte is 
	      up until the save check is complete. A cancel leaves the user still
	      in PGEN.  Done, JW, (ES), 3/15/02.

g	c-32. Fixed T547:P1: after exiting layering, all display-off VG elements
	      on the non-current layers are redisplayed only when an refreshing
	      event happens, such as MOVE/EDIT the element on the current layer.
	      Done, JW, (ES), 3/18/02.

g	c-33. Added the same save checks for exiting NMAP/NMAP2 as those used
	      for exiting PGEN/layering. When exiting NMAP/NMAP2, unsaved changes
	      are allowed to be saved layer by layer before exiting. NMAP/NMAP2
	      is up until the save check is complete. A cancel leaves the user
	      still in NMAP/NMAP2.  Done, JW, (ES), 3/18/02.

g	c-34. Enhanced LAYER functionality by greying out add layer after 10 
	      layers have been added and switching to "SELECT" after click on 
	      "Start Layer" button.  Done, HZ, (ES), 3/18/02.

g	c-35. Updated the current file name at the bottom of the main window
	      when switching between layers.  Done, JW, (ES), 3/19/02.

g	c-36. Reset the exit flag upon a cancel on "EXIT" from NMAP/NMAP2.
	      Originally, a sequence as: (1) make some changes in PGEN, (2)
	      "EXIT" from NMAP/NMAP2 and cancel, (3) "EXIT" from product 
	      generation and choose "No", may end up exiting the whole
	      NMAP/NMAP2 application.  Done, JW, (ES), 3/20/02.

g	c-37. Fixed a few bugs related with the new "EXIT".  1. T549:P2/P3: 
	      Load ("Replace") VG files into layers.  Then exit from layering 
	      completely.  A VG file name still appears at the bottom of the main
	      window.  Now it is cleared.  2. Make changes in PGEN, then exit 
	      PGEN, choose "cancel".  The PGEN operation stays in "EXIT".  Now 
	      it set to the previous PGEN operation.  3. Make changes in PGEN, 
	      then exit PGEN, choose "Yes" to save the changes into a file. After
	      exiting PGEN, the hints at the bottom of the main window still 
	      shows that the PGEN is active, which should be set to 
	      "Product Generation Inactive".  Now it is set to correct hints.
	      Done, JW, (ES), 3/20/02.

g	c-38. Reset the PGEN operation to "SELECT" upon exiting layering.  
	      Done, JW, (ES), 3/21/02.

g	c-39. Fixed a layer exit problem where the exit message displayed in the 
	      exit confirmation window which reads "There are unsaved changes in 
	      layer_x.  Do you want to save them?", was being updated before the 
	      save operation was complete.  So while saving layer 1, the message 
	      was changed to refer to layer 2.  Now the update to the exit 
	      message window is not made until the file save window is popped 
	      down.  Done, ES, (SJ), 3/21/02. 

g	c-40. This release closes all PG windows when exiting layering.
	      Done, ES, (SJ), 3/22/02.

g	c-41. Fixed 552:P1.  Exit from the pgen palette was wiping the existing
	      action.  If cancel was selected in the exit comfirmation window
	      then no action was selected.  Now the palette is reset to Select.
	      Done, ES, (SJ), 3/22/02.

g	c-42. Fixed bug where the line attributes were not being saved off in
	      the settings struct after selecting a line element.  Also, fixed 
	      a 0 length file open problem.  Done, ES, (SJ), 3/26/02.

g	c-43. Fixed the error message associated with opening a zero-length
	      file.  Done, ES, (SJ), 3/27/02.

g	c-44. Modified the file open, so that no group number increment is done
	      if the open is for a Replace and layering is not active.  Done,
	      ES, (SJ), 3/29/02.

h	c-45. Implement Layer Product (LP) GUI and functionalities.  Done, TL,
	      (ES), 4/24/02.

h	c-46. Improved error handling in the cvg library.  Done, ES, (SJ), 
	      4/29/02.

h	c-47. Added layer display mode to the layering structure; Removed LP file
	      open confirmation window; Closed layer control window after open LP
	      file is confirmed; and Better handling error message entries.  
	      Done, TL, (ES), 5/7/02.

h	c-48. Closed an open file in a cvg function that caused a failure on
	      loading multitude Layer Product files on sun17 and hpux11.  Done,
	      TL, (ES), 5/8/02.

h	c-49. Correct the file close location in the cvg_gmtrx() routine.  Done,
	      ES, (SJ), 5/8/02.

h	c-50. Fixed a bug in the routine that loads lpf files.  When the layer
	      name exceeds 10 characters the application crashes on Linux.
	      Done, ES, (SJ), 6/25/02.

i	c-51. Added calls to unmanage and re-manage the layer control window as
	       new layers are added. This fixes a problem reported by the AWC
	       where the "Edit Name" and "Exit" buttons would disappear when
	       opening a second LPF file.  Done, SJ, (DP), 9/11/02.

k	c-52. Fixed the bug where all 4 layers in NMAP2 were saved into an
	      OUTLOOK product instead of just the current layer.  HZ, (SJ),
	      2/11/03.

k	c-53. Use group specified in the LPF when labeling.  HZ, (SJ), 3/17/03.

k	c-54. Allow the use of the group specified in the LPF when labeling.
	      HZ, (SJ), 3/18/03.

f	d. T058:  Changed the name of the outlook group names from HAILOUTL, 
	   WINDOUTL, TORNOUTL to HAILOTLK, WINDOTLK, TORNOTLK as requested by 
	   the SPC.  Done, SS, (SJ), 11/27/01.

f	e. T037:  Fixed problem: test report #498 - too small distance error.
	   The problem was caused by a check for the small distance and
	   inconsistent variable type.  Done, ML, (SJ), 11/28/01.

f	e-1. Added check to clo_direct to eliminate out-of-bounds acos expression 
	     and resulting "not a number," nan, returned for the direction.  
	     done, DP, (SJ), 12/4/01.

f	f. T033:  Added a new function to compute the centroid and the area of
	   a polygon.  Done, SJ, (DP), 11/29/01.

	   010g-1:  Corrected inconsistent county markers.  Prviously, the county
	   centroid had to be located inside the county in order for it to be 
	   included.  Done, DP, (SJ), 12/3/01. 

f	f-1. Set the return values for the area and centroid location to missing
	     if there are not enough points input to the function.  Done, SJ,
	     (ES), 12/4/01.

	   010g-2:  Added error message when number of counties reaches parameter
	   "MAX_CNTY" (currently set to 200).  Done, DP, (SJ), 12/4/01.

g	g. T082:  Add a new C function to convert lantitude or longitude in string
	   format of degrees:minutes or decimal degree into double value.  Apply
	   the new function cst_ctod to the symbol GUI so that users may type in
	   either decimal degrees or degrees:minutes.  Done, RT, (DP), 1/24/02.

g	h. T092:  Changed bounds processing to allow sub-bounds.  Done, DP,
	   (SJ), 1/30/02.

g	h-1. Created program clipvgf.c to clip a vgf file based upon a specified 
	     bounds area.  Done, DP, (SJ), 2/7/02.

g	h-2. Added help file to clipvgf program.  Change link script to link in 
	     GPLT directly.  Done, DP, (SJ), 3/4/02.

g	h-3. Reconfigure SSA (seamless surface analysis) areas of responsibility 
	     files:  vgf, bounds, and bounds info.  Add to CLO table.  Remove old
	     SSA confiuration bounds files.  Done, DP, (SJ), 3/4/02.

g	h-4. Added Pacific Region clipping area to SSA vgf, bnd, and bnd info 
	     files.  Correct flaw in GAREA and PROJ definitions in VGF clipping 
	     program.  Done, DP, (SJ), 3/6/02.

g	h-5. Added more info to the clipvgf help file.  Done, DP, (SJ), 3/8/02.

g	h-6. Fixed bug in clipvgf program.  Done, DP, (SJ), 3/8/02.

g	h-7. Added the pacific region bound area to the seamless surface analysis 
	     (SSA) vgf file.  From this file, regenerated the corresponding 
	     bounds and bounds info files. Done, DP, (SJ), 3/8/02.

g	h-8. Changed the way element records are read.  Done, DP, (SJ), 3/14/02.

g	h-9. Created SSA bound map files.  Done, RT, (TP), 3/18/02.

g	h-10. Fixed Pacific region SSA bound map files.  Done, RT, (TP), 4/5/02.

h	h-11. Added label moving capability and added option to perform clipping 
	      at the bounds' exact borders.  Done, DP, (SJ), 5/23/02.

h	h-12. Bug fix per test report #561.  Done, DP, (DP), 6/4/02.

h	h-13. Updated the help file for clipvgf.  Done, DP, (SJ), 6/5/02.

h	h-14. Added label moving capability to special line and front vg types.
	      Done, DP, (DP), 6/5/02.

h	h-15. Clipvgf program now takes into account text grouped with a symbol.
	      The text grouped with a symbol will be clipped or kept along with
	      the label.  The help was also updated.  Done, DP, (SJ), 8/05/02.

h	h-16. Create an output VGF even if it is empty for the CLIPVGF program.
	      This is in responsed to PR:578:O2.  Done, DP, (SJ), 8/9/02.

m	h-17. Bug fix for when only 1 point on one side of boundary and user asks
	      for 'exact' clipping.  DP, (SJ), 8/13/03.

m	h-18. Bug fix in range computation. Set longitude range to (-180,180) if
	      figure crosses ID.  DP, (SJ), 8/19/03.

m	h-19. New function to compute the range of a line/polygon (set of 
	      connected points).  DP, (SJ), 8/21/03.

m	h-20. Rearrange code in cgr_range to perform final coordinate 
	      transformation prior to calculating range of data.  This fixes a 
	      problem with missing watch anchor points.  DP, (SJ), 8/28/03.

m	h-21. Fixed PR #689, where ordering of bounds when sorted was incorrect 
	      on SUNOS5 when maximum longitudes were compared and found equal.  
	      DP, (SJ), 9/10/03.


g	i. T093:  Allow vg elements of one subtype to be displayed as another 
	   subtype in gpmap.  No actual change is made to the source vg file.  
	   Done, ES, (SJ), 2/7/02.

g	i-1. Fixed a minor error in the uattribd.tbl.  Done, ES, (SJ), 2/13/02.

h	j. Fixed TESTCTB to call CTB_AWDEF with the correct type of variables.
	   Done, SJ, (ES), 4/22/02.

h	k. T129:  Corrected cvg_rdrec() defiencies: (1) replacing cfl_uopn() with
	   cfl_ropn() to avoid unnecessary write access to file, (2) creating a
	   new function cvg_rdrecnoc() to perform a complete element reading,
	   which make it possible to overcome the overhead file open/close.
	   Also fixed a bug in saving the VG element SPTX_ELM. Its attribute
	   "turbsym" is not fully initialized & returned in pgtxt_getAttr().
	   At default, an unpredictable trash value may be set & saved.  Now it 
	   is set as "0" at default.  Done, JW, (TP), 4/23/02.

h	l. T138:  Fixed the parentheses on the macro DDTODM in gemprm.h.  The
	   grouping was causing an incorrect computation of the number of minutes
	   from the decimal degree value.  Done, SJ, (SS), 5/7/02.

h	m. T135:  Added MESO_DSC (mesoscale discussion) group type and removed
	   the unused CCFP group type.  Done, ES, (SJ), 5/20/02.

h	m-1. Created program to generate lat-lon points for the Mesoscale 
	     Discussion Product (MCD).  Done, DP, (SJ), 6/5/02.

h	m-2. Make MDP work for special lines as well.  Done, DP, (SJ), 6/11/02.

i	m-3. Handle continuation lines in grptyp.tbl.  Done, RT, (SJ), 7/25/02.

i	m-4. Added new capability to label lines with a symbol while drawing
	     the line.  This feature is similar to the function to label
	     lines with text.  Any combination symbol, regular symbol or
	     marker can be used to label a line.  The default attributes
	     of the symbol associated with a group may be specified using
	     the $GEMTBL/grptyp.tbl table.  See that table for additional
	     details.  Done, JW, (SJ), 8/7/02.

i	m-5. Made compatiable the new capability to draw a symbol-labeled line
	     with the previous functionality to draw text-labeled lines, symbols,
	     fronts, and circles.  Fixed bug T579:P2 - "Place Symbol" button now 
	     behaves like the mouse button if the symbol is used to label a line.
	     Fixed bug T579:P3 - if the symbol is used to label a line, the 
	     default color/size/width set in grptyp.tbl will be used. If the 
	     user changes them after the symbol window pops up, the changes will 
	     be reserved.  Done, JW, (SJ), 8/12/02.

i	m-6. Allowed the symbols not listed on the object pallette to be
             saved/displayed properly as lines's label. Theoritically, all
             objects that has an icon file in $NAWIPS/icons and has been
             assigned a class/object ID could be saved/displayed. Within the
             current version of product generation, only those objects listed
             on the object pallette could be saved/displayed. For symbols,
             the entries are controlled by three tables symbolbtn.tbl,
             combsymbbtn.tbl, and markerbtn.tbl. However, the new functionality
             to draw symbol-labeled lines is implemented using the grptyp.tbl.
             It is reasonable to not limit the user to use only those symbols
             listed on the object pallette. Instead, all symbols under the
             $NAWIPS/icons should be available for users' choice.  Done, JW, 
	     (SJ), 8/12/02.
 
i	m-7. Fixed a bug related with volcano symbol and label - the text box
	     type may not be set to the last type used if (1) draw a volcano
	     symbol labeled with an outlined text (2) draw a regular non-outlined
	     text (3) pop down the text window and pop up again. The text box
	     type is reset to outlined text in step 1, which should be set
	     non-outlined text used in step 2.  Done, JW, (SJ), 8/19/02.

i	m-8. Added a new class CLASS_LIST into PGEN for future development.
	     Done, JW, (DP), 9/4/02.

i	m-9. Added members lat/lon into ListData structure for future development.
	     Done, JW, (DP), 9/10/02.

i	m-10. Implemented a new elment type - CLASS_LIST into PGEN. At this stage,
	      a list element can be created manually via "testcvg" and checked in
	      "dumpvgf". Then, it could be opened and saved in NMAP/NMAP2 for
	      display purpose. Done, JW, (DP), 9/16/02.

i	m-11. Reduced the value of MAXLISTITEMS from 3000 to 10. The larger
	      size was causing efficiency problems in product generation.
	      Done, SJ, (DP), 10/2/02.

j	m-12. Fixed the significant slowing-down PGEN performance after the
	      add-in of List class.  Done, JW, (SJ), 10/11/02.

j	m-13. Reengineered the LIST class structure to remove unnecessary members
	      and plugged it into product generation.  Done, JW, (SJ), 11/7/02.

j	m-14. Changed volcano label text box from transparent to opaque.
	      MG, (SS), 11/21/02.

j	m-15. Added the LIST class into product generation.  JW, (SJ), 11/25/02.

j	m-16. Activated more PGEN actions on list objects, including - MULTISEL,
	      GROUP, UNGROUP, UNGROUP ALL, SHOW ALL GROUP, and CHANG GRP.  JW,
	      (SJ), 11/25/02.

j	m-17. Added color selection/editing for LIST objects.  JW, (SJ), 11/29/02.

j	m-18. Added the LIST class into product generation.  JW, (SJ), 12/3/02.

j	m-19. Fixed the NMAP/NMAP2 crashing bug when loading a 10-layer LP file.
	      JW, (SJ), 12/6/02.

j	m-20. Fixed the NMAP/NMAP2 bug when starting the layering process or
	      opening LP file.  When loading an LP file which contains multiple 
	      layers, we subdue the popping up of the layering window to avoid 
	      the mutiple exposure.  However, since the layering window is not 
	      popped up, using pglayrw_isUp() to query if the layering process is
	      active will be inappropriate - it may mess up the group types and 
	      numbers of VG elements.  Thus, another global variable _layerActv 
	      is added to solve this problem.  JW, (SJ), 12/16/02.

k	m-21. Fixed the refreshing of large LIST element markers.  The range 
	      record for LIST elements are doubled to allow a full refreshing.  
	      JW, (SJ), 1/2/03.

k	m-22. Changed the STATE LIST element to use the state ids instead of the
	      state number. Fixed the test program, dumpvgf, to  display the
	      correct type for the list elements instead of UNDEFINED.  
	      SJ, (DP), 3/7/03.

k	m-23. changed mdp to allow it to work only on scallop lines, changed the
	      output format according to requirements, updated mdp.hlp to 
	      describe the changes made to mdp.  MG, (SJ), 3/10/03.

k	m-24. Modified the LIST element to set the group type and number from
	      the line used to create the LIST element. This applies only 
	      when creating the LIST by "Selecting another object".  SJ, (DP),
	      3/18/03.

k	m-25. changed mdp to allow it to work when scallop line is grouped only 
	      with WFO's, STATES, or not grouped with either.  if more than one 
	      scallop line is present in the file execution STOPS after the 
	      program finds the first one.  changed the output format only 9 
	      WFO's are output per line, only 7 STATES are output per line, and 
	      added missing "..." at the end of WFOs line.  updated mdp.hlp to 
	      describe the changes made to mdp.  changed dumpvgf to include group 
	      type MESO_DSC.  MG, (SJ), 3/18/03.

k	m-26. Changed the LIST element default to create the list by 
	      "Selecting another object".  SJ, (SS), 3/20/03.

l	m-27. Rewrote the MDP program to use the first scallop line found in
	      the VG file to compute the lists of states and WFOs.  Renamed
	      this version of the program to MDPSPC.  GG, (SJ), 5/30/03.

m	m-28. Reconciled the LIST attribute settings in uattribd.tbl. Now the user
	      can change the LIST objects' color, marker type/size/width in
	      uattribd.tbl when displaying in GPMAP. Originally, such settings
	      were ignored and an error message was produced.  JW, (SJ),
	      6/24/03.

h	n. Fixed sigmentation fault with add/delete counties while locator set
	   to cities.  Removed unnecessary code from bounds checking routine.
	   Done, DP, (SJ), 6/13/02.

i	o. T158:  Fixed problem with erasing sigmets with width > 90.  Done,
	   HZ, (SJ), 7/17/02.

i	o-1. Fixed the problem (575:P1) where a large, >500 width, on an 
	     "Isolated" Intl SIGMET on the edge of the US map could not all
	     be deleted.  Done, HZ, (SJ), 7/26/02.

i	p. T168:  Fixed the bug of undesired side-effect after patch G changing
	   the behavior of the group action.  Done, RT, (SJ), 7/29/02.

i	q. T180:  Changed function CLO_FROM to include the call to CLO_REORDER; 
	   calling sequence to function CLO_REORDER was changed; function 
	   CPCG_NEWPOLY was editted to reflect the changes in calling sequence 
	   to CLO_REORDER.  Done, MG, (DP), 9/10/02.

j	r. T200:  Fixed a problem with areal international sigmets. The last
	   point, which is also the first point, was missing from the list of
	   locations in the "From line".  Done, SJ, (DP), 10/23/02.

k	s. T204:  Modified cgr_segdist to pass all parameters as pointers.
	   DP, (SJ), 1/13/03.

k	s-1. Improved the graph-to-grid program/algorithm to produce more 
	     accurate results and to satisfy MPC/TPC requirements including 
	     modifying the "show extensions" function, eliminating "bulls-eyes", 
	     and allowing for local minima/maxima.  DP, (SJ), 1/15/03.

k	s-2. Added ERROR.PRM so that NORMAL is defined.  Replaced INSIDE/OUTSIDE 
	     bounds logic since BOUNDS parameter was not working properly for 
	     multiple-parts bounds.  DP, (SJ), 2/20/03.

k	s-3. Create a new CVG function called cvgcir2lin.c which converts a
	     circle element to a line element given the circle element and a
	     resolution factor. Apply the new function in "clipvgf" program.
	     Also apply the new function to graph-to-grid.  HZ, (DP), 2/21/03.

k	s-4. Added library files for MDL grid2 encoder.  Changed f90 features 
	     into f77-acceptable statements.  MG, (TP), 3/14/03.

k	s-5. Bug fix - in GRPHGD, when assigning values within a closed contour,
	     check to make sure that no value has been previously assigned.
	     DP, (SJ), 3/17/03.

k	s-6. Created new program, GD2NDFD, to encode a GEMPAK grid into NDFD
	     GRIB2 format.  TP, (SJ), 3/17/03.

k	s-7. Corrected a problem in the mdlg2enc library.  TP, (SJ), 3/25/03.

l	s-8. Added GSKIP parameter to NDFDG2.  TP, (SJ), 4/30/03.

l	s-9. Created new table g2vars.tbl.  Created three functions ctb_g2gnam, 
	     ctb_g2gnum, and ctb_g2read to read in the table, and access its 
	     contents.  Made changes to testctb.c to include these functions.  
	     MG, (SJ), 5/9/03.

l	s-10. changes to g2vars.tbl, add new function ctb_g2gpdn.  MG, (SJ),
	      5/13/03.

l	s-11. change ctb_g2gnam and ctb_g2gnum to add product definition table
	      number.  MG, (SJ), 5/16/03.

l	s-12. Parameter type is now obtained from a table.  TP, (SJ), 5/16/03.

l	s-13. fixed two bugs with entries to the table g2vars.tbl.  MG, (SJ),
	      5/27/03.

l	s-14. Fixed errors on HP platform found during testing.  TP, (SJ), 
	      5/30/03.

l	t. T258:  Fixed watch states input problem which only allow to read one
	   state. Also fixed minor problems in cvgdump.  TL, (SJ), 4/15/03.

m	u. T250:  Preliminary low-level delivery for creation of Volcanic Ash 
	   Advisory (VAA). This includes two new elements for product generation 
	   - the VAA volcano element and the VAA ash cLoud element - added to 
	   vgstruct.h as well as associated display and diagnostic routines.  
	   DP, (SJ), 7/1/03.

m	u-1. Addressed test report 678.  Also modified the new PGEN structures 
	     for the VAA ash cloud and volcanos to account for requirements 
	     changes.  DP, (SJ), 7/25/03.

m	u-2. Deliver Smithsonian table of volcanos in original format to 
	     $GEMPAK/data/tables (new directory). This table in alphabetical
	     order should be the starting point for all NAWIPS volcano tables.
	     DP, (SJ), 7/28/03.

m	u-3. More adjustments to the new VAA elements vgstruct.h.  Included
	     changes for dumpvgf, testcvg, and tag conversion programs.  DP, 
	     (SJ), 7/29/03.

m	u-4. Added basic volcano element into PGEN.  HZ, (DP), 8/11/03.

m	u-5. Recreated the table "volcano.tbl" from the master Smithsonian
	     volcano table. Changed the related routine reading the table.
	     RT, (DP), 8/12/03.

m	u-6. Additional changes to the VAA volcano element:  1) include WMO ID,
	     2) include Next Advisory, 3) split observed date/time into 2 parts,
	     4) increase length of "from" line strings, 5) set max number of ash
	     cloud points to 50.  DP, (SJ), 8/12/03.

m	u-7. Created pgvaa_createfrom and pgvaa_createtext.  RT, (DP), 8/18/03.

m	u-8. Fixed 683.P1, where after drawing a volcano, "left-mouse" can draw 
	     a close line, however, the line disappear after the "middle-mouse" 
	     button.  Fixed 683.P2, where on the platforms of IRIX6, AIX4, SUNOS5,
	     and LINUX2.x, editing or typing values in the "location" of "VAA 
	     Volcano Create" window kills NMAP/NMAP2.  Added two fields for 
	     volcano element in vgstruct.h.  HZ, (DP), 8/21/03.

m	u-9. 1)  Added extended attributes into volcano edit window.  2)  Created
	     "VAA Save" window for volcano text product.  HZ, (DP), 9/4/03.

m	u-10. Fixed the following bugs reported in TP691:  P3) After using the
	   "Reset" button, the selected items in the "Information Source" window
	   are still highlighted. They must be individually selected again to
	   clear them.  P4)  On SUN, The "Information Source" box is not wide
	   enough to be able to see the full names.  P6)  For "OBS ASH TIME", the
	   'z' should be capitallized.  P7)  The free text portions of the
	   message need new line feed characters.  P8)  The volcano's name should
	   be all caps. and replace the underscores with spaces.  P9)  Remove the
	   extra space between the elevation numbers and the "ft" units.
	   P11)  The 'Z' is missing from the 'OBS ASH DATE/TIMES:' time string.
	   HZ, (DP), 9/17/03.

m	u-11. Removed the buttons for the Volcano and Ash Cloud elements from the
	      product generation palette for SIGMETs.  SJ, (DP), 9/24/03.

m	v. T287:  Added shapefile processing software to gempak libraries.
	   MG, (TP), 7/28/03.

m	v-1. Removed some unused variables in reducebnd.c  Created reducebnd_link.
	     RT, (TP), 7/31/03.


006.	GPLT Changes

i	a. T153:  Add outline and marker/symbol plot to BND parameter.  New 
	   function GPLBND allows access to bounds display processing from any 
	   application.  Done, DP, (SJ), 8/30/02.

i	a-1. Fixed bug in program ATEST.  Done, DP, (TP), 9/3/02.

i	a-2. Added capability to fill counties in warnings and SLS routines, 
	     GG_WARN and GG_WSTM.  Done, DP, (SJ), 9/13/02.

i	a-3. Minor bug fix in clo_bgnext.  Bounds parts containing more than 
	     LLMXPT points were not being handled properly.  Done, DP, (SJ), 
	     9/13/02.

i	a-4. Bug fix (assign vrbl cfipx) and change bounds type from CNTY_BNDS 
	     to ZONE_BNDS.  Done, DP, (SJ), 9/20/02.

j	a-5. Allow outlining as an option in NMAP2 and GPMAP for identifying
	     counties for miscellaneous data types WARN and SVRL, and for
	     identifying zones for miscellaneous data type WSTM, instead of
	     plotting a marker.  This outline capability replaces the "fill"
	     option introduced into GPMAP in patch i, and is a first step in
	     "decluttering."  (The default method for indicating counties and
	     zones has not changed.  It is to display a filled marker at the
	     county or zone centroid.  The marker symbol is user-selectable
	     in NMAP2 but not in GPMAP.)  If a WARN, SVRL or WSTM message is a 
	     "test", a hollow marker will be plotted at the county or zone
	     centroid to indicate this, and no outlining will be done.
	     DK, (DP), 11/19/02.

j	a-6. Make outline line width for miscellaneous data types WARN, SVRL,
	     and WSTM user-selectable in NMAP2 by using the "Edit Source"
	     attributes pop-up to change the symbol attribute width using the
	     slider bar.  Default outline line width in both NMAP2 and GPMAP
	     is now 3.  DK, (SJ), 11/27/02.

j	a-7. Changed the plot order of the data in NMAP2. The map is now plotted
	     before any miscellaneous data, but after any VG files.  SJ, (DP),
	     12/3/02.

k	a-8. Modified winter storm display (WSTM) to set a plotting hierarchy 
	     based on message type.  Winter storm warnings now overplot watches,
	     which in turn overplot advisories.  DK, (SJ), 3/10/03.

l	b. T256:  Fixed the contour problem when the data range is very big 
	   (Reported by Aviation Weather Center).  RT, (SJ), 4/9/03.

l	c. T253:  Fixed a problem on the discontinuity of the latitude plot
	   when the pole is in view.  TL, (SJ), 4/15/03.


007.	Device Drivers			

f	a. This release corrects the stop looping button behavior.  It now 
	   functions to stop looping regardless of the number of frames in the 
	   loop.  Heretofore it did not function if a loop contained only a base 
	   map (no data).  The GUI functioned, but the actual looping was not 
	   halted, and in fact, became out of synch with the GUI.  Done, ES, 
	   (SJ), 10/3/01.

f	b. T003D:  Added a new pattern type in IPATLN, #16, to draw a double 
	   line.  Done, JW, (SJ), 10/12/01.

f	b-1. Added a new object "double line" to NMAP/NMAP2.  Done, JW, (SJ), 
 	     10/15/01.

f	b-2. Adjusted the size of the segments for the double line in splpat.tbl. 
	     This is a fix to test report #503.  The other issues listed in that 
	     test report will not be addressed since the double line will be used
	     for specific purposes.  The line will always be smoothed, with no 
	     fill and no sharp angles in the products for which the line was 
	     developed.  Done, SJ, (ES), 10/19/01.

f	c. Fixed core dump found by the CDB due to bad radar data.  Done, TP,
	   (SJ), 11/15/01.

g	d. T085:  Fixed the latest burn-in problem where, when pgen was running 
	   with elements drawn and a loop, other than the one that is in view was 
	   loaded with a roam factor.  The first frame of the viewed loop ended 
	   up burned in.  The problem was in the roam setup; it was destroying 
	   the master pixmap copy.  The xw driver at that stage was not able to 
	   differentiate between the current loop (meaning the one for which 
	   pixmaps were being loaded), and the viewed loop (which owned the 
	   master pixmaps).  Done, ES, (SJ), 1/28/02.

h	e. T113:  Modified NC device driver to allow the user to specify the
	   dimensions of the output.  Modified NTRANS to read the dimensions 
	   from the file header and set up the display appropriately.  Done, 
	   RT, (SJ), 4/9/02.

h	e-1. Updated the help for DEVICE to include information about the
	     xsize and ysize for the NC driver.  Done, SJ, (SS), 4/16/02.

i	e-2. Changed the calculation of the output dimensions in the NC driver
	     to round to the nearest pixel instead of truncating.  Fixed NTRANS
	     to properly swap the file head info for linux.  Done, ML, (SJ),
	     7/11/02.

h	f. T127:  Created a GPFAX application program to display 6-bit fax files.
	   Created a CRNFAX library function that reads the 6-bit fax file and 
	   makes a raster image.  Modified XW device driver to display the 6-bit 
	   fax product as an image.  Modified PS device driver to make the 6-bit 
	   fax produce a postscript.  Modified GIF device driver to make the 
	   6-bit fax product a gif file.  Modified TIFF device driver to make 
	   the 6-bit fax product a tiff file.  Done, RT, (SJ), 5/29/02.

h	f-1. Added a gempak/source/cgemlib/cpg sub-directory. Made changes to
	     some compile and link scripts.  Done, RT, (SJ), 5/30/02.

h	f-2. Updated the help file for the GPFAX program.   Added GPFAX to 
	     hlpbld and pdfbld scripts.  Done, SS, (SJ), 6/13/02.

h	g. T141:  Wrote new family of routines to set group type and group number
	   correctly for the elements in an output vg file created by GPMAP.
	   Done, DK, (SJ), 6/14/02.

h	g-1. Fixed problem in delivery 007g, in which GDPLOT2 assigned the 
	     correct group type but generated a group number of zero for all 
	     groups.  Done, DK, (SJ), 6/18/02.

h	h. Modified CRNEXZ to clear the memory used from the previous image
	   if the space needed for the current image is less than, or equal to, 
	   the previous image.  Done, SC, (ES), 6/20/02.

i	i. T175:  Fixed a bug in the VG driver that caused it to slow down 
	   considerably when numerous elements are added to an output VG file, 
	   one at a time.  Done, SJ, (DK), 8/20/02.

i	j. T179:  Create a preference table and a new set of routines to read the
	   preference table and return strings or boolean variables.  Done,
	   HZ, (SJ), 8/27/02.

i	j-1. Solved 583.P1, where program seg. faults if the maximum number of 
	     characters (25) is exceeded for the tag name.  Solved 583.S1 & 
	     583.S2, where the software should be case insensitive for the tag 
	     name.  Done, HZ, (SJ), 8/29/02.

i	k. T154:  Modified the XW device driver to allow the use of 24-bit 
	   graphics.  N-AWIPS was modified to operate on workstations where 24-bit
	   graphics is set as the default.  The XW device driver has been enhanced
	   to allow the use of 24-bit TrueColor visual setting.  Necessary changes
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

	   Note that each 24-bit pixmap requires three times the memory of a 8-bit
	   pixmap.  Thus, GUI applications such as NMAP/NMAP2 use three times the
	   memory when running on 24-bit graphics workstations.

	   N-AWIPS operation and functionality are not affected on workstations
	   that have 8-bit graphics set as the default with the following
	   exception.  To mitigate the required re-load of imagery when loading a
	   color look-up table (LUT) for 24-bit graphics workstations,  satellite
	   images now use the LUT name specified in the table:
	   $GEMTBL/sat/imgtyp.tbl as their default.  Previously, the default LUT
	   for satellite images was hard-coded to gray.

	   Done, AP, SC, SJ, (DP), 9/16/02.

i	k-1. Made the color buttons in the color bar of ncolor and ntrans 
	     inactive when running with 24-bit as the default.  Done, SJ, (DP), 
	     9/19/02.

i	k-2. Fixed the script "nprog_make" to include NSHARP.  Done, SJ, (DP),
	     9/19/02.

i	k-3. Changed the table imgtyp.tbl to have the default look-up table for
	     all IR images set to GRAY.  Done, SJ, (SS), 9/24/02.

j	k-4. Initialized all colors to black for 16 and 24 bit displays.  Fixed
	     color allocation in NTL.  Done, SC, SJ, (DP), 10/22/02.

j	k-5. Put the call to IM_LUTF after the call to GCLEAR in gd programs
	     gdcntr, gdmap, gdstream, and gdwind.  Done, MG, (SJ), 11/5/02.

l	k-6. Fixed a problem reported by the AWC where GIF images created on a
	     16-bit display were skewed.  Fixed the routine that prepares the
	     pixmap for writing to the GIF file by checking for the line 
	     padding and removing the padding, if present.  The pad removal was 
	     being done for 8-bit displays.  The code was generalized to also
	     handle the 16-bit displays.  The 24-bit displays never have line 
	     padding added to the pixmap.  SJ, (TP), 5/21/03.


j	l. T198:  Fixed reading of packed radar images that are received by the
	   university community over NOAAPort.  Done, SC, SJ, (DP), 10/22/02.

j	m. T183:  Use first and last pause (dwell) when "rocking" frames.
	   Done, HZ, (SJ), 10/22/02.

j	n. T215:  Fixed NMAP2 bug where if the user accesses a loop with no data 
	   and increments, decrements or loops the frames, the frame counter 
	   indicator shown in the lower left corner of the main NMAP2 window, 
	   incorrectly is incremented or decremented.  It has been reported this 
	   will sometimes cause NMAP2 to crash.  HZ, (SJ), 12/4/02.

k	o. T239:  Fixed a bug reported by the AWC, where the GEMPAK GIF Device 
	   Driver fails when switching from DEVICE = gif|big.gif|800;600 to 
	   DEVICE = gif|small.gif|200;150 in the same gpmap session.  
	   SJ, (DP), 2/10/03.

k	p. T240:  Added the ability to draw the "big box" of information for the
	   Sig Wx Mid-level charts for the AWC. The "big box" contains the 
	   cloud cover, cloud types, turbulence and levels, icing and levels
	   and convection and levels.  SJ, (DP), 2/25/03.

k	p-1. Implemented a new text element to represent the midlevel cloud
	     information box in product generation.  JW, (SJ), 3/5/03.

k	p-2. Changed the spacing of the "words" in the Mid Level "Big" Text box.
	     SJ, (DP), 3/6/03.

k	p-3. Completed the implementation of the midlevel cloud text box in
	     product generation.  JW, (SJ), 3/7/03.

k	p-4. Fixed the bugs reported as T641:P3 and T641:P4.  JW, (SJ), 3/10/03.

l	p-5. Fixed the memory leak in nmap_pgtxt.c.  JW, (TP), 5/12/03.

m	p-6. Dismissed the drawing of turbulance/icing if they are not forecast
	     in Middle Level Cloud text, i.e., no string is entered in the
	     "Top/Base" text box.  The size of the MLC box is reduced
	     appropriately if turbulance/icing are not forecast.  JW, (SJ),
	     7/29/03.

m	p-7. Enhanced the drawing of middle level cloud text as suggested in
	     T680:O1, O2, O3, O4: (1)bounding all the turbulance symbols within
	     the MLC information box; (2) limiting the input for the top/base
	     level to digits, 'x', 'X' and one '/'.  JW, (SJ), 8/15/03.


k	q. T244:  Made radar display code handles the 0.25 km Velocity images.
	   Fixed NMAP2 crashes when $SAT or $RAD points to an empty directory.
	   RT, (SJ), 3/7/03.

k	r. T225:  added new parameter NFILLPAT to gemprm.h, set it to 7  
	   removed parameter NPATFL from device driver's header files
	   defined new fill patterns for each of the four device drivers 
	   (xw, ps, tiff, fax)  created new fill patterns for nmap2  MG, (SJ), 
	   3/17/03.

k	r-1. Updated icon file for the Wide-spaced Slanted Line fill type.
	     Updated the help file for FLINE.  SJ, (SS), 3/18/03.

l	s. T251:  added symbols A, C, X, N, both transparent and filled to the
	   special symbol table, number 42 through 49.  MG, (SJ), 4/14/03.

l	s-1. forgot to copy icon files into d-livery directory.  MG, (SJ), 
	     4/15/03.

l	s-2. Added new combo symbol #28.  MG, (SJ), 4/17/03.

l	t. T248:  Change the value of MAX_PIXMAP from 88 to 128.  HZ, (SJ),
	   4/22/03.

l	t-1. Fixed the MAX_FRAME bug reported in T657. This long-lasting 
	     problem is caused by an "array index out of boundary" in function
	     dsp_loadLoop().  JW, (SJ), 5/20/03.

m	u. T278:  Fixed the hotkey dysfunctioning after zooming.  JW, (SJ),
	   6/30/03.


008.	General GEMPAK Program Changes 		

f	a. T023:  Grouped high/low symbols and labels on grid contour 
	   applications per HPC/MPC/TPC's request.  Done, TL, (SJ), 10/15/01.

f	b. T040:  Fixed a bug in GDDIAG reported by SPC. The problem occurred
	   when multiple grid diagnostics are performed while grid files were
	   not properly closed. It can be reproduced on HP.  Done, TL, (SJ), 
	   10/16/01.

f	b-1. Rehashed file handling in GDSTAT so that same grid file can be
	     used for I/O.  Done, TL, (SJ), 10/19/01.

f	b-2. Fixed grid file handling problems on HP in that a open file needs
	     to be closed before reopened.  Done, TL, (SJ), 10/23/01.

f	c. T055:  Changed the INCLUDE in GDXGTS from DGCMN.CMN to GEMPRM.PRM.
	   DGCMN was not necessary, only some parameters from GEMPRM were needed 
	   by the routine.  Done, SJ, (SS), 11/16/01.

f	d. T024:  Added new capability to GEMPAK in that the contour fill can
	   use different fill patterns: solid, hash, and diagonal line.  Done,
	   TL, (SJ), 11/21/01.

f	e. T011:  Added a new program, GPLTLN, provided/requested by AWC, which
	   plots latitude/longitude lines with a selected marker.  A plus sign
	   is placed at the intersections of the latitude/longitude grids.
	   Done, TL, (SJ), 11/28/01.

f	e-1. Added Caspian and Black Seas to the world bounds file.  Done, AH,
	     (SJ), 11/30/01.

f	e-2. Added the AWC program VGGREP to the source Contrib directory.  The
	     program searches for the existence of specified element types in a
	     VG file.  Done, SJ, (ES), 12/3/01.

f	e-3. Added the AWC program VGMOD to the source Contrib directory.  The
	     program changes attributes of specified element types in a VG file.
	     Done, SJ, (ES), 12/4/01.
   
f	e-4. Added a new program, GPANOT, requested by AWC, which plots an
	     object on any device. The object can be text, polygon, etc.
	     Done, TL, (SJ), 12/4/01.

g	e-5. Added a new program from the AWC to append multiple VG files
	     together.  The first file is the output file.  The remaining files 
	     listed on the command line are appended to the output file.  Done,
	     SJ, (ES), 1/16/02.

g	e-6. Added a new time utility program.  The program takes command line
	     input and displays the computed time in the UNIX format specified
	     by the user.  Hours and minutes may be added to or subtracted from
	     the input base time.  Done, SJ, (ES), 1/30/02.

g	e-7. Fixed GPLTLN to parse and use the attribute tables associated with
	     a VG file.  Done, JL, (SJ), 1/30/02.

g	e-8. Added definitions in GRIB decoder tables per most recent 
	     documentation.  Done, DP, (SJ), 1/30/02.

g	e-9. Fixed a bug in NFAX, reported by the AWC. When printing a FAX file
	     to PostScript, the data was shifted so that the graphic area was not
	     all on the paper.  Changed the coordinate translation values so that
	     the entire graphic is drawn to the paper.  Done, SJ, (ES), 2/12/02.

g	e-10. Fixed reported problems in DATETIME related to invalid user input
	      values. Also changed the program to use a help file rather than have
	      the help text in the program file.  Done, SJ, (ES), 2/13/02.

g	e-11. Fixed the LOGGING feature in NTRANS. It would not compile correctly.
	      Added in the necessary variables and checks for the macro "LOGGING"
	      set on the compile command line.  Done, SJ, (ES), 3/8/02.

g	f. Fixed NAGRIB core dump with a very large grid.  The size of MXGRIB was
	   increased to 16 * LLMXGD to accomodate the 12-km eta filled grid.  
	   Done, KB, TP, (SJ), 1/16/02.

g	g. T095:  Fixed a bug in GDSTAT that was adding a column of data to
	   global CED grid, e.g. the AVN model.  The output grid then had too
	   many grid points and could not be read in by other programs.  Done,
	   SJ, (DP), 1/30/02.

g	h. T101:  Fixed file open/close problems in SFGRAM. The fix ensures that a
	   single data file can be accessed in a proper and effective manner.
	   Done, TL, (SJ), 3/1/02.

g	i. Fixed the index for the output station data array. The index used to
	   be the group number, but now is the group number minus the smallest
	   group number for the STNMDL group type.  Done, SJ, (SS), 3/27/02.

h	j. T123:  Removed the check for the 256 character limit on the text
	   output of SFLIST.  Done, AH, (SJ), 4/5/02.

j	k. T185:  Fixed high/low text size problems in GD contouring routines.
	   Done, TL, (SJ), 10/11/02.

j	l. T206:  Created a gdplot_gf_link file to directly link gdplot2 to the 
	   gf driver.  This was done to create a more efficient executable for 
	   post-processing.  SS, (TP), 11/12/02.

k	m. T242:  Removed malloc.h from geminc.h.  TP, (SJ), 3/3/03.

k	m-1. Added INT to BYTE data when used with CHAR in aw library per porting 
	     concerns raised by UCAR/Unidata's Steve Chiswell in 2/25/03 memo.  
	     TP, (SJ), 3/4/03.

k	m-2. Fixed PR640:P1, where red book graphics failed in patch k.  TP,
	     (SJ), 3/10/03.

l	n. T257:  Fixed a problem in GDGSFC on Linux, which results in a 
	   segmentation fault when writing the output to a surface file which 
	   does not have write privilege.  Modified error message so it has a 
	   coherent description of the problem.  TL, (SJ), 4/15/03.

l	n-1. Fixed a pre-existing problem in GDGSFC, which produces multiple
	     lines of error message when the surface file does not exist.
	     TL, (SJ), 5/29/03.

m	o. T283:  Fixed a problem with SFCHCK. Some Airep data files would not
	   produce any output in SFCHCK. The array sizes in SFCHCK were set up
	   for a regular surface file and were set to LLSTFL (4800).  The
	   Aireps are stored in a "ship" surface file, which means that up to
	   4999 reports could be stored in each file.  SJ, (DK), 7/11/03.

m	p. T265:  Bug fix (to correct CPC problem) - add calls to GR_FIXA and 
	   GG_MAPS to properly set the grid navigation for subsequent calls to 
	   GTRANS.  Also added/changed some diagnostic print when history file 
	   is being generated.  DP, (SJ), 7/18/03.

m	p-1. New land/water bounds for OPC processing.  DP, (SJ), 7/18/03.

m	p-2. Fix problem with OPC bounds tables.  DP, (SJ), 7/25/03.

m	p-3. Re-engineer the way graph-to-grid (G2G) stores and accesses the 
	     contour line intersections.  Previously, this information was stored
	     in large arrays whose dimensions were functions of the analysis grid
	     dimensions.  As larger and larger grids were being specified, the 
	     intersection storage arrays were growing larger exponentially with 
	     the majority of the memory being unused.  This re-engineering 
	     alleviates this problem by compressing the intersection information 
	     into a single vector with other arrays containing pointers into the 
	     vector.  The overall storage space for the intersection information 
	     has been modified from 1512432 bytes (for a maximum grid size of 
	     349x277 ) to 544016 bytes (for a maximum grid size 1000x1000 and 
	     overall maximum number of intersections of 20000). DP, (SJ), 7/25/03.

m	p-4. Added an ability for NMAP/NMAP2 to accept any amount of loccator
	     entries in the table "locator.tbl".  Currently, the locator is 
	     limited to 20 entries.  ML, (DP), 8/1/03.

m	p-5. Upgrade the cgr_dang calling sequence and add it to uscore.h and
	     proto_cgemlib.h.  DP, (SJ), 9/8/03.

m	p-6. The following improvements were made to the graph-to-grid technique:
	     1) Allow the specification of local minima or maxima which are
	     surrounded by like-valued contours. The contours may be either closed
	     or open against the grid boundary or a bounded area (see 2)).  To
	     specify, place any symbol with a label indicating the desired
	     limit.  2) Allow the specification of one or more bounded areas which
	     will:  a) mask out areas of the grid (set grid point values to 
	     missing) which are either inside or outside the bounded area, b) 
	     prevent contour line information to be "seen" from opposite sides of
	     peninsulas or other land masses.  Please note that circumpolar 
	     bounded areas will addessed in a future release.  Note also that 
	     using bounded areas may substantially increase the number of "shadow"
	     areas, i.e, those grid points that can "see" only one contour line or
	     none at all. This phenomenon may result in undesireable grid point 
	     values in those areas.  To alleviate this, depict as many contour 
	     lines as reasonably possible, keeping in mind the bounded areas.  3)
	     Bounded areas may be simulated with contour lines.  Closed lines
	     with the label "-9999" will mask all points inside their area;
	     closed lines with "9999" will mask all points outside their area.
	     4) Line extensions are no longer shown by default when the analyzed
	     grid is contoured. Extensions may still be viewed by clicking
	     "Show Extensions".  Also, the function cgr_range was improved to use
	     different intermediate working coordinate systems depending on the 
	     requested output coordinate system.  If the requested output is 'G' 
	     (or 'I' or 'Q'), then 'I' is the intermediate working coordinate 
	     system; otherwise it is 'L'. This change should have no effect to the
	     current application since none require 'G' as output.  Graph-to-grid,
	     however, does.  DP, (SJ), 9/12/03.

m	p-7. Create new OPC bounds files with new VGFTOBND code which
             sets longitude bounds to (-180,180) if bound crosses ID.  DP,
	     (SJ), 9/17/03.

m	p-8. Minor bug corrections to graph-to-grid.  DP, (SJ), 9/22/03.

m	p-9. Remove unnecessary call to determine if min/max(s) are inside closed
	     contours. (This was causing a seg fault)  DP, (SJ), 9/23/03.

m	p-10. More bug fixes:  1) allow for group types HIGH and LOW (in addition
	      to LABEL).  2) handling of extrema testing was not precise enough;
	      changed algorithm for checking whether extrema get used.  DP,
	      (SJ), 9/24/03.

m	q. T279:  Modified GDGRIB so that it can convert a grid larger than 
	   LLMXGD to GRIB-1 (except on AIX4).  tHIS IS Achieved by bypassing 
	   the grid diagnostics for existing grids.  TL, (SJ), 7/25/03.


009.    NMAP

f	a. This release addresses a recently located bug connected with sp file 
	   loading.  This bug results in vg elements being drawn to an incorrect 
	   garea.  While it is not fatal (a refresh or switching loops clears 
	   the problem), it is annoying.  Done, ES, (SJ), 10/01/01.

f	b. T038:  Fixed an SPC reported bug, which is in evidence only when the
	   number of files in a data directory equals or exceeds 87.  The
	   problem was that an internal assignment of the n + 1 data source time 
	   string to null did not take into account the number of loaded times.  
	   If the array was full the assignment still took place, writing to the 
	   space now occupied by the source on flag (making it 0 or off).  This 
	   was a long standing bug (since at least 06/00, and probably much 
	   earlier).  Done, ES, (SJ), 10/11/01.

f	c. This release addresses bug #499:O1.  If the data window is closed from
	   the window manager menu item "Close", it can result in vg elements 
	   being drawn to an incorrect garea.  While it is not fatal (a refresh 
	   or switching loops clears the problem), it is annoying.  Done, ES, 
	   (SJ), 10/12/01.

f	d. T039:  This release fixes a problem discovered by the AWC.  The 
	   validation routine used to determine if an image source in an sp 
	   file is ok was incorrectly filling in the path for SAT and RAD 
	   sources.  The bug only became apparent when an environement variable 
	   other than $SAT was used to locate the top of the SAT tree.  Done, 
	   ES, (SJ), 10/15/01.

f	e. T034:  The wipe control in the main window always resets to the 
	   default map.  Now it only resets the map if an image source had been 
	   included in the wiped data set.  Done, ES, (SJ), 10/15/01.

f	f. T041:  Fixed a problem with sp file loading discovered by the AWC.  
	   The counting mechanism routine used to determine how many times had 
	   been loaded in a source contained an error in the algorithm.  This 
	   resulted in the number of sources being decremented by one if all the 
	   times had been filled.  The bug only became apparent when restoring 
	   an sp file when the dominant source directory contained 87 or more 
	   times.  Done, ES, (SJ), 10/16/01.

f	f-1. Change the definition of MAX_FRAME in nmap_data.h, which fixes test 
	     report 505:S1.  The available frames has a limit of 87 but this 
	     should be 80, as that is the maximum number of frames of data that 
	     can be loaded in nmap2.  Done, HZ, (ES), 11/7/01.

f	g. T031:  Fixed a bug when plotting lightning data in NMAP2. If the
	   attributes of the symbols were changed, the marker would change from
	   the "+" and "-" to a filled circle.  This problem also affected 
	   other MISC data types that plot symbols, except WARN.  Done, SJ, 
	   (DK), 10/16/01.

f	h. T036:  Fixed a bug reported by the TPC. The bug was that if using
	   the "Set Time" feature on image data, where there is no data within
	   the last 2 days, the navigation was not set to the image navigation. 
	   Added setting of the image navigation to the callback functions of 
	   "Set Time".  Done, SJ, (ES), 10/19/01.

f	i. T035:  Fixed the mess that occurs when the pgen ghost line is active
	   and the roam box is moved.  Done, ES, (SJ), 10/19/01.

f	i-1. Fixed  bug report 507:P1.  When using the roam arrow buttons and the
	     pgen ghost line is active (in the middle of drawing a linear element)
	     the ghost line becomes a confused mess.  This release applies the 
	     fix to the roam box motion callback to the arrow callbacks.  Done, 
	     ES, (SJ), 10/24/01.

f	j. Fixed a cdb located bug in the data window.  If the data window is up
	   and the sp file selection window is up, the data window control buttons
	   (Load and Cancel) are still accessible.  Hitting load when a sp file
	   is being read and processed will cause odd behavior in the data
	   window, and an incomplete load.  With this release the data window
	   control buttons ignore any press actions if the sp file load window 
	   is up.  Done, ES, (SJ), 11/8/01.

f	k. This is a more complete fix for the data window and spf selection 
	   window interaction issues.  The fix yesterday (009j) solved the 
	   immediate problem, but left some unresolved interaction issues, such 
	   as being able to open both the spf and new source selection windows 
	   simultaneously.  Done, ES, (SJ), 11/9/01.

f	l. T053:  Fixed the cdb bug resulting in burn-in if pgen is exited with 
	   the map window up.  Turns out nmap had solved this problem before but 
	   the fix had not been incorporated into nmap2. Done, ES, (SJ), 11/20/01.

f	l-1. Updated selected NMAP/NMAP2 help files and supporting tables.  These
	     include map selection help files and supporting map tables.  Also, 
	     updated selected product generation help files and added more 
	     detailed help for modify and group actions.  Done, SS, (SJ), 12/6/01.

f	m. T066:  Fixed a bug related to sp files.  The error is actually in the
	   nmap_dataw.c module, though it was only apparent when an sp file which
	   contained a loop with a single VGF source was loaded.  The problem
	   was that the number of frames was incorrect when a VG file was the
	   dominant source.  Done, ES, (SJ), 12/5/01.

g	n. T069:  Fixed memory leaks and closed open files in cgemlib, nmap2, 
	   pgen, and nxmlib found by purify.  Done, TP, (ES), 12/17/01.

g	n-1. Removed unused variable out of vfwpwn and vfwsel.  Moved line length
	     wrap variable to top of program for vfwawn.  Removed XtFree from
	     NxmBxmBtn.c.  Done, AH, (TP), 12/19/01.

g	n-2. A write past the end of a text string is fixed in nmap_pgsigw.c.  
	     The popdown routines for circle, line and text elements were
	     repeatedly called when not needed and were needlessly updating and
	     re-updating the settings table each time the middle mouse button was
	     clicked.  Fixed a bug in the element settings update process.  The 
	     settings struct is sometimes used to store group type information 
	     for specific element types.  Accordingly, the ces_set routine was 
	     changed (03/01) to check the grptyp value in the header of the passed
	     in vg element.  However, in the majority of cases the vg element 
	     structure sent into ces_set never contained an initialized value for
	     grptyp.  We have lucked out in that more often than not, whatever 
	     garbage the grptyp field contains is not a meaningful group type 
	     number.  This change adds a header initialization routine to load 
	     the element header with valid default values.  It is called before 
	     the current values are loaded into the element, and the default 
	     values are then overwritten as necessary.  Done, ES, (SJ), 12/20/01.

g	n-3. Removed an unnecessary dynamic memory allocation (and resultant
	     memory leak) from the icon tip mechanism in the Nxm library.  Done,
	     ES, (SJ), 12/27/01.

g	n-4. Fixed a problem found by "purify" utility. Initialized a variable
	     in the cloud height module.  Done, TL, (SJ), 1/2/02.

g	n-5. Plugged major leaks in nmap and ntrans.  Fixed other warnings
	     found by purify.  Done, TP, (SJ), 1/2/02.

g	n-6. Plugged major leaks in nsharp.  Set return values for GN driver 
	     routines.  Fixed other warnings found by purify.  Done, TP, (SJ), 
	     1/14/02.

g	n-7. Fix to a problem in the GIF driver. The string for the output file
	     name was being freed too early and the file name was undefined.
	     Done, SJ, (TP), 1/23/02.
	    
g	n-8. Cleaned up resource files, NTRANS, NSHARP and fixed mnemonics.
	     Done, TP, (SJ), 2/5/02.

g	n-9. Added a new argument to GG_WARM, and made corresponding changes to 
	     modules which call GG_WARN.  Done, RT, (TP), 2/6/02.

g	n-10. Restructured the machanism for retrieving the track interval
	      times from a table.  A single table entry is read in the original
	      machanism which is inefficient and slow.  Now, all table entries
	      are read once into an array of strings for use.  Done, JW, (ES),
	      2/7/02.

g	n-11. Fixed report #534:P1, gpmap crash. New variable added to gg_warn 
	      was already used as a dummy output.  Done, TP, (ES), 2/7/02.

g	n-12. Fixed report #535:P1, nsat crash on Linux.  Done, TP, (ES), 2/13/02.

g	n-13. Fixed more memory leaks.  A search of 'Xm...GetString' and
	      'XmString...' as well as calloc and malloc were manually checked.
	      Done, TP, (SJ), 2/27/02.

h	n-14. Fixed memory leak in xw driver found during map editing.  Done,
	      TP, (SJ), 4/8/02.

h	n-15. Removed duplicate call to XCreateGC.  Fixed Freeing Non Heap Memory
	      (FNH) error found while testing NSAT.  Fixed core dump with NxmWarn
	      found while testing.  Done, TP, (ES), 4/12/02.

h	n-16. Fixed UMRs found while testing NMAP.  Done, TP, (SJ), 4/12/02.

h	n-17. Fixed UMR when returning from cvg_scan.  Before this fix, parts of
	      the element structure were checked for values even when they had
	      none.  Done, ES, (SJ), 4/24/02.

h	n-18. Fixed a UMR in the cds_symb() routine.  Only one of the seven
	      input variables to gstext() was set.  Done, ES, (SJ), 4/29/02.

h	n-19. Removed the unncessary popup for the logo placement in NMAP2.
	      Originally, when the user select "OFF" for a logo, the "Apply to
	      all loops" dialogue box pops up even though that logo is already
	      "OFF" in all loops. In this case, it is unnecessary and is thus
	      removed now.  Done, JW, (ES), 5/6/02.

h	n-20. Eliminated the full file name option from the RBK driver.  Done,
	      AH, (SJ), 5/6/02.

h	n-21. Fixed uninitialized memory read error in the TIFF device driver.
	      Done, SJ, (ES), 5/6/02.

h	n-22. Purified all SF and SN programs.  Done, TP, (SJ), 5/7/02.

h	n-23. Removed a param named garea from zoomw_setZoom function.  Removed 
	      nmpgmapstr.c and all references to it.  Done, HZ, (ES), 5/23/02.

h	n-24. Fixed ABR in cst_srch.  Removed unused routine mapspnt.f.  Fixed
	      date/time display in text window and closed files being left 
	      open in NWX.  Done, TP, (SJ), 5/29/02.

h	n-25. Removed duplicate include Nxmlib.h from $GEMPAK/source/nxmlib.
	      Done, TP, (SJ), 5/30/02.

h	n-26. Removed a variable "extra" from crg_gettxtbox().  Done, HZ, (ES),
	      5/30/02.

h	n-27. Fixed test report #566:P1, NWX crashes if previous button selected
	      prior to selecting a station on the map.  Fixed ABR found with 
	      purify.  Added RR_DATA to master.tbl for fflood/obs.  Added 'No 
	      current watches found' message.  Done, TP, (SJ), 6/20/02.

h	n-28. Un-deliver changes to FL_DOPN to check write access vs. 
	      permissions.  Done, SJ, (SS), 6/26/02.

i	n-29. Fixed search for multiple reports in one file for Current Watch 
	      Boxes.  Fixed display of Date/Time in text window for Current 
	      Watch Boxes.  Done, TP, (SJ), 7/8/02.

i	n-30. Fixed previous/next button for plotData.mode VALUE and GRAPHIC.
	      This only affected two datatypes, UVI and QPF.  Also removed 
	      interface.h which is no longer required.  Done, TP, (SJ), 7/10/02.

j	n-31. Initialized a variable in a CFL routine.  TL, (SJ), 12/4/02.

l	n-32. Bugs noted by the SPC:  Removed '...' after the watch replacement 
	      number.  Corrected the cancellation time of the replaced watch from
	      the ending time of the replacement watch to the valid time of the 
	      replacement watch.  Corrected a line length problem with the 
	      'EFFECTIVE' line.  Initialized 'strin' in testvf.c.  AH, (SJ), 
	      4/24/03.


g	o. T016:  Added a capability for NMAP2 to apply the map and map related
	   settings from one loop to another.  An "Apply Map Setting" button was 
	   added to the map window, when the button was clicked, a window was p
	   opped up, which contained the map settings, Zoomed area, overlays and 
	   Roamed setting options, and the target loops options. The Apply button
	   applied the map settings from the current loop to the selected loops.  
	   Done, ML, (ES), 1/11/02.

g	o-1. Added a capability for NMAP2 to get the map and map related settings
	     from a specific loop, and apply to the current loop.  Also, fixed
	     the ROAM not applied problem.  Also, replaced the bitmap buttons of 
	     "Apply/Get Map settings" with push buttons on the map window.  
	     Cleaned up the toggle button settings on the "Apply/Get Map settings"
	     window.  Done, ML, (ES), 1/28/02.

g	o-2. Fixed the "Apply Map Settings" not working correctly.  A changed 
	     file (nmpsproj.c)  was not submitted with last hand-off.  Done, ML, 
	     (ES), 1/30/02.

g	o-3. Fixed #533:P1, P2, P3 - data reloading and projection error problems.
	     Done, ML, (ES), 2/7/02.

g	o-4. Fixed a map window bug where results in the main window are not being
	     reloaded after choosing custom as the predefined map area.  Done,
	     ES, (SJ), 2/13/02.

g	o-5. Fixed #537:P1, unintentional unzoom.  It also uses a consistent 
	     reference to the current loop.  Done, ES, (SJ), 2/14/02.

g	o-6. Changed the map setting windows (get and apply) to always appear on 
	     top of the map window.  Done, ES, (SJ), 2/15/02.

m	o-7. Modified nmap_mapset.c to treat all unremapped images the same.
	     This fixes a bug found by the spc/tpc with unremapped satellite 
	     images.  TP, (SJ), 7/18/03.

g	p. T009:  Fixed the bug in the SPF Confirmation Window when restoring a large 
	   SPF file.  Done, RT, (ES), 1/16/02.  

g	q. T090:  Modified the resource file to place the group control box in a more 
	   helpful position.  To this point it has been initially located directly over 
	   the pgen palette.  Done, ES, (SJ), 1/30/02.  
	   
g	q-1. Adjusted the range record size for lines, fronts, and circles.  Done, ES, 
	     (SJ), 1/30/02.

g	q-2. Fixed the problem where the group action was not terminated when 
	     the data window starts.  Done, ES, (SJ), 1/31/02.

g	q-3. This release saves changes made to the group type within the line, 
	     front, and symbol attribute windows.  These changes are remembered 
	     by object.  Done, ES, 9SJ), 3/4/02.

g	q-4. Corrected the group structure underlying the ces_gt* routines. 
	     It also modifies the new sigwxcnv program to use the correct 
	     initialization routine.  The ces changes are in preparation for 
	     storing and using the group type by layer.  Done, ES, (SJ), 3/4/02.

g	q-5. This release accomplishes setting and remembering a group default 
	     value for a layer.  This layer value is what is initially placed in 
	     the popup group type menu in the group action window.  Done, ES, 
	     (SJ), 3/4/02.

g	q-6. Altered the behavior of the connect tool with respect to grouping.
	     If either element in the pair being connected is grouped, then the 
	     resulting element from the connection will be grouped.  Further, if 
	     the other elements which are grouped with the connecting pair will 
	     be included in the end group.  Done, ES, (SJ), 3/6/02.

g	q-7. Removed the group type popup menu from the outlook product window.
	     Done, ES, (SJ), 3/13/02.

h	q-8. Created a new function CRG_GGNHL to retrieve the largest and smallest
	     group number of the input group type. Modified CRG_GGNXT. Replaced
	     the calling to CRG_GGNXT with CRG_GGNHL in some PGEN functions to
	     improve modularity and performance.  Done, ML, (ES), 4/5/02.

h	q-9. Compressed the group number sequences for a given file when it is 
	     loaded into product generation.  Done, ES, (SJ), 4/9/02.

h	q-10. Fixed the label menu problem for lines, fronts, and symbols, when
	      the specified group type from the settings table is not in the 
	      grptyp.tbl.  Done, ES, (SJ), 4/9/02.

h	q-11. Changed the param list for ces_gtggrps() to eliminate the need for
	      the calling routine to guess the size of the string it needs to 
	      send in.  Added a new function ces_gtgavid() which maps a group 
	      type to the index number in the available groups.  Separated 
	      "Change All Groups window" from nmap_pggrpw.c and generated a new 
	      file "nmap_pggrpch.c".  Done, HZ, (SJ), 4/9/02.

h	q-12. Fixed a bug in the outlook product window.  An old call to the
	      group module was inadvertently left in after the last change to 
	      the outlook module.  This resulted in a bad output file name in 
	      some circumstances.  Done, ES, (SJ), 4/10/02.

h	q-13. Improved the assignment of group numbers to labeled objects.  The
	      group number is incremented by 1 now, not by 2 when placing such 
	      objects.  Done, ES, (SJ), 4/12/02.

h	q-14. Corrected a problem with the group number compression mechanism.  
	      An FUM (freeing unallocated memory) error occured in certain 
	      circumstances, resulting in an application crash.   Also the two 
	      new cvg routines were renamed to bring the routine names into 
	      harmony with the file names.  Done, ES, (SJ), 4/17/02.

h	q-15. Fixed a problem recently discovered in the crg_clearLayer routine, 
	      which resulted in incomplete wiping of range records when using 
	      delete all.  Done, ES, (SJ), 4/18/02.

h	q-16. Removed FUNC_LABEL, and created a new mechanism to track label
	      placement event.  Done, ML, (ES), 4/19/02.

h	q-17. Highlight the group action instead of the select while grouping.
	      Done, ML, (ES), 4/29/02.

h	q-18. Reengineered nmap_pggrpw.c.  Done, HZ, (ES), 5/2/02.

h	q-19. Add a capability for the PGEN to allow lalbe placement when 
	      grouping is active.  Done, ML, (ES), 5/10/02.

h	q-20. Corrected bug 560:P1, where while grouping, drawing lines, fronts,
	      or symbols with labels had the group handlebars turn off after the 
	      label was placed.  This was misleading -- the grouping action was 
	      still grouping objects together, but the handlebars were removed, 
	      suggesting the grouping was not taking place.  Done, ES, (SS), 
	      5/16/02.

h	q-21. Modify the Current Group menu in the Change All Groups window to use
	      the master group list as the source.  Done, HZ, (ES), 5/20/02.

h	q-22. Created a label volcano menu window in the PGEN, the window was
	      popped up for volcano selection when a volcano symbol was drawn
	      or selected. The menu included a list of Volcano names. The name and
	      lat/lon of the selected volcano would be drawn in the text window
	      in a box.  Done, ML, (DP), 6/12/02.

h	q-23. Fixed a "Place Symbol" not being grouped problem.  The symbol and 
	      associate label were not grouped when using "Place Symbol" to place
	      the symbol.  The reason is that the group type and group number of 
	      the label could not be specified when using "Place Symbol" to place
	      the symbol.  Also modified the format of the Volcano Label Format.
	      Done, ML, (DP), 6/17/02.

g	r. T096:  Fixed a bug reported by the SPC when attempting to access
	   a grid restore file that does not exist. Added checks on the return
	   code returned by NGD_RSFL to stop processing and generate an error 
	   message.  Done, SJ, (ES), 2/12/02.

g	s. T099:  Modified the station model edit module in NMAP2 to check for
	   out-of-bounds color values.  Done, SJ, (ES), 2/26/02.

g	t. T106:  Fixed problem report #541.  Data window cancel problems with 
	   SPF.  Done, HZ, (ES), 3/13/02.

h	u. T122:  Modified NSF_TLST and NSN_TLST to add 15/30 minutes to end time
	   before starting the time range computations.  Done, ML, (SJ), 4/5/02.

i	u-1. Remove the 15 minutes to endtime in nsftlst.f.  Remove the 30 
	     minutes to endtime in nsntlst.f.  Done, RT, (SJ), 7/26/02.

i	u-2. Plot observational data before the top of the hour in NMAP2.  Done,
	     ML, (SJ), 9/11/02.

i	u-3. Added check for values greater than 20 minutes, setting them to
	     20 minutes.  Also, updated the documentation for the prefs.tbl.
	     Done, ML, (SJ), 9/18/02.
	     
h	v. T119:  Added the source edit parameter strings to the SP files, which 
	   allows the saving and restoring of the data sources' attibute 
	   settings.  Done, JW, (ES), 4/12/02.

h	v-1. Added the overlay edit parameter strings to the SP files, which 
	     allow the saving and restoring of the map overlay's attibute 
	     settings.  Done, JW, (SJ), 4/29/02.

h	v-2. Fixed SPF crash bugs: 1) a roam factor not listed in "nmap_roam.tbl" 
	     may be accepted as valid to be restored and point to a nonexistent
	     roam button thus crash NMAP2.  2) restoring an SP file with certain 
	     short length ( ~ less than 40 charactors ) and no valid data sources
	     in it crashes NMAP2.  Done, JW, (ES), 4/30/02.

h	v-3. Added the single time mode strings to the SP files, which allows the
	     saving and restoring of the single time mode settings.  Also, broke
	     down the data source attribute string to multiple lines for 
	     readiblitity (for surface & upper air sources).  Done, JW, (ES), 
	     6/12/02.

h	v-4. Fixed problems with the data selection timeline in nmap2 in 
	     connection with adding single time selection to sp files.  Done, ES,
	     (SJ), 6/20/02.

h	v-5. Fixed problems with the timeline tick marks being reset when
	     switching loops. (Report #571: All)  Done, SJ, (SS), 6/24/02.

k	v-6. Added an option for displaying the SPF confirmation window, the 
	     option can be set in the prefs.tbl.  ML, (SJ), 1/2/03.

k	v-7. Fixed the SPF bugs reported by SPC (Test Report 624).  RT, (SJ),
	     2/11/03.

l	v-8. Fixed the spf saving problem that there is no attribute saved for
	     UAIR_FCST.  RT, (SJ), 4/2/03.

l	v-9. Changes to cst_gtag to account for "\<" in the tag string.  New
	     paired function to insert a "\" before any "<" in a tag string.
	     DP, (SJ), 6/5/03.

l	v-10. Added an escape character '\' before character '<' in the SPF tag
	      value to avoid the confusion with the start of another tag.  JW, 
	      (SJ), 6/5/03.

h	w. T098:  Fixed the loop alignment problem after roaming.  Done, JW, (ES),
	   4/12/02.

h	x. Fixed SGI bug, where when the ZOOM button was clicked, the button would
	   not change from blue to red.  The problem was caused by mis-typed 
	   variables in setting the size of the button pixmap when changing the 
	   color to red.  Done, SJ, (ES), 6/13/02.

h	y. T143:  Responded to a request by AWC to allow the translation of the
	   wild card character, "*", to be used at the end of the image file
	   name, e.g., YYYYMMDDHHNN.*.  Done, TL, (SJ), 6/17/02.

i	z. T149:  Changed the check for the cycle time in nmap_obs from looking 
	   for the substring "MOS" to using the sub-category number in 
	   datatype.tbl.  Done, SJ, (DP), 9/11/02.

i	z-1. Created a set of decoder/bridge functions which decode Sea Ice Drift 
	     data and store in a GEMPAK surface file.  Done, TL, (SJ), 9/11/02.

i	z-2. Added new entry to IDFT station models.  Done, TL, (SJ), 9/13/02.

j	aa. T192:  The SPC reported a problem when printing frames from NMAP2.
	    The data was shifted in relation to the map on all but the last
	    frame. Added a check for printing to the function dsp_loadFrame
	    in order to make sure that the projection, and margins, are set for 
	    each frame.  Done, SJ, (DP), 10/10/02.

j	bb. T181:  Add color look up table (LUT) to the SPF files.  Correct a 
	    problem that no entry on Enhancement List matches the default 
	    SAT IMG LUT file.  Done, HZ, (SJ), 10/16/02.

j	bb-1. Added a check for lut files in spf. If lut file exists, use it; 
	      if not, use DEFAULT.  RT, (SJ), 12/6/02.

j	cc. T201:  Created a new Nxmlib module NxmPushBtnMenu.c which attaches
	    a popup menu to a push button.  Added new features "Auto-Update Lock"
	    and "Auto-Update Unlock".  Added key accelerators 'a' to toggle 
	    auto-update on/off, and 'A' to toggle auto-update lock/unlock.  
	    RT, (SJ), 11/7/02.

j	cc-1. Fixed 609:P1 by adding the new actions mbtnw_autoUpdtToggle and 
	      mbtnw_autoLockToggle to the list of actions in NMAP.  SJ, 12/6/02.

k	cc-2. Changed the interface of NxmBxmBtn_create() and 
	      NxmBxmBtn_createMulti() to increase the response time of button 
	      click to satisfy the HPC user.  RT, (SJ), 1/27/03.

j	dd. T211:  Fixed a bug where a double print is produced while looping 
	    with aero freames.  HZ, (SJ), 12/4/02.

j	ee. T220:  Fixed NMAP2 to allow the display of upper air forecast data
	    types (CAT_SNF/SCAT_SNF). Only set the mandatory level data flag
	    for upper air observations.  SJ, (DP), 12/6/02.

j	ee-1. Fixed NMAP2 to allow editing of the station models for the upper
	      air forecast data types (CAT_SNF/SCAT_SNF).  SJ, (TP), 12/10/02.

j	ee-2. Added the model point forecast data for surface and upper levels
	      to NMAP2. Added the upper level data sets to the table for NSHARP.
	      KB, SJ, (AH), 12/10/02.

j	ee-3. Added MODEL_SND and MODEL_SFC to the environment variables.  SJ,
	      (SJ), 12/13/02.

j	ff. T221:  Fixed file name length in the miscellaneous data library.
	    TP, (SJ), 12/13/02.

k	gg. T226: Modified to not allow re-display the roam control box after an
	    auto-update.  HZ, (SJ), 1/2/03.

k	gg-1. Modified to not allow re-display the roam control box after an
	      auto-update.  HZ, (SJ), 1/6/03.

k	gg-2. Fixed test report 618:01, where the roam control window would 
	      appear after changing loop and returning to current loop.  HZ,
	      (SJ), 2/27/03.

k	gg-3. Rollback to Patch j for NMAP2's nmap_auto.c and nmap_roamw.c to
	      correct roam problems found at the AWC and SPC.  TP, (SS), 4/7/03.

l	gg-4. Major roam upgrade.  Fixed roam menu sensitivity errors.  Fixed 
	      UNIX/X signal handling error in Busy.  Fixed wrong roam after 
	      change loop in data window then cancel.  Fixed bug found by AWC 
	      where lat/lon incorrect after auto_update.  Added identification 
	      of active roam value by desensitizing roam button.  Added radar 
	      data as valid size of image roam option.  TP, (SJ), 4/17/03.

l	gg-5. Removed unneccessary XCopyArea and XFlush from logo_createPxms.
	      TP, (SJ), 4/22/03.

l	gg-6. Fixed dirty roam window when switching between images with 
	      different aspect ratios - add XClearWindow.  Also modified 
	      roamw_setup to not call roam popup related functions unless 
	      loop is in view.  TP, (SJ), 4/22/03.

l	gg-7. Replaced reading pixmaps with including them in the file for busy.c
	      TP, (SJ), 5/6/03.

l	gg-8. Modified nmap_auto.c to load all loops with one call to dsp_setBusy.
	      TP, (SJ), 5/7/03.

l	gg-9. Fixed bug in Modified nmap_auto.c to load all loops with one call to
	      dsp_setBusy.  TP, (SJ), 5/13/03.

m	gg-10. Added roam sharing option to nmap2.  Also added sensitizing
	       option menu on/off buttons.  TP, (SJ), 6/24/03.

k	hh. T230: Fixed the incorrect display upon a month selection in NMAP/NMAP2
	    "Set Time" option, as described in PR612P1.  JW, (SJ), 1/13/03.

k	ii. T224:  Added surface level selection of sounding data to Nmap2.  
	    Enabled sounding data loading from the data selection window.  TL, 
	    (SJ), 1/13/03.

k	ii-1. Ensured that sounding data loads properly from the data selection
	      window when filter values are changed.  TL, (SJ), 2/3/03.
	      
k	jj. T238:  Fixed the time-matching function in the NGD library to allow
	    analysis grids to match imagery that has auto-updated.  SJ, (DK),
	    1/29/03.

k	kk. T237:  Fixed bug where KP_Left, KP_Right, KP_Up, KP_Down didn't
	    navigate as designed on lnx265.  HZ, (SJ), 2/6/03.

l	ll. T259:  Fixed roam bug when hot keys are combined with the mouse.
	    TP, (SJ), 3/31/03.

l	mm. T249:  Added an option for the QSCT to plot the wind data in the 
	    second colors.  If the rain flag is true, plot the data in the 
	    second colors, which may be different from the colors of non-rain 
	    winds.  ML, (SJ), 4/30/03.

l	mm-1. Added an option for the QSCT to plot the time stamp on the QuickScat
	      data.  The interval, color and line width of the time stamp could
	      be edited in nmap2 and the miscset.tbl table.  ML, (SJ), 5/13/03.

l	mm-2. A problem was reported by the OPC where NMAP2 would crash when
	      plotting the QuikScat data with a skip value larger than zero.
	      The problem was that the time stamp was being processed even if 
	      the data was not swapped properly for Linux.  SJ, (DP), 6/19/03.

m	mm-3. Fixed fatal core dump in nmap2 when restoring ATCF attributes
	      from an SPF file.  TP, (SJ), 7/2/03.


l	nn. T266:  Compute cloud height using T-12 h upper-air data (instead of
	    climatology) for closest sounding search and moist-adiabatic method.
	    Climatology table is employed only for standard atmospheric sounding
	    search.  TL, (SJ), 5/2/03.

l	nn-1. Initialized variables properly to solve the problems of getting 
	      cloud height when an old sounding file resides in the local 
	      directory.  TL, (SJ), 5/12/03.

l	oo. T246:  Added an option for AIRM to plot the turbulence data in the
	   second color above certain flight level.  Added level filter for AIRM 
	   to plot the data inside the filtered levels only.  ML, (SJ), 5/20/03.

l	oo-1. Updated help file for AIRM.  SJ, (SS), 5/20/03.

l	pp. T269:  Changed the location of the "Data Selection Window" to be
	    higher on the screen. Changed the location of the "Data Source"
	    popup to always be at Y=0.  SJ, (AH), 6/5/03.

m	qq. T275:  Fixed bug found by AWC with >50 radar changes.  TP, (SJ),
	    6/24/03.

m	rr. T271:  Added the day of the week and the forecast hour, if 
	    appropriate, for the current frame be displayed in the bottom left 
	    corner of the main NMAP2 window.  ML, (SJ), 6/24/03.

m	rr-1. Fixed problems #670:P1, O1, O2, and O3 -- text in the bottom 
	      frame widget cut off problems.  ML, (SJ), 7/25/03.

m	rr-2. Fixed problems #679:P1, and P2. -- text in the bottom frame widget
	      cut off problems.  ML, (SJ), 8/12/03.

m	rr-3. Fixed problems #679:P4. -- wrong text in the bottom frame widget 
	      problem.  ML, (SJ), 8/12/03.

m	ss. T267:  This is the phase I delivery for the timeline enhancement 
	    project.  Through the new range/interval window, the user could now 
	    pre-specify a data source's time range and interval before loading 
	    the data.  This provides a machnism for the user to "zoom" in/out 
	    the timeline to check on a specially-interested time period.  
	    JW, (SJ), 7/11/03.

m	ss-1. This is the phase II delivery for the timeline enhancement project.
	      Allow the user to save/restore data sources' timeline range and
	      interval.  JW, (SJ), 7/15/03.

m	ss-2. Corrected T675:O1. The interval value in timeline window is limited
	      to be always smaller than the range. Also, invalid range & interval
	      settings in "datatype.tbl" will be adjusted.  JW, (SJ), 7/18/03.

m	ss-3. Allowed a proper restore of default range/interval value in the
	      "datatype.tbl" if the interval is greater than the range.  Fixed
	      T676:P1 to allow the interval to be equal to as well as smaller
	      than the range.  JW, (SJ), 7/24/03.

m	ss-4. Fixed the problem reported in T684. The acceptable values for
	      range and interval are now 1 to 14400. A too small range may
	      result in the dispppearing of the timeline - which means no data
	      available in that range and a new range is expected.  A range larger
	      than the default value may not cause any changes of the timeline
	      due to the limit of the MAX_FRAME allowed. Also disabled the 
	      range/interval selection for VGF data.  JW, (SJ), 8/15/03.

m	ss-5. Removed Range/Int button on data window for release 5.6.m.  TL,
	      (SJ), 9/10/03.

m	tt. T281:  Added preference option to stop looping at current frame.
	    TP, (SJ), 7/15/03.

m	tt-1. Fixed a bug found by developer when attempting to loop a single
	      frame.  TP, (SJ), 7/25/03.

m	uu. T284:  Fixed P672:  Fix map overlays' marker size slider values.
	    JW, (SJ), 8/13/03.

m	vv. T289:  Fixed a bug found by CDB where popping up the Color Box pushes
	    the Misc Data Edit Box behind the main NMAP2 window for those set to
	    16 or 24 bit color.  AH, (SJ), 9/12/03.


010.	PRODUCT GENERATION

f	a. T015A:  Added a new class of markers to pgen, which included 22 markers
	   that were actually symbols within the pgen GUI.  The users could draw, 
	   move, and copy the markers in different colors on the main window of 
	   NMAP/NMAP2.  Done, MI, (ES), 10/23/01.

f	a-1. Fixed problem #509:P4 - symbol size and width problem.  Increased 
	     the minimum size of the symbol/marker to 0.5, and the minimum width 
	     to 1 instead of 0.  Done, ML, (ES), 10/31/01.
 
f	a-2. Reordered the PGEN marker buttons, turned 'Clear' to default 'ON',
	     and increased the default size for the '.' from 1.0 to 3.0.  Fixes 
	     report 509:P2, P3 and S1.  Done, AH, (SJ), 10/31/01.

f	a-3. Added PostScript and PDF files that show all of the possible
	     GEMPAK symbols and line types.  Done, SJ, (SS), 12/5/01.
	     
f	b. T021:  Created and added two new objects into NMAP/NMAP2: kink pointing
	   lines with an open arrow head or a filled head (Part I)  Currently, the
	   kink position is fixed at the middle point of the line. It will be 
	   adjustable in the next delivery (Part II).  Done, JW, (SJ), 10/24/01.

f	b-1. Initialized a Boolean variable in nmap_pgevt.c. Forgetting to do so
	     disabled "MODIFY" and "CONNECT" functions for lines on some 
	     platforms.  Done, JW, (SJ), 10/25/01.

f	b-2. Added a slider in the "Line Attribute" popup window to adjust the
	     kink position for the two newly-added kink pointing lines.  Done,
	     JW, (SJ), 10/31/01.

f	b-3. Adjusted the behavior and attributes for kink lines as follows:  
	     (1) When toggle between kink line with open head and kink line
	     with filled head, the previous setting for kink position remains
	     unless being changed again. (T512.P1); (2) If the text input for 
	     kink position > 0.75, it is set to 0.75; if < 0.25, it is set to 
	     0.25. (T512.P2); (3) The fill/close/smooth buttons are shaded out. 
	     (T512.S1).  Done, JW, (SJ), 11/8/01.

f	b-4. Disabled "LABEL" capability for kink lines (515:O1).  Done, JW, 
	     (SJ), 11/16/01.

f	b-5. Fixed counting of special lines in PLOTSYMS. The display was
	     duplicating line numbers 9 and 17 due to an error in counting the 
	     number of lines per column in the output.  Done, SJ, (ES), 12/3/01.

f	c. T001:  Revised the pgen grouping scheme to combine the functionality
	   currently included in the Group and Label action buttons.  Also
	   provide a means to draw new elements and add them directly to a
	   group.
  
      1. The user will explicitly start and end the group action. When the
         group action is started any selected elements will be grouped 
         (though there need not be any elements initially selected). The group
         action will continue as long as the user selects the Select, Multi-
         Select, Undo or Redo buttons. Selecting any other action will 
         terminate the grouping action.
      2. These elements will not be allowed to be grouped: Watches, Tracks
         and Sigmets. If the grouping action is active and the user tries to
         select a watch(including watch status line), track or sigmet
         (including CCF or its test), the element will not be selected. A 
         warning will be sent to the Error Box in the lower right corner of 
         the Nmap window.
      3. New elements(other than watch, track, or sigmet)that are drawn will
         be added to the group. This will remain true until the user switches
         the grouping action off. If the user starts to draw a new element of
         class watch, track or sigmet, the grouping action ceases.
      4. If any elements are selected prior to hitting the group action, they
         should be checked for an existing group type. If any element already
         has a group type, the group window's current selection should be set
         to that type. If no elements are selected, then the first element
         which is selected should be checked for a group type. If it has one,
         then the group menu in the group window should be reset to that type.
         After one element is selected, no further checks and resets should occur.
      5. "Label" action button is removed.
      6. Use the middle mouse button to exit group mode.
      7. When adding elements to a group in the grouping action, selecting one
         element of a group will add all elements of that group to the new
         group.
      8. Once the user starts the grouping action the group handle bars(yellow
         triangles and yellow group bounding box) will be used to highlight
         the elements rather than the standard white circle handle bars.
	Done, HZ, (SJ), 10/30/01.

f	c-1. Cleaned up some of the function names in nmap_pghdlb.c.  In the
	     wake of the changes to the grouping action, several functions
	     with very similar names existed within nmap_pghdlb.c.  These have
	     been renamed, and one utilty function has been moved from 
	     nmap_pghdlb.c over to nmap_pgutls.c.  This release contains no 
	     functional changes.  Done, ES, (SJ), 11/1/01.

f	c-2. Fixed bug report 514:P1, 514:P2:  Multi-select will group both 
	     groupable and ungroupable elements.  Multi-select will create 
	     multiple replications of elements by changing group types.  
	     Done, HZ, (ES), 11/14/01.

g	c-3. Fixed  the group type initialization.  The problem was that if the
	     group function was invoked, but no change was ever made in the group
	     type menu, the elements placed ended up in group type 0, meaning they
	     weren't grouped.  Done, ES, (SJ), 12/19/01.

f	d. T051:  Fixed a problem recently discovered by the cdb.  If a line or 
	   front is labeled and the cursor is not moved at all after the line or 
	   front is completed, the label was being placed on the starting point 
	   of the line/front, not the current cursor location.  This change 
	   places the label at the current cursor location.  Done, ES, (SJ),
	   11/8/01.

f	e. T003B:  Added a new special text type to draw text with an icing 
	   symbol.  The icing symbol worked in the same way as the text with 
	   turbulence.  The users can change the attributes of the icing symbols 
	   on NMAP and NMAP2.  Done, ML, (SJ), 11/9/01.

f	f. T015B:  This release allows pgen to create and edit all gempak symbols.
	   Done, ES, (SJ), 11/29/01.

f	f-1. Fixed the text with icing.  Done, ES, (SJ), 11/30/01.

f	f-2. Fixed a bug with the text entry in the symbols window.  Non-numeric
	     data was allowed to be entered in fields that are required to be 
	     numeric values.  The non-numeric values were not acted upon, but it 
	     was sloppy to allow bad data to be entered in the first place.  
	     Done, ES, (SJ), 12/3/01.

f	f-3. Cleaned up the $NAWIPS/icons directory.  Done, ML, (SJ), 12/5/01.

f	f-4. Fixed the warning problem for the markers.  Done, ML, (SJ), 12/5/01.

f	f-5. Added instructions for how to add GEMPAK symbols to the product 
	     generation symbol object palette by updating 
	     $GEMTBL/pgen/symbolbtn.tbl.  Done, SS, (SJ), 12/6/01.

f	f-6. Placed the correct icon for 2-star snow (wxsym071.xbm) in the icons
	     directory.  Done, SJ, (SJ), 12/11/01.
	     
g	f-7. Fixed bug# 520:O1.  The numeric validation routine in nmap_pgutls.c
	     recognized the '.' and '-' as valid characters for numeric data 
	     fields, but allowed multiple instances of each, and positioning of 
	     the negative sign anywhere in the field.  This release tightens up 
	     the validation, allowing only one decimal point and/or negative 
	     sign.  Further, the negative sign must be the first character in 
	     the text field.  The validation routine has also been renamed.  
	     Fixed ABR in nmap_pgtxt.c.  It contains a routine that strips 
	     carriage returns from text fields before placing the text string.  
	     When the text string is 0 length it actually tries to read memory 
	     from _before_ the the starting string position (0).  This situation 
	     takes place any time the text attribute window is opened and 
	     contains no text.  This change avoids the read error.  Done, 
	     ES, (SJ), 12/18/01.

g	f-8. Fixed a small bug related to the symbol text field verification.  
	     With the new verification routine installed the text widgets have to 
	     be wiped before assigning new values, otherwise an erroneous "beep" 
	     is sounded when positioned symbols were selected for editing.  No 
	     other problems occurred as a result, but grew to be annoying.  Done, 
	     ES, (SJ), 12/20/01.

g	f-9. Made corrections on Nmap/Nmap2 icons.  Done, TL, (SJ), 1/3/02.

f	g. T007:  Created "Watch Conference Call (WCC)" popup window.  Created 
	   "Generate Products" pane for "Watch Specifications and County List" 
	   popup window.  Done, HZ, (DP), 12/3/01.

f	g-1. Produce the WCC text message per SPC Appendix F.  Done, DP, (SJ),
	     12/3/01.

f	g-2. Added code to generate WCC launch script.  The filename defaults to 
	     "KNCFNIMNAT.launch."  Done, DP, (SJ), 12/4/01.

f	g-3. Minor fixes to WCC product.  Done, DP, (DP), 12/5/01.

f	g-4. WCC message (launch script) now picks up a second line of WFOs.  The
	     number of separating dots may be any amount.  The number of WFO 
	     characters may be any amount.  Done, DP, (SJ), 12/6/01.

f	g-5. Corrected Track #7 P0&P1.  P0, Eliminate widgets for WCL and Format 
	     Watch.  P1, Once the WCC button is clicked, you cannot ever again 
	     edit the watch, even if you cancel without clicking the middle mouse
	     button twice.  Also, you cannot edit the watch after you "Save" the 
	     product even though the watch edit GUI remains.  Done, HZ, (DP), 
	     12/6/01.

f	g-6. Modified end of line characters to be just the newline character.
	     Removed the two carriage returns at the request of the SPC.  Done,
	     DP, (SS), 12/7/01.

f	g-7. Second attempt at fixing problems listed in g-5.  Done, HZ, (TP),
	     12/7/01.

f	g-8. Corrected 523.P1&P2&P3.  Done, HZ, (DP), 12/10/01.

j	g-9. Fixed bug where WCL would list counties that supposedly were turned
	     off.  Done, DP, (SJ), 10/18/02.

j	g-10. Response to testing of previous fix.  "WCL should not list counties
	      supposedly turned off".  Internal structure in VF library needed to
	      be initialized.  Done, DP, (SJ), 10/24/02.

j	g-11. Fixed problem #595:P1, where if the last state listed in the WCL 
	      and WOU text products had only one county, then the end time would 
	      be output twice at the end of the UGC line for that state.  Done, 
	      SJ, (DP), 11/1/02.

g	h. T005:  Create "points" file when generating outlook according to SPC 
	   Attachment E.  This delivery will generate the individual points files 
	   which will then be combined to produce the Convective Outlook Areal 
	   Outline product. The filename will be: "(group name)_(day)_(time).pts".
	   Done, DP, (SJ), 12/20/01.

g	h-1. Fixed fatal crash on Linux when there are no vg elements in the 
	     expected group type.  Done, DP, (SJ), 12/27/01.

g	h-2. Created a new program to convert the Outlook verification
	     files to the Outlook Points text product.  Done, SJ, (DK), 2/26/02.
	     
g	h-3. Changed the file type strings in the DAT2PTS processing routines.
	     Also added reading of the forecaster name from the .dat files.  The
	     name is not yet written to the output product file.  Done, SJ, (DK), 
	     3/4/02.
   
g	h-4. Remove points product processing from outlook product generation.  
	     Done, DP, (SJ), 3/11/02.

h	h-5. Updated DAT2PTS to ignore extra blank lines and extra lines with
	     "$$" at the end of the file.  Done, SJ, (DP), 4/16/02.

i	h-6. Fixed a bug in DAT2PTS to indicate the correct AM/PM qualifier for
	     times between 12:00 Noon and 12:59 PM.  Done, GG, (SJ), 8/29/02.

g	i. T017:  Added element selection by irregular area to the 
	   increment/decrement, multi-select and group functions.  This means 
	   users can draw a closed unsmoothed ghost line figure.  Once completed,
	   those element which fall within the described figure will be selected.
	   Done, HZ, (ES), 1/25/02.

g	j. T086:  Fixed the Linux platform bug where select "MULTI_SELECT", then 
	   do Ctl+Button1Press on drawing area, NMAP/NMAP2 crashes.  Done, HZ, 
	   (ES), 1/25/02.

g	j-1. Improved upon the fix for the Ctrl-Btn1 combination that is fatal
	     on linux.  Changes have been made to the resource file to trap all
	     button events that occur in the main drawing area.  A Ctrl-Btn1 
	     combination outside of the main canvas will still be fatal on linux, 
	     but the previous fix only prevented such crashes within the context 
	     of multi-select.  Done, ES, (SJ), 1/30/02.

g	k. T100:  Corrected typo in pull-down menu of compass directions for CCFP.
	   Done, DK, (SJ), 2/25/02.

g	l. T110:  Allow the PGEN file open to access files using environment
	   variables in the file path.  Done, SJ, (ES), 3/12/02.

h	m. T126:  From the SPC: Added help info to the title of the save dialog
	   box for the Outlook product.  Done, GG, SJ, (DP), 4/16/02.

h	n. T125:  Fixed the file save problem after appending a VGF file across
	   network.  Done, JW, (ES), 4/22/02.

h	o. T130:  Fixed problems with the watch format window found by the SPC.
	   It enforces limits on the sizes of the text windows and adds 
	   verification routines, and blocks writes larger than the window can 
	   accomodate.  Done, ES, (SJ), 5/2/02.

h	o-1. Fixed bug 556:P1, a crash on Linux and SunOS due to too large of a
	     string in the continuing watches text field.  Done, ES, (SJ),
	     5/7/02.

h	o-2. Generalized and converged the verification routines used for
	     numeric data input into a text widget.  Done, JW, (ES), 5/8/02.

h	o-3. Added the verification callback procedure for the input into the
	     numeric attributes of PGEN elements.  Also fixed a bug in "Hurricane
	     Track" popup window. At the popup, the "Storm ID" may start with 
	     unrecognized characters.  Done, JW, (ES), 5/20/02.

h	o-4. Fixed 559:P1 and 559:P2, where missing and oversized entries in the
	     watch status window caused crashes on Linux and SunOS machines.
	     Done, ES, (SJ), 5/20/02.

h	o-5. Fixed a system beep always sounded when a drawn front was selected 
	     bug in the validation routines used by the front attribute edit 
	     window.  Done, ES, (SJ), 6/4/02.

h	o-6. Removed the verification callback for the times in the track edit
	     window.  The times are in a gempak format with "/", and this was not 
	     allowed by the verification routine.  Done, ES, (SJ), 6/24/02.

i	o-7. Fixed two bugs in the SIGMET drawing. The distance text entry box was
	     erasing the value after it was changed.  Also, the sequence number 
	     would always be changed by to "0" if it was changed by typing. The 
	     arrow buttons would not change the value of the sequence number. 
	     SJ, (SS), 7/3/02.

h	p. Corrected bug in Hurricane Track Window.  The window did not pop down 
	   when it should.  Done, ML, (TP), 5/16/02.

h	q. Fixed a bug in "Show All Groups" function so that clicking the middle
	   mouse button will de-select all the groups and reset the palette to
	   Select.  Done, HZ, (ES), 5/16/02.

h	r. T140:  Built object panel for each class via taking the class' ID 
	   instead of the loop index. This allows that a clipped class panel 
	   still works correctly if the user chooses to redesign the class panel 
	   via editing the "classbtn.tbl". The original mechanism works for a 
	   non-clipped class panel or some certain clips. But it fails for most 
	   cases since the object panels have not been loaded properly for some 
	   classes. Thus clicking on those class buttons could not pop up the 
	   corresponding object panel.  Done, JW, (ES), 5/31/02.

h	s. T132:  Renamed the "Watch Conference Call(WCC)" window to "Watch 
	   Coordination".  Added a popup menu "Preliminary ID" to the Watch 
	   Coordination  window. The menu has single character "A" through "J".  
	   Renmamed "Generate WCC" to "Generate WCC/WCL" in the Watch Spec. 
	   window.  Done, ML, (ES), 6/4/02.

h	s-1. Cleaned up some cosmetic issues with the Watch Coordination window,
	     standardized the size of the list of wfos between modules, and close
	     the Watch Coordination window when the watch is de-selected.  Done,
	     ES, (SJ), 6/5/02.

h	s-2. Updated the full names of the WFOs in wfo.tbl.  Done, SJ, (SS),
	     6/10/02.

h	s-3. Modified the codes that generate the Watch County List (WCL) product
	     to meet the SPC requirement.  Done, RT, (SJ), 6/13/02.

h	s-4. Relocated the WCL report generation from the watch format window
	     to the Watch Coordination window.  When the WCC report is saved, 
	     the WCL window is immediately popped up.  When Save is selected in 
	     this window the WCL report is saved.  Done, ES, (SJ), 6/17/02.

h	t. T136:  Used the county clustering feature to solve the independent
	   city problem, i.e., cities surrounded by the county border, which 
    	   cannot be deleted in a watch box.  Done, TL, (ES), 6/10/02.

h	t-1. Modified the watch element structure by removing the "cn_stat"
	     field and increased the number of maximum counties to 400.  Done,
	     JW, (ES), 6/14/02.

h	u. Fixed a file save problem.  Done, ES, (SJ), 6/25/02.

i	v. T160:  Fixed bug found by SPC for General Thunderstorm Outlook Case
	   with only one grouped element.  Done, TP, (SJ), 7/11/02.

i	w. T165:  Fixed the problem where  the phone in the "WCC Save" GUI does 
	   not appear if a Watch letter other than 'A' is selected.  Done, HZ, 
	   (SJ), 7/23/02.

i	x. Fixed the problem where the date in the "Expiration Time" widget does 
	   not change when the time selection is changed in the "Watch 
	   Coordination" GUI.  Done, HZ, (TP), 7/31/02.

i	y. T164: Corrected problem with the track element where the track line
	   was improperly located if the number of times was changed after
	   editing it.  Also, changed default time interval in the setting.tbl
	   from 62 to 30 minutes.  Done, HZ, (SJ), 8/7/02.

i	y-1. Fixed the vertical scroll bar for the "Track Results" window.
	     Done, HZ, (SJ), 8/14/02.

i	z. T167:  Added overline text and overline fill text.  Done, TL, (SJ),
	   8/19/02.

j	aa. T184:  Fixed core dump caused by insufficient string length for 
	    user-provided VGF file template in tables.  Done, DP, (SJ), 10/8/02.

j	bb. T187:  Fixed the garbage display problem in the warning of Outlook 
	    PROD when more than one group type was found in an outlook vg file.  
	    Done, ML, (SJ), 10/8/02.

j	cc. T199:  Fixed incomplete watch status message, where great lakes and
	    adjacent coastal waters missing in wsm ID line.  Done, DP, (SJ),
	    10/23/02.

j	dd. T193:  Added a new product generation action EXTRAP, which 
	    extrapolates a single object or a group of objects, given an input 
	    speed, direction, and duration.  Done, JW, (SJ), 11/1/02.

j	dd-1. Added documentation of the extrapolation action to the Product
	      Generation help file for NMAP/2.  SJ, (TP), 11/25/02.
	      
j	ee. T202:  Made the "Volcano_list" a cascading GUI where volcano names 
	    are accessed by selecting a starting letter group, e.g., A-C. Each
	    group should have no more than about 15 volcanoes.  HZ, (SJ), 11/7/02.

j	ee-1. Removed duplicate entries from volcano.tbl.  MG, (SJ), 11/25/02.

k	ee-2. Fixed the possible mismatch between the volcano name & its lat/lon
	      position.  JW, (SJ), 5/21/03.
	      
j	ff. T216:  Added a check for a null filename and added a warning asking
	    to enter a non-null filename.  MG, (SJ), 12/3/02.

j	gg. T214/218:  Fixed a bug where the hide/show function gets out of synch
	    when leaving product generation.  Fixed a bug where on hp64, when the
	    user draws an element, the action buttons expand and the pg palette 
	    window also expands.  HZ, (SJ), 12/4/02.

j	hh. T217:  Changed radio buttons, which failed with Motif 2.1.30 on AWC 
	    linux machines, to check buttons in nmap2, nmap, and nsat.  ML, TP,
	    (SJ), 12/10/02.

j	hh-1. Fixed problem #611:P1 - pair of sounding data options in the cloud
	      height window not match.  ML, TP, (SJ), 12/13/02.

k	hh-2. Fixed 611.O1, where if in PGEN the text box for cloud level or 
	      turbulence is clicked and then the icing box is clicked, the bottom
	      half of the label "icing" and its box for the icing symbol are 
	      truncated.  After doing this, the "turbulence" label and turbulence
	      symbol are truncated for the other text boxes.  However, if the 
	      icing box is clicked prior to any other text boxes, then this 
	      truncation does not occur.  HZ, (SJ), 1/2/03.

k	ii. T229:  Fixed the shrinking down of the VG file dialog box as described
	    in PR614.  The problem was caused by the improper manage/unmanage
	    sequence of the main file dialog box.  JW, (SJ), 1/8/03.

k	jj. T223:  Add marker attributes to the watch box VG element, the Watch
	    attributes GUI and prefs.tbl.  HZ, (SJ), 1/9/03.

k	jj-1. Removed vgstruct.h from the cds and ces functions.  ML, (TP), 
	      1/9/03.

k	jj-2. Updated CVG, CDS library files and PGEN files to accommodate
	      WatchBox Version 5 (latest version is 6).  Now county marker type,
	      size and width are changable through WatchBox attributes w_mrktyp, 
	      w_mrksiz and w_mrkwid.  HZ, (SJ), 1/22/03.
	      
k	jj-3. Add default WatchBox marker info. into setting.tbl. Add marker type,
	      size and width selection GUI on Watch Attributes window. They get 
	      the default values from settin.tbl and users can change them on the 
	      fly when drawing watches.  HZ, (SJ), 1/29/03.

k	jj-4. Fixed bug where marker residue from large markers remains after 
	      switching to small markers.  Fixed bug where counties don't change 
	      after reshaping watch box.  HZ, (SJ), 2/4/03.

l	jj-5. Change the mininum value of size sliderbar for Watch and Maker.
	      HZ, (SJ), 4/10/03.

l	jj-6. Added watch marker info. into uattrbd.tbl and modified the related
	      files that make use of the watch marker info. in this table.  
	      HZ, (SJ), 5/12/03.

l	jj-7. Fixed a problem reported by the SPC where changing the attributes
	      of the markers for watches that have been issued, changes the watch
	      to not be issued and resets the watch number.  Fixed the setting.tbl
	      entries for watches for the type and colors.  They now match what 
	      was set up in the source code.  SJ, (DP), 5/27/03.

k	kk. T231:  Fixed Bug #615. The "pgplette" does not refresh itself after 
	    the "Line Attributes" window popped down by clicking "ZOOM".  RT, 
	    (SJ), 1/13/03.

k	kk-1. Fixed test report #637:P1.  The warning message:  "Warning: null 
	      child passed to XtManageChildren" occurred because there was no 
	      check for the product generation palette before a call that 
	      refreshed it.  Therefore the refresh was being performed on a 
	      non-existent widget.  SJ, (DP), 3/3/03.

k	ll. T227:  Modified cvg_write to only allocate tmp_el when swapping and 
	    to skip cfl_seek for sequential writes.  Modified nmap_pgfiw.c to use 
	    sequential write option in open and save VGF.  TP, (SJ), 2/6/03.

l	ll-1. Removed .DEFAULT.vgf file instead of marking every element in it as
	      deleted when the user is doing a "Replace" and layering is inactive.
	      HZ, (SJ), 4/9/03.
	      
k	mm. T243:  Fixed bug #623.O1, where for any closed pattern line, when a 
	    partial delete is performed, the directiion of the pattern is 
	    reversed.  HZ, (SJ), 3/5/03.

k	nn. T245:  Modified the format of Excessive Rainfall, removed product 
	    header, and QPF, removed duplicate points, fixed spacing).  SJ, 
	    (DP), 3/10/03.


011.	General GUI Modifications	

f	a. T030:  Fixed malformed callbacks in nmap_pgpalw.c.  Added full 
	   prototypes to callback functions in proto_nxmlib.h.  The resultant 
	   code changes are mostly adding the XtCallbackProc cast to some 
	   callbacks.  Added float.h to geminc.h per UCAR/unidata request and
	   removed redundant X11 include files from numerous include and source 
	   files.  Done, TP, (SJ), 10/11/01.

f	a-1. Removed redundant '\0' from sprintf calls.  Removed unused variables.
	     Added parentheses around compound if clauses.  Done, TP, (SJ), 
	     10/30/01.

f	a-2. Fixed the software title string in the TIFF file.  The string must 
	     end with a NULL and if the length is odd, have another NULL to end 
	     the file.  This was improperly implemented and has now been fixed.  
	     Done, SJ, (ES), 10/31/01.

f	a-3. Last and least, cleaned up test and utility main programs including
	     explicity typing main, removing unused variables, removing '\0' from
	     sprintf calls, adding parentheses around compund if statements and
	     correcting format statements.  Done, TP, (SJ), 11/9/01.
	     
f	b. T026:  Made the help text box display using a nonproportional font, 
	   and adjusts all the calling programs to size the help text display 
	   to 80 columns ((characters).  Done, ES, (SJ), 10/12/01.

f	b-1. Modified GUI help files such that lines are <= 80 characters,
	     only 2 spaces are at the end of a sentence, the TAB key is NOT used,
	     table-like information and lists are indented, titles are centered,
	     and all lines begin in the 1st column.  Done, TP, (SJ), 10/16/01.

f	b-2. Fixed content of the help files for Cloud Height and Graph-to-grid.
	     (Fixes for test report #504 problems 1 and 2.)  Done, SJ, (DP),
	     10/23/01.

f	b-3. Corrected test report #504:01.  The new fonts for the Help window 
	     did not display well on hpux10 boxes.  This release uses a font 
	     that is common to all platforms.  Done, ES, (SJ), 10/23/01.

h	c. Increased the maximum possible help files for an application from 30 
	   to 50.  Done, ES, (SJ), 5/21/02.

j	d. Update the Makefile for Busy to use the environment variable $XLIBS
	   instead of hardcoding the list of X and Motif libraries.  Done, SJ,
	   (SS), 10/8/02.

m	e. T272: Move NxmGmpk.c to nxmlib.  TP, (SJ), 6/23/03.

m	e-1. Replace local copies of gmpk_init() with NxmGmpkInit().  TP, (SJ),
	     6/23/03.

m	e-2. Fixed problem with $MAPFIL caused by the addition of ip_init in
	     NxmGmpkInit for NSAT and NWX.  Cleaned up NWX, in_bdta and gg_init
	     were being called twice.  TP, (SJ), 7/15/03.

m	e-3. Consolidated GEMPAK registration routines.  TP, (SJ), 7/25/03.

m	e-4. Fixed bug in NSAT.  TP, (SJ), 8/11/03.

m	f. T273:  Replaced XAllocNamedColor with new XW driver function xsncolr.c.
	   TP, (SJ), 6/23/03.

m	f-1. Removed xwcmn.h from files by replacing gemdisplay, et al. with Xt
	     macros.  Also fixed long standing bug with nsat display of pixmaps
	     in resized window.  TP, (SJ), 7/9/03.

	f-2. Eliminated xwcmn.h from NxmGmpk.c  TP, (SJ), 8/11/03.
	
m	g. T285:  Removed $NAWIPS/include.  Moved the only two (2) NXM include 
	   files to $GEMINC.  TP, (SJ), 7/15/03.

m	g-1. Removed all references to NAWIPS_INC.  TP, (SJ), 7/24/03.

m	g-2. Made prototype for scandir.c consistent with ansi c.  TP, (SJ),
	     7/25/03.
	     
m	h. T191:  Removed creation of the busy icon and removed the invoking of 
	   the Busy program.  TP, (SJ), 7/15/03.


012.	NTRANS			

013.	NSAT		

014.	NWX	

g	a. T078:  Fixed the bug of NWX crashing when trying to look at Fire 
	   Weather Forecasts with a size larger than REPMAX (80000).  Done, RT, 
	   (SJ), 1/17/02.

g	a-1. Increased REPMAX from 80,000 to 100,000 per the SPC.  Done, SJ, 
	     (SJ), 1/17/02.

h	b. T124:   Fixed bugs in NWX when trying to read from an empty file.
	   Done, RT, (SJ), 4/16/02.

h	b-1. Fixed Problem Report 555:P1. NWX crashes if the environment
	     variable TEXT_DATA does not exist and the user selects a second
	     station marker.  Done, SJ, (ES), 5/6/02.

i	c. T163:  Reinstated the select by state option at AWC's request.
	   Done, TP, (SJ), 7/26/02.

i	c-1. Fixed test report numbers 577:P1 and 577:P2, where NWX crashed or
	     malfunctioned with a combination of state mode and 48 hours of obs.
	     Done, TP, (SJ), 8/13/02.

i	c-2. Fixed TR#582:P1,P2,&P3.  Now use state and country id to find all
	     stations in a "state" or "country".  Done, MG, (TP), 8/23/02.

m	c-3. List the stations in alphabetic order in NWX when selected by state.
	     RT, (SJ), 7/25/03.

j	d. T186:  Added a new color for DAY3 QPF in NWX. Previously, the contours
	   of QPF data displayed in two colors (red and green), DAY3 contours 
	   display in the same color as DAY1's.  Done, ML, (TP), 10/8/02.

l	e. T262:  Add an append mode to the text window in NWX.  RT, (SJ),
	   4/22/03.

l	e-1. Fixed BUG:656.  RT, (SJ), 5/21/03.

m	e-2. Fixed bug 666.  RT, (SJ), 6/24/03.

m	e-3. Fixed bug for NWX print.  RT, (SJ), 6/24/03.

m	e-4. Fixed bug #671: after switching product type, can not select
	     previously selected stations.  RT, (SJ), 7/15/03.


015.	NSHARP

f	a. T043:  Prototyped NSHARP and made changes suggested by UCAR/Unidata.
	   This completes all three sub-tasks 43A, 43B, and 43C.  Done, TP,
	   (SJ), 10/19/01.

f	a-1. Fixed test report problems #506:P1 and P2. Problem 1 was introduced 
	     in patch f and it affected the storm visualization display.  Problem 
	     2 was an existing bug involving the re-display of parcel information
	     after changing the parcel level.  Done, TP, (SJ), 10/23/01.

g	b. T083:  Added map area selection to NSHARP.  Done, SC, SJ, (ES),
	   1/17/02.

j	c. T194:  Increased the station list dimension for model sounding.  Fixed
	   file selection GUI for model soundings.  Changed Nsharp resource file 
	   to access grid and model soundings.  Done, TL, TP, (SJ), 10/28/02.

j	c-1. Added map selection and zooming for Model and PFC data.  Added 
	     help buttons and files.  SC, TP, (SJ), 12/3/02.

k	c-2. Add new functionality to generate a souning in NSHARP from a 
	     cursor location selected in NMAP(2).  RT, (SJ), 2/25/03.

k	c-3. Modified table and help file. Corrected typo for testctb.c.  
	     RT, (SJ), 3/5/03.

k	c-4. Fixed NSHARP documentation for entering a point for the model
	     data.  SJ, (SS), 3/17/03.

l	c-5. Modify the routines ctb_rdcpf (read cpf file) and ctb_wrcpf (write
	     cpf file) to accept the cpf filename in the calling sequence.
	     DP, (SJ), 3/31/03.


016.	NFAX

017.	MAP FILES		

f	a. T022:  Created 5 new maps and boundary files for the HPC, MPC, and TPC
	   seamless surface analysis.  Done, AH, (SJ), 10/9/01.

f	a-1. Added a paragraph to each file describing the seamless surface map
	     file names.  Done, AH, (SJ), 12/5/01.
	     
f	b. T057:  Created two new maps for the AAWU; Alaskan aviation zones,
	   hiznak.ncp and Anchorage FIR, hifiak.ncp.  Done, AH, (SJ), 11/30/01.

f	c. T054:  Updated the County, County Warning Area, Public Forecast Zone,
	   Marine and Offshore Zone maps. These changes are in responses to
	   SCN 01-51, SCN 01-54, SCN 01-56 and to errors reported by other
	   offices.  Updated sfstns.tbl with Canadian station CXVG, Violet Grove.
	   It was conflicting with XVG, Longville, MN.  Done, AH, (TP), 12/6/01.

g	d. T073:  The roads data has been updated.  The new roads are taken 
	   directly from the USGS national Atlas of the US, Map Data Layers 
	   Warehouse.  Done, AH, RT, (TP), 2/7/02.

g	d-1. In response to SCN 02-08, marine zones for HFO (Honolulu HI) were
	     modified.  In response to SCN 01-75,  Broomfield County was added to
	     CO in BOU.  In response to SCN 01-75, CO zones 39, 40 and 43 were 
	     modified to incorporate the new Broomfield county.  Done, AH, (TP), 
	     3/12/02.

g	d-2. Updated zones.tbl with 03/16/02 shapefile. Changed AZZ028 from
	     Central_Deserts to NW_and_North_Ctrl_Pinal_County.  Done, RT, (TP),
	     3/20/02.

h	d-3. Updated tables with 22 March 2002 County Shapefile.
	     Done, RT, (TP), 4/5/02.

h	d-4. Modified mefbna.ncp per HPC directions.  All regions within the
	     largest region were removed.  Done, TP, (SJ), 4/23/02.

h	d-5. Created two new maps for MPC, mefbao.ncp and mefbpee.ncp.  Done,
	     TP, (SJ), 4/29/02.

h	d-6. Updated Public Forecast Zones with 25Apr02 shape file in 
	     response to SCN 02-29 and SCN 02-32.  Done, RT, (TP), 5/16/02.

h	d-7. Updated County Warning Areas with 25Apr02 shape file.
	     Done, RT, (TP), 5/16/02.

h	d-8. Updated Counties with 25Apr02 shape file.  Done, RT, (TP), 5/16/02.

h	d-9. Updated Public Forecast Zones with 24 May 02 shape file.  Done,
	     RT, (TP), 5/30/02.

h	d-10. Updated tpc215.ncp and ssa_bnd.tbl to extend southern boundary to 
	      20S per request of the MPC.  Removed extraneous PR label from 
	      hpc050.vgf, mpc050_atl.vgf, mpc215_atl.vgf, mpc215_pac.vgf, 
	      tpc050.vgf.  Done, TP, (SJ), 6/12/02.

h	d-11. Updated Marine Zones with 24 May 02 shape file.  Done, RT, (TP),
	      6/18/02.

h	d-12. Updated Offshore Zones with 17 May 02 shape file.  Done, RT, (TP),
	      6/18/02.

i	d-13. Updated Public Forecast Zones with 26 Jun 02 shape file.  Done,
	      RT, (TP), 7/11/02.

i	d-14. Created River Basins with 14 May 02 shape file.  Done, RT, (TP),
	      7/19/02.

i	d-15. Updated River Basins with 18 Jul 02 shape file.  Done, RT, (SJ),
	      7/30/02.

i	d-16. Updated Public Forecast Zones with 31 Jul. 02 shape file. Done,
	      RT, (SJ), 8/6/02.

i	d-17. Updated Public Forecast Zones with 30 Aug. 02 shape file.  Done,
	      RT, (TP), 9/19/02.

i	d-18. Updated Counties with 30Aug2 shape file.  Done, RT, (TP), 9/20/02.

i	d-19. Created new Public Forecast Zones bounday files.  Done, AH, (DP), 
	      9/20/02.

i	d-20. Updated Marine Zones with 10 Sep. 02 shape file.  Done, RT, (TP),
	      9/23/02.

i	d-21. Corrected the Public Forecast Zones boundary files.  Winter
	      storm advisories, watches and warnings were not being displayed
	      by markers or a boundary fill in parts of CO, WY, CA, NV and AK.
	      Done, AH, (DP), 10/2/02.

j	d-22. Updated Public Forecast Zones with 10/04/02 shape file.  RT, (TP),
	      11/12/02.

j	d-23. Changed centroid information from calculated geographic to the 
	      attending WFO location in CWA bounds table.  DP, (SJ), 12/6/02.

k	d-24. Updated Counties with 10 Dec. 02 shape file.  RT, (SJ), 1/6/03.

k	d-25. Updated Public Forecast Zones with 12/10/02 shape file.  RT, (SJ),
	      1/6/03.

k	d-26. Updated County Warning Areas with 10 Dec. 02 shape file.  RT, (SJ),
	      1/6/03.

k	d-27. Updated Marine Zones with 02/24/03 shape file.  RT, (SJ), 3/4/03.

k	d-28. Updated Public Forecast Zones with 02/24/03 shape file.  RT, (SJ),
	      3/4/03.

k	d-29. Created a new bound area for the Pacific Region and added it to the
	      Seamless Surface Analysis (SSA) bounds file. Also created a map 
	      file for the new area.  SJ, (DP), 3/10/03.

k	d-30. Fixed problem, (642:P1), reported with the new Pacfic Region map 
	      file, pr2.ncp.  SJ, (SS), 3/17/03.

k	d-31. Updated Public Forecast Zones with 03/06/03 shape file.  RT, (TP),
	      3/20/03.

k	d-32. Updated Marine Zones with 03/10/03 shape file.  RT, (TP), 3/20/03.

l	d-33. Per HPC request, from map file bwx1224.ncp, created associated vgf 
	      and bounds files.  Added entry in clo.tbl.  DP, (SJ), 4/14/03.

l	d-34. Updated Public Forecast Zones with 04/16/03 shpae file.  RT, (TP),
	      4/24/03.

l	d-35. Updated Counties with 12 May 03 shape file.  RT, (TP), 5/28/03.

l	d-36. Updated Marine Zones with 05/06/03 shape file.  RT, (TP), 5/28/03.

l	d-37. Added a new map and bound file for the HPC SFC Analysis Boundary.
	      SJ, (SS), 5/28/03.

l	d-38. Changed the centroid location of Yellowstone Natl Park, MT in the
	      county bounds and stations tables.  SJ, (DK), 6/5/03.

m	d-38. new SSA regions for clipping.  added four regions to SSA table 
	      files HPC050W, HPC050E, TPC215W and TPC215W; added new map files 
	      for four new SSA regions; changed old MPC labels to OPC in the SSA 
	      VG file; changed map and VG files names from MPC to OPC.  MG, (SJ), 
	      7/18/03.

m	d-39. Updated Public Forcast Zones and Marine Zones with 07/15/03 shape 
	      files.  Created Fire Zones with 07/02/03 shape file.  Changed 
	      Metcalf to Metcalfe in coutny.tbl, countynam.tbl, and ffgzon.stn.
	      RT, (TP), 7/28/03.

m	d-40. Updated Public Forecast Zones with 08/28/03 shape file.  RT, (TP),
	      9/15/03.

m	d-41. Updated Counties with 08/28/03 shape file.  RT, (TP), 9/15/03.

m	d-42. Updated County Warning Areas with 08/28/03 shape file.  RT, (TP), 
	      9/15/03.

m	d-43. Added Lake Lanier to the RADMAP lakes map file.  TP, (SJ), 9/16/03.


018.	UTILITIES 

f	a. T046:  Added code to read first line of FOP ASCII file which will 
	   contain header information.  This info will not be used at this time. 
	   Done, DP, (DP), 9/26/01.

f	a-1. Apply point reduction to lines containing more than 20 points.
	     Done, DP, (SJ), 10/25/01.

f	b. Modified checkSrc.perl to properly handle 'static void' function type.
	   Done, TP, (SJ), 11/5/01.

g	c. T091:  Created a new program to convert a VGF file to ASCII format. 
	   This delivery dumps lines and special lines with any grouped text.  
	   Done, DP, (SJ), 1/28/02.

g	c-1. Created a new program "rfop" to convert a VGF Flood Outlook Product 
	     file into an ASCII Flood Outlook Product file.  Done, DP, (SJ), 
	     1/28/02.

g	c-2. Added help file to program vgftoascii.  Done, DP, (SJ), 3/8/02.

g	c-3. Remove unnecessary call to ces_gtrbl.  Done, DP, (SJ), 3/11/02.

g	c-4. Changed RFOP program per HPC request to make the output text file 
	     format identical to the RFC text file format.  Also added help file.
	     Done, DP, (SJ), 3/21/02.

j	c-5. Added check for character 'V'/'v' so program operates correctly in 
	     November.  Done, DP, (SJ), 11/4/02.

j	c-6. Added check for invalid fill pattern.  DP, (SJ), 11/20/02.

g	d.  T112:  Updated the ZLIB library due to a security concern.  The
	    authors of the library issued a new release (v1.1.4).  Done, SJ,
	    (DP), 3/14/02.

h	e. T074:  Modified the utility script "rmque" to parse the message queue
	   id using awk instead of cut.  Done, SJ, (TP), 5/9/02.

i	e-1. Added copying of .DEFAULT.vgf files to $HOME prior to removal as
	     requested by the HPC.  Done, TP, (SJ), 9/24/02.

m	e-2. Modified the script "rmque" to handle cases where the message queue
	     number runs into the user id.  JL, (SJ), 9/25/03.

h	f. T142:  Created a program called WMOSTRIP for NCDC. The program strips
	   off the WMO header from a GIF or FAX/G3 graphic file.  Done, SJ, (SS),
	   6/10/02.

i	g. T107:  Created a new program to post-process the CCFP VGFs and create
	   the combined CCFP ASCII product file.  Done, DP, (SJ), 8/7/02.

j	g-1. Fixed time problem of program CREATECCFP.  RT, (TP), 11/22/02.

i	h. Fixed the MDP program where longitudes > 99.995 and < 100.0 would
	   be incorrectly represented in the final text product.  Done, DP,
	   (DP), 8/15/02.

i	i. T177: Removed the redundant clocetr.c and replaced it with 
	   cgrcentriod.c. Done, JW, (SJ), 8/23/02.

k	j. T205:  Created new utility program, arinfo, to dump the header 
	   contents of a McIDAS AREA file.  DP, (SJ), 2/13/03.

k	j-1. Clarified documentation for the image processing functions im_btot 
	      and im_ttob.  DP, (SJ), 2/19/03.

k	j-2. Fixed display of two-byte imagery, specifically the 10-bit GVAR RAW 
	     imagery.  Wrote function to get temperature from GVAR 10-bit value. 
	     DP, (SJ), 3/5/03.

k	j-3. Modifications to xw, ps, gif and tiff drivers to improved processing
	     performance of 10-bit GVAR imagery.  DP, (SJ), 3/6/03.

l	j-4. Improve performance of xsatpx.c by implementing stronger checks on
	     requested data, i.e., if same file requested and display dimensions
	     have not changed, simply re-use data in static array - do not
	     re-read data. This change will make the NMAP cloud height computation
	     faster when accessing the same image over and over again. The ODT
	     program will also benefit when computing image temperatures.  DP,
	     (SJ), 4/1/03.

l	j-5. New IM library function to return an array of temperatures from an
	     IR image given a center point (any coord) and a radius (pixels).
	     DP, (SJ), 4/1/03.

l	j-6. New NODT program which will perform the Objective Dvorak Technique.
	     DP, (SJ), 4/10/03.

l	j-7. Fixed item #1 in PR #649.  Corrected item #2 to my best knowledge; 
	     TPC (Chris Sisco) has indicated, however, that he has "never used 
	     it before and [the automode feature is] not necessary".  Added 
	     other required options as indicated by TPC (Sisco) and updated 
	     documentation.  DP, (SJ), 4/23/03.

l	j-8. Fixed bug in xsatpx.c where the image file was not being re-loaded
	     into memory if the actual image file changed.  DP, (SJ), 4/29/03.

l	j-9. Fixes for Test Report 652:  1) print statement should only execute 
	     when ODT scene is overridded, 2) date/time string should only print 
	     if image is processed, not if only history file is listed, 3) this 
	     platform dependency has been traced back to at least IM_GTMP.  The 
	     returned pixel value for a given (lat,lon), i.e., device (i,j), on 
	     AIX differs from that on all other platforms.  All other platforms 
	     are identical to each other, however it is not clear which result 
	     is correct.  No solution is delivered here; investigation continues 
	     and will be delivered outside track number 205.  DP, (SJ), 4/29/03.

l	j-10. Fixed problem where differing results from the ODT program on
	      different platforms.  Modified GPLT function GSATPX.f to apply 
	      the 'nint' function to plot bounds device coordinates prior to 
	      calling XSATPX.c.  DP, (SJ), 5/2/03.

l	j-11. Improved/clarified nodt documentation.  DP, (SJ), 5/6/03.

l	j-12. Bug fixes and minor corrections to N-AWIPS ODT implementation.
	      DP, (SJ), 6/13/03.

m	j-13. Changes to GVAR conversion to include 2nd order polynomial
	      coefficients which will increase precision of conversion from
	      0.1 degrees K to within 0.001 degrees K.  DP, (SJ), 6/25/03.


l	k. T260:  Fixed the CREATECCFP size problem.  Instead of concatenating 
	   output to a string, send output directly to standard output.  RT, 
	   (SJ), 3/27/03.

l	l. T261:  Bug fix on linux platform - seg fault with non-area type file.
	   Also added histogram feature for analysis of pixel values.  DP, (SJ),
	   4/10/03.

l	l-1. Changed the title strings for local radar products. Removed the 
	     word "NIDS" and replaced it with "LOCAL". Adjusted some product
	     abbreviations to accommodate the length difference.  SJ, (DK), 
	     5/16/03.

l	l-2. Fixed a problem with the Global/Mosaic_8km satellite data where the
	     images are not created with the same sensor code in the file header.
	     Some images are created with GOES-10 as the sensor and they are read
	     and loaded ok. Some images are created with METEOSAT5 as the sensor.
	     These images did not have an entry in imgtyp.tbl.  SJ, (TP), 5/21/03.

m	m. T277:  Created two new utility programs which convert a PGEN VGF file 
	   to an ascii tag format ("<tag_name>value") file and vice versa.  
	   DP, (SJ), 6/30/03.


019.    Documentation

f	a. Added winter-weather desk surface parameters SNRT and FZRT.  Done, 
	   KB, (SJ), 10/4/01.

f	b. WhatsNew.hlp and version 5.6.f release notes. Done, SS, (SS), 12/10/01.

g	c. T079:  Added a help file for CCFP product generation.  Also updated 
	   the documentation for ccfp.tbl table that specifies issue and valid 
	   times for the product.  Done, SS, DP, (SJ), 1/28/02.

g	c-1. Updated documentation for the uattribd.tbl, setting.tbl, scale.fax 
	     tables and the vgfile.hl2 help file.  Removed TEXT_ELM and TEXTC_ELM 
	     VGTYPEs from the setting.tbl and uattribd.tbl tables because these 
	     types are no longer set in product generation.  Done, SS, (SJ), 
	     3/4/02.

g	c-2. Updated documentation for the Map Selection window to include a 
	     description of apply and get map settings functionality.  Done, 
	     SS, (SJ), 3/4/02.

g	c-3. Updated help files and associated tables for the following:

		1.  NMAP2 Data Access GUI

		DataSelection.hlp -   Rewrote to describe NMAP2 data selection GUI
		DataAccess_Conf.hlp - New help for site administrators for NMAP2 
					data access configuration information
		Roam.hlp  -           New help for roaming 
		datatype.tbl -        Updated documentation and set time line 
					increment to -1 for observational data 
					types since it is not read from the table
		miscset.tbl -         Added reference to VGF
		nmap_roam.tbl -       Rewrote documentation
		prmlst.tbl -          Rewrote documentation
 
		2. Added help informaton for product layering

		Pgen_Basic.hlp -      Added brief description of start/add layer 
					action
		Pgen_Layer.hlp -      New help describing layering in detail

		3. Updated Group help to account for group assignment rules

		Pgen_Group.hlp

		4. Updated nmapHlp.index to account for new helps
		Done, SS, (SJ), 3/18/02.

g	c-4. Updated help files for Pgen_Layer.hlp and Pgen_Basic.hlp.  Done,
	     SS, (SJ), 3/21/02.

g	c-5. Release notes and updated WhatsNew NMAP help for 5.6.g.  Done,
	     SS, (TP), 3/22/02.

h	c-6. Updated the seek help and wrote new help for locator function.  Also 
	     updated the documentation for the clo and locator tables.  Rewrote 
	     main NMAP help.  Added new help for reload, stop and wipe functions.
	     Removed NMAP2 specific help file that was out of date.  Done, SS, 
	     (DK), 5/22/02.

h	c-7. Wrote new NMAP help for layer product files (LPFs).  Updated layer 
	     help and basic product generation help to reference LPFs.  Updated 
	     documentation for the example LPF.  Updated the group help to 
	     account for line labelling while group action is invoked.  Updated 
	     the procedures help to account for saving and restoring data set and
	     overlay display attributes.  Done, SS, (DK), 6/17/02.

h	c-8. Release notes for version 5.6.h and updated WhatsNew Help.  Done,
	     SS, (SJ), 6/20/02.

h	c-9. Minor update to description of the example LPF file describing the
	     rule when an invalid group is entered.  Also, indicated layer name
	     is truncated if > 8 characters.  Done, SS, (SJ), 6/25/02.

i	c-10. Wrote release notes and WhatsNew help for version 5.6.i.  Done,
	      SS, (TP), 9/24/02.

i	c-11. Added TAV and TDF grid diagnostic problem to known bugs section 
	      of the release notes and WhatsNew help for version 5.6.i.  Done, 
	      SS, (SJ), 9/30/02.

j	c-12. Updated User's Guide, its generation software and associated
	      input files as needed.  TP, (SJ), 11/25/02.

j	c-13. Release notes and updated NMAP WhatsNew.hlp for version 5.6.j.
	      SS, (TP), 12/13/02.

k	c-14. Improvements to GDPLOT2 txt and pdf file, mostly spelling.
	      DP, (SJ), 1/13/03.

k	c-15. Correction to the rebun prologue.  Expansion of cgrqsol and 
	      cgrsegdist prologues.  DP, (TP), 2/3/03.

k	c-16. Release notes and updated NMAP WhatsNew.hlp for version 5.6.k.
	      SS, (SJ), 3/24/03.

k	c-17. Corrections made to release notes and NMAP WhatsNew.hlp for 
	      version 5.6.k.  SS, (SJ), 3/25/03.

l	c-18. Release notes and updated NMAP WhatsNew.hlp for version 5.6.l.
	      SJ, (DK), 6/13/03.

l.1	c-19. Release notes and updated NMAP WhatsNew.hlp for version 5.6.l.1.
	      SJ, (SJ), 7/16/03.

m	c-20. Added the SFPARM and SNPARM help files to the list of "help"
	      topics in NMAP/NMAP2.  JW, (SJ), 7/18/03.

m	c-21. Fixed the documentation of miscset.tbl to better define
	      the information in the last column.  SJ, (SJ), 8/14/03.

m	c-22. This delivery is the template for the release notes for version 
	      5.6.m.  SS, (SJ), 8/25/03.

m	c-23. Updated the release notes for various tasks.  SJ, (SS), 8/25/03.

m	c-24. Updated sfstns.hlp with information about when creating new
	      GEMPAK surface files, how to create enough room in order to be
	      able to add new stations to the GEMPAK surface file.  AH, (SJ), 
	      8/28/03.

m	c-25. Added release note information on watch by county changes,
	      stippling for track watch/warn graphic and new grid diagnostic
	      parameters.  AH, (SS), 9/8/03.

m	c-26. Updated release notes with additions for release M.  DK, (SJ),
	      9/8/03.

m	c-27. Added a "Option - General Description " help file for "Option"
	      functions: cursor, bad frames, logos, icon tips, extended zoom,
	      loop stop and roam share. Rename the GUI help titles for dwell
	      rate, color enhancement and locator.  AH, (SJ), 9/15/03.

m	c-28. Release notes for 5.6.m: 1) REF #4A, 2) REF #5, 3) REF #12A,
	      4) REF #13A,D,E,F.  DP, (SJ), 9/15/03.

m	c-29. This delivery includes the release notes and Whats New Help file
	      for version 5.6.m.  SS, (SJ), 9/30/03.

h	d. Fixed the help file for NAGRIB for the parameter GBTBLS.  The help
	   file incorrectly showed a "|" as a delimeter instead of a ";".
	   Done, SJ, (SS), 4/5/02.

m	e. T276:  changed the name of Marine Prediction Center (MPC) to Ocean
	   Prediction Center (OPC) in sveral table and help files; changed the
	   name of ssmi_mpc.tbl to ssmi_opc.tbl; corrected the internal 
	   documentation of the table wmogrib3.tbl.  MG, (SJ), 7/1/03.


020.    Scripts/NTS files

h	a. Updated the color for the negative temperature lines in the restore
	   file, 850mb_hght_tmp_wind_ncf.


021.	Icons				 

022.	DG Re-Engineering

f	a. T010:  Replaced the logical flag USEFLG in DGCMN.CMN with a new 
	   integer flag IUSESV, which will be used to remove uneeded grids in 
	   future revisions.  The subroutine ID variable ISUBID was also added 
	   to DGCMN.CMN for future revisions.  Done, KB, (SJ), 11/20/01.

g	a-1. DG_MFIL and DG_OFIL were modified to fix a bug/feature that results
	     in array SUBA not being set for the extra points on grids with an 
	     added column.  Changed dg library to allow allocation and freeing up
	     of internal grids.  Done, KB, (SJ), 12/27/01.

g	a-2. These changes allow allocation and freeing up of internal grids by
	     the DF and DV library routines.  DG_TOPV was modified to fix an 
	     erroneous error return code.  Done, KB, (SJ), 1/24/02.

g	a-3. Modified functions fl_mnam and cfl_mnam to make a file name from
	     a template and date/time string to check the length of the date/time.
	     Done, ML, (SJ), 2/14/02.

g	a-4. Added an input variable to FL_SCND which defines the expected 
	     number of files to be returned.  Done, AH, (SJ), 2/25/02.

g	a-5. Created two new functions: ST_ISTP and IN_FILE.  ST_ISTP determines 
	     if the input string is a file name template.  IN_FILE parses the 
	     user input file name string (up to 3 files).  It determines if the 
	     input file name is an alias, a template, or a regular file name.
	     The aliases and templates will be expanded to file names, then all 
	     resulting file names will be put back into a single string for use 
	     in the file opening functions.  Done, ML, (SJ), 2/25/02.

g	a-6. Fixed bugs in IN_FILE and TESTIN found during testing.  Changed the 
	     declaration of the output string in TESTIN.  Modified the file 
	     selection when a time was input with an alias.  Removed the extra 
	     path from the final file name.  Done, SJ, (DP), 3/4/02.

g	a-7. Modified DG_OFIL to identify file name template and open the
	     appropriate files.  Done, ML, (SJ), 3/4/02.

g	a-8. Fixed test report:540:p1 - forecast time processing problem.
	     Done, ML, (SJ), 3/4/02

g	a-9. Remove changes to DG_OFIL, made in delivery 022a-7.  Done, SJ, (DP),
	     3/11/02.

h	a-10. Removed all REAL array declarations of length LLMXGD in DGCMN.CMN.
	      Additional changes remove scratch array declarations of length 
	      LLMXGD in both DGCMN.CMN and PD routines.  Done, KB, (SJ), 5/20/02.

h	a-11. Initialized the pointers to the internal grids holding the lat/lons,
	      map scale factors, and the wind rotation matrix elements.  Brought 
	      testdg.c into conformity with the use of internal grids for lat/lons
	      and map scale factors.  Done, KB, (SJ), 5/21/02.

h	a-12. Modified GDCROSS to allow drawing a cross section across the
	      discontinuity seam on a globe wrapping grid.  Done, KB, (SJ),
	      5/23/02.

h	a-13. Modified dgarea.f to ensure that the navigation dependent grids 
	      stored in the internal grid array will be recomputed if the grid 
	      area changes.  Done, KB, (SJ), 5/31/02.

h	a-14. Fixed test report #562P1, which allows GDCROSS to draw a cross 
	      section across the discontinuity seam on a globe wrapping grid.  
	      This version of GDCROSS always sets a map projection so that 
	      GR_RARG can be called.  In some cases, GSMPRJ was returning with 
	      an error; so, a test was added to separate the cylindrical map 
	      projections from the others.  Done, KB, (SJ), 6/5/02.

i	a-15. These changes allow the grid diagnostic functions to perform
	      computations over a subset grid that covers the area needed
	      for output or display.  This subset grid has the same navi-
      	      gation angles and projection type as that in the grid file,
	      but with the corner points changed to create the subset.  The
	      navigation of the internal grid (SNAV in DGCMN) is set to
	      that of the subset.

	      This set of changes sets the stage for allowing a much larger
	      grid, called the transfer grid, to be read from the grid
	      file; while, calculations are done only on the subset of that
	      grid required for output.  Done, KB, (SJ), 8/8/02

i	a-16. This change prevents an infinite loop in GR_CMPV when the
	      user has set the SCALE parameter inappropriately high for the
	      specified contour interval.  The associated loss of numerical
	      precision can lead to computations that never produce the
	      conditions required to terminate a DO WHILE loop. Done, KB, (SJ),
	      8/8/02.

i	a-17. This change allows very small non-zero reference angles to pass as
	      zero-valued angles in setting a grid projection.  Done, KB, (SJ),
	      8/23/02.

i	a-18. This change fixes a bug in the creation of the longitude buffer
	      zone around the subset grid.  Done, KB, (SJ), 8/23/02.

i	a-19. Increased LLMXGD from 97000 to 275000.  Done, RT, (SJ), 9/4/02.

i	a-20. Restored GDPLTB to the previous version after finding that the
	      "saved" grids no longer work in GDPLOT2, NMAP and NMAP2.
	      This only affected saving diagnostic functions not regular 
	      parameters. Done, SJ, (SS), 9/26/02.

i	a-21. This release corrects a problem with contouring on global grids.
	      Unnecessary extra checks to determine grid point visibility
	      were removed since these checks caused problems in some cases.
	      This code was in the GR_SETR routine. Done, KB, (SJ), 9/27/02.

j	a-22. Because DG_SUBG completely resets the internal grid, there should
	      be no chance allowed for finding a previously computed internal
	      grid.  Therefore, it is necessary to set gparmd () to blanks.
	      Done, KB, (SJ), 10/8/02.

j	a-23. Wrote a routine DG_IGRG, which transforms internal navigation 
	      (RI, RJ) grid relative points to reference navigation (RIR,RJR) 
	      points.  Modified GDMAP to label gird axies relative to reference 
	      grid navigation.  Done, RT, (KB), 10/8/02.

j	a-24. Created DG_CXGP subroutine.  Modified GDCROSS, GDPROF, GDTHGT, 
	      GDTSER to use new sub-gird algorithm.  Done, RT, (SJ), 10/21/02.

j	a-25. The multiplier factor for LLMXGD in HPC contributed program
	      GDGRIB is too large for the new value of LLMXGD in 5.6.i.  This
	      may cause stack size errors and core dumps on some workstations.
	      Done, KB, (SJ), 10/23/02.

j	a-26. Fixed a problem when plotting the AVN grid, in GDPLOT2 and NMAP2,
	      with the following settings:  GAREA  = -5;-125;80;-4, PROJ   = ced.
	      Fixed by removing the checks for the grid columns that are "close"
	      to the edges of the grid in GR_SETR.  Done, SJ, (DP), 10/30/02.

j	a-27. Re-applied the changes to GDPLOT2 to use the new function DG_SUBG
	      in place of DG_AREA and the other supporting functions.  Fixed
	      DG_SUBG to compare the current navigation against the saved
	      navigation.  Only if they are different will the internal grid
	      identifiers be reset.  Done, SJ, (KB), 11/5/02.

j	a-28. added calls to ER_WMSG to the dgcxgp.f

j	a-29. Updated the testdg program to include recent additions to DGCMN.CMN
	      and changes to the dg library.  KB, (SJ), 11/7/02.

j	a-30. Fixed saving of internal grids when one grid is saved, another
	      grid is computed, then the first saved grid is used again.
	      SJ, (KB), 11/7/02.

j	a-31. Added maximum and minimum values to the grid point statistics 
	      computed by GDSTAT. KB, (SJ), 11/20/02.

k	a-32. Increased LLMXTG to 1,000,000.  Eliminated the SUBA array in 
	      DGCMN.CMN and subset flag arrays in the PD library.  Release notes 
	      should advise users who have written their own applications to 
	      check their code for calls to PD routines.  The calling sequences 
	      no longer contain the logical subset flag array. KB, (SJ), 12/27/02.

k	a-33. Added IJSKIP parameter to allow a user controlled skip subsetting 
	      of the reference grid as a method of setting the internal grid for 
	      the grid diagnostic functions.  KB, (SJ), 1/2/03.

k	a-34. Fixed declaration of variable "autos" in IN_GSKP.  SJ, (SJ), 1/2/03.

k	a-35. Re-organized the loop in some df routines.  RT, (SJ), 1/8/03.

k	a-36. This change allows cross sections to traverse the central long.
	      of very high resolution grids.  This is a bug fix.  KB, (SJ), 
	      2/6/03.

k	a-37. This change fixes a bug which prevents the summation of precip
	      over very high resolution grids, when very few internal grids
	      are available.  With this fix, unneeded grids are freed during the 
	      accumulation of multiple precipitation grids.  KB, (SJ), 2/24/03.

l	a-38. These changes allow the //x saved grids to be reused after cycling
	      back with new user input in the grid diagnostic programs.  This
	      change also fixes a bug involving an un-initialized flag (CONTIN)
	      in the GDGSFC program.  KB, (SJ), 5/2/03.

l	a-39. This change prevents //x saved grids from building up and blocking
	      the use of internal grids when the //x specification occurs within 
	      a time loop.  Any saved grid having the same name as the current 
	      grid being saved is nullified by having its save flag set to false.
	      KB, (SJ), 5/7/03.

l	a-40. Fixed bug where DG processing lost the ability to detect a change 
	      in grid navigation.  This fix also solves the problem of TDF and 
	      TAV functions not working for either forecast hours before or after
	      the change in grid navigation (but not both) depending on how 
	      DG_MFIL is called.  KB, (SJ), 5/12/03.

m	a-41. DG_MFIL and DG_OFIL set an incorrect navigation in GPLT when a 
	      global grid requiring the addition of a column is requested after 
	      using data from a model on a different grid.  They need to use the 
	      reference navigation rather than the the internal navigation when 
	      adjusting for the column addition.  KB, (SJ), 6/30/03.

m	a-42. Prevent improper probability values (prob > 1.0) in dfpaub.f.
	      KB, (SJ), 9/15/03.

	      
023.	LDM changes

f	a. T027A:  Updated NWX tables, and 5 pqact.conf files in ldm, ldmis2, 
	   ldmdev, and ldmdata, according to NWS change notice SCN# 01-44 COR.
	   (effective 11/7/01).  Done, ML, (SJ), 10/15/01.

f	a-1. Updated the pqact.conf and watndsc.bull to display the Current
	     Watches in NWX.  Done, SJ, (SJ), 11/30/01.

g	b. T114:  Updated/cleaned up NWX tables, and pqact.conf file for SPC
	   products per SCN 01_44.  Done, ML, (TP), 3/19/02.

h	b-1. Updated NWX tables and pqact.conf files according to NWS change 
	     notice SCN 02-31 effective May 29, 2002.  Done, ML, (SJ), 5/9/02.

h	b-2. Added products to be saved for the MPC to send to a web page.  
	     Done, SJ, (SJ), 5/9/02.

h	b-3. Added a product to be saved for the MPC to send to a web page.
	     Also fixed the WMO ID of another MPC product for the web page.
	     Done, SJ, (DK), 5/23/02.

h	b-4. Updated pqact.conf files according to NWS change notice 
	     SCN#02-27 COR effective May 29, 2002.  Done, ML, (SJ), 5/30/02.

h	b-5. Added the ETA MOS to the LDM tables and to the NWX tables.  Done,
	     SJ, (DK), 6/10/02.

h	b-6. Added newmos/eta directory to the scour.conf files to delete files
	     older than 5 days.  Done, AH, (SJ), 6/18/02.

i	b-7. Added the regional digital forecasts (RDF) to the LDM tables and
	     to the NWX tables.  Done, AH, (SJ), 7/1/02.

i	b-8. Added the new WMO headers for the Climate Daily Summary and the
 	     Climate Monthly Summary as stated by Notification TECH 02-14.
	     Done, AH, (SJ), 8/5/02.

i	b-9. Added KWNH to the list of valid originating stations for
	     Hurricane Public Bulletins in the LDM and NWX.  Done, SJ,
	     (AH), 8/8/02.

i	b-10. Updated all scour.conf files to scour the svr_summ directory.
	      Fixed lnx165 scour.conf file. Fixed a typo on newmos/eta and
	      added fwddy1, fwddy2 and National Mosaics scoures.  Added the 
	      severe weather summary back into master.tbl and guidata.tbl  
	      Done, AH, (SJ), 8/12/02.

i	b-11. Added the Hazardous Weather Outlook (HWO) to the LDM and NWX
	      tables.  From SCN 02-43, this product goes into affect 10/1/02.
	      Done, AH, (SJ), 8/12/02.

i	b-12. Separated out the Coded City Forecasts from the Selected City
	      Forecast in the NWX directory 'city" and the Zone Forecasts
	      in the directory 'zone' to resolve problems found by the HPC.
	      Done, AH, (SJ), 9/18/02.

i	b-13. Added the new TAF decoder, DCTAF, the Regional Digital Forecast
	      decoder, DCRDF, the Convective Sigmet decoder, DCCSIG and the
	      winter storm warning decoder, DCWSTM, to pqact.conf and ctab.
	      Removed the obsolete old AVN MOD decoder, dcamos, from ctab.
	      Done, AH, (SJ), 9/24/02.

j	b-14. Reconciled the LDMs' pqact.conf, scour.conf and ctab, as needed.
	      Done, AH, (SJ), 10/24/02.

k	b-15. Added a new table for NWX, wou.bull.  AH, (SJ), 1/28/03.

k	b-16. Update the pqact.conf as a result of the Central Region going to 
	      the "End-state WMO/AWIPS Product Identifiers."  AH, (AH), 3/4/03.

l	b-17. Added Alaskan precipitation data (SXAK58 PACR) to NWX.  AH,
		(SJ), 4/7/03.
l	b-18. Updated pqact.conf file according to the Public Info Statement...
	      Tech Implement notice 03-04 effective April 9, 2003.  
	      ML, (SJ), 4/11/03.

l	b-19. Added the HPC Heat Index products to NWX.  SJ, (AH), 4/28/03.

m	c. T280:  modified master.tbl and guidata.tbl to include Marine MOS data.
	   modified marine_mos.tbl so it is in standard GEMPAK station format.
	   modified LDM files to include Marine MOS data.  MG, (DK), 9/2/03.

---------------------------------------------------------------------------------


	DK - Duane Kidwell		CM - Chris Caruso Magee
	DP - Dave Plummer		GG - Greg Grosshans	
	FY - Fee-Jing Yen		JA - Jeff Ator	
	SJ - Scott Jacobs		JL - Jan Lewis (AWC)	
	SS - Steve Schotz		
	AH - Andrea Hardy		JH - Jon Hoopingarner
					JP - James Partain	
		
	ES - Edward Safford		JC - Joey Carr	
	HZ - Harris Zeng		KB - Keith Brill
        JW - Jun Wu						
	MG - Michael Gamazaychikov
	ML - Michael Li	
	RT - Ruiming Tian
	TL - Tiros Lee			SC - Steve Chiswell	
	TP - Tom Piper			AP - Art Person/PSU

