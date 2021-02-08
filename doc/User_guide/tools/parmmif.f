	PROGRAM PARMMIF	
C************************************************************************
C* PARMMIF								*
C*									*
C* This program makes parameter documentation from the .hl2 files.	*
C*									*
C* INPUT is a string that holds the chapter number, the name		*
C* of the parameter, an optional h or t, the path to the template,	*
C* and the path for the output file--all separated by plus signs.	*
C* The h is a flag to generate the MIF header in the output file, using	*
C* the template file.  The t flag is a flag to generate the MIF tail in	*
C* the output file, using the template file.  If the h and t are 	*
C* omitted, their plus sign must still be entered (e. g., ++).		*
C*									*
C* For example:  parmmif 3+colors+h+../tpl+/usr/doc/mif			*
C*									*
C* Input file names:	$GEMHLP/colors.hl2				*
C*			tplPath/tpl_chapX.mif				*
C*									*
C* Output file name:  /usr/doc/mif/colors.prmmif			*
C**									*
C* Log:									*
C* K. Brill/NMC		11/92						*
C* G. Krueger/EAI	 9/94	Modified to include template & do tabs	*
C* M. Linda/GSC		05/95	Fixed file name extension: h12 --> hl2	*
C* M. Linda/GSC		10/96	Changed location of the template file	*
C* T. Piper/SAUC	11/02	Replaced tab with CHTAB			*
C************************************************************************
	INCLUDE		"GEMPRM.PRM"
C*
	CHARACTER	outfil*72, txtfil*72, tplfil*128, record*256
	CHARACTER	out*80, parm*80, newrec*256
	CHARACTER	cnum*6, sproc*1, prvlst*12
	CHARACTER*80	cwords (5)
C-----------------------------------------------------------------------
5	FORMAT (A)
C
C*	Get section number and parameter name.
C
	narg = iargc ()
    	IF ( narg .lt. 1 ) THEN
	    WRITE ( 6, * ) ' MISSING ARGUMENTS: ',
     +			   '  output path - parameter'
	    STOP
	END IF
C*
	CALL GETARG ( 1, record )
C
C*	Get the input record containing the following separated by +.
C*
C*		The chapter number 
C*	  	The parameter name
C*		A flag to write out the MIF header:
C*			If this flag is any string beginning with
C*			lower case h, the header is written; a lower
C*			case t, the tail is written; otherwise,
C*			no header is written.  A null entry for this
C*			flag may be entered as two consecutive
C*			delimiters (++).
C*		The path to the template file
C*		The path to the output file
C
	CALL ST_CLST ( record, '+', ' ', 5, cwords, num, ier )
	cnum = cwords (1)
	parm = cwords (2)
	CALL ST_RMBL ( cnum, cnum, llnum, ier )
C*
	CALL ST_UCLC  ( parm, parm, ier )
C
C*	Construct template file name.
C
	CALL ST_LSTR ( cwords (4), lensw, ier )
	tplfil = cwords (4) (1:lensw) // '/' // 
     +				'tpl_chap' // cnum (1:llnum) // '.mif'
C
C*	Construct the text and output file names.
C
	CALL ST_LSTR (parm, isparm, ier)
	CALL ST_LSTR ( cwords (5), lensw, ier )
	outfil = cwords (5) (1:lensw) // '/' // parm (1:isparm)
     +		 // '.prmmif'
	txtfil = 'GEMHLP:'// parm (1:isparm) // '.hl2'
C
C*	Open the text file.
C
	CALL FL_SOPN  ( txtfil, luntxt, iret )
	IF  ( iret .ne. 0 )  THEN
	    CALL ER_WMSG  ( 'FL', iret, txtfil, ier )
	    STOP
	END IF
C
C*	Create the output file.
C
	CALL FL_SWOP  ( outfil, lunout, iret )
	IF  ( iret .ne. 0 )  THEN
	    CALL ER_WMSG  ( 'FL', iret, outfil, ier )
	    STOP
	END IF
C
C*	Define the MIF parameters.
C
	sproc = cwords (3)
	IF ( sproc .eq. 'h' ) THEN
C
C*	    Open the template file.
C
	    CALL FL_SOPN  ( tplfil, luntpl, iret )
	    IF  ( iret .ne. 0 )  THEN
		CALL ER_WMSG  ( 'FL', iret, tplfil, ier )
		STOP
	    END IF
	    CALL SETOPN ( 0, ier )
	    CALL WTSTUP ( lunout, luntpl, ier )
            CALL WTPARA ( lunout, 'top of page', ier )
            CALL WTLINE ( lunout, '', ier )
            CALL WTPARA ( lunout, 'Title', ier )
            CALL WTLINE ( lunout, '', ier )
            CALL WTPARA ( lunout, 'subtitle', ier )
            CALL WTLINE ( lunout, 'GEMPAK Variables', ier)
	ELSE
	    CALL SETOPN ( 1, ier )
	END IF
C
C*	Find the first non blank record.
C
	CALL NOBLNK  ( luntxt, record, ier )
	CALL CHKREC ( record, lrecl, ier )
	CALL ST_CLST ( record, ' ', ' ', 2, cwords, num, ier )
	out = '\t' // cwords (1)
	CALL ST_LSTR ( out, ilout, ier )
	CALL WTPARA ( lunout, 'parmhd', ier )
	CALL WTLINE ( lunout, out(1:ilout), ier )
	CALL WTPARA ( lunout, 'Body', ier )
	prvlst = 'Body'
	CALL NOBLNK  ( luntxt, record, ier )
	CALL CHKREC ( record, lrecl, ier )
	CALL WTLINE ( lunout, record(1:lrecl), ier )
C
C*	Begin main loop.
C
	ienum = 0
	nb = 0
	iblnk = 0
	DO WHILE  ( .true. )
	    READ  ( luntxt, 5, END = 100 )  record
	    CALL CHKREC ( record, lrecl, ier )
	    CALL CHKLST ( record, ienm, newrec, ier )
	    IF ( ienm .eq. 1 .and. nb .gt. 0 ) THEN
		ienum = ienum + 1
	    ELSE IF ( nb .gt. 1 ) THEN
		ienum = 0
	    END IF
	    IF ( record .eq. ' ' ) THEN
		nb = nb + 1
	    ELSE
		CALL GETIDX ( 11, record, itloc, iret )
		itloc = itloc + 1
		CALL GETVRT ( lrecl, record, lvrecl, iret )
		IF ( itloc .gt. 0 .and. (record (1:1) .eq. CHTAB .or.
     +		      record (1:8) .eq. '        ') .and.
     +		      (INDEX ( record (itloc:lrecl), CHTAB ) +
     +		       INDEX ( record (itloc:lrecl), '   ' ) .gt. 0
     +		      .or. (lvrecl .lt. 22 .and. ienum .eq. 0)) ) THEN
			IF ( nb .ge. 1 ) THEN
			    CALL WTPARA ( lunout, 'Body', ier )
			    CALL WTLINE ( lunout, ' ', ier )
			    CALL WTPARA ( lunout, 'gemtab', ier )
			END IF
			CALL PUTTAB ( record, lrecl, ier )
			CALL WTPARA ( lunout, 'gemtab', ier )
			prvlst = 'gemtab'
			CALL WTSLIN ( lunout, record (1:lrecl), ier )
		ELSE IF ( ienum .ne. 0 ) THEN
		    IF ( nb .ge. 1 ) THEN
			CALL WTPARA ( lunout, 'Body', ier )
			CALL WTLINE ( lunout, ' ', ier )
			CALL WTPARA ( lunout, 'list2', ier )
		    END IF
		    CALL TBLIST ( record, ienm, lrecl, ier )
		    CALL WTLINE ( lunout, record (1:lrecl), ier )
		    CALL WTPARA ( lunout, 'list2', ier )
		    prvlst = 'list2'
		ELSE
		    IF ( nb .ge. 1 ) THEN
			CALL WTPARA ( lunout, 'Body', ier )
			CALL WTLINE ( lunout, ' ', ier )
		    END IF
		    IF ( prvlst .ne. 'Body' .or. nb .ge. 1 ) THEN
			CALL WTPARA ( lunout, 'Body', ier )
		    END IF
		    IF ( record (1:1) .eq. CHTAB ) THEN
			CALL WTPARA ( lunout, 'tabit', ier )
			prvlst = 'tabit'
		    END IF
		    prvlst = 'Body'
		    CALL WTLINE ( lunout, record (1:lrecl), ier )
		END IF
		nb = 0
	    END IF
	END DO
  100	CONTINUE	
	CALL WTENDP ( lunout, ier )
	IF ( sproc .eq. 't' ) THEN
C
C*	    Open the template file.
C
	    CALL FL_SOPN  ( tplfil, luntpl, iret )
	    IF  ( iret .ne. 0 )  THEN
		CALL ER_WMSG  ( 'FL', iret, tplfil, ier )
		STOP
	    END IF
	    CALL WTFNSH ( lunout, luntpl, ier )
	END IF
	CALL FL_CLAL ( ier )
	STOP
C
	END
