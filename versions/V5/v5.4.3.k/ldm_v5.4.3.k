			N-AWIPS 5.4.3+ Changes for the LDM 

		( d - Development account 
		  o - Operational account
		  b - Both accounts )

=========================== Patch 5.4.3.a ==================================

=========================== Patch 5.4.3.b ==================================

=========================== Patch 5.4.3.c ==================================
b1.	Added Volcanic Ash Advisory Statement to LDM pattern
	action tables (see t9.)  Done, SJ, (SS), 10/29/97.

	ldm/etc/pqact.conf, scour.conf

=========================== Patch 5.4.3.d =================================

b2.	Updated LDM pattern action table for OSO November 18th WMO
	header change (See t19).  Done, GK, SJ, (SS), 11/18/97.

	ldm/etc/pqact.conf

=========================== Patch 5.4.3.e =================================

b3.	Updated Coded Cities Forecast entries in the patter action table.
	Also increase the retention time for the Monthly Climatology files.
	Removed files that are no longer needed.  Done, SJ, (SS), 12/17/97.

	ldm/etc/pqact.conf, scour.conf

d4.	Updated pattern action table for eta and ngm guidance product 
	new stations.  (See t33).  Done, ID, (SS), 1/5/98.

	ldm/etc/pqact.conf

=========================== Patch 5.4.3.f =================================

=========================== Patch 5.4.3.g =================================

b5.	Updated LDM pattern action table to add the Synoptic decoder.
	(This has already be done in the operational area and is being
	done here so that the distributed version of this file is 
	up to date.)  Done, SJ, (SS), 3/11/98.

	ldm/etc/pqact.conf

b6.	Updated LDM pattern action table for new KIWX climate report, 
	(See t61).  Done, GK, (SS), 3/25/98.

	ldm/etc/pqact.conf

b7.	Updated LDM pattern action and scour tables for new MOS and Volcanic
	Ash products (See t64).  Done, SJ, (SS), 4/2/98.

	ldm/etc/pqact.conf, scour.conf

d8.	Changed entries in LDM pattern action table to save prodcuts from 
	North Webster, IN (KIWX) into proper groups.  Done, SJ, (SS), 
	4/14/98.

	ldm/etc/pqact.conf

d9.	Updated pattern action table for new TPC products (t70.)  Done,
	SJ, (SS), 4/16/98.

	ldm/etc/pqact.conf
	ldm/etc/scour.conf

=========================== Patch 5.4.3.h ==================================

b10.	Added products to the alarms for the marine desks.
	Done, SJ, (SJ), 5/20/98.

	ldm/etc/pqact.conf

b11.	Added coded front and forecast analysis messages for the HPC (see 
	t100).  Done SJ, (SS), 6/16/98.

	ldm/etc/pqact.conf, scour.conf

=========================== Patch 5.4.3.i ==================================

b12.	Added KGID, Hastings, NE, to the flash flood watch section of the
	ldm pattern action file to account for a Nebraska zone change on
	July 8th, 1998.  Done, GK, (SS), 7/7/98.

	ldm/etc/pqact.conf

b13.	Added new account for AFOS alarms for the Medium Range desk.  Done,
	SJ, (SS), 7/15/98.

        ldm/etc/pqact.conf

b14.	Added a new TPC AFOS product, TSA to the ldm pattern action file.
	Done, SJ, (SS), 7/23/98.

	ldm/etc/pqact.conf

b15. 	Added HPC international text message to ldm pattern action table
	and cleanup table  (See t131.).  Done, SJ, (SS), 7/30/98

	ldm/etc/pqact.conf, scour.conf

b17.	Added Hurricane Strike Probabilities product to LDM tables, 
	(see t136). Done, SJ, (SS), 8/24/98.

	ldm/etc/pqact.conf, scour.conf

b18.	Added new accounts for alarm products in the LDM for
	the HPC.  Done, SJ, (SS), 8/31/98.

	ldm/etc/pqact.conf

d19.	Added new stations to high seas forecast in the LDM for
	the MPC.  Done, JP, (SS), 9/24/98.

	ldm/etc/pqact.conf

b20.	Updated some product headers for October 1, WMO header
	changes.  Done, GK, (SS), 10/1/98.

	ldm/etc/pqact.conf

=========================== Patch 5.4.3.j =================================

b21.	Added state forecast discussion directory to the LDM cleanup.
	Done, SS, (SS), 10/21/98.

	ldm/etc/scour.conf

b22. 	Added Air Stagnation and Extended Pacific Forecast products
	to ldm tables.  (See t160.).  Done, SJ, (SS), 10/26/98.

	ldm/etc/pqact.conf, scour.conf

b23.	Updated to reflect header changes on December 1, 1998.
	(See t167).  Done, GK, (SS), 12/1/98.

	ldm/etc/pqact.conf, scour.conf

b24.	Updated to reflect OSO header changes for Phase 3A,
	(see t175.).  Done, GK ,(SS), 12/8/98.

	ldm/etc/pqact.conf

b25.	Updated high seas product ID from the UK. (See t180.)
	Done, JP, (SS), 12/18/98.

	ldm/etc/pqact.conf

b26.	Updated to reflect Winter phase changes to NWS COMS
	ID's.  (See also, t181).  Done, GK, 12/21/98.

	ldm/etc/pqact.conf

b27.	Updated pattern action table to properly receive
	some international Marine products (see t198.).
	Done, JP, (SS), 1/22/99.

	ldm/etc/pqact.conf
