	SUBROUTINE DXTOCE ( entry )
C************************************************************************
C* DXTOCE								*
C*									*
C* This subroutine writes a Table Of Contents entry.			*
C*									*
C* DXTOCE ( ENTRY )							*
C*									*
C* Input parameters:							*
C*	ENTRY		CHAR*		Text for the TOC entry		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
	INCLUDE		'dxtoc.cmn'
C*
	CHARACTER*(*)	entry
C
	CHARACTER	blanks*128, tmpstr*128, chapst*10
C------------------------------------------------------------------------
C
C*	Convert the chapter number to a string.
C
	CALL ST_INLN ( ichap, chapst, ilnc, iret )
C
C*	Check for TOC overflow.
C
	IF  ( ( itocln + 4 ) .gt. TOCMAX ) THEN
	    CALL ER_WMSG ( 'DX', -8, chapst, ier )
	    RETURN
	END IF
C
C*	Skip a few lines on the output page.
C
	DO  i = 1, 2
	    itocln = itocln + 1
	    toc ( itocln ) = ''
	END DO
C
C*	Construct the TOC entry.
C
	CALL ST_LSTR ( entry, ilne, iret )
C
	blanks = ''
	tmpstr = 'CHAPTER ' // chapst ( 1:ilnc ) // blanks ( 1:5 ) //
     +		 entry ( 1:ilne )
C
	CALL DXTOCS ( tmpstr )
C
C*	Skip one more line on the output page.
C
	itocln = itocln + 1
	toc ( itocln ) = ''
C*
	RETURN
	END
