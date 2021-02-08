		NAWIPS 5.6  Changed Files Log

	   	 NEW => new files; CSC => calling sequence changes 

010b.	9/12/00	gempak/source/gemlib/ss/ssvers.f

021a.	9/12/00	gempak/source/nmaplib/pgen/nmap_pgsigw.c, nmap_pgvgf.c
		gempak/source/cgemlib/clo/clofrom.c
		gempak/source/cgemlib/cvg/cvgcp.c, cvgrdele.c, cvgswap.c
	CSC:	gempak/source/cgemlib/cvg/cvgsigsto.c, cvgsvsig.c
	NEW:	gempak/source/cgemlib/cvg/cvgrdsig.c

010c.	9/12/00	gempak/source/gemlib/cv/testcv.f
		gempak/include/uscore.h
		gempak/build/gemlib_compile
	NEW:	gempak/source/gemlib/cv/cvmdfy.c

010d.	9/12/00	gempak/source/gemlib/gg/testgg.f
		gempak/source/nmaplib/nms/nmsdspl.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/nts/gemglb.nts
		gempak/parm/gpmap.prm
		gempak/txt/programs/gpmap.txt

	CSC:	gempak/source/gemlib/gg/ggmisc.f	
		gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/source/gemlib/gg/ggncon.f
		gempak/help/ncon.hl1, ncon.hl2

010e.	9/12/00	gempak/source/cgemlib/clo/clodddec.c, testclo.c
		gempak/include/uscore.h

021b.	9/12/00	nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c

010f.	9/15/00	gempak/source/cgemlib/clo/testclo.c
	CSC:	gempak/source/cgemlib/clo/clodddec.c

018a.	9/15/00	nprogs/nmap/source/nmap_mbtnw.c, nmap_dsp.c, nmap_zoomw.c
		gempak/source/programs/gui/nmap2/nmap_mbtnw.c

019a.	9/15/00	gempak/maps/hiznus.nws, meznus.nws, loznus.nws, tpznus.nws
		gempak/maps/ascii/aschiznus.nws, ascloznus.nws, ascmeznus.nws,
								asctpznus.nws

019b.	9/15/00	gempak/maps/hicwa.nws, locwa.nws, mecwa.nws, tpcwa.nws
		gempak/maps/ascii/aschicwa.nws, asclocwa.nws, ascmecwa.nws,
								asctpcwa.nws

019c.	9/15/00	gempak/maps/hicnus.nws, locnus.nws, mecnus.nws, tpcnus.nws
		gempak/maps/ascii/aschicnus.nws, asclocnus.nws, ascmecnus.nws,
								asctpcnus.nws

018b.	9/18/00	nprogs/nmap/source/nmap_mapw.c
		gempak/source/programs/gui/nmap2/nmap_mapw.c

001a.	9/18/00	gempak/source/bridge/am/ambnds.f
		gempak/source/bridge/nc/ncbnds.f
		gempak/source/bridge/ww/wwcrnr.c, wwus8.f
		gempak/source/programs/dc/dcairm/dcairm.c
		gempak/source/programs/dc/dcncon/dcncon.c
		gempak/source/programs/dc/dcwtch/dcwtch.c
		gempak/build/bridge_compile
		gempak/error/dcairm.err, dcncon.err

018c.	9/18/00	gempak/source/programs/gui/nmap2/nmap_dsp.c

018d.	9/18/00	gempak/build/nmaplib_link
		gempak/include/undscr.h
		
	NEW:	gempak/source/nmaplib/nmp/nmpdspl.f, testnmp.c, testnmp_link
		      	
021c.	9/19/00	gempak/source/nmaplib/pgen/nmap_pgfilw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c

003a.	9/20/00	gempak/source/contrib/hpc/gdgrib/bds_mak.f, gdgint.f

010g.	9/20/00	gempak/source/cgemlib/cvg/cvgdump.c, cvgrdsig.c, dumpvgf.c, 
								testcvg.c

001b.	9/20/00 gempak/source/bridge/is/isdecd.f	
	CSC:	gempak/source/bridge/is/istc.f

010h.	9/20/00	gempak/source/gemlib/im/imcbar.f

010i.	9/22/00	gempak/source/gemlib/im/imsimg.f, testim_link
		gempak/source/gemlib/gg/testgg_link
		gempak/source/gemlib/lc/testlc_link
		gempak/source/driver/active/ps/psatim.c, ps_link
		gempak/source/driver/active/gif2/wsatim.c, gif2_link
		gempak/source/driver/active/xw/xsatim.c, xw_link
		gempak/source/driver/active/gf/gf_link
		gempak/source/driver/active/gn/gn_compile, gn_link
		gempak/source/driver/active/xwp/xwp_link
		gempak/build/gemlib_compile
		gempak/include/GEMPRM.PRM, gemprm.h, gemprm.log,  uscore.h
		gempak/source/programs/gd/gdcntr/gdcntr_link
		gempak/source/programs/gd/gdlist/gdlist_link
		gempak/source/programs/gd/gdmap/gdmap_link
		gempak/source/programs/gd/gdplot/gdplot_link, gdplot_ps_link,
								gdplot_nc_link
		gempak/source/programs/gd/gdplot2/gdplot_link, gdplot_nc_link,
						gdplot_ps_link, gdplot_vg_link
		gempak/source/programs/gd/gdstream/gdstream_link
		gempak/source/programs/gd/gdwind/gdwind_link
		gempak/source/programs/gp/gpmap/gpmap_link
		gempak/source/programs/gui/nafos/nafos_link
		gempak/source/programs/gui/nmap2/Makefile
		gempak/source/programs/oa/oabox/oabox_link
		gempak/source/programs/sf/sfmap/sfmap_link, sfmap_nc_link
		gempak/source/programs/sn/snmap/snmap_link
		gempak/source/nmaplib/ngd/testngd_link
		gempak/source/nmaplib/nim/testnim_link
		gempak/source/nmaplib/nmp/testnmp_link
		gempak/source/nmaplib/nms/testnms_link
		gempak/source/nmaplib/nsf/testnsf_link
		gempak/source/nmaplib/nsn/testnsn_link
		nprogs/nmap/source/Makefile
		nprogs/nsat/source/Makefile
		nprogs/nwx/source/Makefile
	
	NEW:	gempak/source/gemlib/im/imncdf.f, imrcdf.c
		gempak/source/driver/active/gn/crncdf.c

019d.	9/25/00	gempak/maps/ascii/mapfiles.doc
		gempak/help/mapfil.hl2

	NEW:	gempak/maps/hilkus.nws, lolkus.nws, melkus.nws, tplkus.nws
		gempak/maps/ascii/aschilkus.nws, asclolkus.nws, ascmelkus.nws,
								asctplkus.nws

012a.	9/25/00	gempak/source/nxmlib/NxmBxmBtn.c

018e.	9/25/00	gempak/source/programs/gui/nmap2/nmap_zoomw.c
		nprogs/nmap/source/nmap_zoomw.c

006b.	9/25/00	gempak/source/gplt/utility/strmln.f

010j.	9/25/00	gempak/source/cgemlib/clo/clotinltln.c

019e.	9/27/00	gempak/maps/hiznus.nws, loznus.nws, meznus.nws, tpznus.nws
		gempak/maps/ascii/aschiznus.nws, ascloznus.nws, ascmeznus.nws,
								asctpznus.nws

001c.	9/27/00	gempak/source/bridge/ww/wwdcod.f

007a.	9/27/00	gempak/help/device.hl2
		gempak/include/uscore.h
		gempak/source/gemlib/gg/ggsdev.f
		gempak/source/driver/active/tiff/hinita.f, ttiff.c, twrpxl.c, 
							  tiffcmn.h, tiff_link
	CSC:	gempak/source/driver/active/tiff/tinita.c
	NEW:	gempak/source/driver/active/tiff/hsatim.f, hsicmn.f, tsatim.c,
							tsicmn.c, tuncomp.c

018f.	9/27/00	gempak/source/programs/gui/nmap2/nmap_mbtnw.c

007b.	9/27/00	gempak/source/driver/active/rbk/ainita.c, asdatt.c, hinita.f,
									hsdatt.f
		gempak/help/device.hl2


018g.	9/27/00	nprogs/nmap/source/nmap_mapw.c
		gempak/source/programs/gui/nmap2/nmap_mapw.c

021d.	9/27/00	gempak/source/nmaplib/pgen/nmap_pgwbxw.c, nmap_pgwlst.c

006c.	9/29/00	gempak/source/appl/gtxsy.f
		gempak/source/gplt/device/dtxsy.f

001d.	9/29/00	gempak/build/bridge_compile, dc_link
		gempak/include/undscr.h

	NEW:	gempak/source/bridge/ms/*.f
		gempak/source/programs/dc/dcmosa/dcavnm.f, dcmosa.c, dcmosa_link
		gempak/source/programs/dc/dcmosm/dcmosm.c, dcmrfm.f, dcmosm_link
		gempak/error/dcmos.err, ms.err
		gempak/help/dcmosa.hlp, dcmosm.hlp

019f.	9/29/00	gempak/maps/*cnus.nws, *cwa.nws, *znus.nws
		gempak/maps/ascii/*cnus.nws, *cwa.nws, *znus.nws
		gempak/maps/ascii/aschilkus.nws

021e.	10/2/00	nprogs/nmap/source/nmap_pgpalw.c

010k.	10/2/00	gempak/source/gemlib/gg/ggcbar.f

018h.	10/2/00	gempak/source/programs/gui/nmap/nmap_dsp.c, nmap_loop.c,
						nmap_loopw.c, nmap_mbtnw.c

009a.	10/4/00	NEW:  gempak/nts/nmap/restore/modl/nww3_gfdl/
			peak_swell_per_gridded, peak_swell_period_contoured, 
			sig_wave_gridded_dir_only, sig_wave_gridded_feet_dir, 
			sig_wave_gridded_meters_dir

011a.	10/5/00	gempak/source/programs/gd/gdplot2/gdpltb.f

010l.	10/5/00	gempak/source/cgemlib/cvg/cvgcp.c, cvgrdele.c, dumpvgf.c

018i.	10/6/00	nprogs/nmap/source/nmap_image.c

021f.	10/6/00	gempak/source/nmaplib/pgen/nmap_pgsigw.c

007c.	10/6/00	gempak/source/driver/inactive/gdr/README
		gempak/source/driver/active/gif/hinita.f, wline.c, wsatim.c, 
									wsbrgb.c
		gempak/source/gemlib/gg/ggsdev.f
		gempak/build/driver_compile, driver_link
	NEW:	gempak/source/driver/active/gif/gif_compile, gif_link
		gempak/source/driver/inactive/gdr/gdr_compile, gdr_link

011b.	10/6/00	gempak/source/contrib/tdl/radmap/radmap.f, dinita2.f, ggsplt2.f,
						imdrop2.f, imlutf2.f, radmap_link
	NEW:	gempak/source/contrib/tdl/radmap/cities.rad
	
010m.	10/6/00	gempak/source/gemlib/cv/cvmdfy.c, testcv.f, testcv_link

021g.	10/6/00	gempak/source/nmaplib/pgen/nmap_pgsigw.c

001e.	10/6/00	gempak/source/bridge/ms/msdcdm.f
		gempak/source/programs/dc/dcmosm/dcmrfm.f
		gempak/help/dcmosm.hlp, sfparm.hl2
		gempak/txt/apx/parms.apx

010n.	10/10/00 gempak/source/cgemlib/cgr/cgrbounds.c, cgrtorad.c
		 gempak/source/nmaplib/pgen/nmap_pgconn.c, nmap_pgdelpt.c,
			nmap_pgedit.c, nmap_pgevt.c, nmap_pgmvcp.c, 
			nmap_pgnew.c, nmap_pgpdel.c, nmap_pgundo.c, nmap_pgutls.c

021h.	10/11/00 gempak/source/nmaplib/pgen/nmap_pgwatch.c, nmap_pgwlst.c

007d.	10/11/00 gempak/source/driver/active/gif/hsbrgb.f, wsatim.c
		 gempak/help/colors.hl2, device.hl2

019g.	10/11/00 gempak/maps/*osuo.nws
		 gempak/maps/ascii/*osuo.nws

010o.	10/11/00 gempak/source/gemlib/cv/cvmdfy.c

021i.	10/11/00 gempak/source/nmaplib/pgen/nmap_pgmdfy.c

018j.	10/11/00 gempak/source/programs/gui/nmap2/nmap_dataw.c

021j.	10/11/00 gempak/include/vgstruct.h

010p.	10/11/00 gempak/source/gemlib/aw/*
	NEW:	 gempak/source/gemlib/aw/awcmn.cmn, awgabv.f, awgcuv.f

021h.	10/16/00 gempak/source/nmaplib/pgen/nmap_pgmodv.c, nmap_pgvgf.c,
			nmap_pgwatch.c, nmap_pgwbxw.c, nmap_pgwpts.c
		 gempak/source/cgemlib/cds/cdswbox.c
		 gempak/source/cgemlib/clo/clotgid.c
		 gempak/source/cgemlib/cvg/cvgdump.c, cvgrdwbx.c, cvgsvwbx.c,
							cvgswap.c, cvgwbsto.c

018k.	10/16/00 gempak/source/programs/gui/nmap2/nmap_dataw.c

001f.	10/16/00 gempak/source/bridge/nc/ncphen.f
		 gempak/source/bridge/is/isdecd.f, istc.f, ists.f

021l.	10/17/00 gempak/source/nmaplib/pgen/nmap_pgmdfy.c

014a.	10/17/00 nprogs/ntrans/source/models.c

021m.	10/17/00 gempak/source/cgemlib/cvg/cvgrdwbx.c
		 gempak/source/nmaplib/pgen/nmap_pgmodv.c, nmap_pgwatch.c,
								nmap_pgwpts.c

021n.	10/18/00 gempak/include/vgstruct.h
		 gempak/source/cgemlib/cds/cdstrack.c
		 gempak/source/cgemlib/clo/clotimes.c
		 gempak/source/cgemlib/cvg/testcvg.c, cvgdump.c, cvgswap.c
		 gempak/source/cgemlib/ctb/testctb.c
		 gempak/source/nmaplib/pgen/nmap_pgtrkw.c, nmap_pgvgf.c
	CSC:	 gempak/source/cgemlib/cvg/cvgsvtrk.c, cvgtrksto.c
	NEW:	 gempak/source/cgemlib/ctb/ctbtrkfnd.c, ctbtrkitv.c, ctbtrkqn.c

018l.	10/19/00 gempak/include/gemprm.h
		 gempak/source/gemlib/ti/timtch.f
		 gempak/source/nmaplib/ngd/ngddspl.f, ngdgtim.c, ngdtlst.f
		 gempak/source/nmaplib/nim/nimgfln.f, nimdspl.f, nimftot.f, 
							nimgtim.c, nimtlst.f
		 gempak/source/nmaplib/nsf/nsfdspl.f, nsfgtim.c, nsftlst.f
		 gempak/source/nmaplib/nsn/nsndspl.f, nsngtim.c, nsntlst.f
		 gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_tmln.c

007e.	10/19/00 gempak/source/driver/active/gn/crnids.c

011c.	10/19/00 gempak/source/programs/sf/sfchck/sfchck.f

019h.	10/20/00 gempak/maps/*znus.nes, *osuo.nws
		 gempak/maps/ascii/*znus.nes, *osuo.nws

019i.	10/20/00 gempak/maps/*cnus.nws
		 gempak/maps/ascii/*cnus.nws

010q.	10/23/00 gempak/source/gemlib/vf/vfarea.c, vfvors.c, vfwsaw.c, vfwsel.c

011d.	10/23/00 gempak/source/programs/gd/grphgd/ggdriv.f

001g.	10/23/00 gempak/source/bridge/af/afbltp.f, afcpas.f, afdcod.f, afpnbd.f
	CSC:	 gempak/source/bridge/af/afobdh.f, afrtim.f, afxbif.f
	NEW:	 gempak/source/bridge/dc/dcrtmh.f

010r.	10/23/00 gempak/source/cgemlib/cds/cdswind.c
		 gempak/source/device/plot/dhash.f

021o.	10/23/00 gempak/source/nmaplib/pgen/nmap_pgwpts.c, nmap_pgwfmt.c, 
								nmap_pgwatch.c

010s.	10/24/00 gempak/source/gemlib/im/imar2gm.f

011e.	10/24/00 gempak/source/programs/sf/sfchck/sfchck.f, sfkhdr.f
		 gempak/help/sffile.hl2

021p.	10/24/00 gempak/source/nmaplib/pgen/nmap_pgwatch.c

019j.	10/24/00 gempak/maps/tprbma.rfc
		 gempak/maps/ascii/asctprbma.rfc

021q.	10/24/00 gempak/source/nmaplib/pgen/nmap_pgedit.c

018m.	10/24/00 nprogs/nmap/source/nmap_dataw.c

010t.	10/26/00 gempak/source/gemlib/cv/testcv.f
	CSC:	 gempak/source/gemlib/cv/cvmdfy.c

021r.	10/26/00 gempak/source/nmaplib/pgen/nmap_pgmdfy.c

021s.	10/26/00 gempak/source/nmaplib/pgen/nmap_pgsigw.c, nmap_pgutls.c

018n.	10/26/00 gempak/source/programs/gui/nmap2/nmap_dataw.c

006d.	11/1/00	gempak/source/gplt/contour/ccplot.f
	NEW:	gempak/source/gplt/contour/cclip.f

021t.	11/1/00 gempak/source/nmaplib/pgen/nmap_pggst.c, nmap_pgmdfy.c

008a.	11/1/00 gempak/help/device.hl2

021u.	11/1/00 gempak/source/nmaplib/pgen/nmap_pgtrkw.c
		resource/Nmap

010u.	11/1/00 gempak/source/cgemlib/cvg/cvgcp.c

019k.	11/1/00 gempak/maps/*znus.nws
		gempak/maps/ascii/*.znus.nws

018o.	11/2/00	nprogs/nmap/source/nmap_mbtnw.c
		gempak/source/programs/gui/nmap2/nmap_dataw.c

021v.	11/2/00	gempak/source/nmaplib/pgen/nmap_pgtrkw.c

021w.	11/2/00	gempak/source/nmaplib/pgen/nmap_pgmodv.c, nmap_pgmvcp.c,
						nmap_pgwatch.c, nmap_pgwlst.c

021x.	11/2/00	gempak/source/nmaplib/pgen/nmap_pgsigw.c

021y.	11/2/00	gempak/source/nmaplib/pgen/nmap_pgmdfy.c
		gempak/source/gemlib/cv/cvmdfy.c

010v.	11/3/00	gempak/source/gemlib/cv/cvmdfy.c

008b.	11/6/00 gempak/help/nmap/WhatsNew.hlp

021z.	11/6/00 gempak/source/nmaplib/pgen/nmap_pgsigw.c

=============================  End of Patch 5.6.a  =============================

010w.	11/13/00 gempak/source/gemlib/ss/ssvers.f

007f.	11/13/00 gempak/source/driver/active/xw/xinita.c, xdwtbl.c
		 gempak/include/error.h, ERROR.PRM, uscore.h
		 gempak/error/gemplt.err

021aa.	11/13/00 gempak/source/nmaplib/pgen/nmap_pgsigw.c

021bb.	11/14/00 nprogs/nmap/source/nmap_pgpalw.c
		 gempak/source/nmaplib/pgen/nmap_pgfilw.c
		 gempak/source/programs/gui/nmap2/nmap_pgpalw.c

011f.	11/15/00 gempak/source/contrib/tdl/radmap/radmap.f, imdrop2.f, imrtbl2.f,
		 			radmap_link, README
	NEW:	 gempak/source/contrib/tdl/radmap/RADMAP.CMN

010x.	11/16/00 gempak/source/gemlib/cv/cvmdfy.c

021cc.	11/17/00 gempak/source/nmaplib/pgen/nmap_pgfilw.c

010y.	11/17/00 gempak/source/gemlib/er/erinit.c
		 gempak/include/gemprm.h

018p.	11/17/00 nprogs/nmap/source/nmap_dataw.c, nmap_mapw.c, nmap_mmenuw.c,
							nmap_sfmw.c, nmap_uairw.c

010z.	11/17/00 gempak/include/vgstruct.h, cescmn.h
		 gempak/source/cgemlib/cvg/cvgsvsym.c, cvgsvwnd.c, testcvg.c,
						cvgswap.c, cvgdump.c, cvgtodev.c

021dd.	11/21/00 gempak/source/nmaplib/pgen/nmap_pgsigw.c

015a.	11/21/00 nprogs/nsat/source/gmpk.c

001h.	11/21/00 gempak/source/bridge/am/amflvl.f
		 gempak/source/bridge/nc/ncdcod.f, nchdr.f

010aa.	11/28/00 gempak/include/pgprm.h
		 gempak/source/cgemlib/cvg/cvgcp.c

010bb.	11/28/00 gempak/source/cgemlib/cvg/cvgrdele.c

021ee.	11/28/00 gempak/source/nmaplib/pgen/nmap_pgundo.c, nmap_pgdel.c,
		    nmap_pgedit.c, nmap_pgrot.c, nmap_pgccfw.c, nmap_pgconn.c,
		    nmap_pgdelobj.c, nmap_pgevt.c, nmap_pggrpw.c, nmap_pgmdfy.c,
		    nmap_pgmodv.c, nmap_pgmvcp.c, nmap_pgpdel.c, nmap_pgrad.c,
		    nmap_pgwatch.c, nmap_pgwlst.c, nmap_pgnew.c, nmap_pgsymb.c,
		    nmap_pgwsmw.c, nmap_pgdelpt.c, nmap_pgfilw.c
		 nprogs/nmap/source/nmap_pgpalw.c, nmap_mmenuw.c
		 gempak/source/programs/gui/nmap2/nmap_pgpalw.c, nmap_mmenuw.c
		 gempak/include/pgprm.h
	NEW:	 gempak/source/cgemlib/cvg/cvgundel.c

018q.	11/28/00 gempak/source/programs/gui/nmap2/nmap_dataw.c

020a.	11/28/00 gempak/source/programs/util/avnbul/bavcntr.c, bavextrinfo.c

010cc.	11/28/00 gempak/source/gemlib/pc/pcfunc.f
		 gempak/source/gemlib/pr/testpr.f
		 gempak/help/sfparm.hl2
		 gempak/txt/apx/parms.apx
	NEW:	 gempak/source/gemlib/pr/prpr24.f

011g.	11/28/00 gempak/source/programs/gd/gdcntr/gdcntr.f
		 gempak/source/programs/gd/gdlist/gdlist.f
		 gempak/source/programs/gd/gdmap/gdmap.f
		 gempak/source/programs/gd/gdplot/gdplot.f
		 gempak/source/programs/gd/gdplot2/gdpltb.f
		 gempak/source/programs/gd/gdstream/gdstream.f
		 gempak/source/programs/gd/gdwind/gdwind.f
		 gempak/source/programs/oa/oabox/oabox.f
		 gempak/source/programs/oa/oabsfc/oacare.f
		 gempak/source/programs/oa/oabsnd/oanare.f
		 gempak/source/gemlib/gr/testgr.f
	CSC:	 gempak/source/gemlib/gr/grfixa.f

009b.	11/29/00 gempak/nts/nmap/restore/misc/pmsl_thkn

018r.	11/29/00 gempak/source/nmaplib/nmp/testnmp.c, testnmp_link
		 gempak/build/nmaplib_compile
	 NEW:	 gempak/source/nmaplib/nmp/nmpcmn.h, nmpgovlattr.c, nmpgovlflg.c,
			nmpinit.c, nmpgmapnms.c, nmpgmapnum.c, nmpgovlnms.c, 
			nmpgovlnum.c
		 gempak/error/nmp.err

001i.	11/29/00 gempak/source/bridge/wn/wndcod.f, wnghdr.f
	NEW:	 gempak/source/bridge/wn/wnstfs.f

021ff.	11/30/00 gempak/source/nmaplib/pgen/nmap_pgundo.c, nmap_pgedit.c,
			nmap_pgevt.c, nmap_pgmvcp.c, nmap_pgwlst.c,
			nmap_pgdsel.c, nmap_pgqpf.c, nmap_pgtrk.c, nmap_pgutls.c,
			nmap_pgwbxw.c, nmap_pgwxd.c, nmap_pgxrain.c
			nmap_pgsfp.c

021gg.	11/30/00 gempak/source/nmaplib/pgen/nmap_pgvgf.c

018s.	11/30/00 gempak/source/programs/gui/nmap2/nmap_cldhgtw.c, nmap_dsp.c,
			nmap_mapw.c, nmap_mcanvw.c, nmap_roamw.c, nmap_seekw.c,
			nmap_zoomw.c
		 nprogs/ntrans/source/commands.c
		 nprogs/nsat/source/mcanvw.c, mmenuw.c
		 nprogs/nwx/source/draw.c, mapw.c
		 nprogs/nmap/source/nmap_cldhgtw.c, nmap_dsp.c, nmap_image.c,
				nmap_mapw.c, nmap_mcanvw.c, nmap_mmenuw.c,
				nmap_roamw.c, nmap_seekw.c, nmap_zoomw.c

010dd.	11/30/00 gempak/build/bridge_compile, gemlib_compile, syslib_compile
		 Too Many To Count, but nearly the entire cgemlib directory.

021hh.	12/1/00	gempak/source/nmaplib/pgen/nmap_pgccfw.c, nmap_pgcirc.c,
			nmap_pgconn.c, nmap_pgdelpt.c, nmap_pgedit.c,
			nmap_pgevt.c, nmap_pgggc.c, nmap_pggst.c, nmap_pghdlb.c,
			nmap_pgmdfy.c, nmap_pgmodv.c, nmap_pgmvcp.c, 
			nmap_pgnew.c, nmap_pgolk.c, nmap_pgpdel.c, nmap_pgrad.c,
			nmap_pgrot.c, nmap_pgsigw.c, nmap_pgsymb.c, 
			nmap_pgtxt.c, nmap_pgvgf.c, nmap_pgwatch.c,
			nmap_pgwbxw.c, nmap_pgwlst.c, nmap_pgwpts.c, 
			nmap_pgwsmw.c

010ee.	12/4/00 gempak/source/cgemlib/cgr/cgrinpoly.c, cgrsegint.c, testcgr.c
		gempak/source/cgemlib/clo/clobinpoly.c, clotinpoly.c, clotqbnd.c
		gempak/source/cgemlib/cvg/cvgfscan.c, cvgtodev.c
		gempak/source/cgemlib/cds/cdsccf.c, cdscirc.c, cdsfrnt.c,
			cdsline.c, cdssig.c, cdssymb.c, cdstext.c, cdstrack.c,
			cdswbox.c, cdswind.c
		gempak/source/cgemlib/crg/crggbnd.c, crggettxtbox.c, 
			crgrngpt.c, crgsetcir.c, crgsetltln.c, crgsetsym.c,
			crgsetwbx.c, crgsetwnd.c
		gempak/source/cgemlib/utf/utfptext.c, utfpvctr.c, utfpvev.c
		gempak/source/programs/util/avnbul/bavcb.c, bavgetpoly.c,
			bavinitgplt.c, bavturb.c

015b.	12/4/00	nprogs/nsat/source/enhw.c

010ff.	12/6/00 gempak/include/vgstruct.h, uscore.h, gemprm.h, geminc.h
		Many cgemlib, nxmlib, and nmaplib routines - see list
		NEW:	gempak/include/proto.h, proto_cgemlib.h, proto_gemlib.h,
			proto_clo.h, proto_nwx.h, proto_vg.h

011h.	12/6/00 gempak/source/programs/gd/gdinfo/gdinfo.f
		gempak/source/gemlib/gd/gdsrtl.f

001j.	12/6/00 gempak/source/bridge/wn/wndcod.f, wnout.f, wnghdr.f

016a.	12/6/00 nprogs/nwx/source/dttm.c, srchb.c, srcho.c, srchw.c

007g.	12/6/00 gempak/source/driver/active/fax/rmapid.c

001k.	12/7/00 gempak/source/bridge/is/isphen.f, istc.f, isdecd.f

021ii.	12/7/00	gempak/source/nmaplib/pgen/*.c
		gempak/source/programs/gui/nmap2/*.c
		nprogs/nmap/source/*.c
		nprogs/ncolor/source/NxmGmpk.c
		nprogs/nfax/source/cpgdmpct.c, cpgreadcuts.c, cpgshoct.c, 
								cpgsixrd.c
		gempak/source/driver/active/fax/rclosp.c
		gempak/source/driver/active/gif/gfcmn.h
		gempak/source/gemlib/cv/testcv_link
		gempak/include/proto.h, proto_cgemlib.h, proto_vg.h, 
					uscore.h, nmsdef.h
	NEW:	gempak/include/proto_nmaplib.h



007h.	12/7/00 gempak/source/driver/active/xw/xsatim.c
		gempak/source/driver/active/ps/psatim.c
		gempak/source/driver/active/gif/wsatim.c
		gempak/source/driver/active/tiff/tsatim.c
		gempak/source/gemlib/im/imsimg.f, imnihd.f, testim_link
		gempak/include/GEMPRM.PRM, gemprm.h, uscore.h, gemprm.log
		gempak/build/all_compile
		gempak/source/gemlib/gg/testgg_link
		gempak/source/gemlib/lc/testlc_link
		gempak/source/gemlib/cv/testcv_link
		gempak/source/driver/active/*/*_link
		gempak/source/programs/gd/*/*_link
		gempak/source/programs/gp/gpmap/gpmap_link
		gempak/source/programs/oa/oabox/oabox_link
		gempak/source/programs/sf/sfmap/sfmap_*link
		gempak/source/programs/sn/snmap/snmap_link
		gempak/source/programs/gui/nafos/nafos_link
		gempak/source/programs/gui/nmap2/Makefile
		gempak/source/nmaplib/*/*_link
		gempak/source/contrib/tdl/radmap/radmap_link
		nprogs/*/source/Makefile

	NEW:	gempak/source/driver/active/gn/crnexz.c
		gempak/source/gemlib/im/imnidh.f, imnzhd.f, imnexz.c
		gempak/source/zlib/*
		gempak/include/zconf.h, zlib.h
		gempak/build/zlib_compile

010gg.	12/12/00 gempak/source/gemlib/vf/vfcmn.h, vfarea.c, vfavcd.c, vfcnsaw.c,
			vfcnsel.c, vfctim.c, vfeftm.c, vfgttxt.c, vfread.c,
			vfrptxt.c, vfspc.c, vfvors.c, vfwawn.c, vfwoui.c,
			vfwpwn.c, vfwsaw.c, vfwsel.c, vfwsev.c, vfwwcl.c, 
			vfwwcp.c

010hh.	12/12/00 gempak/source/cgemlib/cds/cdstext.c
		 gempak/source/cgemlib/ces/testces.c
		 gempak/source/cgemlib/cfl/testcfl.c
		 gempak/source/cgemlib/clo/cloddenc.c, clotdirect.c, testclo.c
		 gempak/source/cgemlib/crg/crgsettxt.c
		 gempak/source/cgemlib/cst/testcst.c
		 gempak/source/cgemlib/ctb/testctb.c
		 gempak/source/cgemlib/cvg/*.c
		 gempak/source/cgemlib/cvq/cvq*.c
		 gempak/source/cgemlib/utf/testutf.c, utfopen.c, utfplot.c,
							utfpvev.c, utfsize.c

018t.	12/13/00 gempak/source/nmaplib/nmp/testnmp.c, nmpinit.c
		 gempak/error/nmp.err
	 NEW:	 gempak/source/nmaplib/nmp/nmprestorovl.c, nmpsavovl.c,
								nmpsovlattr.c

001l.	12/13/00 gempak/build/bridge_compile, dc_link
		 gempak/include/uscore.h

	NEW:	 gempak/source/programs/dc/dcsvrl/*
		 gempak/source/bridge/sv/*
		 gempak/error/dcsvrl.err 
		 gempak/help/dcsvrl.hlp

010ii.	12/13/00 gempak/source/cgemlib/cvg/cvgcp.c, cvgrdele.c

010jj.	12/13/00 gempak/source/gemlib/fl/fltbop.f
		 gempak/source/cgemlib/cfl/cfltbop.c

010kk.	12/13/00 gempak/source/driver/active/vg/vgcmn.h, vcirc.c, vfill.c, 
			vfrnt.c, vhash.c, vline.c, vmark.c, vspln.c, vsymb.c,
			vtext.c, vtxsy.c, vwind.c
	NEW:	 gempak/source/cgemlib/cvg/cvgwritelm.c, cvginitelm.c

012b.	12/14/00 gempak/source/nmaplib/nmp/nmpinit.c
		 gempak/source/nmaplib/nms/nmsghrn.c, nmsrtbl.c
		 gempak/source/nmaplib/pgen/*.c  (actually only 30)
		 gempak/source/nxmlib/Nxmlib.h, *.c  (actually only 22)
		 include/Nxm.h, NxmTxt.h
   		 gempak/include/nmsdef.h, pgcmn.h, proto.h, proto_gemlib.h,
			proto_cgemlib.h, proto_nmaplib.h, proto_nwx.h, 
			proto_vg.h
	NEW:	 gempak/include/proto_nxmlib.h, proto_xw.h

010ll.	12/15/00 gempak/source/gemlib/gg/ggltln.f, testgg.f
		 gempak/source/gplt/main/gplt.f
		 gempak/source/testprog/atest.f
		 gempak/source/programs/gui/nmap2/nmap_mapw.c
		 nprogs/nmap/source/nmap_mapw.c
		 gempak/help/latlon.hl1, latlon.hl2
		 gempak/txt/gemplt/AppxD.txt

	CSC:	 gempak/source/gemlib/gg/ggdltn.f
		 gempak/source/gplt/utility/gdrgrd.f
		 gempak/source/appl/utility/gdrgrd.f

021jj.	12/18/00 nprogs/nmap/source/nmap.c 
		 gempak/source/nmaplib/pgen/nmap_pgccfp.c, nmap_pggfmt.c,
				nmap_pgofmt.c, nmap_pgsigw.c, nmap_pgutls.c,
				nmap_pgwfmt.c
		 gempak/include/proto_nmaplib.h

007i.	12/18/00 gempak/source/driver/active/gif/hinit.f

011i.	12/18/00 gempak/source/programs/gd/gdplot2/gdplot.cmn, gdpltb.f,
								testgdp.f 

010mm.	12/19/00 gempak/source/gemlib/gb/gbbms.c, gbensemble.c, gbgaus.c,
			gbgds.c, gbgubd.c, gbids.c, gblamb.c, gbltln.c,
			gbmerc.c, gbpds.c, gbpolr.c, gbrindx.c, gbscan.c,
			gbtdlens.c, gbcmn.h
		 gempak/include/proto_gemlib.h

012c.	12/20/00 nprogs/busy/source/busy.c
		 nprogs/guitst/source/guitst.c
		 nprogs/ncolor/source/ncolor.c
		 nprogs/nfax/source/cpgshoct.c, cpgsixrd.c
		 nprogs/nmap/source/nmap_cldhgtw.c, nmap_dataw.c, nmap_dsp.c,
			nmap_dsrc.c, nmap_mapw.c, nmap_mtbl.c, nmap_rsrc.c,
			nmap_stbl.c, nmap_stnmw.c, nmap_vtbl.c
		 nprogs/nsat/source/*.c
		 nprogs/ntl/source/appbtn.c, apptab.c, ntl.c, prog.c
		 nprogs/ntrans/source/*.c
		 nprogs/nwx/source/*.c
		 nprogs/ntrans/include/defs.h, interface.h
	 	 gempak/include/ctbcmn.h, proto_gemlib.h, proto_cgemlib.h
	NEW:	 gempak/include/proto_vf.h, proto_ctb.h

006e.	12/20/00 gempak/source/gemlib/im/imar2gm.f, imnidh.f
		 gempak/source/gplt/satellite/nvxini.f
		 gempak/source/gplt/transform/mcidas/nvxsae.f, nvxeas.f
		 gempak/source/gplt/utility/gdrgrd.f
	NEW:	 gempak/source/gplt/transform/mcidas/nvxradr.f

010nn.	12/21/00 gempak/source/gemlib/im/imnidh.f

010oo.	12/21/00 gempak/source/gemlib/im/imnexz.c

021kk.	12/21/00 gempak/source/nmaplib/pgen/nmap_pgundo.c, nmap_pgdel.c, 
			nmap_pgedit.c, nmap_pgrot.c, nmap_pgccfw.c, nmap_pgevt.c,
			nmap_pgdelobj.c, nmap_pgconn.c, nmap_pggrpw.c,
			nmap_pgmdfy.c, nmap_pgmodv.c, nmap_pgmvcp.c, 
			nmap_pgpdel.c, nmap_pgrad.c, nmap_pgwatch.c,
			nmap_pgwlst.c, nmap_pgnew.c, nmap_pgsymb.c,
			nmap_pgwsmw.c, nmap_pgdelpt.c, nmap_pgfilw.c
			gempak/source/programs/gui/nmap2/nmap_pgpalw.c
			nprogs/nmap/source/nmap_pgpalw.c
			gempak/tables/pgen/funcbtn.tbl
			gempak/include/drwids.h

010pp.	12/22/00 gempak/source/nmaplib/pgen/nmap_pgvgf.c, nmap_pgprd.c
		 gempak/source/cgemlib/cvg/testcvg.c
		 gempak/source/driver/active/vg/vcirc.c, vfill.c, vfrnt.c, 
			vhash.c, vline.c, vmark.c, vspln.c, vsymb.c, vtext.c,
			vtxsy.c, vwind.c
		 gempak/include/proto_cgemlib.h, proto_vg.h
	CSC:	 gempak/source/cgemlib/cvg/cvgwritelm.c

019l.	12/22/00 gempak/maps/*cnus.nws
		 gempak/maps/ascii/asc*cnus.nws

015c.	12/22/00 resource/Nsat

018u.	12/22/00 gempak/source/nmaplib/nmp/testnmp.c, nmpinit.c, nmpgmapnms.c,
			nmpgovlattr.c, nmpgovlnms.c, nmpsovlattr.c, nmpcmn.h
		 gempak/include/gemprm.h
	NEW:	 gempak/source/nmaplib/nmp/nmpgmapattr.c, nmprestormap.c,
			nmpsetmap.c, nmpsmapattr.c, nmpsvmap.c, nmpszoom.c
		 gempak/include/nmpdef.h

010qq.	12/22/00 gempak/source/gemlib/tg/tgrang.f

018v.	12/22/00 gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c,
								nmap_dtmbw.c

018w.	12/22/00 gempak/source/programs/gui/nmap2/nmap_dslw.c

010rr.	12/22/00 gempak/source/gemlib/cv/cvmdfy.c

012d.	1/2/01	gempak/source/programs/gui/aftext/aftdsp.c
		gempak/source/programs/gui/nafos/nafdslw.c, nafmenw.c, nafprefw.c
		gempak/source/programs/gui/nalarm/*.c
		gempak/source/programs/gui/nmap2/nmap_cldhgtw.c, nmap_dataw.c, 
			nmap_dsp.c, nmap_gtbl.c, nmap_loopw.c, nmap_mainw.c, 
			nmap_mbotw.c, nmap_mbtnw.c, nmap_mmenuw.c, nmap_msc.c, 
			nmap_seekw.c, nmap_stbl.c, nmap_stnmw.c, nmap_vgf.c, 
			nmap_vtbl.c
		gempak/source/cgemlib/clo/closortbnd.c, closortstn.c
		gempak/source/nmaplib/pgen/nmap_pgccfw, nmap_pgcirc.c, 
		    nmap_pgdelobj.c, nmap_pgevt.c, nmap_pgfilw.c, nmap_pgfrtw.c, 
		    nmap_pggrpw.c, nmap_pgline.c, nmap_pgnumb.c, nmap_pgpdel.c, 
		    nmap_pgprd.c, nmap_pgsigw.c, nmap_pgsymb.c, nmap_pgtrk.c, 
		    nmap_pgtrkw.c, nmap_pgtxt.c, nmap_pgundo.c, nmap_pgwatch.c,
		    nmap_pgwbxw.c, nmap_pgwcnl.c, nmap_pgwfmt.c, nmap_pgwlst.c, 
		    nmap_pgwndw.c, nmap_pgwsmw.c
		gempak/include/proto_nmaplib.h, uscore.h, proto_xw.h

010ss.	1/3/01	gempak/source/gemlib/im/imnidh.f

021ll.	1/3/01	gempak/source/nmaplib/pgen/nmap_pgtxt.c

021mm.	1/3/01	gempak/source/nmaplib/pgen/nmap_pgfrtw.c, nmap_pggrpw.c,
			nmap_pglabel.c, nmap_pgline.c, nmap_pgsymb.c
		gempak/include/pgcmn.h, proto_nmaplib.h
		
019m.	1/4/01	gempak/maps/hifiwo.ncp
		gempak/maps/ascii/aschifiwo.ncp

010tt.	1/4/01	gempak/source/gemlib/in/intype.f, inwind.f
		gempak/help/type.hl1, type.hl2, wind.hl2

010uu.	1/4/01	gempak/source/gemlib/gg/testgg.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/source/nmaplib/nms/nmsdspl.f
		nprogs/nmap/source/nmap_dsp.c
		gempak/help/warn.hl2
		gempak/include/proto_gemlib.h
		gempak/parm/gpmap.prm
		gempak/nts/gemglb.nts
		gempak/txt/programs/gpmap.txt
	CSC:	gempak/source/gemlib/gg/ggmisc.f, ggwarn.f
		gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/help/svrl.hl1, svrl.hl2

018x.	1/4/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_tmln.c

011j.	1/5/01	gempak/source/contrib/tdl/radmap/ggsplt2.f, radmap.f, cities.rad
	NEW:	gempak/source/contrib/tdl/radmap/radmap_sw.f, radmap_sw_link

007j.	1/9/01	gempak/source/driver/active/fax/faxcmn.h, ras26bit.c, rclosp.c, 
						rmapid.c, rscnfll.c, rsdump.c
		gempak/source/driver/active/gf/xendd.c, xwrgif.c
		gempak/source/driver/active/gif/wclosp.c
		gempak/source/driver/active/gn/cctabl.c, cqcomp.c, crarea.c, 
			crgini.c, crnexz.c, crnids.c, crnowr.c, cscname.c,
			cscrgb.c, csctbl.c
		gempak/source/driver/active/nc/msdatt.c, mtext.c, mtextc.c, 
									nccmn.h
		gempak/source/driver/active/ps/pcirc.c, pclear.c, pclosp.c, 
			pcvtclr.c, pdots.c, pfil.c, pline.c, psatim.c, pscmn.h,
			pscolor.c, psltyp.c, psopen.c, ptext.c, ptextc.c
		gempak/source/driver/active/rbk/aclosp.c, aopen.c, ardcmn.h
		gempak/source/driver/active/tiff/tcircpts.c, tcosp.c, tg4comp.c,
					tiffcmn.h, tscnfll.c
		gempak/source/driver/active/utf/uopen.c, utfcmn.h
		gempak/source/driver/active/xw/xcamgr.c, xgbank.c, xline.c, 
									xmloop.c
		gempak/include/proto_gemlib.h, uscore.h

020b.	1/9/01	gempak/source/syslib/unix/ccheck.c, ciproc.c, csproc.c, gemsys.h

021nn.	1/9/01	gempak/source/nmaplib/pgen/nmap_pgolk.c

010vv.	1/9/01	gempak/source/cgemlib/cvg/cvgrdsig.c, cvgrdwbx.c, dumpvgf.c,
								testcvg.c
		gempak/include/vgstruct.h, proto_cgemlib.h
	NEW:	gempak/source/cgemlib/cvg/cvgcrall.c

019n.	1/9/01	NEW:  gempak/source/contrib/tdl/radmap/hipona.nws, lakes.ncp,
						aschipona.nws, asclakes.ncp

011k.	1/9/01	gempak/source/gplt/control/ggtpnt.f
		gempak/source/gemlib/ip/ipgtpt.f
		gempak/source/programs/gui/nafos/nafmenuw.c
		gempak/source/programs/gui/nmap2/nmap_zoomw.c
		nprogs/nwx/source/mapw.c, draw.c
		nprogs/nsat/source/mmenuw.
		nprogs/nmap/source/nmap_zoomw.c

018y.	1/9/01	gempak/source/programs/gui/nmap2/nmap_mcanvw.c
		nprogs/nmap/source/nmap_mcanvw.c
		gempak/source/nmaplib/pgen/nmap_pggst.c
		gempak/source/cgemlib/cvg/cvgwritelm.c
		gempak/source/include/proto_nmaplib.h

010ww.	1/9/01	gempak/source/gemlib/gg/ggcbar.f
		gempak/help/clrbar.hl1, clrbar.hl2

010xx.	1/10/01	gempak/source/cgemlib/ctb/testctb.c
		gempak/source/programs/gui/nmap2/nmap_dslw.c
		nprogs/nmap/source/nmap_dslw.c
		gempak/include/proto_cgemlib.h
	CSC:	gempak/source/cgemlib/ctb/ctbpllist.c

021oo.	1/10/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c, nmap_pgwatch.c,
						nmap_pgwlst.c, nmap_pgedit.c

009c.	1/10/01	NEW:  gempak/nts/meta/200mb_hght_wnd.2.nts, 250mb_hght_wnd.2.nts,
			300mb_hght_wnd.2.nts, 500mb_hght_absv.2.nts,
			500mb_hght_gabsv.2.nts, 700mb_hght_relh_omeg.2.nts,
			850mb_hght_tmpc.2.nts, garea_hi.nts, garea_nh.nts,
			garea_sh.nts, garea_us.nts, p03m_pmsl.2.nts,
			p06m_pmsl.2.nts, pmsl_ethkn.2.nts, pmsl_thkn.2.nts,
			precip.2.nts

021oo.	1/10/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c, nmap_pgwatch.c,
						nmap_pgwlst.c, nmap_pgedit.c
		gempak/include/proto_nmaplib.h, proto_vg.h

018z.	1/11/01	gempak/source/programs/gui/nmap2/nmap_dttmw.c
		nprogs/ntrans/source/process_meta.c
		nprogs/nmap/source/nmap_dttmw.c

010yy.	1/11/01	gempak/source/bridge/dc/dcdlog.c
		gempak/source/cgemlib/cds/cdstrack.c
		gempak/source/cgemlib/cfl/cflsrch.c, testcfl.c
		gempak/source/cgemlib/crg/testcrg.c
		gempak/source/cgemlib/ctb/testctb.c
		gempak/source/cgemlib/cvg/cvgc3*.c, cvgdeall.c, cvgdelet.c, 
			cvgindex.c, cvgqkopen.c, cvgundel.c, cvgwrit.c
		gempak/source/cgemlib/utf/testutf.c, utfplot.c, utfptext.c
		gempak/source/gemlib/im/imnexz.c, imrgin.c, imwgin.c
		gempak/source/nmaplib/pgen/nmap_pgccfw.c, nmap_pgcirc.c, 
			nmap_pgfrtw.c, nmap_pgline.c, nmap_pgsymb.c, 
			nmap_pgwatch.c, nmap_pgwbxw.c, nmap_pgwndw.c, 
			nmap_pgwsmw.c
		gempak/source/nxmlib/NuiColorInit.c, NxmAnimationBits.h, 
			NxmBusy.c, NxmBxmBtn.c, NxmColorEdit.h, 
			NxmColorNameLists.c, NxmColorPalette.c, NxmColorTable.c,
			NxmEnhw.c, NxmErr.c, NxmHelp.c, NxmInfoMenu.c, NxmPrt.c,
			NxmLineA.c, NxmLoopPanel.c, NxmMarkA.c, NxmPrompt.c
		gempak/source/programs/gui/nmap2/nmap_cursorw.c, nmap_seekw.c,
			nmap_locfmtw.c, nmap_pgpalw.c
		gempak/source/programs/sf/sfvgsf/sfvvgf.c


021pp.	1/12/01	gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pglabel.c,
								nmap_pgline.c

018aa.	1/12/01	gempak/source/programs/gui/nmap2/nmap_cursorw.c, nmap_locfmtw.c,
			nmap_pgpalw.c, nmap_seekw.c
		gempak/source/nmaplib/pgen/nmap_pgccfw.c, nmap_pglabel.c, 
			nmap_pgsigw.c
		gempak/source/nxmlib/NxmBusy.c, NxmErr.c

012e.	1/12/01	nprogs/busy/source/busy.c

021qq.	1/12/01	gempak/source/nmaplib/pgen/nmap_pggrpw.c

018bb.	1/12/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

018cc.	1/16/01	gempak/source/nxmlib/NxmAnimationBits.h, NxmLoopPanel.c
		gempak/source/programs/gui/nmap2/nmap.c, nmap_cldhgtw.c, 
			nmap_dataw.c, nmap_gtbl.c, nmap_locfmtw.c, nmap_logo.c,
			nmap_mapw.c, nmap_mbotw.c, nmap_mmenuw.c, nmap_pgpalw.c,
			nmap_roamw.c, nmap_rsrc.c, nmap_seekw.c, nmap_stbl.c
		gempak/source/programs/util/avnbul/avnbul.c, bavcb.c, 
			bavgetpoly.c, bavturb.c
		nprogs/nmap/source/nmap.c, nmap_cldhgtw.c, nmap_cursorw.c, 
			nmap_dslw.c, nmap_image.c, nmap_locfmtw.c, nmap_logo.c,
			nmap_loopw.c, nmap_mainw.c, nmap_mbotw.c, nmap_mbtnw.c,
			nmap_mdl.c, nmap_mmenuw.c, nmap_obs.c, nmap_pgpalw.c,
			nmap_seekw.c, nmap_stbl.c, nmap_stnmw.c, nmap_vgf.c,
			nmap_vtbl.c, nmap_wwnw.c
		nprogs/ntrans/source/mainw.c, menubar.c, multipanel.c
		gempak/build/EXAMPLE
		gempak/include/proto_nmaplib.h

021rr.	1/16/01	gempak/source/nmaplib/pgen/nmap_pgtxt.c, nmap_pgsymb.c
		nawdv/resource/Nmap

018dd.	1/17/01	nprogs/nmap/source/nmap_dslw.c

018ee.	1/17/01	gempak/source/programs/gui/nmap2/nmap_dslw.c

018ff.	1/17/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

012f.	1/17/01	gempak/source/gplt/control/ggtpnt.f
		gempak/source/programs/gui/nmap2/nmap_zoomw.c, nmap_mmenuw.c
		nprogs/nmap/source/nmap_zoomw.c, nmap_mmenuw.c
		nprogs/nsat/source/mmenuw.c
		gempak/help/notae.hlp, garea.hl2
		help/common/zoom.hlp

021ss.	1/18/01	gempak/source/nmaplib/pgen/nmap_pgedit.c, nmap_pggrpw.c,
			nmap_pglabel.c, nmap_pgline.c, nmap_pgofmt.c,
			nmap_pgolk.c, nmap_pgwbxw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/include/proto_nmaplib.h

011l.	1/18/01	gempak/source/programs/gd/gdinfo/gdinfo.f

021tt.	1/18/01 gempak/source/nmaplib/pgen/nmap_pgtxt.c

001m.	1/18/01	gempak/source/programs/dc/*/*.c
		gempak/source/bridge/dc/dccmn.h, dcdlog.c, dcwbuf.c
		gempak/source/gemlib/er/erinit.c, ersmsg.c, erwbuf.c
		gempak/include/bridge.h, ercmn.h, proto_gemlib.h
	NEW:	gempak/include/proto_bridge.h

021uu.	1/19/01	gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pgolk.c

021vv.	1/19/01	gempak/source/nmaplib/pgen/nmap_pglabel.c, nmap_pgline.c

007k.	1/19/01	gempak/source/driver/active/vg/vhash.c, vmark.c, vsymb.c, vwind.c

009d.	1/19/01	gempak/data/vgf/test.vgf

021ww.	1/19/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

021xx.	1/23/01	gempak/source/programs/gui/nmap2/nmap_pgwndw.c
		nawdv/resource/Nmap

021yy.	1/23/01	gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pgline.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/include/proto_nmaplib.h

008c.	1/23/01	help/nmap/WhatsNew.hlp
	NEW:	versions/release_notes/v5.6/README_nawips5.6.b

=============================  End of Patch 5.6.b  =============================

010zz.	1/30/01	gempak/source/gemlib/ss/ssvers.f

018gg.	1/30/01	gempak/source/cgemlib/crg/crgclroffst.c, crggettxtbox.c, 
			crggrfrsh.c, crginit.c, crgsettxt.c, crgsetwnd.c, 
			testcrg.c
		gempak/source/nmaplib/nmp/testnmp.c
		gempak/source/nmaplib/pgen/*.c
		gempak/source/nxmlib/NxmCursor.c, NxmLineA.c, NxmMarkA.c, 
									NxmPrt.c
		gempak/source/programs/gui/nafos/nafmenuw.c, nafos.c
		gempak/source/programs/gui/nmap2/*.c
		nprogs/nmap/source/nmap_cldhgtw.c, nmap_mapw.c, nmap_mbtnw.c,
								nmap_pgpalw.c
		nprogs/nsat/source/mmenuw.c
		include/Nxm.h
		gempak/build/all_compile, cgemlib_compile, cgemlib_link,
							gui_compile, gui_link
		gempak/include/nmpdef.h, nmsdef.h, pgprm.h, vgftbl.h,
				proto_gemlib.h, proto_nmaplib.h, proto_nxmlib.h,
				proto_vg.h
		gempak/source/nxmlib/Nxmlib.h
		gempak/source/programs/gui/nmap2/nmap_data.h, nmap_dttm.h,
				nmap_gtbl.h, nmap_mainw.h, nmap_map.h, nmapprm.h
	NEW:	gempak/source/programs/gui/nmap2/proto_nmap2.h
		gempak/source/cgemlib/crg/crgcmn.h [moved from $GEMINC]

015d.	1/30/01	nprogs/nsat/source/*.c, interface.h
	NEW:	nprogs/nsat/source/proto_nsat.h

014b.	1/31/01	nprogs/ntrans/source/*.c, Makefile, ntrans_compile
	NEW:	nprogs/ntrans/source/*.h

016b.	1/31/01 nprogs/nwx/source/*.c, gui.h
		gempak/include/proto_ctb.h, proto_gemlib.h
	NEW:	nprogs/nwx/source/proto_nwx.h

020c.	2/1/01	gempak/source/testprog/plotsyms.f

001n.	2/1/01	gempak/source/bridge/sv/svalnm.f, svdcod.f
		gempak/source/gemlib/gg/ggwarn.f
		gempak/error/gg.err
	CSC:	gempak/source/bridge/sv/svcntt.f, svghdr.f

018hh.	2/1/01	gempak/source/nmaplib/nmp/nmpgovlattr.c, nmpgovlflg.c, 
				nmpsetmap.c, nmpsmapattr.c, nmpsovlattr.c,
				nmpszoom.c, testnmp.c
		gempak/error/nmp.err
		gempak/include/nmpdef.h
	CSC:	gempak/source/nmaplib/nmp/nmpgmapattr.c

001o.	2/1/01	gempak/source/bridge/dc/dcosfc.f, dcosfr.f, dcosnd.f, dcosnm.f
		gempak/source/bridge/sv/svdcod.f
		gempak/source/bridge/wn/wncnty.f, wndcod.f, wnstfs.f

	CSC:	gempak/source/bridge/dc/dcstns.f
		gempak/source/bridge/sv/svout.f
		gempak/source/bridge/wn/wnout.f

022a.	2/1/01	nprogs/nfax/source/*.c, pgcmn.h
	NEW:	nprogs/nfax/source/proto_nfax.h

012g.	2/1/01	gempak/source/nxmlib/NxmLineA.c, NxmPrompt.c
		gempak/source/programs/gui/nalarm/*.c, nalarm.h
		nprogs/ncolor/source/*.c
		nprogs/ntl/source/*.c, app.h
	NEW:	nprogs/ncolor/source/proto_ncolor.h

010aaa.	2/1/01	gempak/source/cgemlib/clo/testclo.c
		gempak/source/cgemlib/ctb/testctb.c
		gempak/include/ctbcmn.h, proto_cgemlib.h, proto_ctb.h

	NEW:	gempak/source/cgemlib/clo/clofindnum.c
		gempak/source/cgemlib/ctb/ctbccfind.c, ctbccrd.c

018ii.	2/6/01	nprogs/nmap/source/*.c, *.h
		gempak/include/proto_cgemlib.h, proto_gemlib.h
	NEW:	nprogs/nmap/source/proto_nmap.h

018jj.	2/6/01	gempak/source/programs/gui/nmap2/nmap_mcanvw.c

018kk.	2/6/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

018ll.	2/6/01	nprogs/nmap/source/nmap_dtmbw.c, nmap_obs.c

006f.	2/6/01	gempak/source/gplt/utility/gdrgrd.f

010bbb.	2/6/01	gempak/source/cgemlib/cvg/testcvg.c, cvgopen.c, cvgqkopen.c,
			cvgc3e3f.c, cvgc3i3h.c, cvgc3k3j.c, cvgcp.c,
			cvgdelet.c, cvgload.c, cvgload2.c, dumpvgf.c,
			cvgdeall.c, cvgwrit.c, cvgindex.c, cvgrdhdr.c, cvgclos.c
		gempak/source/cgemlib/crg/testcrg.c
		gempak/source/nmaplib/pgen/nmap_pgdel.c
		gempak/source/programs/util/sfcsplt/sfcsplt.c
		gempak/source/programs/sf/sfvgsf/sfvvgf.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/include/proto_cgemlib.h

012h.	2/7/01	gempak/source/nxmlib/*.c
		gempak/include/proto_nxmlib.h

011m.	2/8/01	nprogs/busy/source/busy.c
		gempak/source/programs/util/avnbul/*.c
		gempak/source/programs/util/freeColors/freecolors.c
		gempak/source/programs/util/sfcsplt/sfcsplt.c
		gempak/source/programs/util/spctxt/spctxt.c
		gempak/build/nprog_link, util_link
		gempak/include/proto_gemlib.h, proto_vg.h
	NEW:	gempak/source/programs/util/avnbul/proto_avnbul.h


019o.	2/8/01	gempak/maps/*znus.nws, *cnus.nws, *cwa.nws, *osuo.nws, *stus.nws
		gempak/maps/ascii/asc*znus.nws, asc*cnus.nws, asc*cwa.nws,
					asc*osuo.nws, asc*stus.nws
	
018mm.	2/8/01	nprogs/nmap/source/nmap_dslw.c
		gempak/source/programs/gui/nmap2/nmap_dslw.c

010cc.	2/12/01	gempak/source/cgemlib/cvg/cvgcrall.c, cvgcp.c, cvgsvfhed.c,
						cvgsetginf.c, testcvg.c
		gempak/source/nmaplib/pgen/nmap_pgprd.c, nmap_pgvgf.c, 
						nmap_pgdel.c
		gempak/source/driver/active/vg/vcirc.c, vfill.c, vfrnt.c,
				vhash.c, vline.c, vmark.c, vspln.c, vgcmn.h,
				vsymb.c, vtext.c, vtxsy.c, vwind.c
		gempak/include/proto_vg.h, proto_cgemlib.h, uscore.h
	NEW:	gempak/source/cgemlib/cvg/cvgwrite.c, cvgwritef.c
		gempak/source/driver/active/vg/hopen.f, hendd.f, hclosp.f,
						vopen.c, vendd.c, vclosp.c

018nn.	2/12/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

010ddd.	2/12/01	gempak/source/cgemlib/cgr/testcgr.c
		gempak/include/proto_cgemlib.h
	NEW:	gempak/source/cgemlib/cgr/cgrqsol.c

021zz.	2/12/01	gempak/source/nmaplib/pgen/nmap_pgvgf.c

007l.	2/12/01	gempak/source/driver/active/gf/xendd.c, xwrgif.c
		gempak/include/proto_xw.h
		gempak/help/device.hl2
	NEW:	gempak/source/driver/active/gf/xclosp.c, xopenw.c, xsdatt.c

021aaa.	2/15/01	gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pgline.c

018oo.	2/15/01	gempak/include/proto_nmaplib.h, proto_nxmlib.h
		gempak/source/programs/gui/nmap2/nmap_mmenuw.c, nmap_pgpalw.c
		gempak/source/nmaplib/pgen/nmap_pgfilw.c
		nprogs/nmap/source/nmap_pgpalw.c, nmap_mmenuw.c
	CSC:	gempak/source/nxmlib/NxmExit.c

021bbb.	2/15/01	gempak/source/nmaplib/pgen/nmap_pgdelpt.c, nmap_pgevt.c,
								nmap_pgmvcp.c
		gempak/source/programs/gui/nmap2/nmap_loop.c
		gempak/source/cgemlib/cvg/cvgrdsel.c
		gempak/include/pgprm.h

010eee.	2/15/01	gempak/source/cgemlib/ctb/ctbccrd.c

021ccc.	2/21/01	gempak/source/nmaplib/pgen/nmap_pgwatch.c, nmap_pgwlst.c
		gempak/include/proto_nmaplib.h

007m.	2/21/01	gempak/source/driver/active/vg/vinita.c

010fff.	2/21/01	gempak/source/cgemlib/clo/clofrom.c

021ddd.	2/21/01	gempak/source/nmaplib/pgen/nmap_pgpdel.c, nmap_pgutls.c
		gempak/include/pgprm.h, proto_nmaplib.h

021eee.	2/21/01	gempak/source/nmaplib/pgen/nmap_pgwatch.c

010ggg.	2/21/01	gempak/source/cgemlib/cvg/cvgoldstructs.h, cvgcrall.c, 
							cvgrdele.c, cvgdump.c
		gempak/include/proto_vg.h
	NEW:	gempak/source/cgemlib/cvg/cvgrdoldele.c, cvgoldswap.c

001p.	2/22/01	gempak/source/bridge/ru/rumlvl.f, rumsfc.f,
		gempak/source/gemlib/mr/mrmiss.f, mrpwnd.f
		gempak/source/gemlib/sn/snckua.f, sncmn.cmn, sncrua.f, snddat.f,
			snmerg.f, snqdat.f, snrprt.f, snwprt.f, testsn.f
		gempak/source/programs/dc/dcuair/dcudcd.f
		gempak/source/programs/sn/sncfil/sncfil.f
		gempak/source/programs/sn/snedit/snecpr.f, snecpt.f, snedit.f,
						snedtu.f, snewru.f
		gempak/source/programs/sn/snlist/snlist.f, snlpdt.f
		gempak/source/programs/sn/snmod/snmod.f, snodat.f
		gempak/help/dcuair.hlp, mrgdat.hl2, snefil.hl2, snparm.hl2,
								stndex.hl2
		gempak/txt/programs/snedit.txt, snlist.txt, snmod.txt

	CSC:	gempak/source/bridge/ru/rudcd2.f, rudecd.f, ruttaa.f, ruttcc.f
		gempak/source/gemlib/mr/mruadt.f, testmr.test	
		gempak/source/gemlib/sn/snmman.f, snmspm.f
		gempak/source/programs/sn/snedit/snep2s.f
		gempak/source/programs/sn/snlist/snlfil.f, snllev.f, snlwmn.f, 
									snlwsg.f
	NEW:	gempak/source/bridge/ru/rudupe.f, rummxw.f, rumtrp.f
		gempak/source/gemlib/mr/mrmanw.f
		gempak/source/gemlib/sn/snrstr.f, snwstr.f
		gempak/source/programs/sn/snlist/snlprt.f

010hhh.	2/21/01	gempak/source/cgemlib/cvg/cvgdump.c, cvgsvfhed.c, cvgcrall.c,
			cvgrdele.c, cvgrdoldele.c, cvginitelm.c, dumpvgf.c 
		gempak/source/cgemlib/cds/cdscirc.c, cdstrack.c, cdsfrnt.c,
							cdsline.c, cdsccf.c
		gempak/source/cgemlib/ces/testces.c, cesget.c, cesset.c
		gempak/source/driver/active/vg/vfrnt.c, vline.c, vspln.c, vfill.c
		gempak/source/nmaplib/pgen/nmap_pgconn.c, nmap_pgedit.c,
			nmap_pgevt.c, nmap_pgfrtw.c, nmap_pgggc.c, nmap_pgline.c,
			nmap_pgmdfy.c, nmap_pgnew.c, nmap_pgpdel.c,
			nmap_pgvgf.c, nmap_pgwatch.c, nmap_pgccfw.c
		gempak/include/vgstruct.h
		gempak/source/programs/util/vgfcvt/vgstructcvt.h

024a.	2/23/01	gempak/source/device/draw/iturb.f
		gempak/source/gemlib/df/dfbvsq.f
		gempak/source/gemlib/dm/dmopen.f, dmrflt.f, dmrlbl.f, dmwflt.f
		gempak/source/gemlib/dp/dpunmc.f
		gempak/source/gemlib/er/erinit.c
		gempak/source/gemlib/gd/gdwpgd.f
		gempak/source/gemlib/gg/ggsttl.f
		gempak/source/gemlib/lw/lwinpt.f
		gempak/source/gemlib/pc/pccmn.cmn
		gempak/source/gemlib/sf/sfwsdd.f
		gempak/source/gemlib/st/stnull.f
		gempak/source/gemlib/ti/tiform.f
		gempak/source/cgemlib/cvg/cvgdelet.c, cvgdeall.c, cvgrdele.c,
					cvgrdhdr.c, cvgcrall.c, cvgrdoldele.c,
					cvgundel.c, cvgwrite.c
		gempak/source/driver/active/tiff/ttiff.c
		gempak/source/gplt/utility/gdrmap.f
		gempak/source/programs/na/nagrib/nagrib.f
		gempak/source/programs/sf/sfmap/sfmplt.f
		gempak/source/bridge/rs/rshhde.f
		gempak/maps/programs/gsfssf.f, ssfgsf.f
		gempak/include/GEMPRM.PRM, gemprm.vms, gemprm.log, MCHPRM.Linux,\
					gemprm.h, pgcmn.h
		icons/turb/turb00.xbm, turb03.xbm


012i.	2/26/01	gempak/source/programs/gui/nalarm/nalarm.c
		gempak/source/programs/gui/nmap2/nmap_mbtnw.c
		nprogs/ntrans/source/menubar.c
		nprogs/ntl/source/appbtn.c
		nprogs/nwx/source/mapw.c
		nprogs/nsat/source/mmenuw.c

024b.	2/26/01	gempak/source/driver/active/xw/xgsdat.c
		gempak/source/nmaplib/pgen/nmap_pgsigw.c
		gempak/source/nxmlib/NxmMenuPulldown.c

024c.	2/26/01	gempak/source/bridge/dc/dccmn.h, dcexit.c, dcinit.c, dcsgnl.c,
									dcdlog.c
		gempak/source/programs/dc/dcuair/dcuair.c, dcuair_link
		gempak/source/programs/dc/dcnmos/dcnmos.c, dcnmos_link
		gempak/source/programs/dc/dcffg/dcffg.c, dcffg_link
		gempak/source/programs/dc/dcmmos/dcmmos.c, dcmmos_link
		gempak/source/programs/dc/dcwtch/dcwtch.c, dcwtch_link
		gempak/source/programs/dc/dcamos/dcamos.c, dcamos_link
		gempak/source/programs/dc/dcmetr/dcmetr.c, dcmetr_link
		gempak/source/programs/dc/dcscd/dcscd.c, dcscd_link
		gempak/source/programs/dc/dcmsfc/dcmsfc.c, dcmsfc_link
		gempak/source/programs/dc/dcacft/dcacft.c, dcacft_link
		gempak/source/programs/dc/dclsfc/dclsfc.c, dclsfc_link
		gempak/source/programs/dc/dcwarn/dcwarn.c, dcwarn_link
		gempak/source/programs/dc/dchrcn/dchrcn.c, dchrcn_link
		gempak/source/programs/dc/dcisig/dcisig.c, dcisig_link
		gempak/source/programs/dc/dcairm/dcairm.c, dcairm_link
		gempak/source/programs/dc/dcncon/dcncon.c, dcncon_link
		gempak/source/programs/dc/dcmosa/dcmosa.c, dcmosa_link
		gempak/source/programs/dc/dcmosm/dcmosm.c, dcmosm_link
		gempak/source/programs/dc/dcsvrl/dcsvrl.c, dcsvrl_link
		gempak/build/all_compile
		gempak/include/bridge.h
		.cshrc, .profile


019p.	2/26/01	NEW:	gempak/maps/dcvaac.ncp
			gempak/maps/ascii/ascdcvaac.ncp

016c.	2/26/01	nprogs/nwx/source/fosd.c
		gempak/include/gemprm.h

010iii.	2/27/01	gempak/source/gemlib/ti/tiform.f

021fff.	3/01/01	gempak/source/nmaplib/pgen/nmap_pgmodv.c

021ggg.	3/01/01	gempak/source/nmaplib/pgen/nmap_pgmdfy.c

001q.	3/02/01	gempak/source/bridge/ru/rumtrp.f, ruwind.f
		gempak/source/gemlib/mr/mrsigt.f
		gempak/source/gemlib/sn/snmerg.f
		gempak/source/programs/sn/snlist/snlpdt.f
		gempak/help/mrgdat.hl2

	CSC:	gempak/source/gemlib/mr/mruadt.f, testmr.test
	NEW:	gempak/source/gemlib/mr/mrtrop.f
		gempak/source/programs/sn/snlist/snlwtm.f

021hhh.	3/5/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

021iii.	3/5/01	gempak/source/nmaplib/pgen/nmap_pgevt.c, nmap_pgconn.c,
			nmap_pgmdfy.c, nmap_pgdelpt.c, nmap_pgpdel.c,
			nmap_pgdel.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c

010jjj.	3/6/01	gempak/source/cgemlib/ces/cesget.c,cesrtbl.c,cesset.c,testces.c
		gempak/source/nmaplib/pgen/nmap_pgfrtw.c, nmap_pggrpw.c,
						nmap_pgline.c, nmap_pgsymb.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/include/cescmn.h, proto_cgemlib.h, proto_nmaplib.h, 
								proto_vg.h
		
	NEW:	gempak/source/cgemlib/ces/cesgtgid.c, cesgtgnam.c, cesgtrtbl.c

010kkk.	3/6/01	gempak/source/cgemlib/crg/crgcmn.h, crgdeselect.c, crgrngpt.c,
			crgsetcir.c, crgsetltln.c, crgsetsym.c,
			crgsetwbx.c, crgsetwnd.c

007n.	3/7/01	gempak/source/driver/active/ps/pinita.c
		gempak/source/driver/active/xwp/xwp_compile
		gempak/source/driver/active/xw/xenanm.c, xgtpnt.c, xinita.c, 
					xloopc.c, xmfrmtg.c, xmloop.c, xstext.c
		gempak/include/xwcmn.h

	NEW:	gempak/include/xwpcmn.h, pscmn.h
		gempak/source/driver/active/xwp/pinita.c

012j.	3/7/01	gempak/source/programs/gui/nalarm/naltxt.c

011n.	3/7/01	gempak/source/gemlib/dg/dgmfil.f
		gempak/source/programs/gd/gdcntr/gdcntr.f
		gempak/source/programs/gd/gdwind/gdwind.f
		gempak/source/programs/gd/gdcross/gdcross.f
		gempak/source/programs/gd/gddiag/gddiag.f
		gempak/source/programs/gd/gdlist/gdlist.f
		gempak/source/programs/gd/gdmap/gdmap.f
		gempak/source/programs/gd/gdprof/gdprof.f
		gempak/source/programs/gd/gdstat/gdstat.f
		gempak/source/programs/gd/gdstream/gdstream.f
		gempak/source/programs/gd/gdthgt/gdthgt.f
		gempak/source/programs/gd/gdtser/gdtser.f
		gempak/source/programs/gd/gdgsfc/gdgsfc.f
		gempak/source/programs/gd/gdplot/gdplot.f
		gempak/source/programs/gd/gdcfil/gdcfil.f
		gempak/source/contrib/cpc/cpclist/cpclist.f
		gempak/help/gdoutf.hl2, gdfile.hl2

018pp.	3/8/01	gempak/source/programs/gui/nmap2/nmap_roamw.c

018qq.	3/8/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c,
			nmap_loop.c, nmap_tmln.c, proto_nmap2.h, nmap_data.h

010lll.	3/12/01	gempak/source/cgemlib/ces/testces.c
		gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pgfrtw.c,
				nmap_pgsymb.c, nmap_pgline.c, nmap_pgggc.c,
				nmap_pgnew.c, nmap_pgolk.c
		gempak/include/proto_nmaplib.h, proto_cgemlib.h, cescmn.h, 
									pgcmn.h
	NEW:	gempak/source/cgemlib/ces/cesgtggrps.c, cesgtglbls.c,
								cesgtgcolr.c

010mmm.	3/12/01	gempak/source/cgemlib/cds/cdstext.c

010nnn.	3/13/01	gempak/source/gemlib/cv/cvmdfy.c
		gempak/source/cgemlib/clo/cloddenc.c
		gempak/source/cgemlib/cvg/cvgcrall.c, cvgrdhdr.c, cvgwritef.c
		gempak/source/driver/active/gf/xendd.c
		gempak/source/driver/active/xw/xqcmps.c
		gempak/source/nmaplib/pgen/nmap_pgccfp.c, nmap_pgsigw.c
		gempak/source/nxmlib/NxmLoopPanel.c
		gempak/source/programs/gui/nmap2/nmap_cldhgtw.c, nmap_vgf.c
		nprogs/nfax/source/nfax.c, vscrollcb.c
		nprogs/nmap/source/nmap_cldhgtw.c

010ooo.	3/13/01	gempak/source/gemlib/tb/tbastn.f

010ppp.	3/14/01	gempak/source/cgemlib/ces/cesgtgid.c, cesgtgnam.c, testces.c

010qqq. 3/14/01	gempak/source/programs/gui/nmap2/nmap_gtbl.h, nmap_gtbl.c
		gempak/source/programs/gd/grphgd/ggdriv.f
		gempak/source/nmaplib/ngd/testngd.c, ngdgtim.c, ngdtlst.f,
		gempak/source/nmaplib/nim/nimflnm.f, nimgfln.f, nimdspl.f, 
								nimtlst.f
		gempak/source/nmaplib/nsf/nsftlst.f
		gempak/source/nmaplib/nsn/nsntlst.f
		gempak/source/cgemlib/ctb/testctb.c, ctbdtdump.c, ctbdtcat.c,
			ctbdtget.c, ctbdtpath.c, ctbdttime.c, ctbdttmpl.c
		gempak/source/gemlib/dg/dgmfil.f
		gempak/source/gemlib/fl/fltmpl.f, flmfil.f, flmfls.f, testfl.f
		gempak/source/gemlib/gd/testgd.f
		gempak/source/gemlib/gg/ggwtch.f, ggwarn.f, gghrcn.f, ggisig.f,
			ggltng.f, ggatcf.f, ggairm.f, ggncon.f
		gempak/source/gemlib/st/testst.f
		gempak/include/gemprm.h, proto_nmaplib.h, uscore.h
		gempak/error/ngd.err

	NEW:	gempak/nts/nmap/restore/volcano/volcash_comp, volcash_high_lvl,
						volcash_low_lvl, volcash_mid_lvl
		gempak/source/nmaplib/ngd/ngdgnms.c, ngdnlst.f
		gempak/source/gemlib/st/stsort.f


021jjj.	3/14/01	gempak/source/nmaplib/pgen/nmap_pgwbxw.c, nmap_pgnew.c

001r.	3/15/01	gempak/source/bridge/ru/rugrpt.f
		gempak/source/programs/dc/dcuair/dcudcd.f
		gempak/help/dcuair.hlp
	CSC:	gempak/source/bridge/ru/rudcd2.f, rudecd.f, rushdr.f, rustms.f, 
						rutmst.f, ruttaa.f, ruttbb.f 
	NEW:	gempak/source/bridge/ru/rudrop.f, rudrp1.f

021kkk.	3/15/01	gempak/source/cgemlib/ces/cesget.c, cesgtrtbl.c, cesgtglbls.c,
							cesset.c, cesgtgcolr.c
		gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pgfrtw.c,
						nmap_pgsymb.c, nmap_pgline.c
		gemapk/include/cescmn.h, pgprm.h

010rrr.	3/16/01	gempak/source/cgemlib/ces/cesgtrtbl.c

018rr.	3/19/01	gempak/source/programs/gui/nmap2/nmap_data.h

019q.	3/20/01	gempak/maps/*znus.nws
		gempak/maps/ascii/asc*znus.nws

018ss.	3/21/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_roamw.c,
								proto_nmap2.h

011o.	3/22/01	gempak/source/programs/gd/gdplot/gdplot.f
		gempak/source/contrib/cpc/cpclist/cpclist.f

021lll.	3/23/01	gempak/source/cgemlib/ces/cesgtrtbl.c, testces.c
		gempak/source/nmaplib/pgen/nmap_pggrpw.c, nmap_pglabel.c,
				nmap_pgline.c, nmap_pgfrtw.c, nmap_pgsymb.c,
				nmap_pgedit.c, nmap_pgtxt.c, nmap_pgwbxw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/include/cescmn.h
		gempak/include/proto_nmaplib.h
		gempak/include/proto_cgemlib.h
		gempak/include/gemprm.h
		gempak/tables/pgen/grptyp.tbl
	NEW:	gempak/source/cgemlib/ces/cesgtginfo.c

020d.	3/26/01	gempak/source/programs/util/sfcsplt/sfcsplt.c

020e.	3/26/01	gempak/source/programs/util/avnbul/avnbul.c, bavcb.c, bavline.c,
						bavsplin.c, bavturb.c, bavcntr.c

007o.	3/26/01	gempak/source/driver/active/gf/xsdatt.c

008d.	3/26/01	help/nmap/WhatsNew.hlp
	NEW:	versions/release_notes/v5.6/README_nawips5.6.c

021mmm.	3/27/01	gempak/source/nmaplib/pgen/nmap_pgedit.c, nmap_pgline.c,
						nmap_pgnew.c, nmap_pgvgf.c
		gempak/include/proto_nmaplib.h

=============================  End of Patch 5.6.c  =============================

010sss.	4/2/01	gempak/source/gemlib/ss/ssvers.f

007p.	4/2/01	gempak/source/driver/active/vg/vsdatt.c

021nnn.	4/2/01	gempak/source/nmaplib/pgen/nmap_pgcirc.c, nmap_pgedit.c,
					nmap_pgfrtw.c, nmap_pgline.c,
					nmap_pgnew.c, nmap_pgsymb.c,
					nmap_pgvgf.c

021ooo.	4/3/01	gempak/source/nmaplib/pgen/nmap_pgolk.c

021ppp.	4/3/01	gempak/source/nmaplib/pgen/nmap_pgedit.c

021qqq.	4/3/01	gempak/source/nmaplib/pgen/nmap_pgxrain.c

008e.	4/3/01	versions/release_notes/v5.6/README_nawips5.6.c
		help/nmap/WhatsNew.hlp

=============================  End of Patch 5.6.c.1 =============================

010ttt.	4/9/01	gempak/source/gemlib/ss/ssvers.f

021rrr.	4/9/01	gempak/source/device/plot/dfrnt.f
		gempak/source/testprog/plotsyms.f
		gempak/source/nmaplib/pgen/nmap_pgfrtw.c, nmap_pgobj.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		icons/nmap/trptfnt.xbm
		gempak/include/drwids.h

018tt.	4/9/01	gempak/source/nmaplib/nsn/nsndspl.f

001s.	4/9/01	gempak/source/bridge/ww/wwcrnr.c
		nprogs/nwx/source/wwcrnr.c

007q.	4/9/01	gempak/source/driver/active/rbk/aegrp.c, aclosp.c

012k.	4/9/01	gempak/source/nxmlib/NuiColorInit.c, NxmColorEdit.c, NxmColrP.c,
		      NxmErr.c, NxmLineA.c, NxmPrt.c, NxmBusy.c, NxmColorInit.c,
		      NxmGeneric.c, NxmLoopPanel.c, NxmVers.c, NxmClrW.c,
		      NxmColorSliders.c, NxmCursor.c, NxmHelp.c, NxmMarkA.c,
		      NxmWarn.c, NxmColorBar.c, NxmColorTable.c, NxmDwell.c,
		      NxmInitialize.c, NxmPrompt.c

018uu.	4/9/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c,
			nmap_loop.c, nmap_tmln.c, nmap_roamw.c, nmap_data.h,
			proto_nmap2.h

016d.	4/10/01	nprogs/nwx/source/dir.c, draw.c, dslw.c, gui.h, guid.c, mapw.c, 
			nwx.c, qpf.c, srchb.c, srcho.c, srchw.c, sstruct.c, 
			txtw.c

014c.	4/10/01	nprogs/ntrans/source/commands.c, drawingw.c, file.c, models.c,
			gp_callbks.c, grouplist.c, legend.c, man_group.c,
			 menubar.c, ntrans.c, ntrans_spool.c, process_meta.c,
			 select_frame.c, select_group.c

001t.	4/10/01	gempak/build/bridge_compile

015e.	4/10/01	nprogs/nsat/source/*.c

012l.	4/10/01	nprogs/ntl/source/*.c

010uuu.	4/10/01	gempak/include/proto_cgemlib.h
		gempak/build/cgemlib_compile, cgemlib_link

022b.	4/10/01	nprogs/nfax/source/cpgdmpct.c, cpggetfile.c, cpggetfname.c,
			cpggetsix.c, cpgprint.c, cpgprse.c, cpgrindex.c,
			cpgsetbits.c, cpgshoct.c, cpgsixrd.c, vfindload.c,
			vfonts.c, vmisccb.c, vrdbmap.c, vwheelcb.c

006g.	4/10/01	gempak/source/gplt/main/gplt.f
		gempak/source/device/main/device.f
		gempak/source/testprog/atest.f
		gempak/source/programs/gp/gptext/gptext.f
		gempak/source/programs/gui/nmap2/nmap_dsp.c
		nprogs/nmap/source/nmap_dsp.c
		gempak/include/proto_gemlib.h

	CSC:	gempak/source/appl/plot/glogo.f
		gempak/source/gplt/plot/glogo.f	
		gempak/source/device/plot/dlogo.f
		gempak/source/gplt/device/plot/dlogo.f

	NEW:	gempak/source/device/draw/inoaa.f
		gempak/source/gplt/device/plot/inoaa.f


018vv.	4/10/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_roamw.c,
								proto_nmap2.h

021sss.	4/10/01	gempak/source/nmaplib/pgen/nmap_pgfilw.c

018ww.	4/10/01	gempak/source/driver/active/xw/xmloop.c, xsroam.c, xwgui.h
		gempak/source/programs/gui/nmap2/nmap_auto.c, nmap_dsp.c,
								nmap_mbotw.c
		nprogs/nmap/source/nmap_dsp.c

010vvv.	4/11/01	gempak/source/cgemlib/clo/clocmn.h, cloinit.c, testclo.c
		gempak/include/proto_cgemlib.h, proto_gemlib.h, uscore.h
	NEW:	gempak/source/cgemlib/clo/clobgnext.c, clobofile.c, clobrdrec.c,
						clobsarea.c, clobstype.c

021ttt.	4/11/01	nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c

001u.	4/12/01	gempak/source/programs/dc/dcacft/dcacft.c
		gempak/source/programs/dc/dcairm/dcairm.c
		gempak/source/programs/dc/dcamos/dcamos.c
		gempak/source/programs/dc/dcffg/dcffg.c
		gempak/source/programs/dc/dchrcn/dchrcn.c
		gempak/source/programs/dc/dcisig/dcisig.c
		gempak/source/programs/dc/dclsfc/dclsfc.c
		gempak/source/programs/dc/dcmetr/dcmetr.c
		gempak/source/programs/dc/dcmmos/dcmmos.c
		gempak/source/programs/dc/dcmosa/dcmosa.c
		gempak/source/programs/dc/dcmosm/dcmosm.c
		gempak/source/programs/dc/dcmsfc/dcmsfc.c
		gempak/source/programs/dc/dcncon/dcncon.c
		gempak/source/programs/dc/dcnmos/dcnmos.c
		gempak/source/programs/dc/dcscd/dcscd.c
		gempak/source/programs/dc/dcsvrl/dcsvrl.c
		gempak/source/programs/dc/dcuair/dcuair.c
		gempak/source/programs/dc/dcwarn/dcwarn.c
		gempak/source/programs/dc/dcwtch/dcwtch.c

021uuu.	4/12/01	nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c

020f.	4/12/01	NEW: gempak/utilities/bounds/vgftobnd.c, vgftobnd_link
		     gempak/data/vgf/locowobnds.vgf

007r.	4/12/01	gempak/source/device/draw/inoaa.f
		gempak/source/device/plot/dlogo.f
		gempak/source/programs/gp/gptext/gptext.f
		gempak/txt/programs/gptext.txt
		gempak/help/txtfil.hl2

	CSC:	gempak/source/driver/active/gn/hlogo.f
	NEW:	gempak/source/device/draw/inws.f

010www.	4/13/01	gempak/source/gemlib/na/narhdr.f

018xx.	4/13/01	gempak/source/nmaplib/ngd/ngddspl.f

021vvv.	4/13/01	gempak/source/nmaplib/pgen/nmap_pgwlst.c

018yy.	4/13/01	gempak/source/programs/gui/nmap2/nmap_data.h, nmap_dataw.c

021www.	4/16/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

010xxx.	4/17/01	gempak/include/uscore.h

012m.	4/18/01	nprogs/ncolor/source/ncolor.c

001v.	4/18/01 gempak/source/bridge/ma/macmn.cmn, mabtyp.f, madcod.f,
			magrpt.f, maifpt.f, maifsp.f, mainit.f, maintf.f,
			mastbl.f, mawgem.f
		gempak/source/gemlib/st/strpsl.f
		gempak/source/programs/dc/dcmsfc/dcmsfc.c
		gempak/error/ma.err
		gempak/help/dcmsfc.hlp

	NEW:	gempak/source/bridge/ma/macg*.f, mafind.f

020g.	4/18/01	gempak/utilities/bounds/vgftobnd.c
		gempak/data/vgf/greatlakesbnds.vgf

021xxx.	4/18/01	gempak/source/nmaplib/pgen/nmap_pgsigw.c

021yyy.	4/18/01	gempak/include/pgprm.h

018zz.	4/19/01	nprogs/nmap/source/*.c

018aaa.	4/20/01	gempak/source/programs/gui/nmap2/nmap_dsp.c, nmap_dataw.c,
								proto_nmap2.h

001w.	4/20/01	gempak/source/bridge/sv/svdcod.f
	CSC:	gempak/source/bridge/sv/svghdr.f, svout.f

012n.	4/20/01	nprogs/busy/source/busy.c

018bbb.	4/20/01	nprogs/nmap/source/nmap.c, nmap_loopw.c, proto_nmap.h
		gempak/source/programs/gui/nmap2/nmap.c, nmap_loopw.c, 
								proto_nmap2.h
		resource/Nmap

010yyy.	4/20/01	gempak/source/cgemlib/clo/clobstype.c

010zzz.	4/20/01	gempak/source/cgemlib/cst/cstwrap.c

006h.	4/20/01	gempak/source/gplt/main/gplt.f
		gempak/source/testprog/atest.f
		gempak/include/FUNCCODE.PRM
		gempak/build/gplt_link
	NEW:	gempak/source/appl/utility/gflbnd.f
		gempak/source/gplt/utility/gflbnd.f

021zzz.	4/23/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

010a1a.	4/23/01	gempak/source/cgemlib/clo/clobgnext.c   clobstype.c   testclo.c
		gempak/source/gplt/utility/gflbnd.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/parm/gpmap.prm
	CSC:	gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/source/gemlib/gg/ggbnd.f, ggfbnd.f
		gempak/help/bnd.hl1, bnd.hl2

010a1b.	4/25/01	gempak/source/gemlib/gg/ggwarn.f

006i.	4/25/01	gempak/source/gplt/utility/gflbnd.f
		gempak/source/gemlib/gg/ggbnd.f
		gempak/data/vgf/locowobnds.vgf
		gempak/error/gg.err
	NEW:	gempak/utilities/bounds/README.maptobnd

018ccc.	4/25/01	gempak/source/programs/gui/nmap2/nmap_data.h

018ddd.	4/25/01	gempak/source/programs/gui/nmap2/nmap_msc.c

018eee.	4/25/01	gempak/source/programs/gui/nmap2/nmap_logo.c, nmap_dsp.c,
			nmap_mmenuw.c, nmap_roamw.c, proto_nmap2.h, nmapprm.h
		gempak/include/gemprm.h

	
018fff.	4/26/01	gempak/source/programs/gui/nmap2/nmap.c, nmap_roamw.c,
								proto_nmap2.h
		nprogs/nmap/source/nmap.c, nmap_roamw.c, proto_nmap.h
		resource/Nmap

014d.	4/26/01	nprogs/ntrans/source/ntrans_spool.c, models.c

018ggg.	4/26/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

021a1a.	4/26/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

010a1c.	4/26/01	gempak/source/gemlib/dg/dgchck.f, dgdriv.f
		gempak/help/gparm.hl2
	NEW:	gempak/source/gemlib/df/dfbeta.f
		gempak/source/gemlib/dv/dvdivt.f

016e.	4/26/01	nprogs/nwx/source/dttm.c, nwx.c, srchb.c, srcho.c, srchw.c,
						gui.h, interface.h

007s.	4/26/01	gempak/source/driver/active/gn/crnexz.c

019r.	4/27/01	gempak/data/vgf/locowobnds.vgf

010a1d.	4/27/01	gempak/source/gemlib/gg/ggairm.f, gghrcn.f, ggisig.f,
						ggncon.f, ggwarn.f, ggwtch.f

016f.	4/27/01	nprogs/nwx/source/srchw.c

018hhh.	4/30/01	nprogs/nmap/source/nmap_dsp.c
		gempak/source/nmaplib/pgen/nmap_pgfilw.c

018iii.	4/30/01	nprogs/nmap/source/nmap.c, nmap_pgpalw.c, proto_nmap.h
		gempak/source/programs/gui/nmap2/nmap.c, nmap_pgpalw.c,
								proto_nmap2.h
		gempak/source/nmaplib/pgen/nmap_pgundo.c
		resource/Nmap
		gempak/include/proto_nmaplib.h

021a1b.	4/30/01	gempak/source/nmaplib/pgen/*.c

021a1c.	5/1/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

019s.	5/1/01	gempak/maps/dcvaac.ncp
		gempak/maps/ascii/ascdcvaac.ncp

010a1e.	5/1/01	gempak/source/gemlib/im/imgpix.f
		gempak/source/gemlib/lc/testlc.f
		gempak/source/gemlib/ps/psustb.f
		gempak/source/gemlib/sn/snghgt.f
	CSC:	gempak/source/gemlib/lc/lcdist.f

010a1f.	5/1/01	gempak/include/gemprm.h
		gempak/source/cgemlib/clo/clofrom.c

021a1d.	5/1/01	gempak/source/nmaplib/pgen/nmap_pgfilw.c

010a1g.	5/1/01	gempak/source/cgemlib/cds/cdsccf.c

018jjj.	5/1/01	nprogs/nmap/source/nmap.c, nmap_mbotw.c, proto_nmap.h
		gempak/source/programs/gui/nmap2/nmap.c, nmap_mbotw.c,
								proto_nmap2.h
		resource/Nmap

010a1h.	5/1/01	gempak/source/gemlib/gr/grmttl.f, grtitl.f
		gempak/help/title.hl2

012o.	5/2/01	nprogs/busy/source/busy.c

018kkk.	5/2/01	gempak/source/nmaplib/nmp/nmpdspl.f, nmpinit.c, nmprestormap.c, 
			nmpsetmap.c, nmpsovlattr.c, nmpsvmap.c, nmpcmn.h,
			testnmp.c
		gempak/source/programs/gui/nmap2/nmap.c, nmap_auto.c,
			nmap_cldhgtw.c, nmap_dataw.c, nmap_dsp.c, nmap_image.c,
			nmap_loop.c, nmap_mapw.c, nmap_mbtnw.c, nmap_mpcstw.c,
			nmap_msc.c, nmap_obs.c, nmap_zoomw.c
		gempak/include/gemprm.h, nmpdef.h
		gempak/error/nmp.err
	CSC:	gempak/source/nmaplib/nmp/nmpgmapattr.c, nmpgovlattr.c,
			nmpsmapattr.c
	NEW:	gempak/source/nmaplib/nmp/nmpgltln.c, nmpgmapstr.c, nmpmkstn.c,
			nmpplot.c, nmpsetmapstr.c, nmpsimf.c, nmpsovlflg.c,
			nmpsproj.c

018lll.	5/4/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_mapw.c,
					nmap_tmln.c, proto_nmap2.h
		gempak/source/nmaplib/nmp/testnmp.c
		gempak/include/proto_nmaplib.h

011p.	5/4/01	gempak/source/programs/na/nagrib/naginp.f, nagrib.f
		gempak/source/gemlib/na/narhdr.f
		gempak/help/pdsext.hl1, pdsext.hl2
		gempak/nts/gemglb.nts
		gempak/parm/nagrib.prm
		gempak/txt/programs/nagrib.txt

018mmm.	5/7/01	nprogs/nmap/source/nmap_mmenuw.c, nmap_dsp.c, nmap_logo.c,
					nmapprm.h, proto_nmap.h
		gempak/source/programs/gui/nmap2/nmap_mmenuw.c, nmap_dsp.c,
					nmap_logo.c, proto_nmap2.h
		gempak/source/nxmlib/NxmMenuPulldown.c
		gempak/include/gemprm.h

021a1e.	5/7/01	nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c

021a1f.	5/7/01	gempak/source/nmaplib/pgen/nmap_pgsigw.c

018nnn.	5/8/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_loop.c,
			nmap_mapw.c, nmap_mbtnw.c, nmap_mpcstw.c
		gempak/source/nmaplib/nmp/nmpinit.c, testnmp.c, nmpcmn.h
		gempak/include/proto_nmaplib.h
	NEW:	gempak/source/nmaplib/nmp/nmpsimmap.c, nmprstrproj.c

018ooo.	5/8/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, proto_nmap2.h

018ppp.	5/8/01	nprogs/nmap/source/nmap_roamw.c, proto_nmap.h
		gempak/source/programs/gui/nmap2/nmap_roamw.c, proto_nmap2.h
		resource/Nmap

021a1g.	5/8/01	gempak/source/nmaplib/pgen/nmap_pgofmt.c, nmap_pgprd.c, 
								nmap_pgsfp.c

021a1h.	5/8/01	gempak/source/nmaplib/pgen/nmap_pgevt.c, nmap_pgmvcp.c
		gempak/include/proto_vg.h
	CSC:	gempak/source/cgemlib/cvg/cvgrdsel.c

010a1i.	5/10/01	gempak/source/gemlib/gg/ggatcf.f, ggatrp.f, ggmisc.f, testgg.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/source/nmaplib/nms/nmsdspl.f
		gempak/help/atcf.hl2
		gempak/parm/gpmap.prm
		gempak/nts/gemglb.nts
	CSC:	gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/source/gemlib/gg/ggnarp.f, ggnatc.f
		gempak/help/atco.hl1, atco.hl2

009e.	5/10/01	gempak/nts/nmap/restore/modl/nww3/sig_wave_gridded_meters_only,
			sig_wave_gridded_feet, sig_wave_gridded_feet_only, 
			sig_wave_gridded_feet_dir, sig_wave_gridded_mslp_feet,
			sig_wave_gridded_meters, sig_wave_gridded_mslp_meters, 
			sig_wave_gridded_meters_dir, 
			sig_wave_gridded_mslp_feet_nw, 
			sig_wave_gridded_mslp_meters_nw 

018qqq.	5/10/01	gempak/source/programs/gui/nmap2/nmap_auto.c, nmap_dsp.c

006j.	5/10/01	gempak/source/gplt/contour/cccrss.f, cclip.f

010a1j.	5/10/01	gempak/source/gemlib/gg/ggdmap.f, ggdltn.f

021a1i.	5/10/01	gempak/source/nmaplib/pgen/nmap_pgsfp.c

021a1j.	5/10/01	gempak/source/nmaplib/pgen/nmap_pgline.c

012p.	5/10/01	gempak/source/nxmlib/*.c
		gempak/source/bridge/dc/dcb.c
		gempak/source/driver/active/xw/xmloop.c, xsatim.c
		gempak/include/geminc.h

021a1k.	5/10/01	gempak/source/nmaplib/pgen/nmap_pgwlst.c

021a1l.	5/10/01	gempak/source/nmaplib/pgen/nmap_pgwatch.c, nmap_pgwfmt.c

019t.	5/10/01	NEW:	gempak/maps/mwo.ncp
			gempak/maps/ascii/ascmwo.ncp

021a1m.	5/14/01	gempak/source/nxmlib/NxmPrt.c
		gempak/source/nmaplib/pgen/nmap_pgtrk.c, nmap_pgwsmw.c

018rrr.	5/14/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

021a1n.	5/14/01	gempak/source/nmaplib/pgen/nmap_pgprd.c, nmap_pgolk.c
		gempak/include/proto_nmaplib.h


021a1o.	5/14/01	gempak/source/gemlib/gg/ggnarp.f
		gempak/source/nmaplib/pgen/nmap_pgprd.c, nmap_pgtrk.c

010a1k.	5/14/01	gempak/source/gemlib/dp/dpterm.f
		gempak/source/gemlib/in/inprmf.f

010a1l.	5/14/01	gempak/source/gemlib/gg/gghrcn.f, ggisig.f, testgg.f
	NEW:	gempak/source/gemlib/gg/ggarc.f

021a1p.	5/14/01	gempak/source/nmaplib/pgen/nmap_pgsfp.c

020h.	5/15/01	gempak/source/programs/util/avnbul/*.c

021a1q.	5/15/01	gempak/source/nmaplib/pgen/nmap_pgolk.c, nmap_pgprd.c

011q.	5/15/01	gempak/source/programs/sf/sfgram/sfgram.f, sfxdat.f, sfxdta.f
		gempak/source/gemlib/sf/sfuare.f, testsf.f, testsf_link
		gempak/source/gemlib/ti/testti.f
		gempak/error/sf.err, sfgram.err
		gempak/help/sffile.hl2

	NEW:	gempak/source/gemlib/sf/sftlst.f
		gempak/source/gemlib/ti/tirang.f

018sss.	5/16/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c,
								nmap_loop.c

010a1m.	5/16/01	gempak/source/gemlib/gg/testgg.f
		gempak/help/title.hl2

018ttt.	5/16/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

018uuu.	5/16/01	gempak/source/programs/gui/nmap2/nmap_auto.c

021a1r.	5/16/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c

010a1n.	5/16/01	gempak/source/cgemlib/css/aix4/scandir.c
		gempak/source/cgemlib/css/linux2/scandir.c
		gempak/source/cgemlib/css/sunos5/scandir.c

010a1o.	5/16/01	gempak/source/gemlib/fl/fltbop.f, testfl.f
		gempak/source/gemlib/in/inprmf.f
		gempak/source/cgemlib/cfl/cfltbop.c, testcfl.c
		gempak/source/nmaplib/ngd/ngddspl.f
		gempak/include/proto_cgemlib.h
	NEW:	gempak/source/gemlib/fl/fltinq.f
		gempak/source/cgemlib/cfl/cfltinq.c

010a1p.	5/16/01	gempak/source/gemlib/gg/testgg.f

021a1s.	5/16/01	nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		gempak/source/nmaplib/pgen/nmap_pggprw.c
		gempak/include/proto_nmaplib.h, drwids.h
	NEW:	icons/nmap/chnggrps.xbm

010a1q.	5/17/01	gempak/source/gemlib/gg/ggwtch.f

001x.	5/17/01	gempak/source/bridge/mt/mtdcod.f

011r.	5/17/01 NEW:gempak/source/gemlib/gh/* (NEW Library)
		    gempak/source/programs/gp/gptpc/* (NEW Program)
		    gempak/help/strmid.hl1, strmid.hl2
		    gempak/error/gptpc.err
		    gempak/parm/gptpc.prm
		    gempak/txt/programs/gptpc.txt

		gempak/build/gemlib_compile, gp_compile, gp_link
		gempak/nts/gemblb.nts
		gempak/utilities/pdfbld/gp_pdfbld
		gempak/utilities/hlpbld/gp_hlpbld

018vvv.	5/17/01	gempak/source/programs/gui/nmap2/nmap_auto.c,
		nmap_dataw.c, nmap_mbtnw.c

011s.	5/17/01	gempak/source/programs/gp/gptpc/gptpc.f

011t.	5/17/01	gempak/source/programs/gd/gdplot2/gdptms.f

018www.	5/17/01	gempak/source/programs/gui/nmap2/nmap_auto.c, 
		nmap_dataw.c

018xxx. 5/18/01 gempak/source/programs/gui/nmap2/nmap_mapw.c
		gempak/source/nmaplib/nmp/nmpsetmap.c

018yyy.	5/18/01	gempak/source/nmaplib/nmp/nmpsetmap.c

018zzz.	5/22/01	gempak/source/nmaplib/nmp/nmpplot.c

008f.	5/22/01	help/nmap/HotKeys.hlp, WhatsNew.hlp
		versions/release_notes/v5.6/README_nawips5.6.d

008g.	5/23/01 help/nmap/WhatsNew.hlp
		versions/release_notes/v5.6/README_nawips5.6.d

=============================  End of Patch 5.6.d  =============================
010a1r.	5/30/01	gempak/source/gemlib/ss/ssvers.f

018a1a.	5/30/01	gempak/source/programs/gui/nmap2/nmap.c, nmap_mcanvw.c
		gempak/source/nxmlib/NxmBusy.c

018a1b.	5/30/01	gempak/source/programs/gui/nmap2/nmap_mapw.c
		gempak/source/driver/active/xw/xpxm2win.c

018a1c.	5/30/01	gempak/source/nmaplib/nmp/nmpsetmap.c

018a1d.	5/30/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

018a1e.	5/30/01	nprogs/nmap/source/nmap_dttmw.c, nmap_seekw.c,
		nmap_mpcstw.c, nmap_cldhgtw.c, nmap_stnmw.c,
		nmap_wwnw.c
		gempak/source/programs/gui/nmap2/nmap_dttmw.c,
		nmap_mpcstw.c, nmap_seekw.c, nmap_stnmw.c,
		nmap_cldhgtw.c 
		gempak/source/nmaplib/pgen/nmap_pgdelobj.c, nmap_pgsymb.c,
		nmap_pgtrkw.c, nmap_pgwlst.c

010a1s.	5/30/01 gempak/include/proto_vf.h

		gempak/source/gemlib/vf/testvf.c
		gempak/source/gemlib/vf/vfarea.c
		gempak/source/gemlib/vf/vfcnsaw.c
		gempak/source/gemlib/vf/vfeftm.c
		gempak/source/gemlib/vf/vfgname.c
		gempak/source/gemlib/vf/vfgtod.c
		gempak/source/gemlib/vf/vfrdrp.c
		gempak/source/gemlib/vf/vfread.c
		gempak/source/gemlib/vf/vfsort.c
		gempak/source/gemlib/vf/vfstate.c
		gempak/source/gemlib/vf/vfwawn.c
		gempak/source/gemlib/vf/vfwoui.c
		gempak/source/gemlib/vf/vfwpwn.c
		gempak/source/gemlib/vf/vfwsel.c
		gempak/source/gemlib/vf/vfwsev.c
		gempak/source/gemlib/vf/vfwwcl.c
		gempak/source/gemlib/vf/vfwwcp.c

001y.	5/30/01 gempak/source/bridge/ru/rudcd2.f, rudecd.f,
		rudrop.f, rudupe.f, rushdr.f, rustms.f, rutmst.f
		gempak/source/gemlib/sn/sncrua.f
		gempak/source/programs/dc/dcuair/dcudcd.f 

018a1f.	5/30/01	NEW: gempak/source/nmaplib/nmp/nmprestore.c,
		     nmpsave.c

		gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_mapw.c	
		gempak/source/nmaplib/nmp/nmpinit.c, testnmp.c

		gempak/include/proto_nmaplib.h

012q.	5/30/01	nprogs/ntrans/source/drawingw.c, file.c, gp_callbks.c,
		legend.c, multipanel.c, select_frame.c, select_group.c,
		dsply.c, local.c, man_group.c
		nprogs/nwx/source/dslw.c
		nprogs/nfax/source/vtitle.c, nfax.c
		gempak/source/programs/gui/nalarm/naltxt.c

010a1t.	5/31/01	gempak/source/gemlib/gg/ggnarp.f

006k.	5/31/01	gempak/source/gplt/plot/gline.f

010a1u.	5/31/01	NEW:gempak/source/cgemlib/cst/cstgtag.c

		gempak/source/cgemlib/cst/testcst.c
		gempak/include/proto_cgemlib.h

018a1g.	6/04/01	gempak/source/programs/gui/nmap2/nmap_mapw.c
		nprogs/nmap/source/nmap_mapw.c

		NEW: resource/Nmap_1600x1200

		resource/Nmap

018a1h.	6/05/01	gempak/source/programs/gui/nmap2/nmap_dataw.c,
		nmap_loop.c, nmap_mbotw.c, nmap_mapw.c

		gempak/source/programs/gui/nmap2/proto_nmap2.h,
		proto_data.h

006l.	6/05/01	gempak/source/gplt/plot/gline.f

018a1i.	6/05/01	gempak/source/programs/gui/nmap2/nmap_loop.c, 
		nmap_loopw.c

010a1v.	6/05/01	gempak/source/cgemlib/cst/cstgtag.c

		gempak/include/gemprm.h
		gempak/error/cst.err

021a1t.	6/06/01	gempak/source/nmaplib/pgen/nmap_pgtrk.c

018a1j.	6/06/01	gempak/source/gui/nmap2/nmap_mapw.c

018a1k. 6/06/01	gempak/source/gui/nmap2/nmap_auto.c, nmap_dataw.c,
		nmap_loopw.c
		gempak/source/gui/nmap2/proto_nmap2.h

011u.	6/07/01 gempak/source/gemlib/gh/ghbkin.f 
		gempak/source/gemlib/gh/ghbkrc.f 
	        gempak/source/gemlib/gh/ghbkus.f                
		gempak/source/gemlib/gh/ghkgar.f                
		gempak/source/gemlib/gh/ghkgat.f                
		gempak/source/gemlib/gh/ghkgfl.f                
		gempak/source/gemlib/gh/ghkgip.f                
		gempak/source/gemlib/gh/ghkglb.f                
		gempak/source/gemlib/gh/ghkgph.f                
		gempak/source/gemlib/gh/ghnopb.f                
		gempak/source/gemlib/gh/ghrdad.f                
		gempak/source/gemlib/gh/ghrdbd.f                
		gempak/source/gemlib/gh/ghrdfv.f                
		gempak/source/gemlib/gh/ghrdhd.f                
		gempak/source/gemlib/gh/ghrdtx.f                
		gempak/source/gemlib/gh/ghsplb.f                
		gempak/source/gemlib/gh/ghsprb.f                
		gempak/source/gemlib/gh/ghsprl.f                
		gempak/source/gemlib/gh/ghswth.f                
		gempak/source/gemlib/gh/ghwipl.f                
		gempak/source/gemlib/gh/ghwrel.f                
		gempak/source/gemlib/gh/ghwtbl.f

		NEW: gempak/source/gemlib/gh/ghrdds.f
		     gempak/source/programs/gp/gptpc/gppinp.f        
		     gempak/source/programs/gp/gptpc/gppopt.f     

		gempak/source/programs/gp/gptpc/gptpc.f

		gempak/error/gptpc.err

018a1l. 6/07/01 gempak/source/programs/gui/nmap2/nmap_loopw.c

010a1w. 6/07/01 gempak/source/gemlib/ss/ssvers.f

021a1u. 6/11/01	gempak/source/nmaplib/pgen/nmap_pgwlst.c
		gempak/source/programs/gui/nmap2/nmap_stnmw.c
		nprogs/nmap/source/nmap_stnmw.c

008h.	6/12/01	versions/release_notes/v5.6/README_nawips5.6.d.1

021a1v.	6/13/01 gempak/source/nmaplib/pgen/nmap_pgfilw.c

021a1w.	6/20/01	gempak/source/nmaplib/pgen/nmap_pgdelobj.c
		nprogs/nmap/source/nmap_wwnw.c
		nprogs/ntrans/source/select_frame.c
		
012r.	6/26/01	gempak/source/programs/gui/nalarm/nalarm.c, naltxt.c

=============================  End of Patch 5.6.d.1  =============================

010a1x.	6/25/01	gempak/source/gemlib/ss/ssvers.f

011v.	6/25/01	gempak/source/programs/gd/gdcntr/gdnhlo.f
		gempak/source/programs/gd/gdplot/gdbhlo.f
		gempak/source/programs/gd/gdplot2/gdbhlo.f
		gempak/source/gemlib/in/inhilo.f
		gempak/help/hilo.hl2

001z.	6/25/01	gempak/source/bridge/ma/mabtyp.f, madcod.f

018a1m.	6/25/01	gempak/source/programs/gui/nmap2/nmap_mapw.c, nmap_mcanvw.c, 
								proto_nmap2.h
		nprogs/nmap/source/nmap_mapw.c, nmap_mcanvw.c, proto_nmap.h
		resource/Nmap, Nmap_1600x1200 

018a1n.	6/25/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

010a1y.	6/25/01	gempak/source/gemlib/gg/ggnarp.f
		gempak/help/atcf.hl2

021a1x.	6/25/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c

010a1z.	6/25/01	gempak/source/gemlib/gh/ghbkcm.f, ghbkcu.f, ghbkel.f, ghbkhi.f,
			ghbkpc.f, ghbkus.f, ghkgfl.f, ghkglb.f, ghnopb.f, 
			ghrdbd.f, ghrdds.f, ghsplb.f, ghsprb.f, ghswlb.f, 
			ghswln.f, ghswpt.f, ghswth.f, ghwgrf.f
		gempak/source/programs/gp/gptpc/gptpc.f
		gempak/include/uscore.h
		gempak/error/gptpc.err
		gempak/build/gemlib_compile

	CSC:	gempak/source/gemlib/gh/ghkgph.f, ghswdf.f, ghwipl.f, ghwrel.f
	NEW:	gempak/source/gemlib/gh/ghcmn.cmn, ghcmn.h, ghftbl.c, ghgclr.c,
			ghrtbl.c, ghcolr.f, ghrest.f, ghrscl.f, ghsave.f, ghsvcl.f

010a2a.	6/25/01	gempak/include/proto_cgemlib.h
		gempak/build/cgemlib_compile, cgemlib_link

	NEW:	gempak/source/cgemlib/spf/spfcreate.c, spfopen.c, spfread.c,
			spfload.c, spfclnup.c, spfclose.c, spfgtfld.c,
			spfwrite.c, spfinit.c, testspf.c, testspf_link
		gempak/include/spfcmn.h
		gempak/error/spf.err

018a1o.	6/27/01	gempak/source/programs/gui/nmap2/nmap_mainw.c
		nprogs/nmap/source/nmap_mainw.c

018a1p.	6/27/01	gempak/source/programs/gui/nmap2/nmap_logo.c

001aa.	6/27/01	gempak/source/bridge/is/isdcod.f, isegar.f, iseggy.f, isegmv.f,
					isegpr.f, isphen.f

021a1y.	6/27/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

010a2b.	6/27/01	gempak/source/cgemlib/clo/clordstn.c

011w.	6/27/01	gempak/source/programs/gd/gdcntr/gdcntr.f
		gempak/source/gemlib/gr/testgr.f
	NEW:	gempak/source/gemlib/gr/grftim.f

018a1q.	6/27/01	gempak/source/programs/gui/nmap2/nmap_tmln.c

018a1r.	6/27/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c,
								nmap_data.h

021a1z.	6/27/01	gempak/source/nmaplib/pgen/nmap_pgwlst.c, nmap_pgwpts.c
		gempak/include/proto_nmaplib.h

010a2c.	6/28/01	gempak/source/gemlib/gg/testgg.f
		gempak/include/uscore.h, proto_gemlib.h

	CSC:	gempak/source/gemlib/gg/ggwtch.f
	NEW:	gempak/source/gemlib/gg/ggcmn.cmn, gginfo.f, ggwcur.f

018a1s.	6/28/01	gempak/source/programs/gui/nmap2/nmap_mainw.c

016g.	6/28/01	nprogs/nwx/source/draw.c, dslw.c, mapdraw.f, mapw.c, srcho.c, 
					txtw.c, wbox.c, wwcrnr.c, wwdcod.f

018a1t.	6/29/01	gempak/source/programs/gui/nmap2/nmap_mainw.c, nmap_mcanvw.c
		nprogs/nmap/source/nmap_mainw.c, nmap_mcanvw.c

018a1u.	7/2/01	gempak/source/programs/gui/nmap2/nmap_dslw.c

001bb.	7/2/01	gempak/source/bridge/is/isegpr.f

021a2a.	7/2/01	gempak/source/nmaplib/pgen/nmap_pgsigw.c

010a2d.	7/2/01	gempak/source/cgemlib/clo/clofrom.c

010a2e.	7/2/01	gempak/source/gemlib/gh/ghgclr.c

010a2f.	7/3/01	gempak/source/cgemlib/ctb/ctbdtrd.c, testctb.c
		gempak/source/cgemlib/spf/spfcreate.c, spfopen.c
		gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_data.h,
								proto_nmap2.h
		gempak/include/proto_cgemlib.h

	NEW:	gempak/source/cgemlib/ctb/ctbdcatitos.c, ctbdcatstoi.c,
						ctbdscatitos.c, ctbdscatstoi.c
		gempak/source/programs/gui/nmap2/nmap_spfw.c

018a1v.	7/5/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c

021a2b.	7/5/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c

018a1w.	7/5/01	nprogs/nmap/source/nmap_mapw.c, nmap_mcanvw.c
		gempak/source/programs/gui/nmap2/nmap_mapw.c, nmap_mcanvw.c

011x.	7/6/01	gempak/source/programs/gd/gdcross/gdcross.f
		gempak/source/programs/gd/gdcntr/gdcntr.f
		gempak/source/programs/gd/gddiag/gddiag.f
		gempak/help/gr.err

021a2c.	7/6/01	gempak/source/nmaplib/pgen/nmap_pgnew.c

021a2d.	7/6/01	gempak/source/nmaplib/pgen/nmap_pgfilw.c

018a1x.	7/6/01	gempak/source/programs/gui/nmap2/nmap_mcanvw.c

001cc.	7/6/01	gempak/source/bridge/ma/mabst0.f, macst0.f, macwnd.f, malscb.f,
									mapkwd.f

019u.	7/6/01	gempak/maps/ascii/asc*cnus.nws, asc*cwa.nws, asc*znus.nws
		gempak/maps/*cnus.nws, *cwa.nws, *znus.nws

018a1y.	7/6/01	gempak/source/programs/gui/nmap2/nmap_tmln.c

018a1z.	7/9/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c

018a2a.	7/9/01	gempak/source/programs/gui/nmap2/nmap_mapw.c

010a2g.	7/9/01	gempak/include/proto_gemlib.h

010a2h.	7/10/01	gempak/source/gemlib/in/inoutt.f
		gempak/source/cgemlib/cds/cdssymb.c, cdstrack.c, cdswind.c
		gempak/source/programs/sf/sfedit/sfedit.f

014e.	7/10/01	nprogs/ntrans/source/gp_callbks.c, menubar.c

021a2e.	7/12/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c

018a2b.	7/12/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

010a2i.	7/12/01 gempak/source/gemlib/ti/tictoi.f

010a2j.	7/12/01 gempak/source/gemlib/dv/dvdivt.f

010a2k.	7/12/01	gempak/source/gemlib/gh/ghwgrf.f

010a2l.	7/17/01	gempak/source/gemlib/gh/ghkgat.f, ghrtbl.c

001dd.	7/17/01	gempak/source/bridge/hc/hcdcod.f
		gempak/source/gemlib/gg/gghrcn.f
		gempak/help/hrcn.hl2
	CSC:	gempak/source/bridge/hc/hcdecd.f, hcfvld.f, hcghdr.f, hcout.f, 
							hcquad.f, hcspqd.f

011y.	7/17/01	gempak/source/programs/gd/gdcntr/gdcntr.f
		gempak/source/programs/gd/gdlist/gdlist.f
		gempak/source/programs/gd/gdmap/gdmap.f
	CSC:	gempak/source/programs/gd/gdmap/gdmdsp.f

019v.	7/17/01	gempak/maps/*osuo.nws, *mouo.nws
		gempak/maps/ascii/asc*osuo.nws, asc*mouo.nws

021a2f.	7/17/01	gempak/source/nmaplib/pgen/nmap_pgwsmw.c

018a2c.	7/17/01	gempak/source/programs/gui/nmap/nmap_dsp.c

018a2d.	7/18/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c,
								proto_nmap2.h

010a2m.	7/18/01	gempak/source/gemlib/fl/flmfil.f, flmfls.f

010a2n.	7/19/01	gempak/source/cgemlib/clo/clotgltln.c, clotgnm.c

018a2e.	7/19/01	gempak/source/programs/gui/nmap2/nmap_dsp.c

007t.	7/19/01	gempak/source/driver/active/vg/vtext.c
		gempak/source/programs/gp/gptext/gptext.f

018a2f.	7/19/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c,
								proto_nmap2.h

021a2g.	7/19/01	gempak/source/nmaplib/pgen/nmap_pgnew.c
		gempak/source/cgemlib/cvg/cvgwrite.c

001ee.	7/20/01	gempak/source/bridge/is/iseggy.f, isphen.f

010a2o.	7/20/01	gempak/source/gemlib/im/imrcdf.c
		gempak/error/im.err
		gempak/include/uscore.h, proto_gemlib.h
	NEW:	gempak/source/gemlib/im/imchtb.f

018a2g.	7/20/01	gempak/source/nmaplib/ngd/ngddspl.f, ngdgtim.c, testngd.c
		gempak/include/uscore.h, proto_nmaplib.h
	CSC:	gempak/source/nmaplib/ngd/ngdtlst.f
	NEW:	gempak/source/nmaplib/ngd/ngdrsfl.f

017a.	7/20/01	gempak/build/nprog_compile, nprog_link
		tables/ntl/ntl.tbl

	NEW:	nprogs/nsharp/source/*
		resource/Nsharp
		icons/nsharp.xbm

010a2p.	7/23/01	gempak/source/gemlib/gg/testgg.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/nts/gemglb.nts
		gempak/parm/gpmap.prm

	CSC:	gempak/source/gemlib/gg/ggmisc.f
		gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/source/gemlib/gg/ggtcda.f, ggtcep.f, ggtclb.f, ggtcmg.f,
							ggtcsh.f, ggtcsm.f
		gempak/help/tcmg.hl1, tcmg.hl2

010a2q.	7/24/01	gempak/source/gemlib/gg/testgg.f
		gempak/source/nmaplib/nms/nmsdspl.f
		gempak/source/programs/gp/gpmap/gpmap.f
		gempak/source/programs/gui/nmap2/nmap_msc.c
		gempak/include/proto_gemlib.h, uscore.h
		gempak/parm/gpmap.prm
		gempak/nts/gemglb.nts
	CSC:	gempak/source/programs/gp/gpmap/gpminp.f
	NEW:	gempak/source/gemlib/gg/ggqsct.f, ggqsrd.c
		gempak/help/qsct.hl2, qsct.hl1

010a2r.	7/24/01	gempak/source/gemlib/im/imnidh.f

019w.	7/24/01	gempak/data/vgf/adjcstlbnds.vgf

021a2h.	7/24/01	gempak/source/nmaplib/pgen/nmap_pgsigw.c

018a2h.	7/24/01	nprogs/nmap/source/nmap_zoomw.c
		gempak/source/programs/gui/nmap2/nmap_zoomw.c

018a2i.	7/25/01	gempak/source/programs/gui/nmap2/nmap_mapw.c, nmap_gmpk.c

001ff.	7/26/01	gempak/source/bridge/ru/rudrp1.f

018a2j.	7/26/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c,
							proto_nmap2.h
		gempak/source/cgemlib/spf/spfopen.c, spfload.c
		gempak/error/spf.err

021a2i. 7/26/01	gempak/source/nmaplib/pgen/nmap_pgwpts.c

001gg.	7/26/01	gempak/source/bridge/ma/macgpt.f, macgwa.f, macgwd.f, macgwn.f
		gempak/source/gemlib/st/strlch.f
		gempak/source/gemlib/in/intaxs.f
		gempak/source/programs/sn/snedit/snep2s.f

018a2k.	7/27/01	nprogs/nmap/source/nmap_dataw.c
		gempak/source/programs/gui/nmap2/nmap_dataw.c

010a2s.	7/27/01	gempak/source/cgemlib/cvg/dumpvgf.c

018a2l.	7/27/01	gempak/source/programs/gui/nmap2/nmap_dsp.c, nmap_mapw.c

018a2m.	7/31/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c,
						nmap_dslw.c, proto_nmap2.h

007u.	7/31/01	gempak/source/programs/gui/nmap2/nmap_mapw.c
		gempak/source/driver/active/xw/xmloop.c

018a2n.	8/2/01	gempak/source/programs/gui/nmap2/nmap_spfw.c
		gempak/error/spf.err

012s.	8/13/01	gempak/source/nxmlib/NxmHelp.c

015f.	8/13/01	nprogs/nsat/source/dslw.c

010a2t.	8/13/01	gempak/source/gemlib/gg/ggwarn.f
		gempak/error/gg.err

018a2o.	8/13/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

011z.	8/13/01	gempak/source/programs/gd/gdcross/gdcross.f
		gempak/source/programs/gd/gdprof/gdprof.f
		gempak/source/programs/gd/gdcntr/gdcntr.f
		gempak/source/programs/gd/gdlist/gdlist.f
		gempak/source/programs/gd/gdmap/gdmap.f
		gempak/source/programs/gd/gdstat/gdstat.f
		gempak/source/programs/gd/gdstat/gdywrt.f
		gempak/source/programs/gd/gdstream/gdstream.f
		gempak/source/programs/gd/gdwind/gdwind.f
		gempak/source/programs/gd/gdthgt/gdthgt.f
		gempak/source/programs/gd/gdtser/gdtser.f
		gempak/source/programs/gd/gdplot/gdplot.f
		gempak/source/programs/gd/gddiag/gddiag.f
		gempak/source/gemlib/gr/testgr.f

	CSC:	gempak/source/programs/gd/gdcross/gdxdsp.f
		gempak/source/programs/gd/gdprof/gdpdsp.f
		gempak/source/programs/gd/gdstream/gdsdsp.f
		gempak/source/programs/gd/gdwind/gdwdsp.f
		gempak/source/gemlib/gr/grftim.f

001hh.	8/13/01	gempak/source/bridge/ru/rudrp1.f

018a2p.	8/14/01	gempak/source/nmaplib/nmp/testnmp.c
		gempak/include/proto_nmaplib.h
		gempak/error/nmp.err
	NEW:	gempak/source/nmaplib/nmp/nmpvalid.c

021a2j.	8/14/01	gempak/source/nmaplib/pgen/nmap_pgwfmt.c

007v.	8/14/01	gempak/source/programs/gui/nmap2/nmap_dsp.c
		gempak/include/proto_xw.h
	CSC:	gempak/source/driver/active/xw/xmloop.c

018a2q.	8/14/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c,
						nmap_dslw.c, proto_nmap2.h

018a2r.	8/14/01	gempak/source/programs/gui/nmap2/nmap_mbotw.c
		nprogs/nmap/source/nmap_mbotw.c
		resource/Nmap

018a2s.	8/14/01	gempak/source/programs/gui/nmap2/nmap_pgpalw.c

018a2t.	8/15/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c
		gempak/error/nmp.err

018a2u.	8/15/01	gempak/source/nmaplib/nmp/testnmp.c
		gempak/source/programs/gui/nmap2/nmap_dataw.c
		gempak/include/nmpdef.h
	NEW:	gempak/source/nmaplib/nmp/nmpsdefmap.c

001ii.	8/16/01	gempak/source/bridge/is/isegmv.f, ismov.f
		gempak/source/bridge/ms/msdcdm.f
		gempak/source/cgemlib/clo/clodddec.c, testclo.c
		gempak/source/gemlib/gg/ggisig.f
		gempak/source/gemlib/vf/vfvors.c
		gempak/source/programs/dc/dcmosm/dcmrfm.f
		gempak/help/sfparm.hl2
		gempak/include/proto_cgemlib.h
		gempak/txt/apx/parms.apx
	CSC:	gempak/source/cgemlib/clo/clocmpdir.c

018a2v.	8/17/01	gempak/source/programs/gui/nmap2/nmap_pgpalw.c

018a2w.	8/20/01 gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c

018a2x.	8/20/01	gempak/source/programs/gui/nmap2/nmap_dataw.c
		gempak/source/nmaplib/nmp/nmpvalid.c
		gempak/error/spf.err

010a2u.	8/22/01	gempak/source/cgemlib/clo/cloddenc.c, clofindnum.c, testclo.c
		gempak/source/cgemlib/cvg/cvgdump.c, cvgoldswap.c, dumpvgf.c,
			cvgrdoldele.c, cvgoldstructs.h, testcvg.c,
			convcvg_link, dumpvgf_link, testcvg_link
		gempak/source/cgemlib/cvq/testcvq_link
		gempak/source/nmaplib/pgen/nmap_pgsigw.c, nmap_pgwatch.c
		gempak/include/vgstruct.h

020i.	8/22/01	gempak/utilities/bounds/vgftobnd.c, vgftobnd_link
		gempak/data/vgf/adjcstlbnds.vgf, greatlakesbnds.vgf, 
					lakesbnds.vgf, locowobnds.vgf

007w.	8/22/01	gempak/source/driver/active/xw/xcpypxm2.c

018a2y.	8/23/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_dsp.c

018a2z.	8/23/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

018a3a.	8/23/01	gempak/source/programs/gui/nmap2/nmap_dataw.c
		gempak/source/cgemlib/spf/spfread.c
		gempak/error/spf.err

011aa.	8/27/01	gempak/source/programs/sf/sflist/sflist.f, sflprm.f

018a3b.	8/27/01	gempak/source/programs/gui/nmap2/nmap_dataw.c, nmap_spfw.c
		gempak/source/cgemlib/spf/spfgtfld.c
		gempak/source/nmaplib/nmp/nmpinit.c, nmpsave.c, nmpcmn.h, 
								testnmp.c
		gempak/include/proto_nmaplib.h
	NEW:	gempak/source/nmaplib/nmp/nmprdeflts.c

010a2v.	8/27/01	gempak/source/cgemlib/ctb/ctbastn.c, testctb.c

010a2w.	8/27/01	gempak/source/cgemlib/cvg/cvginitelm.c

021a2k.	8/28/01	gempak/source/nmaplib/pgen/nmap_pgwatch.c

021a2l.	8/28/01	gempak/source/nmaplib/pgen/nmap_pgline.c

018a3c.	8/28/01	gempak/source/nmaplib/nmp/nmpinit.c, nmpsave.c, nmprdeflts.c,
								nmpcmn.h

010a2x.	8/29/01	gempak/source/cgemlib/cvg/cvgrdoldele.c

016h.	8/29/01	gempak/source/programs/sf/sflist/sflprt.f
		nprogs/nwx/source/srcho.c

001jj.	8/29/01	gempak/source/bridge/is/iseggy.f, isegmv.f
	NEW:	gempak/source/bridge/is/isegfd.f
	CSC:	gempak/source/bridge/is/isegar.f, isegtm.f, isegts.f

012t.	8/29/01	gempak/source/nxmlib/NxmHelp.c

011bb.	8/30/01	gempak/source/programs/gd/gdplot2/gdblev.f
		gempak/source/gemlib/gr/grnlev.f

018a3d.	8/30/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

021a2m.	9/4/01	gempak/source/nmaplib/pgen/nmap_pgcirc.c, nmap_pglabel.c, 
						nmap_pgsymb.c, nmap_pgtxt.c

021a2n.	9/4/01	NEW:	gempak/source/nmaplib/pgen/nmap_pgwcnsl.c

010a2y.	9/5/01	gempak/source/gemlib/im/imar2gm.f, imnidh.f, imunhd.f

010a2z.	9/6/01	gempak/include/vgstruct.h
		gempak/source/gemlib/vf/vfcmn.h

020j.	9/10/01	gempak/build/util_link
	NEW:	gempak/source/utilities/fop/fop.c, fop_link

021a2o.	9/10/01	gempak/source/nmaplib/pgen/nmap_pggst.c, nmap_pgnumb.c, 
				nmap_pgpdel.c, nmap_pgprd.c, nmap_pgtrkw.c, 
				nmap_pgutls.c, nmap_pgwndw.c

018a3e.	9/10/01	gempak/source/programs/gui/nmap2/nmap_dataw.c

011cc.	9/10/01	gempak/source/cgemlib/clo/testclo.c
		gempak/source/cgemlib/cgr/testcgr.c
		gempak/build/contrib_compile, contrib_link
		gempak/include/proto_cgemlib.h, uscore.h
		gempak/utilities/pdfbld/programs_pdfbld, programs_hlpbld

	NEW:	gempak/source/contrib/cpc/cpcgstn/cpcgnewpoly.c, cpcgrdbnd.c,
				cpcgrdln.c, cpcgsrch.c, cpcginp.f, cpcgout.f,
				cpcgstn.f, cpcgstn_link
		gempak/source/cgemlib/clo/cloreorder.c
		gempak/source/cgemlib/cgr/cgrintersect.c
		gempak/parm/cpcgstn.prm
		gempak/txt/programs/cpcgstn.txt
		gempak/error/cpcg.err, cpcgstn.err
		gempak/utilities/pdfbld/contrib_pdfbld
		gempak/utilities/hlpbld/contrib_hlpbld

021a2p.	9/12/01	gempak/source/nmaplib/pgen/nmap_pgedit.c

010a3a.	9/12/01	gempak/source/cgemlib/ctb/ctbastn.c, testctb.c

010a3b.	9/12/01 gempak/source/gemlib/pc/pcfunc.f
	NEW:	gempak/source/gemlib/pr/prquot.f

020k.	9/12/01	gempak/source/programs/util/fop/fop.c

020l.	9/14/01	gempak/source/contrib/cpc/cpcgstn/cpcgout.f

010a3c.	9/14/01	gempak/source/gemlib/pc/pcfunc.f
		gempak/source/gemlib/pr/testpr.f
		gempak/txt/apx/parms.apx
		gempak/help/sfparm.hl2

	NEW:	gempak/source/gemlib/pr/prwcht.f, prmhkn.f, prknmh.f

001kk.	9/14/01	gempak/source/bridge/is/isout.f, isphen.f, istc.f, ists.f
		gempak/source/gemlib/gg/ggisig.f

018a3f.	9/17/01	gempak/source/nmaplib/ngd/ngdtlst.f, testngd.c
		gempak/error/ngd.err

010a3d.	9/17/01	gempak/source/gemlib/gr/grftim.f

021a2q.	9/17/01	gempak/source/device/draw/ispcl.f
		gempak/source/nmaplib/pgen/nmap_pgobj.c
		gempak/source/programs/gui/nmap2/nmap_pgpalw.c
		nprogs/nmap/source/nmap_pgpalw.c
		gempak/source/testprog/plotsyms.f
		gempak/include/drwids.h
	NEW:	icons/nmap/nuclear.xbm

008i.	9/17/01	gempak/txt/programs/cpcgstn.txt

003b.	9/18/01	gempak/source/programs/gd/grphgd/gggint.f, lnsgin.f
		gempak/source/nmaplib/pgen/nmap_pggfmt.c
		gempak/error/grphgd.err

020m.	9/18/01	gempak/source/programs/util/fop/fop.c

018a3g.	9/18/01	gempak/source/nmaplib/nim/nimflnm.f, nimftot.f

019x.	9/18/01	gempak/maps/hiznus.nws, loznus.nws, meznus.nws, tpznus.nws
		gempak/maps/ascii/asc*znus.nws

020n.	9/20/01	gempak/source/programs/util/fop/fop.c

010a3e.	9/20/01	gempak/source/gemlib/pr/prwcht.f

008j.	9/20/01	help/nmap/nmapHlp.index

	NEW:	help/nmap/Procedures.hlp

020o.	9/21/01	gempak/source/contrib/cpc/cpcgstn/cpcgrdln.c

007x.	9/21/01	gempak/source/driver/active/xw/xmloop.c

008k.	9/24/01	help/nmap/Procedures.hlp

008l.	9/24/01	help/nmap/WhatsNew.hlp
		versions/release_notes/v5.6/README_nawips5.6.e


