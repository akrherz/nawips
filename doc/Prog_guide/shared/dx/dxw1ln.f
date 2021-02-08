	SUBROUTINE DXW1LN ( onelin )
C************************************************************************
C* DXW1LN								*
C*									*
C* This subroutine writes one line to the output page.			*
C*									*
C* DXW1LN ( ONELIN )							*
C*									*
C* Input parameters:							*
C*	ONELIN		CHAR*		One line of text to write	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	onelin
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
C*	Add a left margin to the line.
C
	blanks = ''
	tmpstr = blanks ( 1:LMARGN ) // onelin
C
C*	Add the line to the page.
C
	lncur = lncur + 1
	page ( lncur ) = tmpstr
C*
	RETURN
	END
