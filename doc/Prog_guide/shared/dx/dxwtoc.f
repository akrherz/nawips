	SUBROUTINE DXWTOC ( )
C************************************************************************
C* DXWTOC								*
C*									*
C* This subroutine writes out the Table of Contents (TOC) for the	*
C* Programmer's Guides.							*
C*									*
C* DXWTOC ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxtoc.cmn'
C*
C------------------------------------------------------------------------
C
	DO  i = 1, itocln
	    CALL ST_LSTR ( toc ( i ), ilen, iret )
	    WRITE ( luntoc, '(A)' ) toc ( i ) ( 1:ilen )
	END DO
C*
	RETURN
	END
