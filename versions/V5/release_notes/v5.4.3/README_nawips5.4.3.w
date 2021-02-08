			N-AWIPS 5.4.3.w Patch Release Notes
				11/30/99	

Patch 5.4.3.w covers development from October 4 to November 23, 1999.   

		  Product Generation Changes
		  --------------------------

New capabilities added to NMAP product generation include: 

	o  Incorporated graph-to-grid functionality into NMAP directly.
	   A new GUI allows users to by-pass the intermediate step
	   of manually sending the ".info" file to the GRPHGD GEMPAK
	   program. Input for all GRPHGD parameters is provided by
	   the NMAP GUI.

Improvements to NMAP product generation functions include:

	o  Made several improvements to the generation and formatting
	   of international sigmet products at the request of the AWC.  
	   These include:

		- Added two buttons, 4hrs and 6hrs, which when clicked
		  add the respective hours onto the start time.

		- Changed label from "Direction" to "Direction toward"

		- Made the sequence text box editable.

		- Made the default distance 10 for ESOL case.

		- Added requested phenomena and remarks to the GUI.

	o  Added the word "From" in front of the from line text
	   file for all aviation products except the International
	   Sigmet.

	o  The track action now displays the speed and direction 
	   when it is drawn without having to select the track.
	   This change was requested by the SPC.


Improvements to product generation post-processing functions include:

	o  Made several improvements to the watch text product 
	   generation program, SPCTXT, at the request of the SPC.
	   The improvements include requested changes to the product
	   formats, and the capability to handle watch replacements,
	   corrections, and cancellations.

	o  VGF object attributes can now be modified when creating
	   products using GPMAP.  A table name is specified in the GPMAP
	   VGFILE variable.  The table uses the same format as the
	   table $GEMTBL/pgen/setting.tbl to alter object attributes.
	   See the GPMAP help for additional details.



		NMAP Display Improvements	
		-------------------------

	o The sfstns option in the seek and cursor display functions
	  now points to the global METAR station table instead of the
	  U.S. subset.  This change allows the retrieval of station
	  information on a global basis.

	o Added the capability to display international Sigmets.  
	  International Sigmets are plotted by clicking on the 
	  WTCH_WARN data type.  Click the edit button, to specify
	  the Sigmet color and label options.

	o Modified the display of aircraft observations in NMAP at 
	  the request of the AWC.  A simplier standard parameter 
	  matrix is used for the default display.  The heat parameter
	  has been removed from the display list.  All aircraft flight 
	  levels are shown in 100s of feet, instead of meters.

	o Added the ability to change the size of icing and turbulence
	  symbols by using the station model edit tool.

	o Several improvements have been made to the cloud top height
	  algorithm.  Increased the performance of the sounding 
	  retrieval by improving the sounding station sorting algorithm.
	  The function now displays cloud top temperature even
	  if no corresponding height is retrieved.  Added the
	  display of temperature in degrees Celsius.  Also added time
	  matching logic to get the closest (0Z or 12Z) observation 
	  to the image time and go back 12 hours if sounding data
	  are not available.

	o Watches are now plotted up to one hour prior to the time 
	  they are valid.  This change was made at the request of the
	  SPC.

	o Changed the map overlay label from Watch_Corner to 
	  Anchor_Points at the request of the SPC.


		
		NMAP Bug Corrections
		--------------------

	o Fixed the seek function to operate properly with marine
	  and coastal stations.    


		Decoder Improvements
		--------------------

	o Modified the watch decoder, dcwtch, to handle variations
	  in the status message format.  Two watch status lines
	  are now handled correctly.  Changes in status message format
	  that became effective on October 18, 1999, are also 
	  properly decoded.

	o Wrote a new decoder, dchrcn, that decodes forecast/advisory
	  reports for tropical depressions, tropical storms, and
	  hurricanes, (WTNT2[1-5], WTPZ2[1-5]).  These storms can be 
	  plotted in GPMAP.

	o Wrote a new decoder, dcisig, that decodes the international
	  Sigmets.  Currently, dcisig decodes Sigmets from KMKC and
	  KNHC.  International Sigmets can be plotted in GPMAP.

	o Modified the synoptic decoder, dclsfc, and the marine 
	  decoder, dcmsfc, to fix a bug which prevented weather
	  symbols from being plotted when observations came from
	  automated stations.


		Map Improvements
		----------------

	o The default map for NMAP has been improved to include 
	  additional Caribbean islands requested by the TPC.  Also 
	  improved the depiction of existing Caribbean islands.

	o Added several forecast boundary maps requested by the TPC.
	  They include TPC surface analysis, surface boundary, high
	  seas, Sigmets, and aviation maps.  The alias names for 
	  these maps are tpcsfc, tpcsfcbnd, tpchsf, tpcsig and tpcavn,
	  respectively.

	o Added the Western Region boundary map at the request of the
	  HPC.  The alias name for this map is wregion.

	o Various improvements and updates have been made to the
	  County Warning Area and Marine Zone maps.  See the nawips.log
	  for additional details.

		General Improvements
		--------------------

	o Wrote a new program, GDGSFC, which interpolates grid data
	  from a grid file to a GEMPAK surface file.

	o Added BRBS (barb in miles/hour) and SMPH (statue miles/hour)
	  to available surface parameters at the request of the SPC.



		Known Problems
		--------------

Auto-update occasionally fails to properly update when the skip 
factor is greater than one.

Decoded International Sigmets defined as being "either side of a line" 
are occasionally plotted incorrectly.  A correction is being developed.


		Table Changes *** IMPORTANT PLEASE NOTE *** 
		--------------------------------------------

The table $GEMTBL/config/data.tbl has been REPLACED by 
$GEMTBL/config/datatype.tbl.  Please note that data.tbl is 
NO longer used.  The format of the new table, datatype.tbl is
different.  You MUST add your site specific information into
datatype.tbl.

		Dot file Changes  *** IMPORTANT PLEASE NOTE ***
		-----------------------------------------------

You MUST add two new environment variables for this patch.

	1.  In the .cshrc file please add:

		setenv nmaplib $GEMOLB/nmaplib.a

	2.  In the .cshrc_data file please add:

		setenv GRPHGD $HOME

	    Note that $GRPHGD can be set to any valid writeable
	    directory.  It is used as the destination directory
	    for graph-to-grid grid files.

		Calling Sequence Changes
		------------------------

The calling sequences have been changed in the following routines:

	gempak/source/programs/gp/gpmap/gpminp.f
	gempak/source/gemlib/fl/flscnd.f, fltmpl.f
	gempak/source/cgemlib/cfl/cflscnd.c
	gempak/source/cgemlib/ctb/ctbdtget.c, ctbdttime.c
	gempak/source/cgemlib/cds/cdscirc.c, cdsfrnt.c, cdsline.c,
				  cdssig.c, cdssymb.c, cdstext.c, 
				  cdstrack.c, cdswbox.c, cdswind.c
	gempak/source/bridge/is/ishurc.f ists.f
	gempak/source/cgemlib/clo/clodist.c, clodist.c, clodirect.c,
				  clodltln.c, clocompass.c, clocmpwds.c
	gempak/source/programs/gd/grphgd/grginp.f
	gempak/source/gemlib/gg/ggisig.f gghrcn.f
	gempak/source/gemlib/im/imgpix.f
	gempak/source/gemlib/lc/lcdist.f
	gempak/source/gemlib/sn/snghgt.f


See the nawips.log and changes.log for additional details concerning
these routines.


		Planned Development
		-------------------

This section is an attempt to communicate CDB software development
plans.  The information is an estimate at the time the release notes
are written.

NMAP2 is currently being tested and de-bugged by the CDB.  A
testing and evaluation version will be released in the future.

The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.w 

To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.w >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.
