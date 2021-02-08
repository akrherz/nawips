	SUBROUTINE DXSTRP ( record, iret )
C************************************************************************
C* DXSTRP								*
C*									*
C* This subroutine strips the prologue border from around a record and	*
C* converts tabs into spaces.						*
C*									*
C* DXSTRP ( RECORD, IRET )						*
C*									*
C* Input and output parameters:						*
C*	RECORD		CHAR*		Record to strip border from	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*					 -2 = bad right border		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
C*
	CHARACTER*(*)	record
C
	CHARACTER	chtab*1, record2*128
	LOGICAL		found
C
	DATA		chtab / 9 /
C------------------------------------------------------------------------
	iret = 0
C
C*	Strip the left border.
C
	record ( 1:1 ) = ' '
	IF ( record ( 2:2 ) .eq. '*' ) record ( 2:2 ) = ' '
C
C*	Strip the right border.
C
	CALL ST_LSTR ( record, ilen, ier )
C
	i = ilen
	found = .false.
	DO  WHILE ( ( .not. found ) .and. ( i .gt. 0 ) )
	    IF  ( record ( i:i ) .eq. '*' ) THEN
		record ( i:i ) = ' '
		found = .true.
	    ELSE
		IF ( ( record ( i:i ) .ne.   ' ' ) .and.
     +		     ( record ( i:i ) .ne. chtab ) ) iret = -2
		i = i - 1
		IF ( i .le. 0 ) iret = -2
	    END IF
	END DO
C
	CALL ST_LSTR ( record, ilen, ier )
	CALL ST_UTAB ( record, ilen, record2, ier )
C
C*	Remove up to the first 3 leading spaces.
C
	ibeg = 2
	IF ( record2 ( 2:2 ) .eq. ' ' ) ibeg = 3
	IF ( record2 ( 2:3 ) .eq. ' ' ) ibeg = 4
C
	record = record2 ( ibeg: )
C*
	RETURN
	END
