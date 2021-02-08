	SUBROUTINE DXWANM ( )
C************************************************************************
C* DXWANM								*
C*									*
C* This subroutine writes the appendix title line.			*
C*									*
C* DXWANM ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER	chtitl*128
C------------------------------------------------------------------------
C
C*	Construct the title line.
C
	CALL ST_LSTR ( chnumb, ilen, iret )
	chtitl = 'Appendix ' // chnumb ( 1:ilen )
C
	CALL ST_LCUC ( chtitl, chtitl, iret )
C
C*	Output the title line.
C
	CALL DXWBLN ( 11 )
	CALL DXWCTR ( chtitl )
	CALL DXWBLN ( 1 )
C*
	RETURN
	END
