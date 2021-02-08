	SUBROUTINE DXFOOT ( )
C************************************************************************
C* DXFOOT								*
C*									*
C* This subroutine sets the footer text.				*
C*									*
C* DXFOOT ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
C*
	CHARACTER	strinl*128, strinr*128
C------------------------------------------------------------------------
C
	strinl = "GEMPAK Bridge Prog. Guide"
	strinr = "December 1997"
C
	CALL DXFTER ( strinl, strinr )
C*
	RETURN
	END
