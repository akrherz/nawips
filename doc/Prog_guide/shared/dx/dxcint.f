	SUBROUTINE DXCINT ( txtfil )
C************************************************************************
C* DXCINT								*
C*									*
C* This subroutine constructs the chapter introductory text page in the	*
C* Programmer's Guides.							*
C*									*
C* DXCINT ( TXTFIL )							*
C*									*
C* Input parameters:							*
C*	TXTFIL		CHAR*		Path and name of text file	*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
C*
	CHARACTER*(*)	txtfil
C
	CHARACTER	onerec*128, tmpstr*128
C------------------------------------------------------------------------
C
C*	Open the text file.
C
	CALL FL_SOPN ( txtfil, luntxt, iret )
C
	IF  ( iret .ne. 0 ) THEN
	    CALL ER_WMSG ( 'FL', iret, txtfil, ier )
	    STOP
	END IF
C
C*	Read the first non-blank line.
C
	CALL DXGLN1 ( luntxt, onerec, iret )
C
C*	Write the line as a title centered on the page.
C
	CALL ST_RXBL ( onerec, onerec, ilen, iret )
	CALL DXWBLN  ( 3 )
	CALL DXWCTR  ( onerec )
C
C*	Make a corresponding Table Of Contents entry.
C
	tmpstr = "  Introduction"
	CALL DXTOCS ( tmpstr )
C
C*	Read and write the rest of the records from the text file.
C
	DO  WHILE ( .true. )
C
	    READ ( luntxt, 100, END = 500 ) onerec
100	    FORMAT (A)
C
	    CALL DXW1LN ( onerec )
	END DO
500	CONTINUE
C
C*	Close the text file.
C
	CALL FL_CLOS ( luntxt, ier )
C
C*	Terminate the current page.
C
	CALL DXNEWP ( )
C*
	RETURN
	END
