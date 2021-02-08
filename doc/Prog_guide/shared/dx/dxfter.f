	SUBROUTINE DXFTER ( strinl, strinr )
C************************************************************************
C* DXFTER								*
C*									*
C* This subroutine constructs the footer string (leaving a blank space	*
C* in the center for the page number).					*
C*									*
C* DXFTER ( STRINL, STRINR )						*
C*									*
C* Input parameters:							*
C*	STRINL		CHAR*		Left  part of the footer	*
C*	STRINR		CHAR*		Right part of the footer	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	strinl, strinr
C
	CHARACTER	blanks*128
C------------------------------------------------------------------------
C*	Combine the left and right parts of the footer.
C
	CALL ST_LSTR ( strinl, ill, iret )
	CALL ST_LSTR ( strinr, ilr, iret )
	ilb = CLPAGE - ill - ilr - LMARGN - RMARGN
C
C*	Set the footer string in the common.
C
	blanks = ''
	footer = blanks ( 1:LMARGN ) // strinl ( 1:ill ) //
     +		 blanks ( 1:ilb )    // strinr ( 1:ilr )
C*
	RETURN
	END
