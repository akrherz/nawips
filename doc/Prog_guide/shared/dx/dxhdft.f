	SUBROUTINE DXHDFT ( chsubtl )
C************************************************************************
C* DXHDFT								*
C*									*
C* This subroutine constructs the header and footer.			*
C*									*
C* DXHDFT ( CHSUBTL )							*
C*									*
C* Input parameters:							*
C*	CHSUBTL		CHAR*		Chapter subtitle		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	chsubtl
C
	CHARACTER	blanks*128
C------------------------------------------------------------------------
C
C*	Center the chapter subtitle into the header.
C
	CALL ST_LSTR ( chsubtl, istln, iret )
	iblnk = ( CLPAGE / 2 ) - ( istln / 2 )
C
	blanks = ''
	header = blanks ( 1:iblnk ) // chsubtl ( 1:istln )
C
C*	Create the footer.
C
	CALL DXFOOT ( )
C*
	RETURN
	END
