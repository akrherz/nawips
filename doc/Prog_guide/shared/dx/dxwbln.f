	SUBROUTINE DXWBLN ( iskipln )
C************************************************************************
C* DXWBLN								*
C*									*
C* This subroutine writes a number of blank lines to the output.	*
C*									*
C* DXWBLN ( ISKIPLN )							*
C*									*
C* Input parameters:							*
C*	ISKIPLN		INTEGER		Number of blank lines to write	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
C------------------------------------------------------------------------
C
C*	Finish page and start a new one if lines will not fit on page.
C
	IF  ( ( lncur + iskipln ) .gt. ( LNPAGE - LNFOOT ) ) THEN
	    CALL DXNEWP ( )
	END IF
C
C*	Add the blank lines to the page.
C
	DO  i = 1, iskipln
	    page ( lncur + i ) = ''
	END DO
C
	lncur = lncur + iskipln
C*
	RETURN
	END
