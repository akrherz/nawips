		NAWIPS 5.4.3+ Tables Changes Description Log

=========================== Patch 5.4.3.a ==================================

t1.	Updated the AFOS product table to include the AWC and HPC
	products. Done, SJ, (SJ), 10/10/97.

	gempak/tables/pgen/afosprod.tbl

=========================== Patch 5.4.3.b =================================

t2.	Fixed a typo int the Marine AFOS Text files.  Done, JP,
	(SS), 10/16/97.

	tables/afos/text/MARTXT

t3.	Added new NMAP restore files for model products with no-fills 
	for ETA, NGM, and Global models for MPC.  Done, JP, (SS),
	10/17/97.

	NEW:gempak/nts/nmap/restore/modl/eta/400mb_avg_rh_ncf
	    gempak/nts/nmap/restore/modl/ngm/500mb_avg_rh_ncf
	    gempak/nts/nmap/restore/modl/global/400mb_avg_rh_ncf

	gempak/tables/nmap/mod_res.tbl

t4.	Added new MPC radiofax products to the product tables.  Done,
	JP, (SS), 10/17/97.

	gempak/tables/pgen/faxprod.tbl, product.tbl

t5.	Added San Francisco station to NWX State Forecast table.  Done,
	GG, (SS), 10/20/97.

	tables/nwx/stf.bull

t6.	Turned off county text string label for county centroids in the
	nmap overlay table.  Done, SS, (SS), 10/20/97.

	gempak/tables/nmap/mapovl.nmap 

=========================== Patch 5.4.3.c =================================

t7.	Added Basic Weather maps.  Also added a new geographic area
	for the Basic Weather function and replaced US+ in the
	NMAP table for pre-defined areas.  Done, GK, (SS), 10/27/97.

	NEW:gempak/maps/ascii/ascbwx3648.ncp, ascbwx1224.ncp
	    gempak/maps/bwx3648.ncp, bwx1224.ncp

	gempak/tables/stns/geog.tbl
	gempak/tables/config/mapfil.tbl
	gempak/tables/nmap/mapinfo.nmap, mapovl.nmap

t8.	Added snow depth parameter (snow) to nmap table so that it
	can be plotted.  Done, SS, (SS), 10/28/97.

	gempak/tables/nmap/gemparms.tbl

t9.	Added the new Volcanic Ash Advisory Statements to the
	Watch/Warnings category of NWX and updated LDM pattern
	action tables.  Done, SJ, (SS), 10/30/97.

	tables/nwx/guidata.tbl, master.tbl

t10.	Created tables for aviation VOR points and SPC Watch
	Corner Points.  Added tables to NMAP overlay table.
	Done, GK, (SS), 10/30/97.

	NEW:gempak/tables/stns/spcwatch.tbl, vors.tbl

	gempak/tables/nmap/mapovl.nmap

t11.	Added some new NMAP restore files.  Changed the location
	of some because they are model dependent.  Done, JC, (SS),
	10/30/97.

	NEW:gempak/nts/nmap/restore/modl/eta/850mb_h2o_transport,
	850mb_wind_pw, emsl_bl_tempf_wind
	gempak/nts/nmap/restore/misc/bl_thte_wind
	gempak/nts/nmap/restore/modl/global/850mb_h20_transport,
	850mb_wind_pw
	gempak/nts/nmap/restore/modl/ngm/850mb_h20_transport,
	850mb_wind_pw, pmsl_bl_tempc_wind, pmsl_bl_tempf_wind
	gempak/nts/nmap/restore/prcp/precip_66hr
	gempak/nts/nmap/restore/stnd/250mb_wind_and_rel_vort,
	500mb_hght_color, 500mb_hght_geoabsv

	gempak/nts/nmap/restore/misc/850_300mb_wind_shear
	gempak/nts/nmap/restore/modl/eta/svrwx
	gempak/nts/nmap/restore/modl/fnl/850mb_h2o_transport_al
	gempak/nts/nmap/restore/modl/ngm/bl_thte_wind
	gempak/tables/nmap/mod_res.tbl

t12.    Added meso topography product to NMAP.  Done, DP, (SS), 
	11/3/97.

	NEW:gempak/nts/nmap/restore/modl/meso/topography

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/data.tbl

=========================== Patch 5.4.3.d =================================

t13.	Revised the active and inactive surface station tables
	adding 10 new asos stations, numerous stations in 
	Africa and China, and several other stations.  Done,
	DKW, (SS), 11/12/97.

	gempak/tables/stns/sfstns.tbl, inactive.tbl 

t14.	Sorted the faxprod.tbl by the wheel ID.  Modified rotation
	values for the AWC products.  Done, JW, SJ, (SS), 11/13/97.

	gempak/tables/pgen/faxprod.tbl

t15.	Added four California and Kansas City stations to the
	NWX zone forecast table.  Done, GG, (SS), 11/13/97.

	tables/nwx/zone.bull

t16.	Made relh and dpdc parameters available for surface data for
	NMAP.  Also added tmax, tmin, stha, smxr, selv, and sthe 
	parameters.  Done, GG, (SS), 11/13/97.

	gempak/tables/nmap/gemparms.tbl

t17.	Corrected nmap table that reads the GEMPAK alias for surface
	data.  Replaced hrly with metar.  Done, SS, (SS), 11/14/97.

	gempak/tables/nmap/sfc_stn.tbl

t18.	Updated zone tables and map files.  Changes to AZ, CA,
	CO, MT and WA.  Minor changes to 17 other states.
	Done, GK, (SS), 11/17/97.

	gempak/tables/stns/zones.tbl, ffgzon.stn
	gempak/maps/loznus.nws, hiznus.nws
	gempak/maps/ascii/ascloznus.nws, aschyiznus.nws

t19.	Made updates to LDM pattern action table and affected
	NWX tables for November 18th phase 1 update of WMO headers
	conducted by OSO.  Done, GK, SJ, (SS), 11/18/97.

	tables/nwx/stations.tbl, zone.bull, stf.bull, now.bull

t20.	Updated Alaskan stations for NGMMOS in response to changes
	made to headers on November 18th.  Done, DKW, SJ, (SS), 
	11/19/97.

	gempak/tables/stns/ngmmos.stn
	tables/nwx/ngmmos.stn

t21.	Changed the indentation and reserved values for the TPC products
	in the faxprod.tbl.  Also added a new HPC printer in the printer
	table.  Done, SJ, (SS), 11/24/97.

	gempak/tables/pgen/faxprod.tbl
	gempak/tables/config/printer.tbl

t22.	Changed the default stroke size for ball and chain lines in
	the product generation drawing attribute table to ensure that
	AFOS products are not too large.  Done, SJ, (SS), 12/2/97.

	gempak/tables/pgen/newdraw.tbl

t23.	Updated the AVN MOS station table for header changes for
	Alaskan stations to be made on December 3, 1997.  Done,
	DKW, (SS), 12/2/97.

	gempak/tables/stns/avnmos.stn

t24.    Added VGF test data file to the $GEMDATA directory and modfied
	the NMAP VGF table accordingly.  Done, SJ, (SS), 12/2/97.

	NEW:gempak/data/vgf/test.vgf

	gempak/tables/nmap/vgf.nmap

=========================== Patch 5.4.3.e =================================

t25.	Updated AVN MOS table for NWX due to changes in bulletin headers
	on the FOS.  Done, SJ, (SS), 12/5/97.

	tables/nwx/avnmos.stn

t26.	Updated NWX zone station table for new AZ and NV zone 
	stations, KFGZ, KLKN, KTWC, and KVEF.

	tables/nwx/zone/zone.bull

t27	Added CWA map and WFO station overlays to NMAP.  Done,
	GK, (SS), 12/16/97

	NEW:gempak/tables/stns/wfo.tbl

	gempak/tables/nmap/mapovl.nmap

t28.	Added CLDT parameter to nmap parameter list.  Also,
	added a new station model plot (WINTER2) to nmap.
	Done, GG, (SS), 12/17/97.

	gempak/tables/nmap/gemparms.tbl, sfc_stn.tbl
	gempak/tables/config/prmlst.tbl

t29.	Updated NMAP restore files for WAM model.  Also modified
	the product tables to correct the dimensions for 24-hr
	Pacific Wind/Wave and Surface forecasts.  Also, modified
	the areas WATL and EPAC to match the MPC forecast areas.
	Done, JP, (SS), 12/17/97

	gempak/nts/nmap/retore/modl/wam/sig_wave_and_mslp_feet,
	sig_wave_and_mslp_meters, sig_wave_cont_fill_feet,
	sig_wave_cont_fill_meters, sig_wave_gridded_feet,
	sig_wave_gridded_meters, sig_wave_gridded_mslp_feet,
	sig_wave_gridded_mslp_meters

	gempak/tables/pgen/faxprod.tbl, product.tbl
	gempak/tables/stns/geog.tbl

t30.	Changed bawx area in the geog.tbl to better match the basic
	weather forecast area.  Also, added a restore file of the
	meso eta topography to NMAP with no color fill.   Done,
	JYC, (SS), 12/19/97.

	NEW:gempak/nts/nmap/restore/modl/meso/topolines

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/stns/geog.tbl

t31.	Corrected FOSSTON MN, SELAWIK AK, and ANVIK AK entries in 
	station tables.  FOSSTON entries were 2 degrees too far south.
	The other stations had typos in their names.  Done, GK, (SS),
	12/31/97.

	gempak/tables/stns/pirep_navids.tbl, inactive.tbl, metar.tbl
	gempak/tables/stns/wxpstn/city_sfc.dat

t32.	Updated the active and inactive surface station tables by
	adding 28 new stations and moving some non-reporting stations
	to the inactive table.  Done, AH, (SS), 12/31/97.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t33.	Updated NWX tables for eta and ngm guidance to reflect new
	stations that are reporting.  Deleted staions that are no
	longer reporting.  Done, ID, (SS), 1/5/98.

	tables/nwx/etagd.stn, ngmgd.stn

t34.	Updated the station ID for Bogue Field in the upper-air 
	station table.  Done, GG, (SS), 1/5/98.

	gempak/tables/stns/snstns.tbl

=========================== Patch 5.4.3.f =================================

t35.	Updated NWX zone forecast table for new Colorado zones that become
	effective January 7 1998.  Done, GK, (SS), 1/7/98.

	tables/nwx/zone.bull

t36.	Added 8 character county name table and updated NMAP overlay
	table to use it.  Done, GK, (SS), 1/20/98.

	NEW:gempak/tables/stns/countynam.tbl

	gempak/tables/nmap/mapovl.nmap

t36.	Udated WFO names for some Northern Indiana WFOs as well as
	county transfers to Tulsa WFO.  Done, ID, GK, (SS), 1/20/98.

	gempak/tables/stns/county.tbl

t37.	Added latitude and longitude for Marine zones that were missing
	that information.  Done, ID, (SS), 1/20/98.

	gempak/tables/stns/zones.tbl

t38.	Corrected the newly added marine zones.  They were missing
	the elevation and priority fields.  Done, GK, (SS),
	1/22/98.

	gempak/tables/stns/zones.tbl

t39.	Updated WFOS for 3 zones in OKlahoma and Arkansas.  TUL has
	assumed responsibility for OKZ053, OKZ049, and ARZ020.  Also,
	added two new California zones, CAZ4045 and CAZ4350.
	Done, GK, (SS), 2/4/98.

	gempak/tables/stns/zones.tbl, ffgzon.stn

t40.	Revised the active and inactive surface station tables.  Added
	21 new stations.  Done, AH, (SS), 2/4/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t41.	Added 950mb stability restore file for MPC use.  Done, JP, (SS),
	2/5/98.

	NEW:gempak/nts/nmap/restore/modl/eta/stability_950mb_wnd

	gempak/tables/nmap/mod_res.tbl

t42.	Added HPC and MPC VG files to NMAP table so that these files can
	be accessed and loaded as background displays.  Done, JYC, (SS), 
	2/5/98.

	gempak/tables/nmap/vgf.nmap

t43.	Corrected the reserve field for the 24/48 Hr Severe Weather
	Outlook fax product.  Done, SJ, (SS), 2/5/98.

	gempak/tables/pgen/faxprod.tbl

t44.	Changed the definition of field 77 in the GRIB decoder table.
	Done, DP, (SJ), 2/11/98.

t45.	Updated background VGF file for HPC for NMAP.  Corrected 
	BWX product location.  Done, JYC, (SS), 2/18/98.

	gempak/tables/nmap/vgf.nmap

t46.	Added 925mb stability product for NMAP for global models for MPC.
	Done, JP, (SS), 2/18/98.

	gempak/tables/nmap/mod_res.tbl
	gempak/nts/nmap/restore/modl/global/stability_925mb_wnd

t47.	Updated MPC map backgrounds for their regions of responsiblity.
	Done, JP, GK, (SS), 2/18/98.

	gempak/maps/ascii/ascmereuo.ncp, ascmeosuo.ncp, ascmehsuo.ncp
	gempak/maps/mereuo.ncp, meosuo.ncp, mehsuo.ncp

t48.	Added RFC boundaries to NMAP underlays.  Done, SS, (SS), 2/19/98.

	gempak/tables/nmap/mapovl.nmap

t49.	Revised the sounding station table adding 3 new stations at the
	request of the SDM.  They are, 46902, 76384, and 76904.  Removed
	the obsolete station table metar.tbl.  Done, DKW, (SS), 2/23/98.

	gempak/tables/stns/metar.tbl

=========================== Patch 5.4.3.g =================================

t50.	Updated some NMAP model product restore files.  Done, JYC, (SS),
	2/27/98.

	NEW:gempak/nts/nmap/restore/modl/avn/pmsl_thkn_wind, ransnocsi_500-850,
	ransnocsi_700-850
	gempak/nts/nmap/restore/modl/eta/emsl_thkn_wind, precip_type_vv_ncf,
	sfclifted_index
	gempak/nts/nmap/restore/modl/ngm/pmsl_thkn_wind
	gempak/nts/nmap/restore/stnd/250mb_hght_wind_ncf, 500mb_hght_absv_ncf,
	700mb_hght_rh_omega_ncf

	gempak/tables/nmap/mod_res.tbl
	gempak/nts/nmap/restore/modl/eta/ransnocsi_500-850, ransnocsi_600-850

t51.	Made NMAP product generation icons bolder to improve readability.
	Done, GK, (SS), 3/3/98.

	icons/nmap/windbarb.xbm, windarrw.xbm, wind.xbm, watches.xbm, warmfnt.xbm,
	warm_forming.xbm, warm_diss.xbm, unselect.xbm, undo.xbm, troffnt.xbm,
	textuf.xbm, textsfwr.xbm, testlt.xbm, textlo.xbm, textlab.xbm,
	textht.xbm, texthi.xbm, texthdwr.xbm, textfl.xbm, textcl.xbm, textbu.xbm,
	textbf.xbm, text.xbm, symbol.xbm, statfnt.xbm, stat_forming.xbm, 
	stat_diss.xbm, spc.xbm, rotate.xbm, refresh.xbm, redo.xbm, occlfnt.xbm,
	occl_forming.xbm, occl_diss.xbm, move.xbm, modify.xbm, line.xbm,
	group.xbm, front.xbm, flip.xbm, dryline.xbm, coldfnt.xbm, cold_forming.xbm,
	cold_diss.xbm

t52.	Improved the appearance of the partial delete icon for improved
	readability.  Done, GK, (SS), 3/3/98.

	icons/nmap/partdel.xbm

t53.	Updated the surface station table.  Added 38 new stations and
	revised the name of 2 stations.  Moved non-reporting stations
	to the inactive table.  Done, AH, (SS), 3/4/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t54.	Added station KIWX (North Webster, IN) to the NWX station
	table.  Done, GK, (SS), 3/10/98.

	tables/nwx/stations.tbl

t55.	Added test directories t04-t09 to NAFOS map areas tables.
	Done, ID, (SS), 3/10/98.

	gempak/tables/nafos/nafosmap.tbl

t56.	Added two new look-up tables for radar images.  These tables
	allow a grey scale print out on non-color images.  Done TP,
	(SS), 3/11/98.

t57.	Updated some of the MPC stablility NMAP restore files and added stability
	products at 850mb for the global models and 900mb for the eta model.  Done,
	JP, (SS), 3/16/98.

	NEW:gempak/nts/nmap/restore/modl/eta/stability_900mb_wnd
	    gempak/nts/nmap/restore/modl/global/stability_850mb_wnd

	    gempak/nts/nmap/restore/modl/eta/stability_850mb_wnd, 
	    stability_950mb_wnd
	    gempak/nts/nmap/restore/modl/global/stability_925mb_wnd
	    gempak/tables/nmap/mod_res.tbl

t58.	Updated NWX tables for changes to station id's for KIWX to occur
	on 3/17/98.  Done, GK, (SS), 3/17/98.

	tables/nwx/dclim.bull, now.bull

t59.	Updated NMAP and image tables to add GOES-10 and the Global mosaic
	tables.  Done, JP, (SS), 3/19/98.

	gempak/tables/nmap/master.tbl
	gempak/tables/sat/imgtyp.tbl

t60.	Simplified MPC area of responsibility maps.  Done, JP, GK, (SS), 
	3/24/98.

	gempak/maps/ascii/ascmereuo.ncp, ascmehsuo.ncp
	gempak/maps/mereuo.ncp, mehsuo.ncp


t61.	Added KIWX (North Webster, IN) to MCLIN.BULL, which is the location
	table for the Monthly Climate Reports for NWX.  Also updated the
	LDM pattern action table.  Done, GK, (SS), 3/25/98.

	tables/nwx/mclim.bull

t62.	Modified rotation and reserved values for QPF FAX products.  Added QPF
	products to the AFOS product table.  Done, SJ, (SS), 3/31/98.

	gempak/tables/pgen/faxprod.tbl, afosprod.tbl

t63.	Changed the forecast times for CPC products in the AFOS product table.
	Done, SJ, (SS), 3/31/98.

	gempak/tables/pgen/afosprod.tbl

t64.	Added MOS POP and Max/Min Temp products to LDM and NAFOS tables.
	Added Canadian Volcanic Ash Advisories to the LDM and NWX tables.
	Done, SJ, (SS), 4/2/98.

	gempak/tables/nafos/nafosmap.tbl
	tables/nxw/stations.tbl

t65.	SPC updates are added to the VORS station table.  Done, GK, (SS), 
	4/6/98.

	NEW:gempak/tables/stns/vors.tbl.old

	gempak/tables/stns/vors.tbl

t66.	Modified rotation and reserved values for 6-10 day FAX products.
	Done, SJ, (SS), 4/9/98.

	gempak/tables/pgen/faxprod.tbl

t67.	Changed wheel and subset number for CPC 6 to 10 day FAX product.
	Done, SJ, (SS), 4/14/98.

	gempak/tables/pgen/faxprod.tbl

t68.	Revised the active and inactive surface station tables by adding
	19 new stations to sfstns.tbl, updating station id names, and
	moving non-reporting stations to the inactive table.  The inactive
	table was sorted by station number to make the deletion of duplicates
	easier.  Deleted the missing station numbers from the lsfstns.tbl 
	table.  Done, AH, (SS), 4/14/98.

	gempak/tables/stns/sfstns.tbl, lsfstns.tbl, inactive.tbl 

t69.	Reorganized position of weather symbols in the symbols palette into
	a more logical position.  Alphabetized the parameter lists for the 
	station model editing function.  Done, AH, TP, (SS), 4/14/98.

	gempak/tables/pgen/symbolbtn.tbl
	gempak/tables/nmap/metar_parms.tbl, ship_parms.tbl, uair_parms.tbl

t70.	Added TPC products to NAFOS and afos product generation table.
	Also, updated LDM pattern action table.  Done, SJ, (SS), 4/16/98.

	gempak/tables/nafos/nafosmap.tbl
	gempak/tables/pgen/afosprod.tbl

t71.	Revised the synoptic station table by correcting missing elevations
	and one country code.  Done, AH, (SS), 4/24/98.

	gempak/tables/stns/lsfstns.tbl

t72.	Added CPC long lead prodcuts to the AFOS and FAX product tables.
	Done, SJ, (SS), 4/24/98.

	gempak/tables/pgen/faxprod.tbl, afosprod.tbl

t73.	Changed abbreviations of some radar products in the necessary
	tables.  Done, SJ, (SS), 4/24/98.

	gempak/tables/sat/imgtyp.tbl
	gempak/tables/rad/nidprd.tbl

t74.	Added some new RUC products to NMAP.  Also added mrfx, ruc2,
	ecmwft and ecmwfg model products to NMAP.  Done, JYC, (SS),
	4/27/98.

	NEW:gempak/nts/nmap/restore/modl/rucs/pmsl_and_sfc_fnt,
	pmsl_and_sfc_temp, pmsl_and_sfc_the
	gempak/nts/nmap/restore/modl/ecmwfg/850mb_tmp, pmsl_ethkn
	gempak/nts/nmap/restore/modl/ecmwft/850mb_wnd, 200mb_wnd

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/data.tbl

t75.	Revised synoptic station table by adding 602 new stations,
	215 African, and 387 Chinese stations.  Also corrected the
	longitude for Acupulco.  Done, AH, (SS), 4/28/98.

	gempak/tables/stns/lsfstns.tbl

t76.	Updated colors of special lines created for SPC to be consistent with
	those in the Air Force Severe Storm Forecast Guide.  Done, ID, (SS),
	4/29/98.

	gempak/tables/pgen/newdraw.tbl

t77.	Changed the default attributes of the directional arrow and hash lines.
	Done, WL, (SJ), 5/4/98.

	gempak/tables/pgen/newdraw.tbl

t78.	Added a new water vapor enhancement look-up table.

	tables/nsat/enhance.tbl
	gempak/tables/luts/enhance.tbl
	NEW: gempak/tables/luts/watvap2.tbl

t79.	Udated the METAR station table with 10 new ASOS stations.  Done,
	AH, (SS), 5/5/98.

	gempak/tables/stns/sfstns.tbl

t80.	Modified tables to include sky cover and new swell wave direction
	parameter in display of WAVES data in NMAP.  Improved text file
	description of aircraft report types.  Done, DKW, (SS), 5/5/98.

	gempak/tables/config/prmlst.tbl
	gempak/tables/nmap/ship_parms.tbl
	gempak/txt/apx/parms.apx

t81.	Added North Battleford, Saskatchewan to upper-air station table.
	Done, SJ, (SS), 5/6/98.

	gempak/tables/stns/snstns.tbl

t82.	Added Texas and California zones that have begun to appear in the
	FFG data.  Done, GK, (SS), 5/6/98.

	gempak/tables/stns/ffgzon.stn

t83.	Added station number to NMAP station parameter lists for METAR and
	upper-air station models.  Done, SS, (SS), 5/8/98.

	gempak/tables/nmap/metar_parms.tbl, uair_parms.tbl

=========================== Patch 5.4.3.h ==================================

t84.	Added precip in millimeters to parameter lists for NMAP by
	request of HPC/International desks.  Done, SJ, (SS), 5/11/98.

	gempak/tables/nmap/metar_parms.tbl, ship_parms.tbl, synop_parms.tbl

t85.	Added initial setting for High symbol, set color to blue.  Changed
	front strength from 3 to 2.  Improved the documentation.  Done,
	SS, (SS), 5/12/98.

	gempak/tables/pgen/setting.tbl

t86.	Added total cloud cover, CLDT, to the metar parameter list for NMAP.
	Done, GG, (SJ), 5/18/98.

	gempak/tables/nmap/metar_parms.tbl

t87.	Changed the station number for MPX in the NEXRAD station table.
	Done, GG, (SJ), 5/18/98.

	gempak/tables/stns/nexrad.tbl


	
t88.	Updated the sfstns.tbl with 30 new stations and added 5 stations 
	to inactive.tbl. Also, 2 stations had their identification changed, 
	Y62 -> ANJ and LLJ -> U15, ESGG was corrected for country, latitude
	and longitude. The latitudes and longitudes for 73 stations, 
	beginning with YBRK and ending with D07, had their minutes corrected to
	fractions of degrees.

	Sorted and updated the snstns.tbl by adding 7 new stations, correcting 
	ALB's station number id, modifing 74004 lat., long., and elevation,
	and moved stations with 99999 as station number ids to the end of the
	file.  Done, AH, (SS), 6/1/98.

	gempak/tables/stns/sfstns.tbl, snstns.tbl, inactive.tbl

t89.	Updated the NWX state forecast table for KTOP, Topeka, Kansas.
	Done, GK, (SS), 6/2/98.

	tables/nwx/sfd.bull

t90.	Updated the synoptic stations table by adding 5 new stations.  Removed
	some tabs from the upper-air station table.  Done, AH, (SS), 6/4/98.

	gempak/tables/stns/lsfstns.tbl, snstns.tbl

t91.	Updated offshore marine zones, tables and map files.  Done, GK, (SS),
	6/4/98.

	NEW:gempak/maps/loosuo.nws, hiosuo.nws
	gempak/maps/ascii/ascloosuo.nws, aschiosuo.nws

	gempak/tables/stns/zones.tbl

t92.	Added etasaudi and nogaps models to the mod_res.tbl file for NMAP.
	Done, DP, (SS), 6/4/98.

	gempak/tables/nmap/mod_res.tbl

t93.	Removed several tables that are no longer used.  (See the remove.log 
	for the specific list.).  Done, GK, (SS), 6/4/98.

t94.	Modified map alias table to use new marine zone maps.  Also update
	on-line help.   Done, GK, (SS), 6/4/98.

	gempak/tables/config/mapfil.tbl
	gempak/help/mapfil.hl2

t95.	Added North American forecast boundary map and updated necessary tables
	for NMAP display.  Done, GK, (SS), 6/9/98.

	NEW:gempak/maps/mefbna.ncp
	gempak/maps/ascii/ascmefbna.ncp

	gempak/tables/config/mapfil.tbl
	gempak/tables/nmap/mapovl.nmap
	gempak/help/mapfil.hl2
	gempak/maps/ascii/mapfiles.doc

t96.	Added 19 new stations to the synoptic station table.  Corrected
	station 74641 form VCI to WWR and lat/lon/elev for PHX in
	the upper-air table.  Done, AH, (SS), 6/11/98.

	gempak/tables/stns/lsfstns.tbl, snstns.tbl

t97.	Added cloud ceiling paramater CEIL to nmap parameter list.
	Done, AH, (SS), 6/11/98.

	gempak/tables/nmap/metar_parms.tbl

t98.	Added Saudi Arabia map area to list in NWX.  Done, SJ,
	(SS), 6/15/98.

	tables/nwx/mapinfo.nwx

t99.	Changed default dry line color to brown at the request of the SPC.  Done,
	SS, (SS), 6/16/98.

	gempak/tables/pgen/setting.tbl

t100. 	Added products to NWX and the AFOS alarms for the HPC for display of the
	coded front forecast and analysis messages.  Done, SJ, (SS), 6/16/98.

	NEW:tables/nwx/srp.bull, sus.bull

	tables/nwx/master.tbl, guidata.tbl

t101.	Explicitly set all symbol and wind attributes in the PRMLST table.  Done,
	SJ, (SS), 6/16/98.

	gempak/tables/config/prmlst.tbl

t102.	Added eta_saudi and NOGAPS models to the data table for NMAP display.
	Done, SS, (SS), 6/17/98.

	gempak/tables/config/data.tbl

t103.	Added 12-hour precip to NMAP restore files for the nogaps model.  It si
	in a different format from the rest of the precip fields, therefore it
	had to be placed in the modl directory instead of the prcp directory.
	Done, JYC, (SS), 6/18/98.

	NEW:gempak/nts/nmap/restore/modl/nogaps/precip_12hr

	gempak/tables/nmap/mod_res.tbl

t104.   Added 12-hr pcpn (mm) to nogaps model.  Also added 500mb and 300 mb
	vorticity advection fields to nmap.  Done, JYC, (SS), 6/22/98.

	NEW: gempak/nts/nmap/restore/stnd/300mb_hght_absv_adv, 
	500mb_hght_absv_adv
	gempak/nts/nmap/restore/modl/nogaps/precip_12hr_mm

	gempak/tables/nmap/mod_res.tbl

t105.	Updated the surface station table with 27 new stations and added 36 stations
	to the inactive table.  Also, 3 stations had underscores added to their
	names.  Done, AH, (SS), 6/22/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t106.	Added changes from the TPC for the FAX products and VIEWFAX.  Also,
	added some new geographic areas for the TPC.  Done, MH, SJ, (SS),
	6/23/98.

	gempak/tables/pgen/faxprod.tbl, product.tbl
	gempak/tables/stns/geog.tbl

t107.   Added 630 new stations in Russia, Ukraine, and Kaxakhstan at the
	request of the Dept. of Agriculture.  These are for the synoptic
	surface station table.  Done, DKW, (SS), 6/24/98.

	gempak/tables/stns/lsfstns.tbl

t108.	Added new parameter lists for METAR, SHIP and SYNOP data.
	Corrected directory names in VGF.NMAP. Done, JYC, (SJ), 6/24/98.

	gempak/tables/config/prmlst.tbl
	gempak/tables/nmap/vgf.nmap

t109.	Replaced old offshore zone map for the MPC.  Added new entry
	in mapfil.tbl.  Done, SJ, (SS), 6/25/98.

	gempak/maps/meosuo.ncp
	gempak/tables/config/mapfil.tbl

=========================== Patch 5.4.3.i ==================================

t110.	Changed the rotation for the 36/48 Basic Wx prog to be 180.
	Done, SJ, (SS), 7/3/98.

	gempak/tables/pgen/faxprod.tbl

t111.	Changed the rotation for the another 36/48 Basic Wx prog to
	be 180.  Done, SJ, (SS), 7/6/98.

	gempak/tables/pgen/faxprod.tbl

t112.	Added WFO Tulsa station ID to the NWX station table.  Done, GG, 
	(SS), 7/6/98.

	tables/nwx/stations.tbl

t113.	Added new stations to the METAR station table.  Done, ID, AH,
	(SS), 7/6/98.

	gempak/tables/stns/sfstns.tbl

t114.	Added a mean layer wind product to NMAP.  Done, JYC, (SS),
	7/7/98.

	NEW:gempak/nts/nmap/restore/misc/mlw_pmsl

	gempak/tables/nmap/mod_res.tbl

t115.	Updated image table for METEOSAT7.  Done SJ, (SS), 7/13/98.

	gempak/tables/sat/imgtyp.tbl

t116.	Added more African stations to the synoptic station table.  Done,
	ID, AH, (SS), 7/14/98.

	gempak/tables/stns/lsfstns.tbl

t117.	Added more European stations to the upper-air station table.  Done,
	ID, AH, (SS), 7/14/98.

	gempak/tables/stsns/snstns.tbl

t118.   Added 100-500mb thickness, pmsl and wind product to the eta and avn in
	NMAP.  Added an afos directory to the NMAP table for looking at VG files
	in the background.  Done, JYC, (SS), 7/14/98.

	NEW:gempak/nts/nmap/restore/modl/eta/pmsl_thkn_wind
	gempak/nts/nmap/restore/modl/avn/pmsl_thkn_wind

	gempak/tables/nmap/vgf.nmap, mod_res.tbl

t119.	Added a topography image type and lut file to appropriate tables.
	Done, JYC, (SS), 7/14/98.

	NEW:gempak/tables/luts/upc_topo.tbl

	gempak/tables/sat/imgtyp.tbl

t120.	Modified topography lookup table to use 95 colors instead of 128.
	Done, JYC, (SS), 7/15/98.

	gempak/tables/luts/upc_topo.tbl
	gempak/tables/sat/imgtyp.tbl

t121.	Updated the surface hourly station table.  Removed 13 inactive
	stations and added 38 new stations.  Also removed 17 duplicate
	stations.  Done, AH, ID, (SS), 7/21/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t122.	Fixed the file extension in the NWX master table for the
	Flash Flood Watch product.  Done, SJ, (SS), 7/22/98.

	tables/nwx/master.tbl

t123.	Added 1000, 925, and 850mb streamline NMAP products for 
	various models.  Removed ukmet from the 300-700_q-vctrts_thkn
	product.  Removed nogaps from the mean layer wind product.
	Done, JYC, (SS), 7/23/98.

	NEW:gempak/nts/nmap/restore/stnd/100mv_streamlines,
	925mb_streamlines, 850mb_streamlines

	gempak/tables/nmap/mod_res.tbl

t124.	Added TDXF and TDNF daily max/min temperatures in
	Fahrenheit to NMAP tables for METAR and synoptic data
	types.  Done, DKW, (SS), 7/23/98.

	gempak/tables/nmap/metar_parms.tbl
	gempak/tables/nmap/synop_parms.tbl

t125.	Added new areas for Saudi, Surface, and Medium Range desks
	to the geog.tbl.  Done, JYC, (SS), 7/23/98.

	gempak/tables/stns/geog.tbl

t126.	Added pmsl-boundary layer wind and 850mb wind products to nogaps model
	for nmap.  Done, JYC, (SS), 7/23/98.

	NEW:gempak/nts/nmap/restore/modl/nogaps/850mb_hgt_wind, pmsl_and_bl_wind

	gempak/tables/nmap/mod_res.tbl

t127.	Fixed reserved values for some MPC fax products and added new MPC 
	fax products.  Done, SJ, (SS), 7/23/98.

	gempak/tables/pgen/faxprod.tbl

t128.   Added a new product, TSA, to the TPC group of AFOS products.
	Done, SJ, (SS), 7/23/98.

	gempak/tables/pgen/afosprod.tbl
	gempak/tables/nafos/nafosmap.tbl

t129.	Updated the METAR station table.  Corrected longitude and elevation for
	station CLT.  Removed station WVI because there are currently two stations,
	one in California and one in Alberta Canada, with the same last three
	letters in the staion ID.  Done, DKW, (SS), 7/24/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t130.	Added new NMAP restore files for MPC.  Done, JP, (SS), 7/29/98.

	NEW:nts/nmap/restore/modl/global/bl_winds_only, marine_fronts,
	pmsl_100-500thk, pmsl_1000_850thk
	nts/nmap/restore/modl/eta/l_winds_only, marine_fronts,
	pmsl_100-500thk, pmsl_1000_850thk
	nts/nmap/restore/modl/ngm/l_winds_only, marine_fronts,
	pmsl_100-500thk, pmsl_1000_850thk
	nts/nmap/restore/stnd/500_vort_only, pmsl_only

	gempak/tables/nmap/mod_res.tbl

t131.	Added international text message issued by HPC to NWX.
	Done, SJ, (SS), 7/30/98.

	NEW:tables/nwx/intl.bull

	tables/nwx/master.tbl, guidata.tbl

t132.	Added MPC forecast boundary map background for Eastern
	Pacific.  Done, JP, GK, (SS), 8/4/98.

	NEW:gempak/maps/mefbep.ncp
	gempak/maps/ascii/ascmefbep.ncp

	gempak/tables/config/mapfil.tbl
	gempak/help/mapfil.hl2
	gempak/maps/ascii/mapfiles.doc

t133.	Moved some of the NMAP model products from the basic weather to
	other groups such as tropical and misc.  Added a new group
	called mono-chrome which creates model products in one
	color to facilitate drawing products on top of them.  Done,
	JYC, (SS), 8/6/98.

	NEW:gempak/nts/nmap/restore/modl/eta/bl_thte_wind_mono,
	pmsl_thkn_wind_mono
	gempak/nts/nmap/restore/modl/ngm/bl_thte_wind_mono, 
	pmsl_thkn_wind_mono
	gempak/nts/nmap/restore/modl/global/bl_thte_wind_mono,
	pmsl_thkn_wind_mono

	gempak/tables/nmap/mod_res.tbl
	gemap/nts/nmap/restore/modl/eta/100_470mb_rh_rs_t_700_vv
	gempak/nts/nmap/restore/modl/ngm/100_470mb_rh_rs_t_700_vv
	gempak/nts/nmap/restore/modl/global/100_470mb_rh_rs_t_700_vv

t134.	Changed the originating station for the SDM messages in
	NWX from KWBC to KWNO.  Done, SJ, (SS), 8/12/98.

	tables/nwx/sdm.bull, intl.bull

t135.	Updated the NWX zone table to include 6 new stations from
	MI, IN, and NE.  Done, GG, (SS), 8/13/98.

t136.	Added Hurricane Strike Probabilities product to NWX list of
	products.  Done, SJ, (SS), 8/24/98.

	tables/nwx/guidata.tbl, master.tbl

t137.	Added a new type of special line, a dashed line with an
	open arow head to the special line pattern table.  Also,
	flipped the stationary front pips as requested by the
	TPC, MPC, and HPC.  Done, SJ, (SS), 8/25/98.

	gempak/tables/draw/splpat.tbl

t138.	Changed all SKYK parameter attributes from 112 to 132 in the
	parameter alias table.  This change has the barb drawn from
	the beginning of the sky symbol instead of at the station.
	Done, AH, (SS), 8/25/98.

	gempak/tables/config/prmlst.tbl

t139.	Updated the METAR surface station table based on utility
	maintainance program runs.  15 stations were added, 
	13 were removed from the inactive table.  Other minor
	modifications were made.  Done, ID, AH, (SS), 8/25/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t140.	Six stations are being added to the upper air station
	table.  In addition, a Canadian buoy is being added to 
	marine surface synoptic table.  Done, DKW, (SS),
	8/27/98.

	gempak/tables/stns/snstns.tbl, msfstns.tbl

t141.	Added new HPC accounts to the table for accessing 
	VG files.  Done, SJ, (SS), 9/1/98.

	gempak/tables/nmap/vgf.nmap

t142.	Changed the entries for atlhs and pachs for the MPC
	in the nmap table that acesses VG files.  Done,
	SJ, (SS), 9/1/98

	gempak/tables/nmap/vgf.nmap

t143.	Removed 44 blank spaces in station names and changed
	to underscores so that c table routines can handle
	the read of the surface station table.  Done,
	AH, (SS), 9/2/98.

	gempak/tables/stns/sfstns.tbl

t144.	Corrected some of the states for NEXRAD sites in the
	nexrad station table.  Done, SJ, (SS), 9/3/98.

	gempak/tables/stns/nexrad.tbl

t145.	Added a new printer for the HPC to the printer table.
	Done, SJ, (SS), 9/14/98.

	gempak/tables/config/printer.tbl

t146.	Added Atlantic City to the Daily Climatological Report
	station list for NWX.  Done, GK, (SS), 9/14/98.

        tables/nwx/dclim.bull

t147.	Changed entry modtdg to afos in the NMAP vg table so that
	modtdg can see its local vg files.  Done, SS, (SS), 9/16/98.

	gempak/tables/nmap/vgf.nmap

t148.	Changed the default smooth factor to 0 for arrow lines used
	for SPC outlook, spln4 and spln6.  Done, SS, (SS), 9/17/98.

	gempak/tables/pgen/setting.tbl

t149.	Corrected reserved word for all surface analysis fax product
	entries in the fax prodcut table.  Done, SJ, (SS), 9/24/98.

	gempak/tables/pgen/faxprod.tbl

t150.	Updated the surface station table files.  Added 12 new stations.
	Also, added 17 stations that have duplicate information but new
	station ID's.  The old station ID's will be removed after
	the new go into effect.  Removed 13 inactive stations to the
	inactive table.  Done, AH, (SS), 9/24/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl

t151.   Made various table changes.  Increased the filter value
	and modified the text size in the parameter table used
	by NMAP.  Also added sea-state-anal alias to ship.  Modified
	waves parameters.  Expanded some MPC areas in the geog.tbl.
	Updated subset values for some MPC fax products in the
	faxprod.tbl.  Added London/Heathrow station to the
	NWX high seas forecast station table.  Done, JP, SJ,
	(SS), 9/24/98.

	gempak/tables/config/prmlst.tbl
	gempak/tables/stns/geog.tbl
	gempak/tables/pgen/faxprod.tbl
	tables/nwx/hseas.bull

t152.	Added new NMAP restore files for MPC and HPC.  For MPC,
	files are associated with the new model NEWwave and 
	additional products for the WAM model.  The HPC changes
	include products needed by the Surface Analysis Desk.
	Done, JYC, JP, (SS), 9/25/98.

	NEW:gempak/nts/nmap/restore/modl/wam/sig_wave_gridded_meters,
	sig_wave_gridded_meters_dir, sig_wave_gridded_mslp_meters
	gempak/nts/nmap//restore/modl/global/sig_wave_and_mspl_feet,
	sig_wave_and_mslp_meters, sig_wave_cont_fill_feet,
	sig_wave_gridded_feet, sig_wave_gridded_meters,
	sig_wave_gridded_meters_dir, sig_wave_gridded_mslp_feet
	sig_wave_gridded_mslp_meters
	gempak/nts/nmap/restore/modl/etat/bl_thte_ncf
	gempak/nts/nmap/restore/modl/global/bl_thte_ncf
	gempak/nts/nmap/restore/modl/ruc/mmsl
	gempak/nts/nmap/restore/modl/rucs/sfc_dwpc
	gempak/nts/nmap/restore/modl/rucs/sfc_fnt
	gempak/nts/nmap/restore/modl/rucs/sfc_temp
	gempak/nts/nmap/restore/modl/misc/100-500_thkn, 
	100-850_thkn, pmsl
	gempak/nts/nmap/restore/modl/stnd/500mb_absv_ncf,
	500mb_hght, 850mb_thae_ncf
	gempak/nts/nmap/restore/modl/misc/850_700_thkn

	gempak/tables/config/data.tbl
	gempak/tables/nmap/mod_res.tbl

t153.	Made various changes to WMO identifiers to accomodate 
	changes that go into effect October 1, 1998.  Also,
	made corrections and deleted unused entries in 
	the coastal bulletin table.  Split up the area forecast
	discussions into a new category from the state forecast
	discussions.  Done, GK, (SS), 10/1/98.

	NEW:tables/nwx/afd.bull

	tables/nwx/guidata.tbl, master.tbl, smw.bull, sfd.bull, 
	offsh.bull, mws.bull, coastal.bull, now.bull

=========================== Patch 5.4.3.j ==================================

t154.	Updated the zone station table to reflect that Hawaii
	has split into three zones, HIZ004, HIZ007, HIZ008.  Also,
	updated the local forecast table.  Done, GK, (SS), 10/6/98.

	gempak/tables/stns/zones.tbl
	tables/nwx/local.bull


t155. 	Added and updated MPC map backgrounds and updated tables
	approriately.  Also, renamed map file mefbep to mefbpe for 
	consistency.  Done, GK, (SS), 10/7/98.

	NEW:gempak/maps/mefbpn.ncp, mefbpe.ncp
	gempak/maps/ascii/ascmefpn.ncp, ascmefbpe.ncp

	gempak/maps/mefban.ncp
	gempak/maps/ascii/ascmefban.ncp
	gempak/help/mapfil.hl2
	gempak/tables/config/mapfil.tbl

t156.   Added new NMAP model products.  Added restore files for UKMET2
	model and tdl_mrf grids.  Also, improved some of the existing
	restore files, improved colors, etc.  Modified the parameter
	alias table, prmlst.tbl.  Added new alias, noam_sfc, and
	improved parameters for noam_sat and noam_rad.  Done, JYC,
	(SS), 10/7/98.

	NEW:$GEMPAK/nts/nmap/restore/modl/global/bl_1000mb_temp,
	bl_2-meter_temp, bl_dwpt_c, bl_sgma_9950_temp, svrwx, 
	svrwx_intl
	$GEMPAK/nts/nmap/restore/modl/ruc/lifted_index, sfclifted_index,
	$GEMPAK/nts/nmap/restore/modl/tdl_mrf/climax, climin, devclimax_temp,
	devclimin_temp, devcombomax_temp, devcombomin_temp, max_temp,
	min_temp, pops_24hr, pops_24_dev
	$GEMPAK/nts/nmap/restore/modl/stnd/500mb_hght_absv_wind

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/data.tbl, prmlst.tbl
	$GEMPAK/nts/nmap/restore/modl/eta/sfclifted_index, pmsl_thkn_wind
	$GEMPAK/nts/nmap/restore/modl/stnd/850mb_hght_tmp_wind

t157.	Added a new forecast boundary map for the Basic Weather Desk.
	Done, GK, (SS), 10/19/98.

	NEW:gempak/maps/mefbbw.ncp
	gempak/maps/ascii/ascmefbbw.ncp

	gempak/tables/nmap/mapovl.nmap
	gempak/tables/config/mapfil.tbl
	gempak/help/mapfil.hl2

t158.	Updated the surface station (METAR) table with 31 new stations
	and added 15 station to the inactive table.  Also updated
	the sorted table for excessive rainfall.  Done, AH, (SS),
	10/21/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t159.	Updated the Basic Weather geographic area used by the HPC.
	Done, JYC, (SS), 10/21/98.

	gempak/tables/stns/geog.tbl

t160.	Added Air Stagnation and Extended Pacific Forecast products 
	to the HPC group of NWX.  Done, SJ, (SS), 10/26/98.

	NEW:tables/nwx/stag.bull, expac.bull

	tables/nwx/guidata.tbl, master.tbl

t161.	Modified medium range geographic area.  Added some medium range
	products to NMAP model products.  Added new restore files for
	ukmet and ecmwf models.  Modified some basic weather NMAP restore
	files.  Done, JYC, (SS), 11/5/98.

	NEW:gempak/nts/nmap/restore/modl/ecmwfg/ethkn
	gempak/nts/nmap/restore/modl/ukmet/ethkn
	gempak/nts/nmap/restore/modl/ukmet2/ethkn

	gempak/nts/nmap/restore/modl/eta/pmsl_thkn_wind, pmsl_thkn_wind_mono,
	precip_type_vv
	gempak/nts/nmap/restore/modl/global/pmsl_thkn_wind, pmsl_thkn_wind_mono
	gempak/nts/nmap/restore/modl/ngm/pmsl_thkn_wind, pmsl_thkn_wind_mono
	gempak/tables/stns/geog.tbl
	gempak/tables/nmap/mod_res.tbl

t162.	Updated upper-air station table by adding 8 new stations and deleting
	one.  One station id was changed.  Done, DKW, (SS), 11/5/98.

	gempak/tables/stns/snstns.tbl

t163.	Updated vgf.nmap table to reflect new workstations and
	accounts added to the HPC.  Also, added products to the
	AFOS product table.  These include 90f, 9jh, 9kh, and
	9lh.  Done, JYC, (SS), 11/6/98.

	gempak/tables/pgen/afosprod.tbl
	gempak/tables/nmap/vgf/vgf.nmap

t164.	Added new Medium Range Forecast Bound Map.  Adjusted 
	the Base Weather Forecast Bound Map for the GIF
	product.  Done, GK, (SS), 11/6/98.

	NEW:gempak/maps/mefbmr.ncp
	gempak/maps/ascii/ascmefbmr.ncp

	gempak/tables/nmap/mapovl.nmap
	gempak/tables/config/mapfil.tbl
	gempak/help/mapfil.hl2
	gempak/maps/mefbbw.ncp
	gempak/maps/ascii/ascmefbbw.ncp

t165.	Added CPC 30 and 90 day climatology products to the LDM and
	NAFOS tables.  Changed the NAFOS resource file to make 
	3 columns for the data selection window.  Done, SJ, (SS),
	11/12/98

	gempak/tables/nafos/nafosmap.tbl
	ldm/etc/pqact.conf, scour.conf
	resource/Nafos

t166.	Updated the NMAP table for reading VG files into the background
	to account for a new HPC workstation at the SFC weather desk.
	Done, SS, (SS), 11/16/98.

	gempak/tables/nmap/vgf.nmap

t167.	Updated land and marine zone maps and tables.  Changes to
	the zones include new zones for Guam, Marianas Islands, 
	Puerto Rico, Virgin Islands, and D.C.  Done, GK, (SS),
	11/17/98.

	gempak/tables/stns/zones.tbl
	gempak/maps/loznus.nws, loosuo.nws, hiznus.nws, hiosuo.nws
	gempak/maps/ascii/ascloznus.nws, ascloosuo.nws,
	aschiznus.nws, aschiosuo.nws

t168.	Updated the metar station table sfsstns.tbl, with 18 new
	stations and appended an ASOS identifier to 660 ASOS type
	stations.  Also, 30 stations were added to the inactive
	table and 10 stations added to the sorted table, xrainsort.tbl.
	Done, AH, (SS), 6/19/98.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t169.	Created new static data sets containing the TDL MOS climatology
	values for Max/Min Temps and POPs.  The data are stored in
	monthly files with values for each day of the month.  The
	data have a dattim of 00mmdd/1200.  Added climatology data
	to data.tbl.  Done, SJ, (SS), 11/24/98.

	NEW:gempak/climo/*

	gempak/tables/config/data.tbl

t170.	Corrected latitude of station 33791 from 4303 to 4803
	in response to SDM log.  Done, AH, (SS), 11/30/98.

	gempak/tables/stns/snstns.tbl

t171.	Updated LDM and NWX tables to reflect changes in WMO headers
	that are to occur on December 1, 1998.  Also, moved 
	Convective Sigmet product from SPC to AVIATION section of
	NWX as requested by SPC.  Done, GK, (SS), 12/1/98.

	ldm/etc/scour.conf
	ldm/etc/pqact.conf
	tables/nwx/zone.bull, smw.bull, stations.tbl, 
	now.bull, master.tbl, guidata.tbl

t172.	Added two new products to the AFOS text emulator,
	NFDPMDHMD, NMCCODDUD, for the HPC.  Done,
	JYC, (SS), 12/1/98.

	tables/afos/text/WFBTXT

t173.	Updated image type table for SSMI wind images and updated
	enhacement tables for NMAP and NSAT to include a new LUT
	for these images.  Done, JP, (SS), 12/2/98.

	NEW:gempak/tables/lut/ssmi_mpc.tbl

	gempak/tables/sat/imgtyp.tbl
	gempak/tables/lut/enhance.tbl
	tables/nsat/enhance.tbl

t174.	Added times to a NMAP restore file for precip and modified
	the Pacific surface area in geog.tbl.  Done, JYC, (SS),
	12/3/98.

	gempak/tables/stns/geog.tbl
	gempak/nts/nmap/restore/modl/eta/precip_type_12hr_amounts

t175.   Updated LDM and NWX tables for final portion of Phase 3a changes 
	to product headers made by OSO.  Done, GK, (SS), 12/8/98.

	tables/nwx/stf.bull, ntlsum.bull, local.bull

t176.	Updated the NMAP table for accessing VG files to add
	prism data and update workstation information.  Done,
	JYC, (SS), 12/14/98.

	gempak/tables/nmap/vgf.nmap

t177.	Added more QPF products to the AFOS product table.
	Done, JYC, (SS), 12/14/98

	gempak/tables/pgen/afosprod.tbl

t178.	Added a Pacific Surface forecast boundary overlay map
	for NMAP for the HPC.  Done, GK, (SS), 12/14/98.

	NEW:gempak/maps/ascii/ascmefbps.ncp
	gempak/maps/mefbps.ncp

	gempak/tables/config/mapfil.tbl
	gempak/tables/nmap/mapovl.nmap

t179.	Added two new cities tables.  One is sorted by state the
	other by city name.  Done, GK, (SS), 12/17/98.

	NEW:gempak/tables/stns/citiesnam.tbl, citiesloc.tbl

t180.	Changed the WMO ID for the high seas product from the UK
	from FPUK71 to FZNT80.  Done, JP, (SS), 12/18/98.

	tables/nwx/hseas.bull

t181.	Updated NWX station table to reflect NWS COMS ID change
	effective 12/21/98.  Done, GK, (SS), 12/21/98.

	tables/nwx/stations.tbl

t182.	Added new anomaly and climo parameters to the list
	for the MRF MOS station model editing in NMAP.
	Added new station models for the MRF MOS data.

	gempak/tables/nmap/mrfmos_parms.tbl
	gempak/tables/config/prmlst.tbl

t183.	Changed sort order of the cities location tables and updated
	table documentation.  Done, GK, (SS), 12/28/98.

	gempak/tables/citites/citiesnam.tbl, citiesloc.tbl

t184.	Updated color look-up table for the SSMI imagery used by the
	MPC.  Done, JP, (SS), 12/29/98

	gempak/tables/luts/ssmi_mpc.tbl

t185.	Corrected two pairs of stations that had identical locations 
	in the NWX station location table.  This caused NWX to obscure
	the marker of one station with the marker from the other.
	Done, GK, (SS), 12/29/98.

	tables/nwx/stations.tbl

t186.	Created a new directory which includes GEMPAK map files 
	for Linux.  Done, SJ, (SS), 12/31/98.

	gempak/maps/swapped/*

t187.	Generated byte swapped versions of the map files needed for
	Linux platform.  Done, GK, (SS), 1/6/99.

	NEW:gempak/maps/swapped/mefbps.ncp, mefbpn.ncp,
	mefbpe.ncp, mefbmr.ncp, mefbbw.ncp, mefban.ncp

	gempak/maps/swapped/mefbna.ncp, loznus.nws, hiznus.nws, 
        loosuo.nws, hiosuo.nws

t188.	Updated the METAR and sorted station table with 3 new stations
	and appended an ASOS identifier to 6 ASOS stations.  Sixteen
	stations were added to the inactive table.  Done, AH, (SS),
	1/6/99.

	gempak/tables/stns/sfstns.tbl, inactive.tbl, xrainsort.tbl

t189.	Added station IDA to NWX Coded Cities station table.  Removed
	station KOAX from NWX State Forecast Discussion station 
	table.  Added station KPAH to NWX Zone Forecast station 
	table.  Done, GK, (SS), 1/6/98.

	tables/nwx/zone.bull, sfd.bull, city.stn

t190.	Added new secondary swell wave parameters and wave group
	parameters to NMAP parameter table for ship data at the
	request of the TPC.  Done, DKW, (SS), 1/7/99.

	gempak/tables/nmap/ship_parms.tbl

t191.	Added new stations for NWX zone forecast tables.  These 
	stations in the Northwest U.S. will begin sending
	products on January 13th.  Done, GK, (SS), 1/7/99.

	tables/nwx/zone.bull

t192.	Removed four stations from the NWX station table for
	station forecast discussions that are no longer issuing
	this product as of 1/14/99.  Done, GK, (SS), 1/14/99

	tables/nwx/sfd.bull

t193.	Changed the bounds of the North_America graphics area NCNA.  
	The old defininition is now defined in the area NCNA2.  
	This change was done at the request of the HPC.  Done, 
	SJ, (SS), 1/14/99.

	gempak/tables/stns/geog.tbl

t194.	Fixed a problem in one NMAP restore file where vorticity
	values greater than 20 (scaled) were not being contoured.
	Done, TL, (SS), 1/14/99.

	gempak/nts/nmap/restore/stnd/500mb_hght_absv_ncf

t195.	Added Wilmington, OH to the NWX zone bulletin table.
	Done, GK, (SS), 1/20/99.

	tables/nwx/zone.bull

t196.	Corrected a contouring problem in one NMAP restore file
	where vorticity values greater than 20 (scaled) were
	not being contoured.  Done, TL, (SS), 1/20/99.

	gempak/nts/nmap/restore/stnd/500mb_absv_ncf

t197.	Changed the rotation of the medium range fax product
	from 90 to 270 degrees in response to reports that
	the product was upside down.  Done, SJ, (SS), 1/20/99

	gempak/tables/pgen/faxprod.tbl

t198.	Made various table changes for MPC.  Added and corrected
	headers for international High Seas products.  Added
	new spin-up WFO coastal sites.  Changed Special Marine
	Warnings/Marine Weather Statements to "W" because they
	are event driven.  Also, removed invalid entries 
	in the AFOS text table for Marine text products and added
	TPC HSFEP3 product.  Done, JP, (SS), 1/22/99.

	tables/nwx/coastal.bull, hseas.bull, master.tbl
	afos/text/MARTXT

t199.	Updated some NMAP restore files for the HPC.  Copied the 
	pmsl-thickness-1000-850mb product from the Marine to the 
	BWX group.  Also changed some of the attributes of this
	product, such as wind barb color, text size etc.  Also,
	added new station model plots for NMAP for METAR, ship
	and synoptic data.  Some of these were done for the 
	Saudi desk.  Done, JYC, (SS), 1/25/99.

	gempak/tables/nmap/mod_res.tbl
	gempak/tables/config/prmlst.tbl
	gempak/nts/nmap/restore/misc/pmsl_thkn
	gempak/nts/nmap/restore/modl/avn/pmsl_thkn_wind
	gempak/nst/nmap/restore/modl/ngm/pmsl_thkn_wind

t200.	Updated the GEMPAK zone table with Alaskan marine
	zone changes that take effect 1/25/99.  Done,
	GK, (SS), 1/25/99.

	gempak/tables/stns/zones.tbl

t201.	Changed the rotation for fax product 603X for the QPF 
	desk.  Done, SJ, (TP), 1/28/99.

	gempak/tables/pgen/faxprod.tbl

t202.	Fixed the reserve byte for fax products 105X-108X
	(preliminary surface analyses) for the HPC.
	Done, SJ, (SS), 2/3/99.

	gempak/tables/pgen/faxprod.tbl

t203.	Added new station models to NMAP table for METAR data.
	Also updated display characteristics of two NMAP model
	products.  Done, JYC, (SS), 2/5/99.

	gempak/tables/config/prmlst.tbl
	gempak/nts/nmap/restore/modl/global/pmsl_thkn_wind
	gempak/nts/nmap/restore/modl/global/pmsl_thkn_wind

t204.	Corrected Canadian surface station WWU location. 
	Done, DK, (TP), 2/5/99.

	gempak/tables/stns/sfstns.tbl

t205.	Changed information for the 5-day mean FAX and TIFF products.
	Done, SJ, (TP), 2/9/99.

	gempak/tables/pgen/faxprod.tbl, tiffprod.tbl

t206.	Changed the oder of the icons in prodbtn.tbl and fixed the 
	prolog of the fax and tiff product tables.  Done, SJ, (TP), 2/9/99.
	gempak/tables/pgen/faxprob.tbl, tiffprod.tbl, prodbtn.tbl

t207.	Added a warning to the header of group type table.  
	Done, SJ, (TP), 2/9/99.

	gempak/tables/pgen/grptyp.tbl

t208.	Various changes related to NXW provided by the SPC.
	Done, GK, (TP), 2/9/99.

	ldm/etc/pqact.conf; gempak/tables/stns/nexrad.tbl
	tables/nwx/satest.bull, sfd.bull, stations.tbl, tmppcp.bull,
		   zone.bull

t209.	Changed the contents of the North American forecast boundary
	map.  Also changed the default color.  Done, GK, (TP), 2/10/99.
	gempak/tables/nmap/mapovl.nmap; gempak/maps/mefbna.ncp
	gempak/maps/ascii/ascmefbna.ncp; gempak/maps/swapped/mefbna.ncp

t210.	Moved some overlapped stations slightly so that they may be 
	seen on NWX.  Done, GK, (TP), 2/10/99.



