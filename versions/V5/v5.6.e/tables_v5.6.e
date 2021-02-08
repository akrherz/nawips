		NAWIPS 5.6  Tables Changes Description Log

	TFC => Table Format Change (This notation began with 5.6.e)

t1.	Part of 021a.  Done, FY, (TP), 9/12/00.

	gempak/tables/sigmetinfo.tbl

t2.	Part of 010d.  Done, DKW, (TP), 9/12/00.

	gempak/tables/config/datatype.tbl, miscset.tbl

t3.	Updated the snstns.tbl.  Compiled a new list of current upper air
	stations from the WMO Publication No. 9, Volume A, May 2000.  Done,
	AH, (TP), 9/12/00.

	gempak/tables/stns/snstns.tbl

t4.	Part of b1.  Done, MLI, (TP), 9/12/00.

	tables/nwx/guidata.tbl, master.tbl

t5.	Part of 019a.  Done, AH, (TP), 9/15/00.

	gempak/tables/stns/zones.tbl

t6.	Part of 019b.  Done, AH, (TP), 9/15/00.

	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info

t7.	Part of 019c.  Done, AH, (TP), 9/15/00.

	gempak/tables/stns/county.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t8.	Added DEFAULT column to table mapovl.nmap for default overlay
	settings.  Part of 018b.  Done, MLI, (TP), 9/18/00.

	gempak/tables/nmap/mapovl.nmap [Structure of table changed!]

t9.	Reconciled various model entries in datatype.tbl with the data that is
	actually in the data directories.  Done, SJ, (TP), 9/20/00.

	gempak/tables/config/datatype.tbl

t10.	Updated tables taf.stn, local.bull, zone.bull, and the pqact.conf file
	according to NWS change notice FOS 1781, FOS 1785, SCN 00-73, and
	DMM 08-00.05 ~ 08-00.08. (effective range 8/31/00 - 9/15/00)
	Done, MLI, (TP), 9/25/00.

	tables/nwx/taf.stn, local.bull, zone.bull

t11.	Part of 019e.  Done, AH, (TP), 9/27/00.  

	gempak/tables/stns/zones.tbl

t12.	Updated the NEWMOS station table for two station id. changes, KCUT to
	K0V1 and PHJR to PHNA.  Done, AH, (TP), 9/27/00.

	gempak/tables/stns/newmos.stn

t13.	Part of 001d.  Done, DKW, (TP), 9/29/00.

	gempak/tables/pack/mosa.pack, mosm.pack

t14.	Part of 019f. Done, AH, (TP), 9/29/00.

	gempak/tables/bounds/cwabnds.tbl, cwabnds.tbl.info
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t15.	Added station priorities (for plotting) to the new MOS station table.
	(The priorities are the same as those in the mrfmos.stn table.)  Changed
	German upper air stations:  drop 10486 (Dresden), add 10468 (Oppin).
	Done, DKW, (TP), 10/2/00.

	gempak/tables/stns/newmos.stn, snstns.tbl

t16.	Part of 009a.  Done, JP, SJ, (TP), 10/4/00.

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/pgen/faxprod.tbl, tiffprod.tbl
	gempak/tables/stns/geog.tbl

t17.	Part of 021f.  Done, FY, (TP), 10/6/00.

	gempak/tables/pgen/sigmetinfo.tbl

t18.	Table changes to display new AVN and MRF MOS data in NMAP and NMAP2.
	Done, DKW, (TP), 10/6/00.

	gempak/tables/parms/pcconv.tbl
	gempak/tables/stns/newmos.stn
	gempak/tables/config/datatype.tbl, prmlst.tbl
	gempak/tables/nmap/dcatg.nmap, dsrc.nmap, master.nmap*
NEW:	newavnmos_parms.tbl, newmrfmos_parms.tbl

t19.	Modified tables for station changes.  Done, AH, (TP), 10/11/00.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t20.	Part of 019g.  Done, AH, (TP), 10/11/00.

	gempak/tables/stns/zones.tbl

t21.	Part of 021n.  Done, MLI, (TP), 10/18/00.

	NEW:	gempak/tables/config/trkint.tbl

t22.	Part of 019h.  Done, AH, (TP), 10/20/00.

	gempak/tables/stns/zones.tbl

t23.	Part of 019i.  Done, AH, (TP), 10/20/00.

	gempak/tables/stns/county.tbl
	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t24.	Part of b5.  Done, MLI, (TP), 10/24/00.

	tables/nwx/zone.bull, now.bull, taf.stn

t25.	Part of 019k.  Done, AH, (TP), 11/1/00.

	gempak/tables/stns/zones.tbl

t26.	Part of b7.  Done, GG, SJ, (TP), 11/1/00.

	tables/nwx/guidata.tbl, master.tbl, zone.bull
	NEW:  tables/nwx/stadts.bull, stahry.bull, watcnty.bull, watsum.bull

t27.	Added Western Region QPF points to locator/seek and map overlay for NMAP
	at the request of the HPC.  Done, SS, (TP), 11/2/00.

	gempak/tables/config/clo.tbl
	gempak/tables/nmap/mapovl.nmap, locator.tbl
	NEW:  gempak/tables/stns/wrqpf.tbl

===========================  End of Patch 5.6.a  ===============================

t28.	Changed station priorities (used for plotting) for two new MOS stations
	(per request of HPC's Joey Carr).  Done, DK, (TP), 11/17/00.

	gempak/tables/stns/newmos.stn

t29.	Updated the snstns.tbl.  Added 17 station ids to Canadian and U. S.
	stations.  Done, AH, (TP), 11/17/00.

	gempak/tables/stns/snstns.tbl

t30.	Part of b8.  Done, MLI, (TP), 11/21/00.

	tables/nwx/dclim.stn, mclim.bull

t31.	Part of 010cc.  Done, DKW, (TP), 11/28/00.

	gempak/tables/parms/pcconv.tbl

t32.	Part of 019l.  Done, AH, (TP), 12/22/00.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info

t33.	Added Volcanic Ash (VASH) to the NCEP GRIB table.  Done, SJ, (TP),
	12/22/00.

	gempak/tables/grid/ncepgrib2.tbl

t34.	Part of 021mm.  Dobe, MLI, ES, (TP), 1/3/01.

	gempak/tables/pgen/grptyp.tbl

t35.	Added the ETA20 model to mod_res.tbl.  Done, SJ, (TP), 1/4/01.

	gempak/tables/nmap/mod_res.tbl

t36.	Part of 010uu.  Done, FY, (TP), 1/4/01.

	gempak/tables/config/datatype.tbl, miscset.tbl

t37.	Part of b10.  Done, SJ, (TP), 1/12/01.

	tables/nwx/master.tbl, guidata.tbl

t38.	Updated stations tables.  Done, AH, (TP), 1/12/01.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t39.	Changed the NWX table prog.bull. The SPC pointed out that the
	originating station was wrong on two products.  Done, SJ, (TP), 1/17/01.

	tables/nwx/prog.bull

t40.	Added new proabilistic outlook types to the grptyp table.  Done, DP,
	(TP), 1/17/01.

	gempak/tables/pgen/grptyp.tbl

t41.	Fixed printer names in printer.tbl for the CDB. Removed the 4th floor
	printers since they have their own copies of the table.  Done, SJ, (TP),
	1/17/01.

	gempak/tables/config/printer.tbl

t42.	Changed spln20 and spln21 smoothing level from 2 to 0.  Done, AH, (TP),
	1/19/01.

	gempak/tables/pgen/setting.tbl

t43.	Update documentation for grptyp.tbl.  Done, DP, (TP), 1/19/01.

	gempak/tables/pgen/grptyp.tbl

t44.	Updated sample HPC and MPC directories in the table vgf.nmap.  Done,
	SJ, (TP), 1/19/01.

	gempak/tables/nmap/vgf.nmap

t45.	Updated the nexrad.tbl file to change all station ids of 999 to the
	correct station id value as provided by the NWS.  Done, SJ, (TP),
	1/22/01.

	gempak/tables/stns/nexrad.tbl

t46.	Correct documentation of grptyp.tbl to reflect correct number of 
	maximum allowable characters per label.  Done, DP, (TP), 1/23/01.

	gempak/tables//pgen/grptyp.tbl

===========================  End of Patch 5.6.b  ===============================

t47.	Added new SPC products to awdef.tbl.  Done, SJ, (TP), 2/1/01.

	gempak/tables/pgen/awdef.tbl

t48.	Part of 010aaa.  Done, DP, (TP), 2/1/01.

	NEW:	gempak/tables/stns/countyclust.tbl

t49.	Part of 019o.  Done, AH, (TP), 2/8/01.

	gempak/tables/bounds/countybnds.tbl, countybnds.tbl.info, cwabnds.tbl, 
			cwabnds.tbl.info, statebnds.tbl, statebnds.tbl.info
	gempak/tables/stns/zones.tbl

t50.	Updated the datatype.tbl file to access the data on the new servers.
	Changed the grid data to use 4 digit year.  Updated mod_res.tbl to
	use the new/modified grid aliases.  Done, SJ, (TP), 2/13/01.

	gempak/tables/config/datatype.tbl
	gempak/tables/nmap/mod_res.tbl

t51.	Part of 018oo.  Done, HZ, ES, (SJ), 2/15/01.

		gempak/tables/pgen/funcbtn.tbl
	NEW:	gempak/tables/pgen/ctrlbtn.tbl

t52.	Changed the default IMAGE data from GOES-8 to GOES-E to conform to new
	names on the Dell data servers.  Done, SJ, (DP), 2/21/01.

	gempak/tables/nmap/dcatg.nmap

t53.	Part of b11.  Done, SJ, (AH), 2/21/01.

	tables/nwx/intsig.tbl, vlcsig.bull

t54.	Fixed county cluster definition.  Done, DP, (TP), 2/21/01.

	gempak/tables/stns/countyclust.tbl

t55.	Updated enhance.tbl and added a new table goes_dpw.tbl.  Done, JC, (SS),
	2/21/01.

		gempak/tables/luts/enhance.tbl
	NEW:	gempak/tables/luts/goes_dpw.tbl

t56.	Part of 019p.  Done, DP, (SJ), 2/26/01.

	gempak/tables/config/mapfil.tbl

t57.	Changed the latitude and longitude from 4138  -9133  -> 4163  -9155
	for IOW.  Done, AH, (SJ), 2/26/01.

	gempak/tables/stns/sfstns.tbl, xrainsort.tbl

t58.	Created table containing the county clusters.  Done, DP, (SJ), 3/1/01.

		gempak/tables/nmap/mapovl.nmap
	NEW:	gempak/tables/stns/cnty_clst.tbl

t59.	Modified the entry for product 96C in the awdef.tbl table.  Done, SJ,
	(SJ), 3/2/01.

	gempak/tables/pgen/awdef.tbl

t60.	Part of 010jjj.  Done, HZ, (DP), 3/6/01.

	gempak/tables/pgen/setting.tbl

t61.	SPC updated the following tables: county.tbl - removed keys from Monroe,
	outlooktimes.tbl - corrected initial day 1 adjustment value, 
	nmap_pgw.tbl - modified hail sizes for watch.  Done, GG, (SS), 3/7/01.

	gempak/tables/nmap/nmap_pgw.tbl
	gempak/tables/pgen/outlooktimes.tbl
	gempak/tables/pgen/county.tbl

t62.	Part of 010qqq.  Done, SJ, (ES), 3/14/01.

	gempak/tables/config/datatype.tbl
	gempak/tables/nmap/mod_res.tbl

t63.	Part of 001r.  Done, DKW, (SJ), 3/15/01.

	gempak/tables/stns/snstns.tbl

t64.	Replaced the combined North Carolina counties ala Monroe Co., FL.
	Done, DP, (SS), 3/15/01.

	gempak/tables/stns/county.tbl

t65.	Part of 021kkk.  Done, HZ, (DP), 3/15/01.

	gempak/tables/pgen/grptyp.tbl

t66.	Part of 010rr.  Update documentation.  Done, DP, (ES), 3/16/01.

	gempak/tables/pgen/grptyp.tbl

t67.	Part of b12.  Done, DKW, (SJ), 3/19/01.

	gempak/tables/config/datatype.tbl, prmlst.tbl

t68.	Updated station tables.  Done, AH, (DKW), 3/19/01.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl, lsfstns.tbl

t69.	Part of 019q.  Done, AH, (TP), 3/20/01.

	gempak/tables/stns/zones.tbl

t70.	Added DC VAAC to the map overlay table.  Done, DP, (DP), 3/21/01.

	gempak/tables/nmap/mapovl.nmap

t71.	Ensemble data files under $MODEL/ens were changed to take advantage of
	recently added model subname (ala VAFTAD and GHM).  Done, DP, (SJ),
	3/21/01.

	gempak/tables/config/datatype.tbl
	gempak/tables/nmap/mod_res.tbl

t72.	Add doc for group type in setting.tbl.  Done, DP, (SJ), 3/22/01.

	gempak/tables/pgen/setting.tbl

t73.	Part of 021lll. The format for grptyp.tbl has changed to add the complete
	set of line and text attributes. Done, HZ, (DP), 3/23/01.

	gempak/tables/pgen/grptyp.tbl

t74.	Corrected group type settings for dashed line and scallop line.
	Done, TL, (SJ), 3/23/01.

	gempak/tables/pgen/setting.tbl

t75.	Change size of CATG_SVR text size from small to large.  Done, DP, (SS),
	3/26/01.

	gempak/tables/pgen/grptyp.tbl

t76.	Updated group table to add probabilistic label values to the outlook
	group.  Done, SS, (DP), 4/3/01.

	gempak/tables/pgen/grptyp.tbl

===========================  End of Patch 5.6.c  ===============================

t77.	Part of 021rrr.  Done, SJ, (ES), 4/9/01.

	gempak/tables/draw/splpat.tbl
	gempak/tables/pgen/frontbtn.tb

t78.	Added global grids, AVNP, FNLP, and MRFP, to configuration and
	restore file tables.  Done, TL, (SJ), 4/11/01.

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/datatype.tbl

t79.	Part of 021ttt.  Done, ES, (SJ), 4/11/01.

	gempak/tables/pgen/circlebtn.tbl, classbtn.tbl, combsymbbtn.tbl,
				ctrlbtn.tbl, frontbtn.tbl, funcbtn.tbl,
				linebtn.tbl, prodbtn.tbl, sigmetbtn.tbl,
				symbolbtn.tbl, trackbtn.tbl, textbtn.tbl,
				vectorbtn.tbl, watchbtn.tbl

t80.	Part of 020f.  Done, DP, (SJ), 4/12/01.

	      gempak/tables/config/clo.tbl
	NEW:  gempak/tables/bounds/locowobnds.tbl, locowobnds.tbl.info

t81.	Created vgf and bounds files for lakes and great lakes.  Done, DP, (TP),
	4/13/01.

		gempak/tables/config/clo.tbl
	NEW:	gempak/tables/bounds/greatlakesbnds.tbl, greatlakesbnds.tbl.info,
						lakesbnds.tbl, lakesbnds.tbl.info
		gempak/data/vgf/greatlakesbnds.vgf, lakesbnds.vgf

t82.	Created vgf and bounds files for adjacent coastal waters in support of
	the AWC Convective SIGMET product.  Done, DP, (TP), 4/17/01.

		gempak/tables/config/clo.tbl
	NEW:	gempak/tables/bounds/adjcstlbnds.tbl, adjcstlbnds.tbl.info
		gempak/data/vgf/adjcstlbnds.vgf

t83.	Part of 001v.  Done, FY, (DKW), 4/18/01.  

	gempak/tables/pack/msfc.pack
	gempak/tables/stns/msfstns.tbl

t84.	Part of 020g.  Done, DP, (TP), 4/18/01.

	gempak/tables/bounds/greatlakesbnds.tbl, greatlakesbnds.tbl.info

t85.	Part of 006i.  Done, DP, (SJ), 4/25/01.

	gempak/tables/bounds/locowobnds.tbl, locowobnds.tbl.info

t86.	Part of 018ddd.  Done, SJ, (SS), 4/25/01.

	gempak/tables/config/miscset.tbl

t87.	Part of 019r.  Done, DP, (TP), 4/27/01.

	gempak/tables/bounds/locowobnds.tbl, locowobnds.tbl.info

t88.	Part of 016f.  Done, SC, TP, (DKW), 4/27/01.

	tables/nwx/mws.bull, rgtmpc.stn, smw.bull, stf.bull

t89.	Part of 021a1c.  Done, SS, GG, (DP), 5/1/01.

	gempak/tables/pgen/outlook.txt

t90.	Part of 018kkk.  Done, MLI, ES, (SJ), 5/2/01.

	gempak/tables/nmap/mapovl.nmap

t91.	Removed the margin settings from the geog area BWUS at the request of 
	the HPC.  Done, SJ, (DP), 5/7/01.

	gempak/tables/stns/geog.tbl

t92.	Part of 010a1i.  Done, FY, (DKW), 5/10/01.

	gempak/tables/config/datatype.tbl, miscset.tbl

t93.	Part of 009e.  Done, JP, SS, (SJ), 5/10/01.

	gempak/tables/pgen/tiffprod.tbl

t94.	Added more models to the datatype.tbl. Re-ordered some of the model
	entries.  Done, SJ, (TP), 5/10/01.

	gempak/tables/config/datatype.tbl

t95.	Created 6 new tables for use by GPTPC in the generation of the hurricane
	graphics.  Done, AH, (DK), 5/14/01.

	NEW:	gempak/tables/hcnadv/altker.tbl, eptker.tbl, intprba.tbl,
					intprbp.tbl, wndprba.tbl, wndprbp.tbl

t96.	Part of 021a1p.  Done, DP, (SJ), 5/14/01.

	gempak/tables/pgen/setting.tbl

t97.	Part of 021a1s.  Done, HZ, (ES), 5/16/01.

	gempak/tables/pgen/funcbtn.tbl

t98.	Part of 010a1q.  Done, DK, (SJ), 5/17/01.

	gempak/tables/config/miscset.tbl

t99.	Part of 001x. Done, DK, (SJ), 5/17/01.

	gempak/tables/stns/sfstns.tbl

t100.	Part of 011r. Done, AH, DK, (SJ), 5/17/01.

	gempak/tables/config/datatype.tbl

=============================  End of Patch 5.6.d  =============================
t101.	The Table drop_parms.tbl is added to enable station
	model editing for ship dropsonde data.  Part of 
	001y.  Done, DK, (SJ), 5/30/01.

	NEW: gempak/tables/nmap/drop_parms.tbl

t102.	Updated the data type table to access the old and new
	format ATCF data that originates on the SP.  Done, DK, (SJ),
	5/30/01.

	gempak/tables/config/datatype.tbl

t103.	Corrected the longitude value for Point Wilson in Great Lakes
	buoy table file.  Done, FY, (DK), 6/4/01

	gempak/tables/stns/msfstns.tbl

t104.	Added GHM and GHMNEST to the mod_res.tbl and created 8 new
	restore files for these models.  Done, SJ, (DP), 6/05/01.

	gempak/tables/nmap/mod_res.tbl 

	NEW:
	gempak/nts/nmap/restore/modl/ghm/500mb_absv_wind 
	gempak/nts/nmap/restore/modl/ghm/pmsl_1000-500thk       
	gempak/nts/nmap/restore/modl/ghm/850mb_absv_wind        
	gempak/nts/nmap/restore/modl/ghm/200mb_absv_wind        
	gempak/nts/nmap/restore/modl/ghm/700mb_absv_wind        
	gempak/nts/nmap/restore/modl/ghm/pmsl_1000mb_wind       
	gempak/nts/nmap/restore/modl/ghm/minpres_1000mb_wind    
	gempak/nts/nmap/restore/modl/ghm/minpres_35m_wind  

t105.	Updated county tables (county.tbl and countynam.tbl) with the 16my01
	shapefile.  Done, TP, SJ, (SS), 6/12/01.

	gempak/tables/stns/county.tbl, countynam.tbl


 =============================  End of Patch 5.6.d.1  ======================

t106.	Added new entries for the MM5, FSL RUCS and FNMOC Wave models to
	datatype.tbl and mod_res.tbl.  Done, SJ, 6/18/01.

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/datatype.tbl

t107.	Added station MHSC/78718 to upper air station table at the request of
	the SDM.  Done, DKW, (SJ), 6/19/01.

	gempak/tables/stns/snstns.tbl

t108.	Part of 021a1x.  Done, HZ, (DP), 6/25/01.

	gempak/tables/nmap/nmap_pgw.tbl

t109.	Part of 010a1z.  Done, AH, (DKW), 6/25/01.

	NEW:  gempak/tables/hcnadv/ghcolr.tbl

t110.	Added NTAA (Tahiti) to international sigmet table for NWX; added PAFA
	(Fairbanks) to state forecast discussion table for NWX.  Done, DKW, (SJ),
	6/27/01.

	tables/nwx/intsig.tbl, sfd.bull

t111.	Part of 021a2a.  Done, DP, (SJ), 7/2/01.

	gempak/tables/pgen/sigmetinfo.tbl


t112.	Part of 010a2f.  Done, JW, (ES), 7/3/01.

	NEW:	gempak/tables/nmap/spf.nmap

t113.	Part of 019u.  Done, AH, (TP), 7/6/01.

	gempak/tables/bounds/county.tbl, countybnds.tbl, countybnds.tbl.info
						cwabnds.tbl
	gempak/tables/stns/zones.tbl

t114.	Added 62 new stations to sfstns.tbl, added 8 stations to inactive.tbl and
	added 32 stations to xrainsort.tbl.  Corrected the elevation in all 3 
	tables for station, WYL, YOHO PARK from 60 to 1615.  Changed station id 
	C52 to BUU and 6A3 to RHP.  Done, AH, (SJ), 7/9/01.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t115.	Part of 019v.  Corrected the spelling of two station names in Iowa.  
	Done, AH, (TP), 7/17/01.

	gempak/tables/stns/zones.tbl, sfstns.tbl, xrainsort.tbl

t116.	Added 3 new CPC products to awdef.tbl. The products are: 3-7  Day Max 
	Heat Index, 6-10 Day Max Heat Index, 8-14 Day Max Heat Index.  Done, 
	SJ, (DP), 7/17/01.

	gempak/tables/pgen/awdef.tbl

t117.	Corrected the station name spelling for ADU and fixed unknown
	station number '999990' to '999999' in sfstns.tbl, inactive.tbl, and
	xrainsort.tbl.  Added 24 new stations to sfstns.tbl and 20 to 
	xrainsort.tbl.  Added station 78086, Androstown to snstns.tbl for the 
	CAMEX4 (NASA project).  Done, AH, (DKW), 7/19/01.

	gempak/tables/stns/snstns.tbl, sfstns.tbl, inactive.tbl, xrainsort.tbl

t118.	Part of 010a2o.  Done, AH, (SJ), 7/20/01.

	NEW:	gempak/tables/sat/channel.tbl

t119.	Part of 010a2p.  Done, DKW, (SJ), 7/23/01.

	gempak/tables/config/miscset.tbl

t120.	Part of b15.  Done, SJ, (DKW), 7/23/01.

	tables/nwx/master.tbl, guidata.tbl

t121.	Part of 010a2q.  Done, SJ, ES, (DKW), 7/24/01.

	gempak/tables/config/miscset.tbl, datatype.tbl

t122.	Part of 019w.  Done, DP, (SJ), 7/24/01.

	gempak/tables/bounds/adjcstlbnds.tbl, adjcstlbnds.tbl.info

t123.	Fixed spelling of TALLAHASSEE in spcwatch.tbl.  Done, GG, SJ, (DKW),
	8/13/01.

	gempak/tables/stns/spcwatch.tbl

t124.	Part of 001hh.  Station table was updated to include two possible station 
	numbers for CAMEX4 soundings, since no definitive information has been 
	received as to the correct station number.

	gempak/tables/stns/snstns.tbl

t125.	Added entries to awdef.tbl for 3 new AWC RedBook graphics products.
	The entries are for the CCFP products CF2, CF4 and CF6.  Done, SJ, (DP),
	8/14/01.

	gempak/tables/pgen/awdef.tbl

t126.	Part of 001ii.  Done, FY, (DKW), 8/16/01.

	gempak/tables/nmap/newmrfmos_parms.tbl
	gempak/tables/pack/mosm.pack

t127.	Updated documetation of three NMAP tables to indicate they only apply
	to NMAp, not NMAP2.  Done, SS, (SJ), 8/17/01.

	gempak/tables/nmap/master.nmap, dcatg.nmap, dsrc.nmap

t128.	Part of 020i.  Done, DP, (SJ), 8/22/01.

	adjcstlbnds.tbl(.info), countybnds.tbl(.info), cwabnds.tbl(.info),
	greatlakesbnds.tbl(.info), lakesbnds.tbl(.info), locowobnds.tbl(.info),
	statebnds.tbl(.info)

t129.	Remove multiple WFO entries with proper single WFO in county(nam).tbl.
	Added Caribou, ME to wfo.tbl.  Done, DP, (  ), 

	gempak/tables/stns/county.tbl, countynam.tbl, wfo.tbl

t130.	Part of 011cc.  Done, MLI, (SJ), 9/10/01.

	gempak/tables/config/clo.tbl

	NEW:	gempak/tables/stns/us_ak.tbl, us_ak.tbl.info, stns_ll90.tbl

t131.	Part of 010a3a.  Done, SJ, (DP), 9/12/01. 

	gempak/tables/stns/avnmos.stn, airep_waypnts.tbl, msfstns.tbl,
		marine.tbl, buoys.tbl, cities.tbl, county.tbl, cwa.tbl,
		ffgzon.stn, island.tbl, lsfstns.tbl, mrfmos.stn, newmos.stn,
		ngmmos.stn, pirep_navaids.tbl, snstns_ship.tbl, systns.tbl,
		syworld.tbl, zones.tbl

t132.	Fixed problem #489:P1 - Segmentation fault when running CPCGSTN.  The 
	reason is the program could not read the required bounds file.  This 
	release moves the bounds files to the corect directory.  Done, MLI, 
	(SJ), 9/13/01.

	gempak/tables/bounds/us_ak.tbl, us_ak.tbl.info

t133.	Part of 010a3c.  Done, TL, (SJ), 9/14/01.

	gempak/tables/parms/pcconv.tbl
	gempak/tables/nmap/metar_parms.tbl, ship_parms.tbl, ship6hr_parms.tbl,
								synop_parms.tbl


t134.	Part of 021a2q.  Done, SJ, (ES), 9/17/01.

	gempak/tables/pgen/symbolbtn.tbl

t135.	Part of 019x.  Done, AH, (TP), 9/18/01.

	gempak/tables/stns/zones.tbl


