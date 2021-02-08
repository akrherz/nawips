	SUBROUTINE DXWCTR ( strout )
C************************************************************************
C* DXWCTR								*
C*									*
C* This subroutine writes the string centered on a page.		*
C*									*
C* DXWCTR ( STROUT )							*
C*									*
C* Input parameters:							*
C*	STROUT		CHAR*		String to write			*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	strout
C
	CHARACTER	blanks*128, tmpstr*128
C------------------------------------------------------------------------
C
C*	Finish page and start a new one if lines will not fit on page.
C
	IF  ( ( lncur + 1 ) .gt. ( LNPAGE - LNFOOT ) ) THEN
	    CALL DXNEWP ( )
	END IF
C
C*	Determine how many blanks to prepend on the string to center it.
C
	CALL ST_LSTR ( strout, istln, iret )
	iblnk = 40 - ( istln / 2 )
C
C*	Write out the concatenation of blanks and the string.
C
	blanks = ''
	tmpstr = blanks ( 1:iblnk ) // strout ( 1:istln )
	lncur = lncur + 1
	page ( lncur ) = tmpstr ( 1:iblnk+istln )
C*
	RETURN
	END
