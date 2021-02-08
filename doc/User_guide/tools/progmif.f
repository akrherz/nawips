	PROGRAM PROGMIF
C************************************************************************
C* PROGMIF								*
C*									*
C* This program makes program documentation from .prm, .txt, .err, and	*
C* .hl1 files.								*
C*									*
C* INPUT is a string that holds the chapter number, the name		*
C* of the program, an optional h or t, the path to the template,	*
C* and the path for the output file--all separated by plus signs.	*
C* The h is a flag to generate the MIF header in the output file, using	*
C* the template file.  The t flag is a flag to generate the MIF tail in	*
C* the output file, using the template file.  If the h and t are	*
C* omitted, their plus sign must still be entered (e. g., ++).		*
C*									*
C* For example:  progmif 4+sflist+h+../tpl+/usr/doc/mif			*
C*									*
C* Input file names:  $GEMPARM/sflist.prm				*
C*		      $GEMPTXT/sflist.txt				*
C*		      $GEMERR/sflist.err				*
C*		      $GEMHLP/*.hl1					*
C*                    tplPath/tpl_chapX.mif				*
C*									*
C* Output file name:  /usr/doc/mif/sflist.prgmif			*
C**									*
C* Log:									*
C* I. Graffman/RDS	 8/88						*
C* G. Huffman/GSC	12/88	Correct error message spacing		*
C* M. desJardins/GSFC	 7/89	Set to run from command procedure	*
C* K. Brill/NMC		03/92	Unix version				*
C* K. Brill/NMC		11/92	Derived from HLPBLD			*
C* G. Krueger/EAI	 9/94	Modified to include template & do tabs	*
C* M. Linda/GSC		10/96	Changed location of the template file	*
C* T. Piper/SAIC	11/02	Replaced tab with CHTAB			*
C************************************************************************
	INCLUDE		"GEMPRM.PRM"
C*
	LOGICAL		plist, lstprv, tblprv
	CHARACTER	outfil*72, txtfil*72, prog*80, record*256
	CHARACTER	prmfil*72, hl1fil*72, parm*16, out*80, errfil*72
	CHARACTER	tplfil*128, nxtrec*256, lstpar*20
	CHARACTER	rec*80, cnum*6, rcrdlc*80, sproc*1
	CHARACTER*80	cwords (5)
C-----------------------------------------------------------------------
5	FORMAT (A)
C
C*	Get section number and program name.
C
	narg = iargc ()
    	IF ( narg .lt. 1 ) THEN
	    WRITE ( 6, * ) ' MISSING ARGUMENTS: ',
     +			   '  output path - program'
	    STOP
	END IF
C*
	CALL GETARG ( 1, record )
C
C*      Get the input record containing the following separated by +.
C*
C*              The chapter number 
C*              The parameter name
C*              A flag to write out the MIF header:
C*                      If this flag is any string beginning with
C*                      lower case h, the header is written; a lower
C*			case t, the tail is written; otherwise,
C*                      no header is written.  A null entry for this
C*			flag may be entered as two consecutive
C*			delimiters (++).
C*              The path to the template file
C*              The path to the output file
C
	CALL ST_CLST ( record, '+', ' ', 5, cwords, num, ier )
	cnum = cwords (1)
	prog = cwords (2)
	CALL ST_RMBL ( cnum, cnum, llnum, ier )
C*
	CALL ST_UCLC  ( prog, prog, ier )
C
C*	Construct template file name.
C
	CALL ST_LSTR ( cwords (4), lensw, ier )
	tplfil = cwords (4) (1:lensw) // '/' //
     +				'tpl_chap' // cnum (1:llnum) // '.mif'
C
C*	Construct the text and output file names.
C
	CALL ST_LSTR (prog, isprog, ier)
	CALL ST_LSTR ( cwords (5), lensw, ier )
	outfil = cwords (5) (1:lensw) // '/' // prog (1:isprog) //
     +		 '.prgmif'
	txtfil = 'GEMPTXT:' // prog (1:isprog) // '.txt'
	prmfil = 'GEMPARM:' // prog (1:isprog) // '.prm'
	errfil = 'GEMERR:'  // prog (1:isprog) // '.err'
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
	    CALL WTLINE ( lunout, 'GEMPAK Programs', ier)
	ELSE
	    CALL SETOPN ( 1, ier )
	END IF
C
C*	Find the first non blank record.
C
	CALL NOBLNK  ( luntxt, record, ier )
	CALL CHKREC ( record, lrecl, ier )
	CALL ST_CLST ( record, ' ', ' ', 2, cwords, num, ier )
	out = "\t" // cwords (1)
	CALL ST_LSTR ( out, ilout, ier )
	IF ( sproc .eq. 'h' ) THEN
	    CALL WTPARA ( lunout, 'heading 0', ier )
	ELSE
	    CALL WTPARA ( lunout, 'heading 1', ier )
	END IF

	CALL WTLINE ( lunout, out(1:ilout), ier )
	CALL WTPARA ( lunout, 'intro', ier )
	lstpar = 'intro'
	DO WHILE ( record .ne. ' ' )
	    CALL WTLINE ( lunout, record(1:lrecl), ier )
	    READ ( luntxt, 5 ) record
	END DO
	CALL WTPARA ( lunout, 'intro', ier )
C
C*	Begin main loop.
	icur = 0
	ivcur = 0
	mode = 0
	nb = 0
C
	DO WHILE  ( .true. )
	    READ  ( luntxt, 5, END = 100 )  record
	    CALL CHKREC ( record, lrecl, ier )
C
C*	    Look for program description.  Write out
C*	    heading and get first non blank record.
C
	    IF (INDEX (record, 'PROGRAM DESCRIPTION') .gt. 0 ) THEN
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL WTLINE ( lunout, record(1:lrecl), ier )
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL NOBLNK ( luntxt, record, ier)
	        CALL CHKREC ( record, lrecl, ier )
		CALL WTPARA ( lunout, 'program', ier )
	        CALL WTLINE ( lunout, record(1:lrecl), ier )
	        mode = 1
	        nb = 0
		lstpar = 'program'
C
C*	    Look for program examples. Write 2 blanks, 
C*	    heading and get first non blank record.
C
	    ELSE IF (INDEX (record, 'EXAMPLE') .gt. 0 ) THEN
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL WTLINE ( lunout, record(1:lrecl), ier )
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL NOBLNK ( luntxt, record, ier)
	        CALL CHKREC ( record, lrecl, ier )
		CALL WTPARA ( lunout, 'example', ier )
		CALL CHKLST ( record, ienum, nxtrec, ier )
		CALL ST_LSTR ( nxtrec, lrecl, ier )
	        CALL WTLINE ( lunout, nxtrec(1:lrecl), ier )
	        mode = 2
	        nb = 0
		tblprv = .false.
		lstprv = .false.
		plist = .false.
		lstpar = 'example'
C
C*	        Error messages.
C
	    ELSE IF (INDEX (record, 'ERROR MESSAGES') .gt. 0) THEN
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL ST_LSTR ( record, lrecl, ier )
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL WTLINE ( lunout, record(1:lrecl), ier )
		CALL WTPARA ( lunout, 'heading 2', IER )
	   	mode = 0
C
C*	        Open error file
C
	        CALL FL_SOPN (errfil, lunerr, iret)
C
C*	        Find first non comment.
C
	        record(1:1) = '!'
	        DO WHILE ((record(1:1) .eq. '!') .or.
     +	                  (record .eq. ' '))
	            READ (lunerr, 5) record
	            CALL CHKREC ( record, lrecl, ier )
	        END DO
	        BACKSPACE (lunerr)
C
C*              Leading spaces squeezed out first so that the tab
C*		expansion will compensate, keeping the message text
C*              in the same place.
C
	        DO WHILE (.true.)
	            READ (lunerr, 5, end = 35) record
	            CALL CHKREC ( record, lrecl, ier )
	            CALL ST_LDSP (record, record, n, ier)
		    CALL ST_UTAB (record, 80, rec, ier)
		    isp = INDEX (rec, '!')
		    isdesc = isp
		    IF (isp .gt. 0) rec (isp:isp) = ' '
		    isp = INDEX (rec, '!AS')
		    IF (isp .gt. 0) rec (isp:isp+2) = '...'
		    isp = INDEX (rec, ' ')
		    parm = prog (1:isprog)
		    CALL ST_LCUC ( parm, parm, ier )
		    out = "\t[" // parm (1:isprog) // "\t" //
     +                     rec (1:isp-1) // "]\t" // rec (isdesc+1:)
		    CALL ST_LSTR ( out, lrecl, ier )
		    CALL WTPARA ( lunout, 'err num entry', ier )
		    CALL WTLINE ( lunout, out (1:lrecl), ier )
	         END DO
   35	         CONTINUE
		lstpar = 'err num entry'
C
C*	        Input parameters.
C
	    ELSE IF (INDEX (record, 'INPUT PARAMETERS') .gt. 0) THEN
	        CALL ST_LSTR ( record, lrecl, ier )
		CALL WTPARA ( lunout, 'heading 2', ier )
	        CALL WTLINE ( lunout, record(1:lrecl), ier )
		CALL WTPARA ( lunout, 'heading 2', ier )
		mode = 0
C
C*	        Open parameter file.
C
	        CALL FL_SOPN (prmfil, lunprm, iret)

	        IF (iret .ne. 0) THEN
	            GO TO 100
	        END IF
C
C*	        Loop through parameters. Create help 1 file name.
C
		CALL ST_LSTR ( record, lrecl, ier )
		nprm = 0
	        DO WHILE (.true.)
	            READ (lunprm, 5, end = 50) record
	    	    CALL CHKREC ( record, isiz, ier )
		    nprm = nprm + 1
		    CALL ST_UCLC (record, rcrdlc, ier )
	            hl1fil = 'GEMHLP:' // rcrdlc (1:isiz) // '.hl1'
	            CALL FL_SOPN (hl1fil, lunhl1, iret)
	            parm = record(1:isiz)
	            IF (iret .ne. 0) THEN
C*	                Get past first records to blank.
	            ELSE
C	                record = 'dd'
C	                DO WHILE (record .ne. ' ')
C	                    READ (lunhl1, 5, end = 45) record
C	    		    CALL CHKREC ( record, lrecl, ier )
C	                END DO
C
C*	                Read the records.
C
	                i = 0
	                DO WHILE (.true.)
	                    READ (lunhl1, 5, end = 45) record
	    		    CALL CHKREC ( record, lrecl, ier )
	                    i = i + 1
	                    IF (i .eq. 1) THEN
	                        out = "\t" // parm // "\t" // record
	                    ELSE
	                        out = "\t\t" // record
	                    END IF
			    CALL ST_LSTR ( out, lrecl, ier )
			    CALL WTPARA ( lunout, 'parm entry', ier )
	                    CALL WTLINE ( lunout, out (1:lrecl), ier )
	                END DO
	            END IF
   45	            CONTINUE
	            CALL FL_CLOS (lunhl1, ier)
	        END DO
   50	        CONTINUE
		IF ( nprm .eq. 0 ) THEN
		    CALL WTPARA ( lunout, 'parm entry', ier )
		    CALL WTLINE ( lunout, 'None', ier )
		END IF
	    	CALL WTPARA ( lunout, 'parm entry', ier )
		lstpar = 'parm entry'
C
C*	    Else NOT a heading, just write.
C
	    ELSE 
C*	'mode .eq. 2' is for EXAMPLE section of TXT file.
		IF ( mode .eq. 2 ) THEN
		    iprv = icur
		    ivprv = ivcur
		    icur = INDEX ( record, '=' )
		    CALL GETVRT ( icur, record, ivcur, iret )
		    inxt = 0
		    READ  ( luntxt, 5, END = 200 ) nxtrec
		    CALL ST_LSTR ( nxtrec, nrecl, ier )
		    inxt = INDEX ( nxtrec, '=' )
		    CALL GETVRT ( inxt, nxtrec, ivnxt, iret )
200		    BACKSPACE luntxt
		    lstprv = plist
		    plist = ( icur .ne. 0 .and.
     +				((iprv .ne. 0 .and.
     +				ABS (ivprv - ivcur) .lt. 2 ) .or.
     +				(inxt .ne. 0 .and.
     +				ABS (ivcur - ivnxt) .lt. 2 ) .or.
     +				nxtrec .eq. ' ')) 
		    IF ( plist ) THEN
			IF ( .not. lstprv ) THEN
			    nb = 0
			    CALL WTPARA ( lunout, 'program', ier )
			    CALL WTLINE ( lunout, ' ', ier )
			    CALL WTPARA ( lunout, 'program', ier )
			    lstpar = 'program'
			END IF
	    		CALL CHKREC ( record, lrecl, ier )
			iq = INDEX ( record(1:lrecl), '=' )
			IF ( iq .ne. 0 ) THEN
			    rcrdlc = "\t" // record(1:iq-1) //
     +				     "\t=" // "\t" //
     +				     record(iq+1:lrecl)	    
			    CALL ST_LSTR ( rcrdlc, lrecl, ier )
			    CALL WTPARA ( lunout, 'pexlst', ier )
			    lstpar = 'pexlst'
			    CALL WTLINE ( lunout, rcrdlc (1:lrecl),
     +					  ier )
			END IF
		    ELSE
			IF ( lstprv .or. tblprv ) THEN
			    CALL WTPARA ( lunout, 'program', ier )
			    CALL WTPARA ( lunout, 'example', ier )
			    lstpar = 'example'
			END IF
			IF ( record .ne. ' ' ) THEN
       			CALL ST_LSTR ( record, lrecl, ier )
			IF ( lrecl .eq. 0 ) THEN
			    itloc = 0
			    isloc = 0
			ELSE
			    CALL GETIDX ( 11, record, istart, iret )
			    itloc = INDEX ( record(istart:lrecl), CHTAB )
			    isloc = INDEX ( record(istart:lrecl), '  ' )
			END IF
			indx = istart+isloc-2
			IF ( indx .le. 0 ) indx = 1
			IF ( (itloc + isloc .gt. 0) .and. 
     +                      ((record(indx:indx) .ne.
     +                  '.') .and. (record(indx:indx)
     +                      .ne. ':' )) )  THEN
			    CALL PUTTAB ( record, lrecl, ier )
			    CALL WTPARA ( lunout, 'gemtab', ier )
			    CALL WTSLIN ( lunout, record(1:lrecl),
     +					      ier )
			    tblprv = .true.
			ELSE
			    CALL CHKLST ( record, ienum, nxtrec, ier )
			    CALL ST_LSTR ( nxtrec, lrecl, ier )
			    CALL WTLINE ( lunout, nxtrec(1:lrecl),
     +					      ier )
			    tblprv = .false.
			END IF
			END IF
		    END IF
C*	'mode .ne. 2'; i.e., all cases except EXAMPLE
		ELSE IF (record .eq. ' ') THEN
	            nb = nb + 1
C*	'mode .eq. 1' is for PROGRAM DESCRIPTION section of TXT file. 
	            IF (nb .eq. 1 .and. mode .eq. 1 ) THEN
			CALL NOBLNK ( luntxt, nxtrec, ier )
			BACKSPACE luntxt
			IF ( INDEX (nxtrec, 'EXAMPLE') .gt. 0 ) THEN
			    CALL WTPARA ( lunout, 'program', ier )
			    BACKSPACE luntxt
			ELSE  
			    CALL WTPARA ( lunout, 'program', ier )
			    CALL WTLINE ( lunout, ' ', ier )
			    CALL WTPARA ( lunout, 'program', ier )
			END IF
	            END IF
C*	'mode .ne. 2' and "record .ne. ' '"
		ELSE
		    nb = 0
		    CALL ST_LSTR ( record, lrecl, ier )
		    CALL GETIDX ( 11, record, istart, iret )
		    itloc = INDEX ( record(istart:lrecl), CHTAB )
		    IF ( itloc .eq. 1 ) THEN
			istart = istart + 1
			itloc = INDEX ( record(istart:lrecl), CHTAB )
		    END IF
		    isloc = INDEX ( record(istart:lrecl), '  ' )
		    indx = istart+isloc-2
		    IF ( indx .le. 0 ) indx = 1
		    IF ( (itloc + isloc .gt. 0)  .and.
     +			((record(indx:indx) .ne.
     +			'.') .and. (record(indx:indx)
     +			.ne. ':' )) )  THEN
			CALL PUTTAB ( record, lrecl, ier )
			CALL WTPARA ( lunout, 'gemtab', ier )
			CALL WTSLIN ( lunout, record(1:lrecl), ier )
			CALL ST_LSTR ( lstpar, krecl, ier )
			CALL WTPARA ( lunout, lstpar(1:krecl), ier )
		    ELSE
			IF ( record(1:1) .eq. CHTAB ) THEN
			    CALL PUTTAB ( record, lrecl, ier )
			    CALL WTSLIN ( lunout, record(1:lrecl), ier )
			    CALL ST_LSTR ( lstpar, krecl, ier )
			    CALL WTPARA ( lunout, lstpar(1:krecl), ier )
			ELSE
			    CALL ST_LSTR ( record, lrecl, ier )
			    CALL WTLINE ( lunout, record(1:lrecl), ier )
			END IF
		    ENDIF
		END IF
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
