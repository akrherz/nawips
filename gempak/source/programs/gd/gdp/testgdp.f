	PROGRAM TESTGDP
C************************************************************************
C* TESTGDP								*
C*									*
C* This program tests the GDPLOT program subroutines			*
C*									*
C**									*
C* Log:									*
C* D.W.Plummer/NCEP	 1/97	From TESTGD				*
C* D.W.Plummer/NCEP	 8/98	Change calling sequence of GDPTMS	*
C* D.W.Plummer/NCEP	 2/99	Added GPLT access and call to GDPWND	*
C* T. Lee/GSC		12/00	Used LLMXLN for input string length	*
C* T. Piper/SAIC        01/08   Added GD_INIT; removed from IN_BDTA     *
C************************************************************************
	PARAMETER	( MAXTMS = 100 )
	PARAMETER	( MAXBAN = 10 )
	INCLUDE		'GEMPRM.PRM'
	INCLUDE		'GMBDTA.CMN'
C
        CHARACTER       gdfile*(LLMXLN), gdfilo*(LLMXLN), 
     +                  gdfilc*(LLMXLN), gdatim*(LLMXLN)
        CHARACTER       timfnd(LLMXGT)*128
        CHARACTER       timstr*21000
        CHARACTER       str(MAXBAN)*64
        CHARACTER       string*128, cdef*128, strout*128, cycle*20
        LOGICAL         proces, lrmbl
	CHARACTER*2	sep
	CHARACTER	wind*(LLMXLN), wintyp*(LLMXLN)
C------------------------------------------------------------------------
C*  Initialize COMMON blocks
C
	CALL IN_BDTA ( iret )
C
C*  Initialize GEMPLT
C
        CALL GG_INIT  ( 1, iret )
        IF  ( iret .ne. 0 )  CALL SS_EXIT
C
C*      Initialize grid library common area grdcmn.cmn
C 
        CALL GD_INIT  ( iret )
C
	iostat = 0
	DO WHILE  ( iostat .eq. 0 )
	    WRITE  (6,20)
20	    FORMAT 
     +  ( '  1 = GDPTMS   2 = GDINST   3 = GDPBAN   4 = GDPTMC  '/
     +    '  5 = GDPWND  ' )
	    CALL TM_INT ( 'Select a subroutine number', .false.,
     +                     .false., 1, numsub, n, ier )
	IF ( ier .eq. 2 ) THEN
	   iostat = -1
           numsub = -1
	END IF
1	FORMAT (A)
C------------------------------------------------------------------------
	    IF (numsub .eq. 1) THEN
		WRITE (6,*) 'ENTER GDFILE'
                READ  (5,1)  gdfile
                WRITE (6,*) 'ENTER GDATTIM'
                READ  (5,1)  gdatim
                WRITE (6,*) 'ENTER CYCLE'
                READ  (5,1)  cycle
                CALL GDPTMS ( gdatim, gdfile, cycle, LLMXGT,
     +                        ntimes, timfnd, iret )
C
		WRITE (6,*) 'IRET = ', IRET
                proces = iret .eq. 0
C
                IF ( .not. proces )  THEN
                    CALL ST_LSTR ( gdatim, lgt, iret )
                    WRITE(6,*) "Unable to process GDATTIM=",gdatim(:lgt)
C
                  ELSE
                    write(6,*)  "Number of times matched = ", ntimes
                    DO  n = 1, ntimes
                        CALL ST_LSTR ( timfnd(n), ltf, iret )
                        WRITE(6,5)  n, timfnd(n)(:ltf)
5                       FORMAT (I5, 5x, A)
                    END DO
                END IF
                gdfilo = gdfile
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 2) THEN
		WRITE (6,*) 'ENTER STRING'
                READ  (5,1)  string
		WRITE (6,*) 'ENTER DEFAULT STRING'
                READ  (5,1)  cdef
		WRITE (6,*) 'ENTER BLANK REMOVAL FLAG (LOGICAL)'
                READ  (5,*)  lrmbl
		CALL GDINST ( string, cdef, MAXBAN, lrmbl, 
     +			      str, nstr, iret )
		WRITE(6,*) 'IRET = ', IRET
		DO  n = 1, nstr
		    WRITE(6,*) n, ' '//str(n)
		END DO
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 3) THEN
		WRITE (6,*) 'ENTER STRING'
                READ  (5,1)  string
		WRITE (6,*) 'ENTER BANG ELEMENT to SUBSTITUTE'
                READ  (5,*)  nbang
		CALL GDPBAN ( string, nbang, MAXBAN, 
     +			      strout, nbangs, iret )
		WRITE(6,*) 'IRET = ', IRET
		CALL ST_LSTR ( strout, ls, iret )
		WRITE(6,*) 'Output string = ', strout(:ls)
		WRITE(6,*) 'Number of bangs found = ', nbangs
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 4) THEN
		WRITE (6,*) 'ENTER GDFILE'
                READ  (5,1)  gdfile
                WRITE (6,*) 'ENTER GDATTIM'
                READ  (5,1)  gdatim
                WRITE (6,*) 'ENTER CYCLE'
                READ  (5,1)  cycle
                WRITE (6,*) 'ENTER character separator'
                READ  (5,1)  sep
		CALL GDPTMC ( gdatim, gdfile, cycle, sep, 
     +			      21000, ntimes, timstr, length, iret )
		WRITE(6,*) 'IRET = ', IRET
		WRITE(6,*) 'length = ', length
		WRITE(6,*) 'ntimes = ', ntimes
		WRITE(6,*) 'timstr = ', timstr(:length)
		gdfilc = gdfile
C-------------------------------------------------------------------------
	      ELSE IF (numsub .eq. 5) THEN
		WRITE (6,*) 'ENTER WIND'
                READ  (5,1)  wind
                WRITE (6,*) 'ENTER WINTYP (B or A or D)'
                READ  (5,1)  wintyp
		CALL GDPWND ( wind, wintyp, iwnclr, iret )
		WRITE(6,*) 'IRET = ', IRET
		WRITE(6,*) 'IWNCLR =', iwnclr
C-------------------------------------------------------------------------
	    END IF
C
	END DO
C
	END
