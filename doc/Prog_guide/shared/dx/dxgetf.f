	SUBROUTINE DXGETF ( lunlst, fname, descr, iret )
C************************************************************************
C* DXGETF								*
C*									*
C* This subroutine gets the next file name and description from the	*
C* lists file.								*
C*									*
C* DXGETF ( LUNLST, FNAME, DESCR, IRET )				*
C*									*
C* Input parameters:							*
C*	LUNLST		INTEGER		Lists file logical unit number	*
C*									*
C* Output parameters:							*
C*	FNAME		CHAR*		File name from lists file	*
C*	DESCR		CHAR*		Description from lists file	*
C*	IRET		INTEGER		Return code			*
C*					 -4 = end of file reached	*
C**									*
C* Log:									*
C* K. Tyle/GSC		 9/95	Original				*
C* M. Linda/GSC		12/97	Corrected check for no description	*
C************************************************************************
C*
	CHARACTER*(*)	fname, descr
C
	CHARACTER	record*128, rec*128
C------------------------------------------------------------------------
	iret = 0
C
C*	Step sequentially through the records in the lists file.
C
	DO  WHILE ( .true. )
C
C*	    Read the next record from the lists file.
C
	    READ ( lunlst, '(A)', END = 500 ) record
C
C*	    Process the record only if it is not a comment and not blank.
C
	    CALL ST_RMBL ( record, rec, length, ier )
	    IF  (( rec ( 1:1 ) .ne. '#' ) .and. ( length .ne. 0 )) THEN
C
C*		Extract the file name from the record.
C
		CALL ST_CLST ( record, ' ', ' ', 1, fname, num, ier )
C
C*		Extract the description from the record.
C
		ibeg = INDEX ( record, '-' )
C
		IF  ( ibeg .ne. 0 ) THEN
		    CALL ST_LSTR ( record, iend, ier )
		    descr = record ( ibeg + 1 : iend )
		    CALL ST_RXBL ( descr, descr, length, ier )
		ELSE
		    length = 0
		END IF
C
C*		Finished if the description is not blank.
C
		IF ( length .ne. 0 ) RETURN
C
		CALL ER_WMSG ( 'DX', -5, fname, ier )
	    END IF
	END DO
C
C*	Set the error code if the end of file was reached (unexpectedly).
C
500	CONTINUE
	iret = -4
C*
	RETURN
	END
