	SUBROUTINE IM_HRNIDH  ( imgfil, ihdr, iret )
C************************************************************************
C* IM_HRNIDH								*
C*									*
C* This subroutine parses the header information from a raw Higher      *
C* Resolution NIDS file	and sets the navigation.			*
C*									*
C* IM_HRNIDH  ( IMGFIL, IHDR, IRET )					*
C*									*
C* Input parameters:							*
C*	IMGFIL		CHAR		Image file name			*
C*	IHDR (39)	INTEGER		HR NIDS header information	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*					  0 = normal return		*
C*					 -4 = Invalid image product	*
C*					 -5 = Invalid image navigation	*
C**									*
C* Log:									*
C* X. Guo/CWS           05/10   Copy from IM_NIDH                       *
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
	INCLUDE		'IMGDEF.CMN'
	INCLUDE		'AREAFL.CMN'
C*
	CHARACTER*(*)	imgfil
	INTEGER 	ihdr (39)
C*
	INTEGER		idtarr (3), idlvls (16)
	INTEGER*2	iarr2 (78), ivtim2 (2)
	INTEGER*4	inhead (39), ivtim4
	CHARACTER       prdnam*8, units*8, desc*20, cbar64(16)*4
C*
        DATA            cbar64  / 'ND', '-64', '-50', '-36',
     +                           '-26', '-20', '-10', '-1',
     +                           '0', '+10', '+20', '+26',
     +                           '+36', '+50', '+64', 'RF' / 
C*
        EQUIVALENCE     (inhead, iarr2)
	EQUIVALENCE	(ivtim4, ivtim2)
C------------------------------------------------------------------------
	iret = 0
C
C*	Get the header array into the local array variable.
C
        DO  i = 1, 39
            inhead (i) = ihdr (i)
        END DO
C
C*      Determine whether file needs bytes flipped. If so, swap and save
C*      the four byte data values before flipping each two-byte pair.
C*      The time variable crosses a word boundary, so treat it specially.
C
        IF ( (iarr2 (1) .gt. 255) .or. (iarr2 (1) .lt. 0) ) THEN
            CALL MV_SWP4 ( 1, inhead (6), iradlt )
            CALL MV_SWP4 ( 1, inhead (7), iradln )
            CALL MV_SWP4 ( 1, inhead (28), isymof )
            CALL MV_SWP4 ( 1, inhead (34), idllen )
            CALL MV_SWP2 ( 39, inhead, inhead )
            ivtim2 (1) = iarr2 (23)
            ivtim2 (2) = iarr2 (22)
            ivtime = ivtim4
            imbswp = 1
        ELSE
            iradlt = inhead (6)
            iradln = inhead (7)
            isymof = inhead (28)
            idllen = inhead (34)
            ivtim2 (1) = iarr2 (22)
            ivtim2 (2) = iarr2 (23)
            ivtime = ivtim4
            imbswp = 0
        END IF

C
C*      Fill 2-byte variables
C
        iprod  = iarr2 (16)
	immode = iarr2 (17)
C
C*      If equal 0 (maintenance mode), do not need to process
C
        IF ( immode .eq. 0 ) THEN 
            iret = -4
            RETURN
        END IF
        ivdate = iarr2 (21)
        ipd3   = iarr2 (30)
C
	DO i = 1, 16
            idlvls (i) = iarr2 (30 + i)
            IF ( i .ge. 2 ) THEN
                IF ( immode .eq. 2 ) THEN
                        IF ( (iprod .eq. 134 ) .or. 
     +                       (iprod .eq. 135)) THEN
                              IF ( i .eq. 2 ) THEN
                                    IF (iprod .eq. 134) THEN
                                            idlvls (i) = 1
                                        ELSE
                                            idlvls (i) = 0
                                    END IF
                                 ELSE
                                    idlvls (i) = 5 * (i - 2)
                              END IF
                           ELSE 
                              idlvls (i) = idlvls (2) * (i - 1)
                        END IF
                     ELSE
                        idlvls (i) = -28 + 4 * (i - 2)
                END IF
            END IF
	END DO
C
        ipkcd1 = iarr2 (69)
C
C*      Check for the current higher resolution pack code
C
        IF ( ipkcd1 .ne. 16 ) THEN
            iret = -4
            RETURN
        END IF
C
C*	Radial product-specific variables
C
	nrbins = iarr2 (71) 
C
        imnpix = nrbins * 2
        imnlin = imnpix
        imrdfl = 1
        imdoff = isymof * 2 + 28
        imldat = idllen - 14
C
C*	Set product info
C
	imsorc = 7
	imdpth = 1
	imtype = iprod
	isrc   = iarr2 (7)
	CALL TB_NIDS  ( isrc, imtype, prdnam, nlev, units, res, desc,
     +			ierr )
	IF  ( ierr .ne. 0 )  THEN
	    CALL ER_WMSG ( 'TB', ierr, ' ', ier )
	    iret = -4
	    RETURN
	END IF
	CALL ST_RNUL(prdnam, prdnam, lens, ier )
	CALL ST_RNUL(units, units, lens, ier )
	CALL ST_RNUL(desc, desc, lens, ier )
C
C*	Set image calibration (units)
C
	cmcalb = 'RAW '
C
C*	Save radar beam elevation angle for base products
C
	IF ( (imtype .eq. 94) .or. (imtype .eq. 99) .or.
     +        (imtype .eq. 134) .or. (imtype .eq. 135)) THEN
	    rmbelv = ipd3 * 0.1
	ELSE
	    rmbelv = RMISSD
	END IF
C
C*	Determine date. Date stored with the raw data is the number of
C*	days from 1/1/70. Put it into YYYYMMDD form.
C
	nyear = (ivdate - 1 + .5) / 365.25	    
	jyear = 1970 + nyear
	jday  = ivdate - INT (nyear * 365.25 + .25)
	CALL TI_JTOI ( jyear, jday, idtarr, ier )
	imdate =  idtarr (1) * 10000 + idtarr (2) * 100 + idtarr (3)
C
C*	Time stored is number of seconds past UTC midnight. Put it into
C*	HHMMSS form. Use volume scan time.
C
	imtime = (10000 * (ivtime / 3600)) + (100 * MOD (ivtime/60,60)) 
     +		 + MOD (ivtime,60)
C	 
C*	Build data level values
C
	imndlv = nlev
	cmbunt = units
C
	DO idl = 1, imndlv
C
C*	    Data value (or flagged code) is in least signigicant byte
C
            IF ( idl .eq. 1 ) THEN
                  cmblev (idl) = 'ND'  
               ELSE
                  IF ( (imtype .ne. 99) .or. (immode .eq. 1)) THEN 
                      CALL ST_INCH ( idlvls (idl), cmblev (idl), ier )
                      IF ((immode .eq. 1) .and. 
     +                    (idlvls (idl) .gt. 0)) THEN
                          cmblev (idl) = '+'//cmblev (idl)(1:)
                      END IF
                    ELSE
                      cmblev (idl) = cbar64(idl)
                  END IF
            END IF
	END DO
C
C*	Set image subset bound to whole image right now.
C
	imleft = 1
	imtop  = 1
	imrght = imnpix
	imbot  = imnlin
C
	iadir (6)  = 1
	iadir (7)  = 1
	iadir (12) = 1
	iadir (13) = 1
	    
	CALL ST_CTOI ( 'RADR', 1, ianav (1), ier )
	ianav (2)  = imnlin / 2
	ianav (3)  = imnpix / 2
C
C*	Convert floating point lat/lon to DDDMMSS format
C
	deg = ABS ( iradlt * .001)
	ideg = INT ( deg * 100000 )
	idec = MOD ( ideg, 100000 )
	irem = (idec * 3600 + 50000 ) / 100000
 	
	idms = ( ideg / 100000 + irem / 3600 ) * 10000 +
     +	         MOD (irem, 3600) / 60 * 100 + MOD (irem, 60)
	IF ( iradlt .lt. 0 ) idms = -idms
	ianav (4)  = idms

	deg = ABS ( iradln * .001)
	ideg = INT ( deg * 100000 )
	idec = MOD ( ideg, 100000 )
	irem = (idec * 3600 + 50000 ) / 100000
 	
	idms = ( ideg / 100000 + irem / 3600 ) * 10000 +
     +		MOD (irem, 3600) / 60 * 100 + MOD (irem, 60)
C
C*	Set west lon (neg) to match MCIDAS west lon (pos)
C
	IF ( iradln .gt. 0 ) idms = -idms
	ianav (5)  = idms

	ianav (6)  = res * 1000
	ianav (7)  = 0
	ianav (8)  = 0

	CALL GSATMG ( imgfil, iadir, ianav, imleft, imtop, imrght,
     +			  imbot, ier )
C
	IF ( ier .ne. 0 ) iret = -5
C
	RETURN
	END
