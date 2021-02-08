	SUBROUTINE READ_LIGHTNING ( lghtng_file, nstrk, rlat, rlon, 
     +                              secs, ints, count_pos, count_neg,
     +                              iret )
C************************************************************************
C* READ_LIGHTNING							*
C*									*
C* This subroutine reads lightning data from a single hourly file.	*
C*									*
C* READ_LIGHTNING ( LIGHTNING_FILE, NSTRK, RLAT, RLON, SECS, INTS,	*
C*		    COUNT_POS, COUNT_NEG, IRET )			*
C*                                                                      *
C* Input parameters:							*
C*	LGHTNG_FILE	CHAR*		Name of lightning data file     *
C*									*
C* Output parameters:							*
C*	NSTRK(*)	INTEGER		Number of strikes each minute   *
C*	RLAT(*,*,*)	REAL		Latitudes of strikes		*
C*	RLON(*,*,*)	REAL		Longitudes of strikes		*
C*	SECS(*,*,*)	REAL		Times (seconds) strikes occurred*
C*	INTS(*,*,*)	REAL		Intensity of strikes (KAMPS)	*
C*	COUNT_POS(*)	INTEGER		Number of positive strikes	*
C*	COUNT_NEG(*)	INTEGER		Number of negative strikes	*
C*	IRET		INTEGER		Return code			*
C*									*
C**									*
C* Log:									*
C* G. McFadden/IMSG	11/12	                                        *
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
C*
	CHARACTER	lghtng_file*15, dattm2*20, datfil*20
C*
	PARAMETER	( MAXSTK = 5000 )
C*
	CHARACTER	datmin*20, cmin*2
	INTEGER		idata (LLMXPT*4), iptr (0:62), nstrk(0:60)
	INTEGER		istrtp (0:60), istrtn (0:60), ier, lunf
	INTEGER		count_pos (0:60), count_neg (0:60), iret
 	REAL		rlat (MAXSTK,2,0:60), rlon (MAXSTK,2,0:60)
	REAL		secs (MAXSTK,2,0:60), ints (MAXSTK,2,0:60)
C-----------------------------------------------------------------------
        iret = 0
C
C*	Get the endpoints of the lightning data file, as GEMPAK
C*	date/times.
C
        WRITE (6,*) 'lghtng_file is ',lghtng_file
        datfil = lghtng_file (3:8) // '/' // lghtng_file (9:10) // '00'
        dattm2 = lghtng_file (3:8) // '/' // lghtng_file (9:10) // '59'
C
C*	Open the lightning data file.
C
        WRITE (6,*) 'lghtng_file is ',lghtng_file
        WRITE (6,*) 'datfile is ',datfil
        WRITE (6,*) 'dattm2 is ',dattm2
        CALL FL_DOPN ( lghtng_file, 1, .false., lunf, ier )
        WRITE (6,*) 'lghtng_file is ',lghtng_file
C
C*	Get the pointers for each minute, and the header
C*	information.
C
	CALL LW_INPT ( lunf, 0, 63, iptr, ier )
	lmin = iptr ( 61 )
        WRITE (6,*) 'LMIN from this hourly strikes file is ',lmin
C
C*	Loop over all minutes in the file.
C
	ii = 0
	DO WHILE ( ii .le. lmin )
	    ipos = 0
	    ineg = 0
            istrtp ( ii ) = IMISSD
            istrtn ( ii ) = IMISSD
C
	    IF ( iptr ( ii ) .ne. IMISSD ) THEN
C
C*	 	Get the strike count for this minute.
C
		CALL LW_INPT ( lunf, iptr ( ii ), 1, nstrk ( ii ), ier )
		IF ( nstrk ( ii ) .gt. LLMXPT ) nstrk ( ii ) = LLMXPT
               WRITE (6,*) 'Min is ',ii,' # of strikes is ',nstrk ( ii )
C
C*	 	Get the remaining data for this minute.
C
		CALL LW_INPT ( lunf, iptr ( ii ) + 1, nstrk ( ii )  * 4, idata,
     +			       ier )
C
                DO kk = 1, nstrk ( ii ) * 4
C		WRITE (6,*) 'min is ',ii,' idata(',kk,') is ',idata(kk)
		ENDDO
C
C*		Adjust lmin if needed...this is needed when getting 
C*		close to the end of the file 
C
		CALL ST_INLN ( ii, cmin, lens, ier )
		IF ( lens .eq. 1 ) cmin = '0' // cmin ( :1 )
		datmin = datfil ( :9 ) // cmin
		IF ( datmin .eq. dattm2 ) THEN
		    lmin = ii
		  ELSE IF ( datmin .gt. dattm2 ) THEN
		    lmin = ii - 2
		END IF
C
C*		Save the polarity, location, minute of the hour, 
C*              time during the minute (in seconds), and intensity
C*              of the strikes for this minute.
C
		IF ( ii .le. lmin ) THEN
		    DO jj = 2, nstrk ( ii ) * 4, 4
			IF ( idata ( jj + 2 ) .gt. 0 ) THEN
C
C*		Save this positive strike''s data 
C
			    IF ( ipos .lt. MAXSTK ) THEN
				ipos = ipos + 1
				IF ( istrtp ( ii ) .eq. IMISSD )
     +                               istrtp ( ii ) = ipos
				
				secs (ipos,1,ii) = idata ( jj-1 ) / 100.
				rlat (ipos,1,ii) = idata ( jj ) / 10000.
				rlon (ipos,1,ii) = idata (jj+1) / (-10000.)
				ints (ipos,1,ii) = idata ( jj+2 )
C				WRITE(6,*) ' '
C				WRITE(6,*) 'min is ',ii
C				WRITE(6,*) 'ipos is ',ipos
C				WRITE(6,*) '+ rlat is ',rlat(ipos,1,ii)
C				WRITE(6,*) '+ rlon is ',rlon(ipos,1,ii)
C				WRITE(6,*) '+ secs is ',secs(ipos,1,ii)
C				WRITE(6,*) '+ ints is ',ints(ipos,1,ii)
			    END IF
			  ELSE
C
C*		Save this negative strike''s data 
C
			    IF ( ineg .lt. MAXSTK ) THEN
				ineg = ineg + 1
				IF ( istrtn ( ii ) .eq. IMISSD )
     +                               istrtn ( ii ) = ineg
				secs (ineg,2,ii) = idata ( jj-1 ) / 100.
				rlat (ineg,2,ii) = idata ( jj ) / 10000.
				rlon (ineg,2,ii) = idata (jj+1) / (-10000.)
				ints (ineg,2,ii) = idata ( jj+2 )
C				WRITE(6,*) ' '
C				WRITE(6,*) 'min is ',ii
C				WRITE(6,*) 'ineg is ',ineg
C				WRITE(6,*) '- rlat is ',rlat(ineg,2,ii)
C				WRITE(6,*) '- rlon is ',rlon(ineg,2,ii)
C				WRITE(6,*) '- secs is ',secs(ineg,2,ii)
C				WRITE(6,*) '- ints is ',ints(ineg,2,ii)
			    END IF
			END IF
		    END DO
		END IF
	    END IF
	    count_pos(ii) = ipos;
	    count_neg(ii) = ineg;
	    ii = ii + 1
	END DO
C
C*	Close the lightning data file and exit.
C
	CALL FL_CLOS ( lunf, ier )
C*
	RETURN
	END
