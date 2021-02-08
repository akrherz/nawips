	SUBROUTINE SNLWST  ( time, stid, istnm, slat, slon, selv, 
     +			     ihhmm, luns, nlun, iret )
C************************************************************************
C* SNLWST								*
C*									*
C* This subroutine writes the station information to the output		*
C* devices.								*
C*									*
C* SNLWST  ( TIME, STID, ISTNM, SLAT, SLON, SELV, IHHMM, LUNS, NLUN,	*
C*           IRET )							*
C*									*
C* Input parameters:							*
C*	TIME		CHAR*		Time				*
C*	STID		CHAR*8		Station identifier		*
C*	ISTNM		INTEGER		Station number			*
C*	SLAT		REAL		Station latitude		*
C*	SLON		REAL		Station longitude		*
C*	SELV		REAL		Station elevation		*
C*	IHHMM		INTEGER		Station release time		*
C*	LUNS  (NLUN)	INTEGER		Output LUNS			*
C*	NLUN		INTEGER		Number of output units		*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*					  0 = normal return		*
C**									*
C* Log:									*
C* M. desJardins/GSFC	10/88	GEMPAK 4.1				*
C* M. desJardins/GSFC	11/89	Changes for station time		*
C* K. Brill/NMC		 8/93	Change for 8-char ID			*
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
C*
	CHARACTER*(*)	time, stid
	INTEGER		luns (*)
C*
	CHARACTER	sss*8, ttt*20
C------------------------------------------------------------------------
	iret = 0
C
C*	Write blank line.
C
	DO  i = 1, nlun
	    WRITE  ( luns (i), 1000 )
1000	    FORMAT ( 1X )
	END DO
C
C*	Write station id, number and time.
C
	sss = stid
	ttt = time
	DO  i = 1, nlun
	    WRITE  ( luns (i), 1001, IOSTAT = iostat )  sss, istnm, ttt
1001	    FORMAT (' STID = ', A, 6X, 'STNM = ', I8, 3X, 'TIME = ', A )
	    WRITE  ( luns (i), 1002, IOSTAT = iostat )  slat, slon, selv
1002	    FORMAT ( ' SLAT = ', F6.2, '     SLON = ', F8.2, 
     +               '   SELV = ', F7.1 )
	    IF  ( ihhmm .ne. IMISSD )  THEN
		WRITE  ( luns (i), 1003, IOSTAT = iostat ) ihhmm
1003		FORMAT ( ' STIM = ', I5 )
	    END IF
	END DO
C*
	RETURN
	END
