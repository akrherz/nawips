			N-AWIPS 5.4.3.h Patch Release Notes
				5/7/98

     
This patch contains major enhancements and new capabilities in  
product generation.

New actions include:

	Partial Delete

	Multi-select

	Group/Ungroup

	Copy

	Label


New classes include:

	Combination symbols

	Vectors (this replaces Winds)

	Products

	Any (this allows selection of an object from any class)


New objects include:

	Lines - many new line types

	Text - underlined text and bold software text

	Symbols - superstructure icing symbols, more weather symbols

	Combination Symbols

	Vectors - directional arrows and hash lines

	Product - Basic Weather surface prog, severe weather outlook


The attributes of the drawable objects include many additions and improvements:

	Smoothing for lines and fronts

	Ability to change the type of a line or front

	Three fill patterns are available for filled areas

	The stationary front pips are drawn in alternating red and blue

	The format for the table specifying default object settings has
	changed.  The new table is called setting.tbl.  The settings can be
	specified for a class or for the individual objects within a class.


The following is a brief description of each of the actions in the product
generation.

OPEN		Open an existing file. The user is presented with a file
		selection box.

SAVE		Save the current objects to the current file name. If there
		is no current file, the action is like SAVE AS.

SAVE AS		Save the current objects to a file. The user is presented
		with a file selection to choose a file or enter a new name.

EXIT		Exit the product generation.

RESTORE		Restore the objects from the last session. The user is
		asked to confirm the action.

REFRESH		Refresh the screen.

DEL ALL		Delete all current objects. The user is asked to confirm
		the action.

DEL		Delete a single object or a group. Choose the DEL action, then
		select the object for deletion and confirm. (Use the hints
		at the bottom of the window.)

DEL PART	Deletes part of a line or front. Choose the DEL PART action,
		then select the object and click for the start of the
		opening, then click for the end of the opening. This 
		results in two new lines separated by the defined space.

SELECT		Select an object for changing attributes.

MULTI SELECT	Select objects for changing attributes or grouping.

UNDO/REDO	This allows the the last action to be undone/redone.

MOVE		Move an object/group to a new location. Choose the MOVE action,
		then select and drag the object/group.

COPY		Copy an object/group to a new location while leaving the
		original object. Choose the COPY action, then select and
		drag the object/group.

MOD		Modify a line or front. Choose the MOD action, then select the
		object and add vertices anywhere along the line.

GROUP		Group objects. Switch to the "ANY" class type, select the
		objects using the MULTI SELECT action, then choose the GROUP
		action. Select the appropriate group type from the dialog box.

UNGROUP		Ungroup objects. Select a group, then choose the UNGROUP
		action.

LABEL		Group a text label with an object. Switch to the "ANY" class
		type, select the object, then choose the LABEL action. The
		first time LABEL is used, the user must choose the type of
		text to use for the label. (Subsequent labels will use the
		selected text type.) Enter the text and click at the
		location for the text.

ROTATE		Rotate a vector software text object. Choose the ROTATE
		action, then select the object and drag the indicator to
		the new direction.

FLIP		Flip the direction of the pips for a front or special line type.
		Choose the FLIP action, then select the object and confirm.

To edit the attributes of a grouped or labeled object, the objects must first
be ungrouped. After changing the attributes, the group can be recreated.


Improvements have been made in the post-processing to allow attributes
to be table-driven for different output device types.  An example table
for the FAX driver is $GEMTBL/pgen/scale.fax. This table may be copied
and modified for specific requirements.


General improvements to the core N-AWIPS code:

	o Major modifications to the aircraft and METAR decoders

	o Added new line smoothing functions
	  (only implemented in the product generation)

	o Added code to plot directional arrows and hash lines

	o Replaced the routines that draw special line types and fronts
	  (this includes new special line types requested by the SPC)

	o Added the ability to change the fill pattern
	  (only implemented in the product generation)

	o The scaling factor for dashed lines has been increased for the 
	  XW and NC device drivers. This results in expanded dash patterns.

	o The scaling factor for the special line and front pips has been
	  changed for all device drivers. This results in larger pips for
	  the same size factor, when compared to the previous version.

	o Added the ability to plot bold software text

	o Added the 925 mb label to the plots created by SNPROF and SNCROSS


Improvements have been made to NMAP data display and access capabilities:

	Synoptic and aircraft data have been added to NMAP.

	Redesigned the station model editing module.  The table
	prmlst.tbl is now read into memory upon entering NMAP.
	Station models are keyed by the data type, e.g, METAR and
	alias, e.g, SUMMER.  There is a auxiliary table associated
	with each data type, e.g, metar_parms.tbl.  If the table
	exists, the user can select parameters from this table for
	the station model.  Otherwise, the user can only turn
	on/off parameters.


Bug fixes:

	o Fixed problem when more than one session of NMAP is running.
	  More than one session of product generation in the same
	  directory is no longer allowed.  This prevents the working
	  VG file from being corrupted.

	o Fixed problem when model data files are missing.
		    
	o Corrected a bug found by the AWC where the SAVE/SAVE AS
	  operation was not always working properly.

	o Corrected some bugs in the modification tool and undo.
	  Made the operation of the modify tool more consistent.
	  The results of modifying a line are now the same when
	  drawing from the end point back to the line or from the
	  line to the end point.  Also, the modification tool was
	  modified so that the last new point added does not have
	  to be near a vertex on a line but rather within 6 pixels
	  of the line.  The undo button is now unavailable after
	  a Delete All operation.


See the N-AWIPS logs for additional details.  This patch includes
development from 2/24/98 to 5/7/98.


The necessary compiling and linking instructions are contained in
the following file:

	patch_build_5.4.3.h 


To execute the script and save its output in a file type:

	cd $GEMPAK/build
	patch_build_5.4.3.h >&! PATCH_$OS & ; tail -f PATCH_$OS

The output of the script will be written to PATCH_$OS.


