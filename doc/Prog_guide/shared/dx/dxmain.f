	PROGRAM DXMAIN
C************************************************************************
C* DXMAIN								*
C*									*
C* This program constructs one chapter of the Programmer's Guide.	*
C*									*
C* Prologues of each GEMPAK source code file are read line by line,	*
C* the border is removed, and the text is placed on the output pages	*
C* with almost no processing.						*
C*									*
C* Input parameters:							*
C*	lists file	    $1 is a path to a file that specifies	*
C*				the content of one chapter in the book.	*
C*				The lists file is a list of paths to	*
C*				GEMPAK source code files.  It also	*
C*				contains associated descriptive names	*
C*				for the subroutines in the source code	*
C*				files.  The order of the entries in the	*
C*				lists file specifies the order of	*
C*				subroutines in the resulting chapter.	*
C*	text file	    $2 is a path to a file of text that		*
C*				becomes the chapter's introduction.	*
C*	errors file	    $3 is a path to the GEMPAK list of error	*
C*				codes and error message texts for the	*
C*				chapter.				*
C*	output file	    $4 is the path of the output file.  The	*
C*				output file is a simple ASCII text file	*
C*				that is intended to be printed out on a	*
C*				line printer with no further		*
C*				modifications.				*
C*	TOC file	    $5 is the path of the temporary file that	*
C*				holds the Table Of Contents for this	*
C*				chapter.				*
C*	chapter number	    $6 is the number of the chapter.  It is	*
C*				used in the chapter title, in numbering	*
C*				the subroutines, and in page numbers.	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Based on glibmif.f			*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
	INCLUDE		'dxtoc.cmn'
C*
	CHARACTER	txtfil*128, outfil*128, chsubtl*128
	CHARACTER	lstfil*128, tocfil*128, errfil*128
C------------------------------------------------------------------------
C
C*	Get the number of arguments on the command line and check it.
C
	narg = iargc ()
	IF  ( narg .lt. 6 ) THEN
	    WRITE ( *,* ) 'ERROR: The following arguments are required:'
	    WRITE ( *,* ) '    1. path of lists file'
	    WRITE ( *,* ) '    2. path of text file'
	    WRITE ( *,* ) '    3. path of errors file'
	    WRITE ( *,* ) '    4. path of output file'
	    WRITE ( *,* ) '    5. path of temporary TOC file'
	    WRITE ( *,* ) '    6. chapter number'
	    STOP
	END IF
C
C*	Get the command line arguments.
C
	CALL GETARG ( 1, lstfil )
	CALL GETARG ( 2, txtfil )
	CALL GETARG ( 3, errfil )
	CALL GETARG ( 4, outfil )
	CALL GETARG ( 5, tocfil )
	CALL GETARG ( 6, chnumb )
C
C*	Create the output file.
C
	CALL FL_SWOP ( outfil, lunout, ierr )
C
	IF  ( ierr .ne. 0 ) THEN
	    CALL ER_WMSG ( 'FL', ierr, outfil, ier )
	    STOP
	END IF
C
C*	Create the temporary TOC file for this one chapter.
C
	CALL FL_SWOP ( tocfil, luntoc, ierr )
C
	IF  ( ierr .ne. 0 ) THEN
	    CALL ER_WMSG ( 'FL', ierr, tocfil, ier )
	    STOP
	END IF
C
C*	Convert the chapter number to an integer.
C
	CALL ST_LSTR ( chnumb, ilen, iret )
	CALL ST_INTG ( chnumb ( 1:ilen ), ichap, iret )
C
C*	Initialize page numbering and line counting.
C
	ipgnm = 1
	lncur = LNHEAD
C
C*	Construct the chapter cover page.
C
	CALL DXCCVR ( txtfil, chsubtl )
	CALL DXCLST ( lstfil )
C
C*	Construct the chapter introduction.
C
	CALL DXCINT ( txtfil )
C
C*	Construct the errors list.
C
	CALL DXCERR ( errfil, chsubtl )
C
C*	Construct the chapter body pages.
C
	CALL DXCBOD ( lstfil )
C
C*	Finish up the Table Of Contents and the output file.
C
	CALL DXWTOC ( )
	CALL DXWFIN ( )
C
C*	Close all files.
C
	CALL FL_CLAL ( ier )
C*
	STOP
	END
