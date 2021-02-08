			N-AWIPS 5.6  Changes for the LDM 

		( d - Development account 
		  o - Operational account
		  b - Both accounts )

b1.	9/12/00	Created a new group "volcano" in NWX, consolidated all the
		volcano products into the new group.

		ldm/etc/pqact.conf

b2.	9/25/00	Updated tables taf.stn, local.bull, zone.bull, and the 
		pqact.conf file according to NWS change notice FOS 1781, 
		FOS 1785, SCN 00-73, and DMM 08-00.05 ~ 08-00.08.  Done, MLI,
		(TP), 9/25/00.

		ldm/etc/pqact.conf

b3.	10/11/00 Changed three pqact.conf files to allow the marine surface 
		 decoder dcmsfc) to decode CMAN station bulletins now coming
		 in under WMO header SXUS82 KTBW.  Done, DKW, (TP), 10/11/00.

		 ldm/etc/pqact.conf

b4.	10/24/00 Added new products for use by the MPC, to the LDM pqact table.

		 ldm/etc/pqact.conf

b5.	10/24/00 Updated tables taf.stn, now.bull, zone.bull, and the pqact.conf 
		 file according to NWS change notices SCN 00-74, TIN 0017, 
		 DMM 09-00.01, TIN 0018, DMM 10-00.04 and FOS 0018 (effect 
		 range: 09/27/00 ~ 10/25/00).  Done, MLI, (TP), 10/24/00.

		 ldm/etc/pqact.conf

b6.	10/26/00 Added new decoders dcmosa and dcmosm for new Aviation MOS
		 and new MRF MOS, respectively.  Done, DKW, (TP), 10/26/00.

		 ldm/etc/pqact.conf

b7.	11/1/00	Changed the LDM pqact.conf to save new SPC products.
		Done, GG, SJ, (TP), 11/1/00.

		ldm/etc/pqact.conf

========================  End of Patch 5.6.a  =================================

b8.	11/21/00 Updated tables dclim.stn, mclim.bull, and three pqact.conf files
		 according to NWS change notices SCN 00-94 (effective 11/01/00).
		 Done, MLI, (TP), 11/21/00.

		 ldm/etc/pqact.conf

b9.	12/22/00 Updated the scour.conf files for ldmas2, ldmis2 and nawdv.
		 Done, AH, (TP), 12/22/00.

		 ldm/etc/scour.conf

b10.	1/12/01	Added Fire Weather Products from the SPC to the LDM 
		configuration files.  Done, SJ, (TP), 1/12/01.

		ldm/etc/pqact.conf, scour.conf

========================  End of Patch 5.6.b  =================================

b11.	2/21/01	Added new stations to the Volcano SIGMET and International
		SIGMET tables for NWX.  Done, SJ, (AH), 2/21/01.

		ldm/etc/pqact.conf

b12.	3/19/01	Changed three pqact.conf files and two ctab files to add the new
		severe storms decoder dcsvrl and the upper air decoder dcuair
		configured for dropsonde data.  Done, DKW, (SJ), 3/19/01.

		ldm/etc/pqact.conf

========================  End of Patch 5.6.c  =================================
b13.	5/1/01	Updated pqact.conf files based upon Eastern Region changeover
		effective 5/8/01.  Done, TP, (SJ), 5/1/01.

		ldm/etc/pqact.conf

b14.	5/1/01	Added more patterns to the list for dcmsfc to decode the
		Coast Guard reports.  Done, SJ, (DKW), 5/1/01.

		ldm/etc/pqact.conf

=============================  End of Patch 5.6.d  =============================

b15.	7/23/01	Added the WCN products as their own group to the LDM and NWX
		tables.  Sorted the directories in the LDM table scour.conf.
		Done, SJ, (DKW), 7/23/01.

		ldm/etc/pqact.conf, scour.conf


