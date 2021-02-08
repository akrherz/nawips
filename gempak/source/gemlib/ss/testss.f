	PROGRAM TESTSS
C************************************************************************
C* TESTSS								*
C*									*
C* This program tests the System Service subroutines.			*
C**									*
C* Log:									*
C* I. Graffman/RDS	 9/88						*
C* M. desJardins/GSFC	 7/90						*
C* S. Jacobs/NMC	10/94		Added SS_ENVR			*
C* D. Keiser/GSC	 8/95		Added SS_LTIM			*
C* S. Schotz/NCEP	12/96		Removed SS_IRET			*
C* S. Jacobs/NCEP	 2/97		Added SS_VERS			*
C* B. Yin/SAIC   	 3/04		Removed SS_LTIM and SS_GTIM	*
C* T. Piper/SAIC	10/04	Modified for change to SS_WAIT		*
C************************************************************************
	CHARACTER 	symnam*20, symval*72,
     +			filnam*72, file*132, vmsg*72
C-------------------------------------------------------------------------
	CALL IN_BDTA ( iret )
	iostat = 0
	DO WHILE  ( iostat .eq. 0 )
	    WRITE  (6,20)
20	    FORMAT 
     +     (' 2 = SS_EXIT   3 = SS_ENVR   4 = SS_WAIT'/, 
     +      ' 5 = SS_GSYM   6 = SS_VERS   7 = SS_PAGE   ' )
	    CALL TM_INT ( 'Select a subroutine number', .false.,
     +                     .false., 1, numsub, n, ier )
	IF ( ier .eq. 2 ) THEN
           iostat = -1
           numsub = -1
	END IF
2	    FORMAT (A)
C------------------------------------------------------------------------
	      IF (numsub .eq. 2) THEN
		CALL SS_EXIT
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 3) THEN
		WRITE(6,*)' Enter file name'
		READ (5,2) filnam
		CALL SS_ENVR ( filnam, file, iret )
		WRITE (6, *) 'iret, file ', iret, ' ', file
   	        IF (iret .ne. 0) CALL ER_WMSG ('SS', iret, ' ', ierr)
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 4) THEN
		WRITE (6,*) 'Enter seconds'
		READ (5,*) secnds
		CALL SS_WAIT ( secnds, iret)
	        IF (iret .ne. 0) CALL ER_WMSG ('SS', iret, ' ', ierr)
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 5)  THEN
		WRITE(6,*)' Enter symbol'
		READ (5,2) symnam
		CALL SS_GSYM (symnam, symval, iret)
		WRITE(6,*) 'symval between : ',':', symval, ':'
   	        IF (iret .ne. 0) CALL ER_WMSG ('SS', iret, ' ', ierr)
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 6)  THEN
		CALL SS_VERS ( vmsg, iret)
		WRITE (6, *) 'iret, vmsg ', iret, ' ', vmsg
		IF (iret .ne. 0) CALL ER_WMSG ('SS', iret, ' ', ierr)
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 7) THEN
		CALL SS_PAGE (iret)
   	        IF (iret .ne. 0) CALL ER_WMSG ('SS', iret, ' ', ierr)
C-------------------------------------------------------------------------
	    END IF
	END DO
	END
