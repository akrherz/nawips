			N-AWIPS 5.4.3.j Patch Release Notes
				9/28/98

This patch contains changes throughout the N-AWIPS code, especially
many changes to the product generation component.


		  Product Generation Changes
		  --------------------------


New actions in NMAP product generation include:
(Note: follow the hints to understand how these actions operate)

	o Ungroup all ("Un-Group All") ungroups objects in all groups.

	o Delete a single point ("DEL PT") removes a single vertex on a line 
	  or front.

	o Connect two lines/fronts ("CONN") connects two lines/fronts to form
	  a single line/front.  The attributes of the first line/front 
	  selected, e.g., the color, are inherited by the connected 
	  line/front.

New capabilities in product generation include:

	o Object and group modes have been added.  Object mode allows actions
	  to be performed on all objects, including objects within a group.  
	  Group mode allows actions to be performed on groups only.  The 
	  object and group modes are invoked by clicking on the "obj" and 
	  "grp" radio buttons, respectively, on the top of the product 
	  generaton palette.

	o North Relative text rotation has been added.  This feature is 
	  enabled for software fonts only.

	o An option to clear graphics under vectors has been added.  Click 
	  the "On" radio button next to "Clear" on the vector palettes to 
	  enable this feature.

	o Two new dashed line types with arrow heads have been added.

	o Four new symbols have been added.  They are the tropical storm 
	  center, tropical depression, tropical cyclone, and past weather 
	  thunderstorm symbols.

NMAP generates two new text products.  They are:

	o The hurricane track text product.  A text product that includes the 
	  lat/lon points of the line vertices is generated.  A line  
	  grouped with a text label must be drawn to generate this product.

	o Excessive rainfall text product. The excessive rainfall potential is 
	  defined by lines.  The closest METAR stations are identified and
	  formatted within the message.

Two new post processing programs for product generation have been written.  
They are:

	o SFCSPLT.  This program allows a VG file containing fronts and 
	  contours to be split up into two VG files with fronts in one, 
	  and all other objects in the other.

	o GRPHGD.  This program provides an initial graph-to-grid capability. 
	  A grid is generated from a text file containing contour location 
	  and label information.  The text file can be made in an NMAP  
	  product generation function.  Contours are grouped with text 
	  indicating the contour value.

Improvements to product generation include:

	o Line ghosting now shows the smoothing associated with the line/front
	  object that is being drawn or editied.

	o The grouping action is now easier to use. To group objects, click on
	  the GROUP action.  Select the group type from the dialog box. Then
	  select the desired objects to group and click the middle mouse button
	  to confirm.  Click the middle mouse button again to deselect the
	  group. Then another grouping action can be performed

	o A text ghost box is drawn to provide guidance when placing or
	  editing text.  This box is not drawn for north relative text.

	o Text attributes are saved for each text type.

	o When adding text, the entire text string can be deleted with the
	  <CNTL>-<Backspace> key sequence.

    	o The smoothing default for line/front objects is now set in the 
	  table: $GEMTBL/pgen/setting.tbl 

	o The hints messages are improved.

	o Undo now operates on the DELETE ALL action. 

	o Front colors can be altered like other line types.

	o Generation of combination symbols has been improved. Although
	  the symbols are saved as a group, they behave as objects.


Bug fixes:

	o The Outlook text product now properly accounts for arrowhead 
	  line flipping.

	o Fixed problems with parallelogram watch creation.


 	      Other improvements included in this patch 
	      -----------------------------------------


	o The NMAP timeline has been re-written.  The time-line now appears 
	  for all data types and displays the available data times.  Frame 
	  times can be selected by altering a skip factor, sliding the box, 
	  stretching the box, or clicking on individual times.  For model 
	  data, all of the forecast times are now displayed.  Note that
	  the set time feature does not work with this release.

	o A new device driver, rbk, has been written to create an AWIPS 
	  graphics file in Redbook format.  GPMAP has been enhanced to 
	  display Redbook graphics files.

	o NWX and GPMAP now plot active tornado and thunderstorm watches.

	o A large size, (24 x 36 inches) has been added to the PostScript 
	  driver.

	o All margins for PostScript plots are now set to 0.25 inches for all
	  paper sizes.

	o Land/sea mask grids have been added to the list of special grids and
	  can be computed for any grid navigation. The original table of
	  land/sea values has a half degree resolution for the world.

	o Added new grid diagnostics for masking scalar and vector grids. The
	  diagnostics are MASK (S1, S2) for scalar grids, and VMSK (V, S) for
	  vector grids. These mask functions are generic and can be used
	  with other GEMPAK diagnostics. For example, to compute a scalar S
	  over only the land areas, specify the grid function as MASK (S, LAND).


Bug fixes:

	o Fixed printing, when the map is plotted in color 1, from xwp driver
	  and GUI programs. 

	o Fixed problems associated with accessing previous model runs in NMAP.

	o Fixed the SKIP parameter in GDPLOT2 and thus in NMAP.


                            Known problems
		            --------------

o The "Set Time" option on the time line does not function properly.


                   Patch i and j incompatibilities
		   -------------------------------


o Any changes to these tables must be re-incorporated into the following
  tables:

	o gempak/tables/config/data.tbl - format change

	o gempak/tables/pgen/setting.tbl - format change - A column for
	  line smoothing has been added.

o Be careful of text size changes indicated above.

o For north-relative text, the meaning of the direction has changed.



See the N-AWIPS logs for additional details.  This patch includes
development from  6/25/98 to 10/1/98.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.j 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.j >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


