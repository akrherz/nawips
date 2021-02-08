		NAWIPS 5.6.f  Tables Changes Description Log

	TFC => Table Format Change (This notation began with 5.6.e)

t1.	Part of 001c.  Added buoys (45035, 45158, 45507, and 45805).  Done, 
	FY, CM, (DK), 10/3/01.

	gempak/tables/stns/msfstns.tbl


t2.	Part of 019a.  Done, KB, (SJ), 10/4/01.

	gempak/tables/parms/pcconv.tbl

t3.	Part of 017a.  Done, AH, (SJ), 10/9/01.

NEW:	gempak/tables/bounds/hpc050.tbl, mpc050.tbl, mpc215.tbl, tpc050.tbl,
				tpc215.tbl, hpc050.tbl.info, mpc050.tbl.info,
				mpc215.tbl.info, tpc050.tbl.info, tpc215.tbl.info

t4.	Part of 007b.  Done, JW, (SJ), 10/12/01.

	gempak/tables/draw/splpat.tbl

t5.	Part of 023a.  Done, ML, (SJ), 10/15/01.

	tables/nwx/day1.bull, day2.bull, meso.bull, pubout.bull, stadts.bull,
			stahry.bull, status.bull, watbox.bull, watcnty.bull,
			watndsc.bull, watsum.bull

t6.	Part of 007b-1.  Done, JW, (SJ), 10/15/01.

	gempak/tables/pgen/linebtn.tbl, setting.tbl

t7.	Part of 004d.  Done, AH, DK, (SJ), 10/22/01.

	gempak/tables/hcnadv/altker.tbl, eptker.tbl

t8.	For both sfstns.tbl and xrainsort.tbl, corrected the station elevation
	for XDW and the station information for PAWS was corrected.  Added 60 
	stations to sfstns.tbl and added the ASOS identifier for VRB and MOT.  
	Added 45 stations to xrainsort.tbl and 6 station to inactive.tbl.  
	Done, AH, (DK), 10/22/01.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t9.	Part of 010a.  Done, ML, (ES), 10/23/01.

		gempak/tables/pgen/classbtn.tbl

	NEW:	gempak/tables/pgen/markerbtn.tbl

t10.	Part of 010b.  Done, JW, (SJ), 10/24/01.

	gempak/tables/pgen/linebtn.tbl, setting.tbl

t11.	Part of 023a-2.  Done, AH, (SJ), 10/25/01.

	gempak/tables/pgen/awdef.tbl

t12.	The HPC added a new RedBook graphics product WNH (PENJ88 KWNH) for the
	Flood Potential Outlook.  Done, SJ, (ES), 10/26/01.

	gempak/tables/pgen/awdef.tbl

t13.	Updated the mod_res.tbl to include the ETAP model. The ETAP is the
	parallel run of the ETA at 12km resolution.  Done, SJ, (SS), 11/1/01.

	gempak/tables/nmap/mod_res.tbl

t14.	Part of 003a.  Done, SJ, (DK), 11/8/01.

	NEW:	gempak/tables/melbufr/* 

t15.	Part of 010e.	Done, ML, (SJ), 11/9/01.

	gempak/tables/pgen/setting.tbl, textbtn.tbl

t16.	Part of 005d.  Done, SS, (SJ), 11/27/01.

	gempak/tables/pgen/grptyp.tbl

t17.	Part of 010f.  Done, ES, (SJ), 11/29/01.

	gempak/tables/pgen/symbolbtn.tbl

t18.	Part of 008e-1.  Done, AH, (SJ), 11/30/01.

	gempak/tables/bounds/locowobnds.tbl, locowobnds.tbl.info

t19.	Part of 001h.  Done, FY, (DK), 11/30/1.

	NEW:	gempak/tables/stns/intlsig.tbl

t20.	Part of 023a-1.  Done, SJ, (SJ), 11/30/01.

	tables/nwx/watndsc.bull

t21.	T060:  Added Alaskan VOR points to the table vors.tbl.  Done, SJ, (SS),
	11/30/01.

	gempak/tables/stns/vors.tbl

t22.	Part of 004j.  Done, AH, (SJ), 12/3/01.

	gempak/tables/parms/pcconv.tbl

t23.	Part of 010g.  Done, HZ, (DP), 12/3/01.

	NEW:	gempak/tables/config/WCCphone.tbl


t24.	Changed the station information for AKQ and corrected the longitude for 
	WZS in sfstns.tbl.  Added CMAN station, LSCM4 to msfstns.tbl.  Added 
	91364 to the upper air station table, snstns.tbl. Done, AH, (DK), 12/4/01.

	gempak/tables/stns/sfstns.tbl, msfstns.tbl, snstns.tbl

t25.	Part of 010f-3.  Done, ML, (SJ), 12/5/01.

	tables/ntl/ntl.tbl

t26.	Part of 0009l-1.  Done, SS, (SJ), 12/6/01.

	gempak/tables/config/mapfil.tbl
	gempak/tables/nmap/mapinfo.nmap, mapovl.nmap

t27.	Part of 010f-5.  Done, SS, (SJ), 12/6/01.

	gempak/tables/pgen/symbolbtn.tbl

t28.	Part of 017c.  Done, AH, (TP), 12/6/01.

	gempak/tables/stns/county.tbl, countynam.tbl, sfstns.tbl, zones.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info, cwabnds.tbl,
								cwabnds.tbl.info

============================  End of Patch 5.6.f  ===============================

t29.	Part of 001h-1.  Added ten stations to intlsig.tbl.  Done, FY, (DK), 
							12/18/01.	

	gempak/tables/stns/intlsig.tbl

t30.	Part of 004d-1.  Done, DK, (SJ), 12/18/01.

	gempak/tables/hcnadv/altker.tbl

t31.	T072:  Corrected the station information for station LPR, Lorain OH.
	Changed the longitude from -8128 -> -8118 and the elevation from
	241 -> 242.   This error was found by NOAA Air Resources Laboratory.
	Done, AH, (SJ), 12/19/01.

	gempak/tables/stns/sfstns.tbl

h	-1. Added 323 new MOS guidance stations for the US, Puerto Rico and
	    Virgin Islands.  These became effective 1200 UTC Jan. 22, 2002.
	    Done, AH, (DK), 2/1/02.

	    gempak/tables/stns/newmos.stn

h	-2. Changes to upper air station table - deleted stations 03240 and 03317,
	    added station 03238 per information received from UKMET.  Done,
	    DK, (SJ), 3/20/02.
	    
	    gempak/tables/stns/snstns.tbl
	 
h	-3. Corrected the longitude for Tampa/Vandenburg (VDF) from -84.35 to
	    -82.35 as requested by SPC.  Added Tumbes/Pedro_Canga (SPME) to the 
	    upper air station table and corrected it's longitude from 27 meters
	    to 25 meters.  Done, AH, (SJ), 4/12/02.

	    gempak/tables/stns/lsfstns.tbl, sfstns.tbl, snstns.tbl

h	-4. Corrected the station elevation in snstns.tbl for 78954 from 56 to 47
	    meters.  Added 76361, Los Mochis Airport.  Added 20 stations to 
	    inactive.tbl.  Added 90 new stations to sfstns.tbl.  Added 23 new 
	    stations to xrainsort.tbl and corrected station information for Flin 
	    Flon (YFO -> WFO) and Rochelle (12C -> RPJ).  Done, AH, (TP), 5/16/02.

		gempak/tables/stns/inactive.tbl, sfstns.tbl, snstns.tbl,
								xrainsort.tbl

h	-5. Change to upper air station table - added station HBO/74547
	    (Hillsboro, KS) at request of SDM, to aid in 18Z QC efforts.  Done,
	    DK, (SJ), 5/21/02.

		gempak/tables/stns/snstns.tbl
		
h	-6. Change to upper air station table - added station VCI/74641
	    (West Woodward, OK) at request of SDM.  This station only reports
	    during the warm months.  Done, DK, (SJ), 6/10/02.
	    
		gempak/tables/stns/snstns.tbl

h	-7. Copied the station information for Billings, MT with the new id
	    'BYZ'.  Done, AH, (SJ), 6/18/02.

		gempak/tables/stns/sfstns.tbl

h	-8. Changes to upper air station table - added stations MRS/74650
	    (Morris, OK) and PRC/74651 (Purcell, OK) at request of SDM.  Added
	    new station 03918 (Castor Bay, UK), replacing 03920 (Hillsborough, 
	    UK), which was deleted.  Done, DK, (SJ), 6/18/02.

		gempak/tables/stns/snstns.tbl

i	-9. Change to upper air station table - Tallahassee, FL (72214) soundings
	    will be moved to the Florida State U. campus effective 7/1/02, 00Z.
	    Change in location and elev. change from 21 to 53 m.  Done, DK, (SJ),
	    7/1/02.

		gempak/tables/stns/snstns.tbl

i	-10. Updated the priorities for MOS stations to be used at the Medium 
	     Range Desk.  Updated the packing table used for the HPC generated 
	     surface data files at the Medium Range Desk.  Done, JC, (SJ), 7/1/02.

		gempak/tables/pack/mmfcst.pack
		gempak/tables/stns/newmos.stn

i	-11. Changed the name for Yellowstone National Park in the county table.
	     The name was too long for the SPC product formats.  Done, GG, SJ,
	     (SS), 8/12/02.

		gempak/tables/stns/county.tbl

i	-12. Added three new stations, 91532, 71953 and 71843, to the upper air
	     station table, snstns.tbl.  Done, AH, (SJ), 8/23/02.

		gempak/tables/stns/snstns.tbl

i	-13. Updated the city.stn table used by Coded City Forecasts in NWX.
	     Done, AH, (SJ), 9/24/02.

		tables/nwx/city.stn

j	-14. Updated the surface station, inactive, and xrainsort tables.
	     Done, AH, (DK), 10/18/02.

		gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

j	-15. Added Winter Weather Experiment (WWE) area to geog.tbl.  Done,
	     JC, (SJ), 10/21/02.

		gempak/tables/stns/geog.tbl

j	-16. Corrected numbers for zones MIZ008 and TXZ251.  Done, DK, (SJ),
	     11/4/02.

		gempak/tables/stns/zones.tbl

j	-17. Added NIDS product 74 (Radar Coded Message) to nidprd.tbl so that
	     this product type can be identified.  SJ, (DK), 11/20/02.

		gempak/tables/rad/nidprd.tbl

k	-18. Updated the TAF station table, tafstn.tbl, with 37 new stations.
	     Added 22 new stations to sfstns.tbl, updated the inactive.tbl
	     with 29 stations and added 2 stations to xrainsort.tbl.  AH, (DK),
	     1/15/03.

		gempak/tables/stns/tafstn.tbl, inactive.tbl, xrainsort.tbl,
								sfstns.tbl

k	-19. Updated pilot report table pirep_navaids.tbl by identifying and
	     searching new navaids locations.  ML, (DK), 1/17/03.

		gempak/tables/stns/pirep_navaids.tbl

k	-20. Updated the NWX tables for the addition of WFO Huntsville, AL.
   	     GG, (SJ), 1/21/03.

		tables/nwx/stations.tbl, zone.bull, now.bull, dclim.stn,
						mclim.bull, sfd.bull, rdf.bull

k	-21. Updated pilot report table pirep_navaids.tbl by identifying and
	     searching new navaids locations.  ML, (DK), 2/21/03.

		gempak/tables/stns/pirep_navaids.tbl

k	-22. Fixed the longitude values of 2 stations in Austria.  SJ, (DK),
	     2/28/03.

		gempak/tables/stns/sfstns.tbl

k	-23. Reconciled the geog.tbl file with the version from the AWC.  Added
	     the Himalayan mask VGF file.  SJ, (SS), 3/10/03.

		gempak/tables/stns/geog.tbl
		gempak/data/vgf/himalayan_hatch.vgf

k	-24. Added new reporting station JKL to TAF station table.  DK, (AH),
	     3/14/03.

		gempak/tables/stns/tafstn.tbl

k	-25. Added a new area to geog.tbl, AK2, defined as the HPC Alaskan
	     QPF area.  JC, SJ, (SS), 3/20/03.

		gempak/tables/stns/geog.tbl

k	-26. Added new reporting stations WWR, MTH and HBG to TAF station table.
	     DK, (SJ), 3/21/03.

		gempak/tables/stns/tafstn.tbl

k	-27. Add AWIPS grid #217 to grdnav.tbl.  This is the Alaska AWIPS grid.  
	     HPC will be using this for Alaska QPF.  KB, (SJ), 3/26/03.

		gempak/tables/grid/grdnav.tbl

l	-28. Updated the surface station table, sfstns.tbl, with 48 new entries.
	     Added 11 stations to inactive.tbl and sorted, removing duplicate
	     stations.  Updated xrainsort.tbl with 21 new entries.  AH, (DK),
	     4/2/03.

		gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

l	-29. Added a new station to the Coded Cities table for NWX.  The station
	     is Los Angeles/USC Campus (CQT). The station will start reporting 
	     in the CCF messages on 1 May 2003.  SJ, (DK), 4/9/03.

		tables/nwx/city.stn

l	-30. Updated pilot report table pirep_navaids.tbl by identifying and
	     searching new navaids locations.  ML, (DK), 4/22/03.

		gempak/tables/stns/pirep_navaids.tbl

l	-31. Added an new geog area for the HPC surface analysis.  JC, SJ, (DK),
	     5/7/03.  

		gempak/tables/stns/geog.tbl

l	-32. Updated volcano.tbl table.  ML, (SJ), 5/13/03.

		gempak/tables/stns/volcano.tbl

l	-33. Updated pilot report table pirep_navaids.tbl by identifying and
	     searching new navaids locations.  ML, (DK), 5/29/03.

	     gempak/tables/stns/pirep_navaids.tbl

l	-34. Updated the sfstns.tbl with 7 new stations, the xrainsort.tbl with
	     1 new station and the inactive.tbl with 20 stations.  Removed 
	     duplicate entry (BWD) in sfstns.tbl.  Changed the latitude for KSKX
	     in newmos.tbl from 3245 -> 3645.  Fixed a typo for Tungurahua in the
	     volcano table.  AH, (SJ), 6/5/03.

	     gempak/tables/stns/xrainsort.tbl, inactive.tbl, sfstns.tbl, 
					newmos.stn, volcano.tbl

l	-35. Added the product "WVPQ21 PGUM" to the NWX table for Volcano
	     Warnings. (Requested by NESDIS SAB.)  SJ, (AH), 6/12/03.

	     tables/nwx/vlcsig.bull

m	-36. Added independent city, Bristol, VA, to be clustered with
	     Washington County, VA.  GG, (SJ), 7/18/03.

		gempak/tables/stns/countyclust.tbl

m	-37. Updated the local NCEP GRIB tables for use in NAGRIB.  Added two
	     new GRIB tables.  TL, (SJ), 7/25/03.

		gempak/tables/grid/ncepgrib2.tbl
		NEW:	gempak/tables/grid/ncepgrib129.tbl, ncepgrib130.tbl

m	-38. Updated the local NCEP GRIB table 129 for use in NAGRIB.  TL,
	     (SJ), 7/31/03.

		gempak/tables/grid/ncepgrib129.tbl

m	-39. Updated tables dclim.bull, mclim.bull and awdef.tbl according to
	     AWC.  ML, (AH), 7/31/03.

	     gempak/tables/pgen/awdef.tbl
	     tables/nwx/dclim.stn, mclim.bull

m	-40. Updated the sfstns.tbl with 71 new stations and the inactive.tbl
	     with 20 stations.  Corrected 4 station identifiers in xrainsort.tbl 
	     and added 20 new stations.  AH, (SJ), 8/28/03.

		gempak/tables/stns/xrainsort.tbl, inactive.tbl, sfstns.tbl

m	-41  Updated pilot report table pirep_navaids.tbl by identifying and
	     searching new navaids locations.  ML, (DK), 9/4/03.

	        gempak/tables/stns/pirep_navaids.tbl

m	-42. Corrected the longitude for Canadian station WPQ - Montreal-Est
	     from -70.55 to -73.55.  AH, (SJ), 9/8/03.

		gempak/tables/stns/sfstns.tbl, xrainsort.tbl

m	-43. Added ten CMAN stations and four Great Lakes buoys to marine
	     surface decoder station table.  DK, (AH), 9/15/03.

		gempak/tables/stns/msfstns.tbl

m	-44. Added new reporting stations TOI and RYY to TAF station table.
	     DK, (SJ), 9/15/03.

		gempak/tables/stns/tafstn.tbl

m	-45. Added 13 new stations to sfstns.tbl. Two of which will have their
	     identifiers change 10/30/03.  (F55 -> GDJ and T72 -> LHB).  Added
	     16 new stations to the inactive.tbl.  AH, (SJ), 9/23/03.

		gempak/tables/stns/sfstns.tbl, inactive.tbl


t32.	Part of 010h.  Done, DP, (SJ), 12/20/01.

	gempak/tables/pgen/outlook.tbl

t33.	Changed the wind chill parameter from WCEQ to WCHT in the station
	model parameter lists.  Done, SJ, (SS), 1/9/02.

	gempak/tables/config/prmlst.tbl

t34.	Updated county tables with new FIPS code for Miami-Dade, 
	effective 1/9/02.  Done, TP, (DP), 1/9/02.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info
	gempak/tables/stns/county.tbl, countynam.tbl

t35.	Part of 003a-2.  Done, AH, (SH), 1/24/02.

	gempak/tables/config/datatype.tbl

t36.	Part of 001h-2.  Done, FY, (DK), 1/28/02.

	gempak/tables/config/miscset.tbl
	gempak/tables/stns/intlsig.tbl

t37.	Part of 019c.  Done, SS, DP, (SJ), 1/28/02.

	gempak/tables/pgen/ccfp.tbl

t38.	Part of 003a-4.  Done, DK, (SJ), 1/28/02.

	gempak/tables/config/datatype.tbl

t39.	Part of 008e-8.  Done, DP, (SJ), 1/30/02.

	gempak/tables/grid/ncepgrib2.tbl, vcrdgrib1.tbl

t40.	Part of 005i.  Done, TP, (SJ), 2/7/02.

	gempak/tables/pgen/uattribd.tbl

t41.	Part of 017d.  Public Forecast Zone name for CA zone 030 was PSR 
	corrected to be "Joshua Tree National Park".  Marine zone names for 
	LMZ643 LMZ644 LMZ645 LMZ646 LMZ665 were modified.  Done, AH, RT, (TP), 
	2/7/02.

	gempak/tables/stns/zones.tbl

t42.	T080:  Per AWC request, make available certain GRIB fields from the
		NWP models.  Done, DP, (SJ), 2/7/02.

	gempak/tables/grid/ncepgrib2.tbl, vcrdgrib1.tbl, wmogrib2.tbl

	t42-1. Update GRIB decoding tables from patch 'f' witk latest entries.
		Done, DP, (SJ), 3/6/02.

		gempak/tables/grid/ncepgrib1.tbl, ncepgrib2.tbl, vcrdgrib1.tbl,
					wmogrib1.tbl, wmogrib2.tbl, wmogrib3.tbl

t43.	Part of 005c-13.  Done, HZ, (ES), 2/12/02.

	gempak/tables/pgen/ctrlbtn.tbl

t44.	Part of 005i-1. Done, ES, (SJ), 2/13/02.

	gempak/tables/pgen/uattribd.tbl

t45.	Part of 004p.  Done, DK, (SJ), 2/21/02.

	NEW:  gempak/tables/hcnadv/tcmgda.tbl

t46.	Part of 001h-3.  Added 8 stations to intlsig.tbl.  Done, FY, (DK), 3/4/02.
	
	gempak/tables/stns/intlsig.tbl

t47.	Part of 005h-3.  Done, DP, (SJ), 3/4/02.

	gempak/tables/config/clo.tbl
	
	NEW:  gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t48.	Part of 005c-22.  Done, TL, (SJ), 3/4/02.

	NEW:	gempak/tables/nmap/example.lpf

t49.	Part of 005h-4.  Done, DP, (SJ), 3/6/02.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t50.	T108:  At the request of the HPC, separated the discussion products
	from the Basic_Wx selection into individual selections in the user
	interface.  Done, SJ, (SS), 3/6/02.

	tables/nwx/master.tbl, guidata.tbl, prog.bull
	NEW:  tables/nwx/hawaii.bull, crbdsc.bull, samdsc.bull


t51.	Part of 001n.  Done, DK, (SJ), 3/8/02.

	gempak/tables/nmap/ship6hr_parms.tbl, ship_parms.tbl
	gempak/tables/pack/msfc.pack
	gempak/tables/parms/pcconv.tbl

t52.	Part of 005h-7.  Done, DP, (SJ), 3/8/02.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t53.	T105:  Added a new C function to compute the centroid of a polygon.
	Applied the new function to update the county.tbl and countynam.tbl.
	Done, RT, (TP), 3/11/02.

	gempak/tables/stns/county.tbl, countynam.tbl

t54.	Part of 017d-1.  Done, AH, (TP), 3/12/02.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info
	gempak/tables/stns/zones.tbl

t55.	Part of 003a-11.  Done, AH, (SJ), 3/18/02.

	gempak/tables/bufr/fxycld.tbl, fxyfrt.tbl, fxyjet.tbl, fxytrp.tbl,
							fxytur.tbl, fxyvts.tbl


t56.	Part of 019c-3.  Done, SS, (SJ), 3/18/02.

	 gempak/tables/config/datatype.tbl, miscset.tbl, prmlst.tbl
	 gempak/tables/nmap/nmap_roam.tbl

t57.	Part of 023b.  Done, ML, (TP), 3/19/02.

	tables/nwx/master.tbl, guidata.tbl, day1.bull, day2.bull, watbox.bull,
			watcnty.bull, watsum.bull, pubout.bull, meso.bull,
			stadts.bull, stahry.bull, status.bull
	NEW:	tables/nwx/fwddy1.bull, fwddy2.bull

t58.	T115:  Added parameter packing tables for RUC BUFR to GEMPAK conversion.
	Done, KB, (SJ), 3/20/02.

	NEW:	gempak/tables/pack/sfruc.prm, sfruc.prm_aux, snruc.prm

	-1. Added the surface and sounding data packing tables for the new GFS 
	    BUFR 3-hr output.  KB, (SJ), 3/17/03.
	
	NEW:	gempak/tables/pack/sfgfs.prm, sngfs.prm
	
	
t59.	Part of 017d-2.  Done, RT, (TP), 3/20/02.

	gempak/tables/stns/zones.tbl

===========================  End of Patch 5.6.g  ==============================

t60.	Part of 017d-3.  Done, RT, (TP), 4/5/02.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t61.	Part of 004t.  Done, DK, (SJ), 4/16/02.

	gempak/tables/hcnadv/altker.tbl, eptker.tbl, ghcolr.tbl

t62.	Part of 005c-45.  Done, TL, (ES), 4/24/02.

	gempak/tables/pgen/ctrlbtn.tbl

t63.	Add heat index product to the AWIPS graphic products table.  Done,
	KB, (SJ), 4/29/02.

	gempak/tables/pgen/awdef.tbl

t64.	Part of 009n-20.  Done, AH, (SJ), 5/6/02.

	gempak/tables/pgen/awdef.tbl

t65.	Part of 004t-2.  Done, DK, (SJ), 5/7/02.

		gempak/tables/config/clo.tbl
	NEW:	gempak/tables/bounds/hcnbnds.tbl, hcnbnds.tbl.info

t66.	Part of 005c-47.  Done, TL, (ES), 5/8/02.

	gempak/tables/nmap/example.lpf

t67.	T120:  Created new bounds file for use with TPC hurricane graphics 
	programs GPKGRF and GPTPC.  Done, DK, (SJ), 5/9/02.

	gempak/tables/bounds/hcnbnds.tbl, hcnbnds.tbl.info
	NEW:  gempak/data/vgf/hcnbnds.vgf

t68.	Part of 023b-1.  Done, ML, (SJ), 5/9/02.

	tables/nwx/smw.bull, plship.bull, omrdata.bull

t69.	Part of 017d-6.  Done, RT, (TP), 5/16/02.

	gempak/tables/stns/zones.tbl

t70.	Part of 017d-7.  Done, RT, (TP), 5/16/02.

	gempak/tables/stns/cwa.tbl
	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info

t71.	Part of 017d-8.  Done, RT, (TP), 5/16/02.

	gempak/tables/stns/county.tbl, countynam.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t72.	Part of 005m.  Done, ES, (SJ), 5/20/02.

	gempak/tables/pgen/grptyp.tbl

t73.	Part of 017d-9.  Done, RT, (TP), 5/30/02.

	gempak/tables/stns/zones.tbl

t74.	Part of 023b-5.  Done, SJ, (DK), 6/10/02.

	tables/nwx/master.tbl, guidata.tbl

t75.	Part of 010t.  Done, TL, (ES), 6/10/02.

	gempak/tables/stns/countyclust.tbl
	NEW:	gempak/tables/nmap/lpf.nmap

t76.	Part of 009q-22.  Done, ML, (DP), 6/12/02

	NEW:	gempak/tables/stns/volcano_small.tbl

t77.	Part of 017d-10.  Done, TP, (SJ), 6/12/02.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t78.	T144:  Added station models requested by the SDMs to prmlst.tbl for NMAP.
	Also added a few GEMPAK parameters to METAR and SYNOP parameter tables 
	needed by the SDMs.  Added roam factors 6-10 to the NMAP roam table.
	Done, SS, (SJ), 6/12/02.

	gempak/tables/config/prmlst.tbl
	gempak/tables/nmap/metar_parms.tbl, synop_parms.tbl, nmap_roam.tbl

t79.	Part of 011h-4.  Stations LBWN, SCEL, and UKOO were added.

	gempak/tables/stns/intlsig.tbl

t80.	Part of 004v.  Done, RT, (SJ), 6/13/02.

	gempak/tables/config/clo.tbl

t81.	Part of 004w-1.  Done, HZ, (ES), 6/13/02.

	gempak/tables/nmap/nmap_pgw.tbl

t82.	Removed 'City_of_' from county name per SPC request.  Done, TP, (SS),
	6/17/02.

	gempak/tables/stns/county.tbl

t83.	Part of 019c-7.  Done, SS, (DK), 6/17/02.

	NEW:	 gempak/tables/pgen/example.lpf

t84.	Part of 009n-27.  Done, TP, (SJ), 6/20/02.

	tables/nwx/guidata.tbl, local.bull, master.tbl, zone.bull

t85.	Part of 019c-9.  Done, SS, (SJ), 6/25/02.

	gempak/tables/pgen/example.lpf

===========================  End of Patch 5.6.h  ==============================

t86.	Part of 023b-7.  Done, AH, (SJ), 7/1/02.

	tables/nwx/guidata.tbl, master.tbl
NEW:	tables/nwx/rdf.bull

t87.	Updated NWX tables according to Technical Implementation Notice 02-10
	effective July 1, 2002 at 0000 UTC.  Done, ML, (SJ), 7/2/02.

	tables/nwx/coastal.bull, mws.bull, now.bull, rgtmpc.bull, sfd.bull,
				stations.tbl, zone.bull
	gempak/tables/stns/snstns_land.tbl, wfo.tbl

t88.	Part of 017d-13.  Done, RT, (TP), 7/11/02.

	gempak/tables/stns/zones.tbl

t89.	Part of 017d-14.  Done, RT, (TP), 7/19/02.

	NEW:	gempak/tables/stns/riverbas.tbl

t90.	Part of 005m-3.  Done, RT, (SJ), 7/25/02.

	gempak/tables/pgen/grptyp.tbl

t91.	Part of 017d-15.  Done, RT, (SJ), 7/30/02.

	gempak/tables/stns/riverbas.tbl

t92.	Fixed a bug reported by Steve Chiswell that the entry for 
	Australia in the locowobnds.tbl was incorrect. Fixed the typo
	in the bounds tables and the VG file.  Done, SJ, (SS), 8/05/02.

	gempak/tables/bounds/locowobnds.tbl, locowobnds.tbl.info
	gempak/data/vgf/locowobnds.vgf

t93.	Part of 17d-16, zone updates.  Done, RT, (SJ), 8/6/01

	$GEMTBL/stns/zones.tbl

t94.	Part of 23b-9, Added KWNH to the list of valid originating 
	stations for Hurricane Public Bulletins in the LDM and NWX.

	tables/nwx/hurrcn.tbl

t95.	Part of 23b-10.  Done, AH, (SJ), 8/12/02.

	tables/nwx/master.tbl, guidata.tbl

t96.	Part of 023b-11.  Done, AH, (SJ), 8/12/02.

	tables/nwx/guidata.tbl, master.tbl

t97.	T176:  Added more CPC products to the AWIPS definition table.  Done, SJ,
	(DK), 8/20/02.

	gempak/tables/pgen/awdef.tbl

t98.	Part of 014c-2.  Done, MG, (TP), 8/23/02.

	gempak/tables/stns/sfstns.tbl

t99.	Part of 007i-1.  Done, HZ, (SJ), 8/27/02.

	NEW:	gempak/tables/config/prefs.tbl

t100.	Part of 001x-2.  Done, ML, (DK), 9/10/02.

	gempak/tables/config/datatype.tbl, miscset.tbl

t101.	Part of 009u-2.  Done, ML, (SJ), 9/11/02.

	gempak/tables/config/prefs.tbl

t102.	Part of 009z-1.  Done, TL, (SJ), 9/11/02.

	gempak/tables/config/datatype.tbl, prmlst.tbl
	NEW:	gempak/tables/nmap/idft_parms.tbl
		gempak/tables/pack/idft.pack
		gempak/tables/stns/idft.tbl

t103.	Part of 009z-2.  Done, TL, (SJ), 9/13/02.

	gempak/tables/config/prmlst.tbl

t104.	Minor alterations to the GRIB dicoding tables to allow decoding
	of the ice concentration parameter. The version 1 WMO parameter
	table listed ice concentration, but the entry was commented.
	Done, DP, (SJ), 9/16/02.

	gempak/tables/grid/wmogrib1.tbl

t105.	T118: As requested by the TPC, changed the Atlantic wind probability
	table.  They found an error which caused the percentages to be
	greater than 100%.  Changed the line:
		6   8  40  56  34   8   4   0   
	to:
		6   8  40  46  34   8   4   0 
	Done, AH, (DK), 9/16/02.

	gempak/tables/hcnadv/wndprba.tbl

	-1. Updated tropical cyclone watch/warning breakpoints for 2003
	    hurricane season, including official U.S. breakpoints and Mexican 
	    breakpoints per TPC.  Added breakpoint table to seek and locator.
	    DK, (SJ), 3/10/03.

		gempak/tables/config/clo.tbl
		gempak/tables/nmap/locator.tbl
		gempak/tables/stns/nhcbreaks.tbl

	-2. Added STID to hurricane breakpoint table for non-US points, so that
	    seek and locator functions would work correctly.   Fixes problem
	    report #643:P1.  DK, (AH), 3/14/03.

		gempak/tables/stns/nhcbreaks.tbl

	-3. Created new table, nhcbkpt_plt.tbl, to be used by program GPKGRF
	    (Kelly graphic) to plot tropical cyclone watches and warnings.
	    Minor corrections to official breakpoint table nhcbreaks.tbl.
	    DK, (SJ), 3/21/03.

		gempak/tables/stns/nhcbreaks.tbl
	NEW:	gempak/tables/stns/nhcbkpt_plt.tbl

	-4. Corrected longitude of Little River Inlet, SC, from 77.55W to 78.55W
	    per Scott Kiser of OS.  DK, (TP), 3/25/03.

		gempak/tables/stns/nhcbreaks.tbl


t106.	T167: Added overline text type entries to the product generation
	setting table to set defaults.  Done, TL, (SJ), 9/18/02.

	gempak/tables/pgen/setting.tbl

t107.	Part of 001z-1.  Done, DK, (SJ), 9/19/02.

		gempak/tables/config/datatype.tbl, prmlst.tbl
		gempak/tables/parms/pcconv.tbl
	NEW:	gempak/tables/nmap/taf_parms.tbl

t108.	Part of 001y-1.	Done, FY, (DK), 9/19/02.

		gempak/tables/config/datatype.tbl, prmlst.tbl
	NEW:	gempak/tables/nmap/rdf_parms.tbl

t109.	Part of 017d-17.  Done, RT, (TP), 9/19/02.

	gempak/tables/stns/zones.tbl

t110.	Part of 017d-18.  Done, RT, (TP), 9/20/02.

	gempak/tables/stns/county.tbl, countynam.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t111.	Part of 017d-19.  Done, AH, (DP), 9/20/02.

		gempak/tables/config/clo.tbl
	NEW:	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info

t112.	Part of 001z-3.  Done, DK, (SJ), 9/23/02.

	tables/nwx/guidata.tbl, master.tbl

t113.	Part of 007k-3.	Done, SJ, (SS), 9/24/02.

	gempak/tables/sat/imgtyp.tbl

t114.	Part 0f 017d-21.  Done, AH, (DP), 10/02/02.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info

===========================  End of Patch 5.6.i  ==============================

t115.	Part of 001aa.  Done, DK, (SJ), 10/8/02.

	gempak/tables/pack/mosm.pack

t116.	Changed the hazardous outlook extension from hzolk -> hzol.  Done, AH,
	(SJ), 10/24/02.

	tables/nwx/master.tbl

t117.	Part of 010dd.  Done, JW, (SJ), 11/1/002.

	gempak/tables/config/prefs.tbl
	gempak/tables/pgen/funcbtn.tbl

t118.	Part of 001x-7.  DK, (SJ), 11/1/02.

	gempak/tables/config/miscset.tbl

t119.	Part of 005m-13.  JW, (SJ), 11/7/02.

	gempak/tables/pgen/setting.tbl, uattribd.tbl

t120.	Part of 010ee.  HZ, (SJ), 11/7/02.

	gempak/tables/pgen/sigmetinfo.tbl

t121.	Part of 017d-22.  RT, (TP), 11/12/02.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info
	gempak/tables/stns/zones.tbl

t122.	Part of 006a-5.  DK, (DP), 11/19/02.
	
	gempak/tables/config/miscset.tbl

t123.	Part of 010ee-1.  MG, (SJ), 11/25/02.

	gempak/tables/stns/volcano.tbl

t124.	Part of 005m-15.  JW, (SJ), 11/25/02.

	gempak/tables/pgen/classbtn.tbl
	NEW:	gempak/tables/pgen/listbtn.tbl

t125.	Part of 001y-2.  FY, (SJ), 11/25/02.

	gempak/tables/config/prmlst.tbl

t126.	Part of 006a-6.  DK, (SJ), 11/27/02.

	gempak/tables/config/miscset.tbl

t127.	Part of 015c-1.  SC, TP, (SJ), 12/3/02.

	NEW:	tables/nsharp/nsharp_models.tbl, nsharp_observed.tbl, 
		nsharp_pfc.tbl
	
t128.	Part of 017d-23.  DP, (SJ), 12/6/02.

	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info

t129.	Part of 001z-7.  AH, (SJ), 12/6/02.

	tables/nwx/master.tbl
	NEW:	gempak/tables/stns/tafstn.tbl
		tables/nwx/tafstn.tbl (link)

t130.	Part of 009ee-2.  KB, SJ, (AH), 12/10/02.

	tables/nsharp/nsharp_pfc.tbl
	gempak/tables/config/datatype.tbl, prmlst.tbl
	gempak/tables/parms/pcconv.tbl
	NEW:	gempak/tables/nmap/etasfc_parms.tbl, etasnd_parms.tbl,
		ruc2snd_parms.tbl, rucptypsnd_parms.tbl, etasfca_parms.tbl,
		ruc2sfc_parms.tbl, rucptypsfc_parms.tbl, ruc2sfca_parms.tbl

t131.	Updated NWX table - tmppcp.bull and tmppcp.stn.  ML, (SJ), 12/18/02.

	tables/nwx/tmppcp.bull, tmppcp.stn

===========================  End of Patch 5.6.j  ==============================

t132.	Part of 009v-6.  ML, (SJ), 1/2/03.

	gempak/tables/config/prefs.tbl

t133.	Part of 017d-24.  RT, (SJ), 1/6/03.

	gempak/tables/stns/county.tbl, countynam.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t134.	Part of 017d-25.  RT, (SJ), 1/6/03.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info
	gempak/tables/stns/zones.tbl

t135.	Part of 017d-26.  RT, (SJ), 1/6/03.

	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info
	gempak/tables/stns/cwa.tbl

t136.	Part of 023b-15.  AH, (SJ), 1/28/03.

	tables/nwx/master.tbl, guidata.tbl
	NEW:	tables/nwx/wou.bull

t137.	Part of 010jj-3.  HZ, (SJ), 1/29/03.

	gempak/tables/pgen/setting.tbl

t138.	Part of 017d-28.  RT, (SJ), 3/4/03.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info
	gempak/tables/stns/zones.tbl

t139.	Part of 004t-10.  DK, (SJ), 3/4/03.

	gempak/tables/hcnadv/altker.tbl, eptker.tbl

t140.	Part of 007p-1.  JW, (SJ), 3/5/03.

	gempak/tables/pgen/setting.tbl, textbtn.tbl
	NEW:	gempak/tables/pgen/mcloud.tbl

t141.	Part of 015c-3.  RT, (SJ), 3/5/03.

	tables/nsharp/nsharp_models.tbl

t142.	Part of 018j-2.  DP, (SJ), 3/5/03.

	gempak/tables/sat/imgtyp.tbl
	NEW:	gempak/tables/sat/imgcoeffs.tbl

t143.	Part of 001bb-15.  AH, (SJ), 3/7/03.

	gempak/tables/config/datatype.tbl

t144.	Part of 017d-29.  SJ, (DP), 3/10/03.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t145.	Part of 001h-6.  FY, (SJ), 3/10/03.

	gempak/tables/stns/intlsig.tbl

t146.	Part of 001bb-17. ML, (AH), 3/10/03.

	gempak/tables/config/miscset.tbl

t147.	Part of 017d-31.  RT, (TP), 3/20/03.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info

t148.	Part of 017d-32.  RT, (TP), 3/20/03.

	gempak/tables/stns/zones.tbl

===========================  End of Patch 5.6.k  ==============================

t149.	T255:  Fix AWIPS grid #220 in grdnav.tbl.  This is the Southern
	Hemisphere SSMI-derived sea ice concentrations.  KB, (SJ), 4/2/03.

	gempak/tables/grid/grdnav.tbl

t150.	Part of 001bb-29.  ML, (SJ), 4/2/03.

	gempak/tables/config/miscset.tbl

t151.	Part of 004t-13.  DK, (SJ), 4/2/03.

	gempak/tables/stns/nhcbkpt_plt.tbl

t152.	Part of 001bb-31.  ML, (SJ), 4/9/03.

	gempak/tables/config/miscset.tbl

t153.	Part of 018l.  DP, (SJ), 4/10/03.

	gempak/tables/sat/imgtyp.tbl

t154.	Psrt of 017d-33.  DP, (SJ), 4/14/03.

	gempak/tables/bounds/bwx1224.tbl, bwx1224.tbl.info
	gempak/tables/config/clo.tbl

t155.	Part of 004r-2.  KB, (SJ), 4/14/03.

	gempak/tables/pgen/awdef.tbl

t156.	Part of 007s-1.  MG, (SJ), 4/15/03.

	gempak/tables/pgen/symbolbtn.tbl

t157.	Part of 007s-2.  MG, (SJ), 4/17/03.

	gempak/tables/draw/combo.tbl
	gempak/tables/pgen/combsymbbtn.tbl

t158.	Part of 004t-15.  TL, (SJ), 4/22/03.

	gempak/tables/config/miscset.tbl

t159.	Part of 017d-34.  RT, (TP), 4/24/03.

	gempak/tables/stns/zones.tbl

t160.	Part of 023b-19.  SJ, (AH), 4/28/03.

	tables/nwx/guidata.tbl, master.tbl
	NEW:	tables/nwx/heat.bull

t161.	T264:  Added fire weather model to datatype and mod_res tables to 
	allow for NMAP and GEMPAK access.  SS, (SJ), 4/29/03.

	gempak/tables/config/datatype.tbl
	gempak/tables/nmap/mod_res.tbl

t162.	Part of 009mm.  ML, (SJ), 4/30/03.

	gempak/tables/config/miscset.tbl

t163.	Part of 010jj-6.  HZ, (SJ), 5/12/03.

	gempak/tables/pgen/uattribd.tbl

t164.	Part of 005s-9.  MG, (SJ), 5/12/03.

	gempak/tables/grid/g2vars.tbl

t165.	Part of 009mm-1.  ML, (SJ), 5/13/03.

	gempak/tables/config/miscset.tbl

t166.	Part of 005s-10.  MG, (SJ), 5/13/03.

	gempak/tables/grid/g2vars.tbl

t167.	Part of 005s-11.  MG, (SJ), 5/16/03.

	gempak/tables/grid/g2vars.tbl

t168.	Part of 018l-1.  SJ, (DK), 5/16/03.

	gempak/tables/sat/imgtyp.tbl

t169.	Part of 009o.  ML, (SJ), 5/20/03.

	gempak/tables/config/miscset.tbl

t170.	Part of 014e-1.  RT, (SJ), 5/21/03.

	tables/nwx/cgdata.bull, taf.stn

t171.	Part of 018l-2.  SJ, (TP), 5/21/03.

	gempak/tables/sat/imgtyp.tbl

t172.	Part of 005s-13.  MG, (SJ), 5/27/03

	gempak/tables/grid/g2vars.tbl

t173.	Part of 010jj-7.  SJ, (DP), 5/27/03

	gempak/tables/pgen/setting.tbl

t174.	Part of 017d-35.  RT, (TP), 5/28/03

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t175.	Part of 017d-36.  RT, (TP), 5/28/03

	gempak/tables/stns/zones.tbl

t176.	Part of 017d-37.  SJ, (SS), 5/28/03

	gempak/tables/config/clo.tbl, mapfil.tbl
	gempak/tables/nmap/mapovl.nmap
	NEW:	gempak/tables/bounds/hpcsfc.tbl, hpcsfc.tbl.info

t177.	Part of 001z-11.  DK, (SJ), 5/28/03

	gempak/tables/config/prmlst.tbl
	gempak/tables/nmap/taf_parms.tbl
	gempak/tables/pack/taf.pack
	gempak/tables/parms/pcconv.tbl
	gempak/tables/stns/tafstn.tbl

t178.	Part of 004nn.  ML, (SJ), 5/20/03.

	gempak/tables/config/miscset.tbl

t179.	Part of 001bb-44.  AH, (SJ), 6/5/03.

	gempak/tables/nmap/nmap_pgw.tbl

t180.	Part of 017d-38.  SJ, (DK), 6/5/03.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info
	gempak/tables/stns/county.tbl, countynam.tbl

t181.	Part of 001h-9.  FY, (SJ), 6/6/03.

	gempak/tables/pgen/sigmetinfo.tbl

t182.	Part of 001h-10.  FY, (SJ), 6/10/03.

	gempak/tables/stns/intlsig.tbl

t183.	Part of 001z-12.  DK, (SJ), 6/10/03.

	gempak/tables/stns/tafstn.tbl

===========================  End of Patch 5.6.l  ==============================

t184.	Part of 009gg-10.  TP, (SJ), 6/24/03.

	gempak/tables/config/prefs.tbl

t185.	Part of 018j-13.  DP, (SJ), 6/25/03.

	gempak/tables/sat/imgcoeffs.tbl

t186.	Part of 004oo-1.  TL, (SJ), 6/30/03.

	gempak/tables/parms/pcconv.tbl
	gempak/tables/nmap/metar_parms.tbl, synop_parms.tbl, newavnmos_parms.tbl,
							ngmmos_parms.tbl

t187.	Part of 019e.  MG, (SJ), 7/1/03.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info
	gempak/tables/config/mapfil.tbl, prmlst.tbl
	gempak/tables/grid/wmogrib3.tbl
	gempak/tables/luts/enhance.tbl
	gempak/tables/pgen/afosprod.tbl, awdef.tbl, tiffprod.tbl
	gempak/tables/sat/imgtyp.tbl
	gempak/tables/stns/geog.tbl, zones.tbl
NEW:	gempak/tables/luts/ssmi_opc.tbl (actually renamed)

t188.	Part of 005u.  DP, (SJ), 7/1/03.

	gempak/tables/pgen/setting.tbl, uattribd.tbl

t189.	Part of 009tt.  TP, (SJ), 7/15/03.

	gempak/tables/config/prefs.tbl

t190.	Part of 017d-38.  MG, (SJ), 7/18/03.

	gempak/tables/bounds/ssa_bnd.tbl, ssa_bnd.tbl.info

t191.	Part of 008p-1.  DP, (SJ), 7/18/03.

	gempak/tables/config/clo.tbl
	NEW:	gempak/tables/bounds/opcbnds.tbl, opcbnds.tbl.info,
				opcbnds_nomex.tbl, opcbnds_nomex.tbl.info

t192.	Updated Marine Zones with 06/30/03 shape file.  Added Marine Zone 
	Bounds and Bounds Info file.

	gempak/tables/stns/zones.tbl
	NEW:	gempak/tables/bounds/mzbnds.tbl, mzbnds.tbl.info

t193.	Part of 004t-18.  DK, (SJ), 7/25/03.

	gempak/tables/stns/nhcbkpt_plt.tbl

t194.	Part of 008p-2.	DP, (SJ), 7/25/03.

	gempak/tables/bounds/opcbnds.tbl, opcbnds.tbl.info, opcbnds_nomex.tbl,
							opcbnds_nomex.tbl.info

t195.	Part of 017d-39.  RT, (TP), 7/28/03.

	gempak/tables/bounds/mzbnds.tbl, mzbnds.tbl.info, pfzbnds.tbl,
							pfzbnds.tbl.info
	gempak/tables/stns/zones.tbl, county.tbl, countynam.tbl, ffgzon.stn
	NEW:	gempak/tables/stns/firezones.tbl

t196.	Part of 001bb-55.  ML, (AH), 7/31/03.

	gempak/tables/config/miscset.tbl

t197.	Part of 004ss.  ML, (SJ), 8/11/03.

	gempak/tables/config/miscset.tbl

t198.	Part of 005u-4.  HZ, (DP), 8/11/03.

	gempak/tables/pgen/sigmetbtn.tbl

t199.	Part of 005u-5.  RT, (DP), 8/12/03.

	gempak/tables/stns/volcano.tbl

t200.	Part of 001bb-56.  AH, (SJ), 8/12/03.

	NEW:	gempak/tables/txtprd/woudef.tbl

t201.	Part of 019c-21.  SJ, (SJ), 8/14/03.

	gempak/tables/config/miscset.tbl

t202.	Part of 002a-6.  TP, (SJ), 8/29/03.

	gempak/tables/grid/g2vars.tbl

t203.	Part of 023c.  MG, (DK), 9/2/03.

	tables/nwx/master.tbl, guidata.tbl
	NEW:	tables/nwx/marnmos.stn

t204.	Part of 001z-14.  DK, (SJ), 9/2/03.

	gempak/tables/nmap/taf_parms.tbl
	gempak/tables/parms/pcconv.tbl

t205.	Part of 005u-9.  HZ, (DP), 9/4/03.

	NEW:	gempak/tables/pgen/vaa.tbl

t206.	Part of 003a-35.  JW, (DP), 9/12/03.

	gempak/tables/pgen/setting.tbl, uattribd.tbl

t207.	Part of 017d-40.  RT, (TP), 9/15/03.

	gempak/tables/bounds/pfzbnds.tbl, pfzbnds.tbl.info
	gempak/tables/stns/zones.tbl

t208.	Part of 017d-41.  RT, (TP), 9/15/03.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info
	gempak/tables/stns/county.tbl, countynam.tbl

t209.	Part of 017d-42.  RT, (TP), 9/15/03.

	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info

t210.	Part of 001h-11.  FY, (SJ), 9/15/03.

	gempak/tables/stns/intlsig.tbl

t211.	Part of 008p-7.  DP, (SJ), 9/17/03.

	gempak/tables/bounds/opcbnds.tbl, opcbnds.tbl.info,
				opcbnds_nomex.tbl, opcbnds_nomex.tbl.info	

t212.	Part of 005u-11.  SJ, (DP), 9/24/03.

	gempak/tables/pgen/sigmetbtn.tbl


