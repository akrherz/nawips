	SUBROUTINE DXCCVR ( txtfil, chsubtl )
C************************************************************************
C* DXCCVR								*
C*									*
C* This subroutine constructs the chapter cover page and creates the	*
C* chapter title for the Programmer's Guides.				*
C*									*
C* DXCCVR ( TXTFIL, CHSUBTL )						*
C*									*
C* Input parameters:							*
C*	TXTFIL		CHAR*		Path and name of text file	*
C*									*
C* Output parameters:							*
C*	CHSUBTL		CHAR*		Chapter subtitle		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Based on DOCHCVR			*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER*(*)	txtfil, chsubtl
C------------------------------------------------------------------------
C
C*	Open the text (chapter introduction) file.
C
	CALL FL_SOPN ( txtfil, luntxt, iret )
C
	IF  ( iret .ne. 0 )  THEN
	    CALL ER_WMSG ( 'FL', iret, txtfil, ier )
	    STOP
	END IF
C
C*	Get the first line (chapter subtitle) from the text file.
C
	CALL DXGLN1 ( luntxt, chsubtl, iret )
	CALL ST_RXBL ( chsubtl, chsubtl, ilen, iret )
C
C*	Close the text file.
C
	CALL FL_CLOS ( luntxt, ier )
C
C*	Write the chapter number.
C
	IF  ( ichap .gt. 0 ) THEN
	    CALL DXWCNM ( )
	ELSE IF ( ichap .eq. -9999 ) THEN
	    CALL DXWANM ( )
	END IF
C
C*	Write the chapter subtitle and set the subtitle in the header.
C
	CALL DXCHSB ( chsubtl )
C*
	RETURN
	END
