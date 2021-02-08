	SUBROUTINE DXPTXT ( txtfil, chsubtl )
C************************************************************************
C* DXPTXT								*
C*									*
C* This subroutine paginates a text file into one chapter of the	*
C* Programmer's Guides.							*
C*									*
C* DXPTXT ( TXTFIL, CHSUBTL )						*
C*									*
C* Input parameters:							*
C*	TXTFIL		CHAR*		Path and name of text file	*
C*	CHSUBTL		CHAR*		Chapter subtitle		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	txtfil, chsubtl
C
	CHARACTER	onerec*128
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
C*	Skip over the first line (chapter subtitle) in the text file.
C
	CALL DXGLN1 ( luntxt, chsubtl, iret )
C
C*	Read and write the rest of the records from the text file.
C
	DO  WHILE ( .true. )
C
	    READ ( luntxt, 100, END = 500 ) onerec
100	    FORMAT (A)
C
	    CALL ST_LSTR ( onerec, ilen, ier )
	    CALL ST_UTAB ( onerec, ilen, onerec, ier )
	    CALL DXW1LN  ( onerec )
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
