	SUBROUTINE DXCERR ( errfil, chsubtl )
C************************************************************************
C* DXCERR								*
C*									*
C* This subroutine writes the errors list section for a chapter in the	*
C* Programmer's Guides.							*
C*									*
C* DXCERR ( ERRFIL, CHSUBTL )						*
C*									*
C* Input parameters:							*
C*	ERRFIL		CHAR*		Path and name of errors file	*
C*	CHSUBTL		CHAR*		Chapter subtitle		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
C*
	CHARACTER*(*)	errfil, chsubtl
C
	CHARACTER	record*128, outrec*128, ehead*128, ehdsp*128
	CHARACTER	blanks*128, errnum*10
	LOGICAL		done
C------------------------------------------------------------------------
C
C*	Try to open the errors file.
C
	CALL FL_SOPN ( errfil, lunerr, ierr )
C
C*	Construct the errors section only if the errors file exists.
C
	IF  ( ierr .eq. 0 ) THEN
C
C*	    Construct the errors section title.
C
	    ibeg = INDEX ( chsubtl, '(' ) + 1
	    iend = INDEX ( chsubtl, ')' ) - 1
C
	    ehead = chsubtl (ibeg:iend) // ' Error Messages'
	    ehdsp = '  ' // ehead
C
C*	    Write out the title.
C
	    CALL DXWBLN ( 3 )
	    CALL DXWCTR ( ehead )
	    CALL DXWBLN ( 1 )
	    CALL DXTOCS ( ehdsp )
C
C*	    Loop through individual lines of the errors file.
C
	    DO  WHILE ( .true. )
C
C*		Read one record from the errors file.
C
		READ ( lunerr, 100, END = 500 ) record
100		FORMAT (A)
C
C*		Skip blank lines and comment lines.
C
		ibang = INDEX ( record, '!' )
		CALL ST_LSTR ( record, ilen, ier )
C
		IF  ( ( ibang .ne. 1 ) .and. ( ilen .gt. 0 ) ) THEN
C
C*		    Find where error message text begins in the record.
C
		    done = .false.
		    ic = ibang
		    DO  WHILE ( ( .not. done ) .and. ( ic .le. ilen ) )
			ic = ic + 1
			IF  ( ( record ( ic:ic ) .ne. ' '  ) .and.
     +			      ( record ( ic:ic ) .ne. '\t' ) ) THEN
			    done = .true.
			END IF
		    END DO
C
C*		    Convert the first '!AS' string to a '...' string.
C
		    ist = INDEX ( record, '!AS' )
		    IF ( ist .gt. 0 ) record ( ist : ist + 2 ) = '...'
C
C*		    Extract the error number out of the record.
C
		    CALL ST_C2C ( record, 1, errnum, np, ier)
		    CALL ST_LSTR ( errnum, ilen, ier )
C
C*		    Wrap brackets around the error number, add comment.
C
		    nblnks = 5 - ilen
		    blanks = ''
		    outrec = '[ ' // chsubtl ( ibeg:iend ) //
     +			     blanks ( :nblnks ) // errnum ( 1:ilen ) //
     +			     ' ]   ' // record ( ic: )
C
C*		    Write out the errors list item.
C
		    CALL DXW1LN ( outrec )
		END IF
	    END DO
500	    CONTINUE
C
C*	    Close the errors file.
C
	    CALL FL_CLOS ( lunerr, ier )
C
C*	    Terminate the current page.
C
	    CALL DXNEWP ( )
	END IF
C*
	RETURN
	END
