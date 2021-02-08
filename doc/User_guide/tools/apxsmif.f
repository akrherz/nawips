	PROGRAM APXSMIF
C************************************************************************
C* APXSMIF								*
C*									*
C* This program makes appendix documentation from the .apx files.	*
C*									*
C* INPUT is a string that holds the appendix letter, the name		*
C* of the appendix, an optional h or t, the path to the template,	*
C* and the path for the output file--all separated by plus signs.	*
C* The h is a flag to generate the MIF header in the output file, using	*
C* the template file.  The t flag is a flag to generate the MIF tail in	*
C* the output file, using the template file.  If the h and t are	*
C* omitted, their plus sign must still be entered (e. g., ++).		*
C*									*
C* For example:  apxsmif A+gfunc+h+/usr/doc/mif				*
C*									*
C* Input file name:  $GEMPAK/txt/apx/gfunc.apx				*
C*                   tplPath/tpl_apxX.mif				*
C*									*
C* Output file name:  /usr/doc/mif/gfunc.apxmif				*
C**									*
C* Log:									*
C* K. Brill/NMC		11/92						*
C* M. Linda/GSC		05/95	Included template logic.		*
C* M. Linda/GSC		10/96	Changed location of input files		*
C************************************************************************
	CHARACTER	outfil*72, txtfil*72, parm*80, record*256
	CHARACTER	tplfil*128, newrec*256
	CHARACTER	out*80
	CHARACTER	cnum*6, sproc*1
	CHARACTER*32	cwords (5)
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
C*	Get the input record containing the following separated by +.
C*
C*		The appendix number
C*		The parameter name
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
     +				'tpl_apx' // cnum (1:llnum) // '.mif'
C
C*	Construct the text and output file names.
C
	CALL ST_LSTR (parm, isparm, ier)
	CALL ST_LSTR ( cwords (5), lensw, ier )
	outfil = cwords (5) (1:lensw) // '/' // parm (1:isparm)
     +		 // '.apxmif'
	txtfil = 'GEMPAK:txt/apx/' // parm (1:isparm) // '.apx'
c------	txtfil = 'NAWIPS:doc/User_guide/apx/' // parm (1:isparm) // '.apx'
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
C*          Open the template file.
C
            CALL FL_SOPN  ( tplfil, luntpl, iret )
            IF  ( iret .ne. 0 )  THEN
                CALL ER_WMSG  ( 'FL', iret, tplfil, ier )
                STOP
            END IF
            CALL SETOPN ( 0, ier )
            CALL WTSTUP ( lunout, luntpl, ier )
        ELSE
            CALL SETOPN ( 1, ier )
        END IF
C
C*	Find the first non blank record.
C
	mode = 0
	CALL NOBLNK  ( luntxt, record, ier )
	CALL CHKREC ( record, lrecl, ier )
	out = 'APPENDIX ' // cnum(1:llnum) 
	CALL ST_LSTR ( out, ilout, ier )
	CALL WTPARA ( lunout, 'Title', ier )
	CALL WTLINE ( lunout, ' ', ier )
	CALL WTPARA ( lunout, 'Title', ier )
	CALL WTLINE ( lunout, out(1:ilout), ier )
	CALL WTPARA ( lunout, 'subtitle', ier )
	CALL WTLINE ( lunout, record(1:lrecl), ier )
C	CALL WTPARA ( lunout, 'Body', ier )
C	CALL WTLINE ( lunout, ' ', ier )
C	CALL WTPARA ( lunout, 'Body', ier )
C	CALL WTLINE ( lunout, ' ', ier )
	CALL WTPARA ( lunout, 'intro', ier )
	CALL NOBLNK ( luntxt, record, ier )
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
	    IF ( ienm .eq. 1 .and. nb .ne. 0 ) THEN
		ienum = 1
		IF ( iblnk .eq. 1 ) THEN
		    iblnk = 0
		    CALL WTPARA ( lunout, 'list2', ier )
		    CALL WTLINE ( lunout, ' ', ier )
		END IF
		CALL WTPARA ( lunout, 'list', ier )
		CALL TBLIST ( record, ienum, lrecl, ier )
		CALL WTLINE ( lunout, record (1:lrecl), ier )
	    END IF
C
C*	    Look for parameter description.
C
	    IF (record .eq. ' ') THEN
	           nb = nb + 1
	           IF (nb .eq. 1 .and. ienum .eq. 0 ) THEN
			CALL WTPARA ( lunout, 'Body', ier )
			CALL WTLINE ( lunout, ' ', ier )
			CALL WTPARA ( lunout, 'Body', ier )
		   ELSE IF ( nb .eq. 1 .and. ienum .ne. 0 ) THEN
			iblnk = 1
		   ELSE IF ( nb .eq. 2 .and. ienum .ne. 0 ) THEN
			CALL WTPARA ( lunout, 'Body', ier )
			CALL WTLINE ( lunout, ' ', ier )
			CALL WTPARA ( lunout, 'Body', ier )
C
C*			End the list mode.
C
			ienum = 0
	           END IF
	       ELSE IF ( record (1:3) .eq. '   ' ) THEN
		   IF ( iblnk .eq. 1 ) THEN
		   	iblnk = 0
			CALL WTPARA ( lunout, 'list2', ier )
			CALL WTLINE ( lunout, ' ', ier )
		   END IF
		   nb = 0
		   CALL SP2TAB ( record, lrecl, ier )
		   CALL WTPARA ( lunout, 'tabit', ier )
		   CALL WTLINE ( lunout, record (1:lrecl), ier )
	       ELSE IF ( ienum .ne. 0 ) THEN
		   IF ( iblnk .eq. 1 ) THEN
		   	iblnk = 0
			CALL WTPARA ( lunout, 'list2', ier )
			CALL WTLINE ( lunout, ' ', ier )
		   END IF
		   nb = 0
		   IF ( ienum .ne. 1 ) THEN
		      CALL TBLIST ( record, ienum, lrecl, ier )
		      CALL WTPARA ( lunout, 'list2', ier )
		      CALL WTLINE ( lunout, record (1:lrecl), ier )
		   END IF
		   ienum = ienum + 1
	       ELSE
		   nb = 0
	           CALL WTLINE ( lunout, record (1:lrecl), ier )
	     END IF
	END DO
  100	CONTINUE	
	CALL WTENDP ( lunout, ier )
        IF ( sproc .eq. 't' ) THEN
C
C*          Open the template file.
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
