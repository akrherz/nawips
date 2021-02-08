			N-AWIPS 5.4.2.h Patch Release Notes
				7/17/1997


This file describes the patch and provides instructions for its installation.

The patch contains some bug fixes and code improvements to version 5.4.2.g .

These include:

	1  Added grouping capability to product generation.  This capability
	   is currently limited to grouping different object types in the
	   VG file.  No other grouping functionality is available yet.
	
	** NOTE:  The VG file format has been updated with the addition of 
	   a new header element and changes to accomodate grouping of elements.
	   The new VG format is NOT compatible with the previous version.  The 
	   utility program vgfcvt MUST be run on any existing VG files to update 
	   them for access.

	2  Added software text editing to NMAP with rotation capability.

	3  Added capability to rotate software text and winds in NMAP after
	   they have been created. 

	4  Added capability to NMAP to display VG files in one color and 
           select the desired color.  Also, more than one VG file can
	   be displayed.  A VG file created in product generation can
	   now be displayed as background data in NMAP without exiting
	   the program.

	5  Added capability to clear the data display in NMAP.  Also, 
	   the edited graphic product or map can now be printed without
	   background data.

	6  Fixed several bugs associated with front drawing.  Stationary
	   fronts can now be flipped.  Fixed problem with spurious hooks
	   being drawn at the ends of fronts.  Corrected front drawing so
	   that short fronts are displayed for cases where there is
	   less than one pip.  Corrected problem where large pips were
	   drawn for vertical fronts.

	7  Added no margins (NM) qualifier to the projection field for AFOS 
	   areas defined in GEOG.TBL.  This change removes margins from AFOS 
	   graphics allowing proper matching of the product to the AFOS 
	   map background.  Also added the AWC areas to this table.  In
	   addition the AWC AFOS products have been added to the product
	   table, PRODUCT.TBL. 

	** NOTE:  The AWC should verify that these additions are correct
	   and complete.

	8  NMAP intialization performance has improved by using a pre-sorted
	   counties table.  The new table is called county_sort.tbl.

	9  Updated NMAP restore files to reflect recent changes made
	   in Eta and Meso-Eta postprocessing.

	10 Increased the maximum number of grid times in GDPLOT2 and
	   NMAP to 500.

	11 Updated font size calculations for the xw and utf drivers in
	   order to make sizes comparable across devices, which we believe
	   will be required for product generation.  The relationship 
	   between the new and old point sizes is:

	   XW point size  AFOS text	old gempak size range	new gempak size range
	   -------------  ---------	---------------------	---------------------
		 8		0	      size <= .71	       size <= .64
		10		0	.71  < size <= .86	.64  < size <= .785
		12		0	.86  < size <= 1.0	.785 < size <= .93
		14		1	1.0  < size <= 1.29	.93  < size <= 1.145
		18		2	1.29 < size <= 1.71	1.145< size <= 1.5
		24		3	1.71 < size	 	1.5  < size 

	** NOTE:  Hardware text sizes may result in plots looking very different.
		  Note that we changes default sizes in many of the NMAP scripts
		  for this reason.  Also note that we have not yet done a similar
		  mapping for the fax driver.

	12 Simplified linking LDM code the N-AWIPS.

	NOTE:  We now only include the ldm routines that are needed for linking the
	      decoders.  They are located in gempak/source/ldmlog.  The directory
	      $NAWIPS/ldm now only contains the directory etc with sample ldm 
	      configuration files.  NOTE that the .cshrc was modified. The 
	      environment variable, LDMINC  was changed to $GEMPAK/source/ldmlog.  
	      The .cshrc file is included in this patch.  Therefore, any site 
	      changes to the .cshrc should be reconciled with the .cshrc included 
	      in this patch.



See the N-AWIPS logs for additional details.  This patch includes
development from 06/23/97 through 7/16/97.

This patch requires some recompiling and linking of GEMPAK programs,
GUI programs, and  device drivers.  A script has been written
to perform all of the necessary compiles and links.  It is called:

	patch_build_5.4.2.h 

The file is located in $GEMPAK/build.

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.2.h >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


