	SUBROUTINE DXGTNM ( lun, record, iret )
C************************************************************************
C* DXGTNM								*
C*									*
C* This subroutine returns the routine name from within a file's	*
C* prologue.								*
C*									*
C* DXGTNM ( LUN, RECORD, IRET )						*
C*									*
C* Input parameters:							*
C*	LUN		INTEGER		Logical unit number of the file	*
C*									*
C* Output parameters:							*
C*	RECORD		CHAR*		Record with subroutine name	*
C*	IRET		INTEGER		Return code			*
C*					 -1 = premature end of prologue	*
C*					 -2 = bad right border		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
C*
	CHARACTER*(*)	record
C
	LOGICAL		found
C------------------------------------------------------------------------
	iret = -1
C
C*	Read records until the start of the prologue is found.
C
	found = .false.
	DO  WHILE ( .not. found )
	    READ ( lun, '(A)', END = 500 ) record
	    IF ( record ( 2:3 ) .eq. '**' ) found = .true.
	END DO
C
C*	Read the record with the routine name.
C
	READ ( lun, '(A)', END = 500 ) record
C
C*	Strip the prologue border off the record.
C
	CALL DXSTRP ( record, iret )
C
500	CONTINUE
C*
	RETURN
	END
