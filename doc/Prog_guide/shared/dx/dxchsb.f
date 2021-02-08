	SUBROUTINE DXCHSB ( chsubtl )
C************************************************************************
C* DXCHSB								*
C*									*
C* This subroutine writes the chapter subtitle and initializes the	*
C* header and the footer.						*
C*									*
C* DXCHSB ( CHSUBTL )							*
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
C------------------------------------------------------------------------
C
C*	Write out the chapter subtitle.
C
	CALL ST_LCUC ( chsubtl, chsubtl, iret )
C
	CALL DXWCTR ( chsubtl )
	CALL DXTOCE ( chsubtl )
C
C*	Initialize the header and the footer.
C
	CALL DXHDFT ( chsubtl )
C*
	RETURN
	END
