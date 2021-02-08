	SUBROUTINE DXWCNM ( )
C************************************************************************
C* DXWCNM								*
C*									*
C* This subroutine writes the chapter title line.			*
C*									*
C* DXWCNM ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER	chtitl*128, chapst*10
C------------------------------------------------------------------------
C
C*	Construct the title line.
C
	CALL ST_INLN ( ichap, chapst, ilen, iret )
	chtitl = 'Chapter ' // chapst ( 1:ilen )
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
