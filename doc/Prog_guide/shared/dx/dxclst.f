	SUBROUTINE DXCLST ( lstfil )
C************************************************************************
C* DXCLST								*
C*									*
C* This subroutine creates the list of routine names for the chapter	*
C* cover page in the Programmer's Guides.				*
C*									*
C* DXCLST ( LSTFIL )							*
C*									*
C* Input parameters:							*
C*	LSTFIL		CHAR*		Path and name of lists file	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	lstfil
C
	CHARACTER	fname*128, descr*128, rec1*128, rec2*128
	CHARACTER	blanks*128
	LOGICAL		eof
C------------------------------------------------------------------------
C
C*	Skip a few lines before the list of routine names.
C
	CALL DXWBLN ( 5 )
C
C*	Open the lists file.
C
	CALL FL_SOPN ( lstfil, lunlst, iret )
C
	IF  ( iret .ne. 0 ) THEN
	    CALL ER_WMSG ( 'FL', iret, lstfil, ier )
	    STOP
	END IF
C
C*	Loop through the lists file.
C
	eof = .false.
	DO  WHILE ( .not. eof )
C
C*	    Get the next source code file name and description.
C
	    CALL DXGETF ( lunlst, fname, descr, iret )
	    IF  ( iret .ne. 0 ) eof = .true.
C
	    IF  ( .not. eof ) THEN
C
C*		Open the source code file.
C
		CALL FL_SOPN ( fname, lunsrc, iret )
C
		IF  ( iret .ne. 0 ) THEN
		    CALL ER_WMSG ( 'FL', iret, fname, ier )
		    STOP
		END IF
C
C*		Get the subroutine name.
C
		CALL DXGTNM ( lunsrc, rec1, iret )
		IF  ( iret .ne. 0 ) THEN
		    CALL ER_WMSG ( 'DX', iret, fname, ier )
		    rec1 = '????'
		END IF
C
		CALL ST_LDSP ( rec1, rec1, ilen, ier )
C
C*		Add a description to the name, and output the line.
C
		blanks = ''
		rec2 = blanks ( 1:8 ) // rec1 ( 1:15 ) // ' ' // descr
C
		CALL DXW1LN ( rec2 )
C
C*		Close the source code file.
C
		CALL FL_CLOS ( lunsrc, iret )
	    END IF
	END DO
C
C*	Close the lists file.
C
	CALL FL_CLOS ( lunlst, iret )
C
	CALL DXNEWP ( )
C*
	RETURN
	END
