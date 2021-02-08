	SUBROUTINE DXWFIN ( )
C************************************************************************
C* DXWFIN								*
C*									*
C* This subroutine writes the tail on the end of the output file for	*
C* the Programmer's Guides.						*
C*									*
C* DXWFIN ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
C------------------------------------------------------------------------
C
C*	Add a blank page for an even page count (for double-sided output).
C
	IF ( MOD ( ipgnm, 2 ) .eq. 0 ) CALL DXNEWP ( )
C*
	RETURN
	END
