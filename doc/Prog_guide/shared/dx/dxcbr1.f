	SUBROUTINE DXCBR1 ( fname, descr, ilist )
C************************************************************************
C* DXCBR1								*
C*									*
C* This subroutine processes the prologue of one source code file	*
C* within the main chapters of the Programmer's Guides.			*
C*									*
C* DXCBR1 ( FNAME, DESCR, ILIST )					*
C*									*
C* Input parameters:							*
C*	FNAME		CHAR*		File name from lists file	*
C*	DESCR		CHAR*		Description from lists file	*
C*									*
C* Input and output parameters:						*
C*	ILIST		INTEGER		Current count in lists file	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Based on DOCHBOD			*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	fname, descr
C
	CHARACTER	currec*128, tocrec*128, chapst*10, routst*10
	CHARACTER	prolog ( MAXLNP )*128
	LOGICAL		found, finish, line1
C------------------------------------------------------------------------
C
C*	Open the source code file.
C
	CALL FL_SOPN ( fname, lunsrc, iret )
C
	IF  ( iret .ne. 0 ) THEN
	    CALL ER_WMSG ( 'FL', iret, fname, ier )
	    STOP
	END IF
C
	linenum = 0
	tocrec = '   ????'
C
C*	Skip to the beginning of the prologue.
C
	found = .false.
	DO  WHILE ( .not. found )
	    READ ( lunsrc, '(A)', END = 500 ) currec
	    IF ( currec (2:3) .eq. '**' ) found = .true.
	END DO
C
C*	Process individual lines of the prologue.
C
	line1  = .true.
	finish = .false.
	DO  WHILE ( found .and. ( .not. finish ) )
C
C*	    Read a record from the source file prologue.
C
	    READ ( lunsrc, '(A)', END = 500 ) currec
C
C*	    Stop if end of prologue was reached.
C
	    IF  ( currec (2:3) .eq. '**' ) THEN
		finish = .true.
	    ELSE
C
C*		Strip the border from around the prologue.
C
		CALL DXSTRP ( currec, iret )
		CALL ER_WMSG ( 'DX', iret, fname, ier )
C
		IF  ( line1 ) THEN
C
C*		    Increment counter of processed source files.
C
		    ilist = ilist + 1
C
C*		    Concatenate subroutine name with its description.
C
		    IF  ( currec .eq. ' ' )
     +			CALL ER_WMSG ( 'DX', -3, fname, ier )
C
		    CALL ST_LDSP ( currec, currec, llstr, iret )
C
		    tocrec = '   ' // currec (1:12) // ' ' // descr
C
		    CALL ST_INLN ( ichap, chapst, ilnc, ier )
		    CALL ST_INLN ( ilist, routst, ilnr, ier )
C
		    currec = chapst ( 1:ilnc ) // '.' //
     +			     routst ( 1:ilnr ) // '  ' // tocrec
C
		    line1 = .false.
		END IF
C
C*		Check for overflows of the string array.
C
		IF  ( linenum .lt. MAXLNP ) THEN

		    linenum = linenum + 1
		    CALL ST_LSTR ( currec, llstr, ier )
		    maxcol = CLPAGE - LMARGN - RMARGN
C
		    IF  ( llstr .le. maxcol ) THEN
			prolog ( linenum ) = currec ( 1:llstr )
		    ELSE
			prolog ( linenum ) = currec ( 1:maxcol )
			CALL ER_WMSG ( 'DX', -6, fname, ier )
		    END IF
		ELSE
		    finish = .true.
		END IF
	    END IF
	END DO
500	CONTINUE
C
C*	Write the prologue text and the TOC entry.
C
	CALL DXWPRO ( prolog, linenum, iret )
	CALL ER_WMSG ( 'DX', iret, fname, ier )
C
	CALL DXTOCS ( tocrec )
C
C*	Close the source code file.
C
	CALL FL_CLOS ( lunsrc, ier )
C*
	RETURN
	END
