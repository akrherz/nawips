	SUBROUTINE DXGLN1 ( lun, record, iret )
C************************************************************************
C* DXGLN1								*
C*									*
C* This subroutine returns the first non-blank record from the given	*
C* file.								*
C*									*
C* DXGLN1 ( LUN, RECORD, IRET )						*
C*									*
C* Input parameters:							*
C*	LUN		INTEGER		Logical unit number of the file	*
C*									*
C* Output parameters:							*
C*	RECORD		CHAR*		First non-blank record		*
C*	IRET		INTEGER		Return code			*
C*					 -4 = end of file reached	*
C**									*
C* Log:									*
C* K. Brill/NMC		 3/93	Original				*
C* M. Linda/GSC		12/97	Cleaned up				*
C************************************************************************
C*
	CHARACTER*(*)	record
C------------------------------------------------------------------------
	iret = 0
C
C*	Step sequentially through the records in the file.
C
	DO  WHILE ( .true. )
C
C*	    Read the records until a record is not blank.
C
	    READ ( lun, '(A)', END = 500 ) record
	    IF ( record .ne. ' ' ) RETURN
	END DO
C
C*	Set the error code if the end of file was reached (unexpectedly).
C
500	CONTINUE
	iret = -4
C*
	RETURN
	END
