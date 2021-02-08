	PROGRAM DXTEXT
C************************************************************************
C* DXTEXT								*
C*									*
C* This program paginates a chapter of fixed text (or the Table of	*
C* Contents) for the Programmer's Guide.				*
C*									*
C* Input parameters:							*
C*	raw text file	    $1 is a path to a non-paginated text file.	*
C*	output file	    $2 is the path of the output file.		*
C*	chapter number	    $3 is the number of the chapter (or the	*
C*				letter of the appendix).  It is used in	*
C*				the chapter title and in page numbers.	*
C*	first page number   $4 is the first page number.  Most chapters	*
C*				start with page number 1, but the table	*
C*				of contents starts with page 3.		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Based on glibmif.f			*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER	txtfil*128, outfil*128, chsubtl*128
	CHARACTER	pg1num*128
C------------------------------------------------------------------------
C
C*	Get the number of arguments on the command line and check it.
C
	narg = iargc ()
	IF  ( narg .lt. 4 ) THEN
	    WRITE ( *,* ) 'ERROR: The following arguments are required:'
	    WRITE ( *,* ) '    1. path of raw text file'
	    WRITE ( *,* ) '    2. path of output file'
	    WRITE ( *,* ) '    3. chapter number'
	    WRITE ( *,* ) '    4. first page number'
	    STOP
	END IF
C
C*	Get the command line arguments.
C
	CALL GETARG ( 1, txtfil )
	CALL GETARG ( 2, outfil )
	CALL GETARG ( 3, chnumb )
	CALL GETARG ( 4, pg1num )
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
C*	Convert the chapter number to an integer.
C
	CALL ST_LSTR ( chnumb, ilen, iret )
	CALL ST_INTG ( chnumb ( 1:ilen ), ichap, iret )
C
C*	Convert the first page number to an integer.
C
	CALL ST_LSTR ( pg1num, ilen, iret )
	CALL ST_INTG ( pg1num ( 1:ilen ), ipgnm, iret )
C
C*	Initialize line counting.
C
	lncur = LNHEAD
C
C*	Construct the chapter cover page.
C
	CALL DXCCVR ( txtfil, chsubtl )
C
C*	Construct the chapter body pages.
C
	CALL DXPTXT ( txtfil, chsubtl )
C
C*	Finish up the output file.
C
	CALL DXWFIN ( )
C
C*	Close all files.
C
	CALL FL_CLAL ( ier )
C*
	STOP
	END
