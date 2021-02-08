	SUBROUTINE DXWPRO ( strlns, numlns, iret )
C************************************************************************
C* DXWPRO								*
C*									*
C* This subroutine writes one prologue to a page.			*
C*									*
C* DXWPRO ( STRLNS, NUMLNS, IRET )					*
C*									*
C* Input parameters:							*
C*	STRLNS (NUMLNS)	CHAR*		Array of prologue text lines	*
C*	NUMLNS		INTEGER		Number of lines in prologue	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*					  -7 = prologue too long	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	strlns ( * )
C
	CHARACTER	blanks*128
	CHARACTER	tmpstr ( MAXLNP )*128
C------------------------------------------------------------------------
	iret = 0
	nlns = numlns
C
C*	Test to make sure the prologue and separator are not too long.
C
	nlines = nlns + ISEPLN
C
	IF  ( nlines .gt. MAXLNP ) THEN
	    iret   = -7
	    nlns   = MAXLNP - ISEPLN
	    nlines = MAXLNP
	END IF
C
C*	Add the prologue.
C
	DO  i = 1, nlns
	    tmpstr ( i ) = strlns ( i )
	END DO
C
C*	Add a separator following the prologue.
C
	DO  i = 1, ISEPLN
	    IF  ( i .eq. ( ( 3 * ISEPLN ) / 5 ) ) THEN
		iblnks = ( CLPAGE / 2 ) - LMARGN - 3
		blanks = ''
		tmpstr ( nlns + i ) = blanks ( 1:iblnks )//'-----'
	    ELSE
		tmpstr ( nlns + i ) = ''
	    END IF
	END DO
C
C*	Output the prologue and separator as a contiguous block.
C
	CALL DXWBLK ( tmpstr, nlines )
C*
	RETURN
	END
