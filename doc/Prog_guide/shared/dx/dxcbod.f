	SUBROUTINE DXCBOD ( lstfil )
C************************************************************************
C* DXCBOD								*
C*									*
C* This subroutine constructs the main chapter body pages for the	*
C* Programmer's Guides.							*
C*									*
C* DXCBOD ( LSTFIL )							*
C*									*
C* Input parameters:							*
C*	LSTFIL		CHAR*		Path and name of lists file	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Based on DOCHBOD			*
C************************************************************************
C*
	CHARACTER*(*)	lstfil
C
	CHARACTER	fname*128, descr*128
	LOGICAL		eof
C------------------------------------------------------------------------
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
	eof   = .false.
	ilist = 0
	DO  WHILE ( .not. eof )
C
C*	    Get the next source code file name and description.
C
	    CALL DXGETF ( lunlst, fname, descr, iret )
C
	    IF  ( iret .eq. 0 ) THEN
C
C*		Process the prologue of the one source code file.
C
		CALL DXCBR1 ( fname, descr, ilist )
	    ELSE
		eof = .true.
	    END IF
	END DO
C
C*	Close the lists file.
C
	CALL FL_CLOS ( lunlst, ier )
C
	CALL DXNEWP ( )
C*
	RETURN
	END
