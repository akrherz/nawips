	SUBROUTINE DMARK ( iwndw, np, x, y, iret )
C************************************************************************
C* DMARK								*
C*									*
C* This subroutine draws markers on the current graphics device.	*
C*									*
C* DMARK ( IWNDW, NP, X, Y, IRET )					*
C*									*
C* Input parameters:							*
C*	IWNDW		INTEGER		Clipping window			*
C*	NP		INTEGER		Number of markers		*
C*	X (NP)		REAL		X coordinates in device units	*
C*	Y (NP)		REAL		Y coordinates in device units	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code			*
C**									*
C* Log:									*
C* M. desJardins/GSFC	 5/85	GEMPLT Version 3.1			*
C* M. Linda/GSC		 3/96	Added check for DEVICE buffer overflow	*
C* M. Linda/GSC		12/96	Changed X and Y to reals		*
C************************************************************************
	INCLUDE		'FUNCCODE.PRM'
	INCLUDE		'ERROR.PRM'
	INCLUDE		'GEMPRM.PRM'
C*
	REAL		x (*), y (*)
C
	INTEGER		isend (4)
C------------------------------------------------------------------------
	iret = NORMAL
C
C*	Check for zero points.
C
	IF ( np .le. 0 ) RETURN
C
C*	Check if DEVICE buffer will overflow.
C
	isnd = 2 + ( 2 + ( 2 * np ) )
	ircv = 1 + ( 1 )
	IF ( ( isnd + ircv ) .gt. IGDSIZ ) THEN
	    iret = NXDBUF
	    RETURN
	END IF
C
C*	Load input parameters into buffer and write them to the mailbox.
C
	isend (1) = isnd
	isend (2) = CMARK
	isend (3) = iwndw
	isend (4) = np
C
	CALL GPUT ( isend, 4, iret )
	IF ( iret .ne. NORMAL ) RETURN
C
	CALL GPUTR ( x, np, iret )
	IF ( iret .ne. NORMAL ) RETURN
C
	CALL GPUTR ( y, np, iret )
	IF ( iret .ne. NORMAL ) RETURN
C
C*	Get output parameters.
C
	CALL GGET ( iret, 1, ierr )
	IF ( ierr .ne. NORMAL ) iret = ierr
C*
	RETURN
	END
