	SUBROUTINE DXWBLK ( strlns, numlns )
C************************************************************************
C* DXWBLK								*
C*									*
C* This subroutine writes a block of strings to a page.  It first	*
C* checks if the block will fit on the rest of the current page.  If it	*
C* will not fit, ejects to a new page.  Writes the block to the page(s)	*
C* and ejects to a new page as the pages fill up.			*
C*									*
C* DXWBLK ( STRLNS, NUMLNS )						*
C*									*
C* Input parameters:							*
C*	STRLNS (NUMLNS)	CHAR*		Array of strings to write	*
C*	NUMLNS		INTEGER		Number of lines in array	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	strlns ( * )
C
	CHARACTER	blanks*128
C------------------------------------------------------------------------
C
C*	Check if the block of lines will fit on the rest of this page.
C
	IF  ( ( lncur + numlns ) .gt. ( LNPAGE - LNFOOT ) ) THEN
C
C*	    Lines will not fit on the rest of this page.
C
	    IF  ( lncur .gt. LNHEAD ) THEN
C
C*		Start a new page unless one was just started.
C
		CALL DXNEWP ( )
	    END IF
	END IF
C
C*	Add lines, filling up pages, as needed.
C
	blanks = ''
	lnpp = ( LNPAGE - LNHEAD - LNFOOT )
	npass = 1 + ( ( numlns - 1 ) / lnpp )
	DO  j = 1, npass
C
C*	    Add the left margin and output a page-full.
C
	    lnadd = lnpp
	    IF ( j .eq. npass ) lnadd = numlns - ( npass - 1 ) * lnpp
C
	    ibeg = 1 + ( j - 1 ) * lnpp
	    iend = j * lnpp
	    IF ( j .eq. npass ) iend = ibeg + lnadd - 1
C
	    DO  i = ibeg, iend
		lncur = lncur + 1
		page ( lncur ) = blanks ( 1:LMARGN ) // strlns ( i )
	    END DO
C
C*	    Eject the page and start the next page.
C
	    IF  ( j .ne. npass ) THEN
		CALL DXNEWP ( )
	    END IF
	END DO
C*
	RETURN
	END
