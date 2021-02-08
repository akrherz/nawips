	SUBROUTINE NOBLNK ( lun, record, iret )
C************************************************************************
C*									*
C* This subroutine returns the first non blank record.			*
C*									*
C* Input parameters:							*
C*	LUN		INTEGER		Unit number of input file	*
C*									*
C* Input and output parameters:						*
C*	RECORD		CHAR*		String into which to read	*
C*	IRET		INTEGER		Return code			*
C*						0 = Success		*
C*					       -7 = End of file		*
C*									*
C* Log:									*
C* K. Brill/NMC		3/93						*
C************************************************************************
	CHARACTER* (*)	record
C
	iret = 0
	DO WHILE (.true.)
	    READ (lun, 5, end = 10) record
	    IF (record .ne. ' ') RETURN
	END DO
    5	FORMAT (a)
   10	CONTINUE
	iret = -7
C
	RETURN
	END	   
C
C========================================================================
C
	SUBROUTINE WTPARA ( lunhlp, ctag, iret )
C************************************************************************
C*									*
C*  This subroutine writes a paragraph header with a tag out to the	*
C*  MIF file.								*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	CTAG		CHAR*		Tag for this paragraph		*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	09/94	Open count; Spec. proc. for first "pr"	*
C************************************************************************
	CHARACTER*(*)	ctag
C*
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
	CHARACTER	apos, outstr*80
	DATA		apos /"'"/
C------------------------------------------------------------------------
	iret = 0
C*
	IF ( ipropn .ne. 0 ) CALL WTENDP ( lunhlp, ier )
	ipropn = 1
	outstr = '<Pgf <PgfTag `' // ctag // apos // '>>'
	nopen = nopen + 1
	IF ( .not. frstpr ) WRITE ( lunhlp, 101 )
101	FORMAT ( 'pr' )
	WRITE ( lunhlp, 102 ) outstr
102	FORMAT ( A )
C*
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE WTSTUP ( lunhlp, luntpl, iret )
C************************************************************************
C*									*
C*  This subroutine prepends a template in the new MIF file.		*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	LUNTPL		INTEGER		Unit number of MIF template	*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	 8/94	Rewritten for insertion into template	*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
	CHARACTER	outstr*256, cmd*64, arg*32
C------------------------------------------------------------------------
	iret = 0
	ipropn = 0
C*
	CALL LOCCMD ( lunhlp, luntpl, 'MIFFile', .true., cmd, ier )
	WRITE ( lunhlp, '(A)' ) 'define ( ln, `<ParaLine <String'' )'
	WRITE ( lunhlp, '(A)' ) 'define ( pr, `<Para'' )'
	CALL LOCCMD ( lunhlp, luntpl, 'PgfCatalog', .true., cmd, ier )
	CALL WTGMTB ( lunhlp, luntpl, ier )
	CALL LOCCMD ( lunhlp, luntpl, 'Document', .true., cmd, ier )
	WRITE ( lunhlp, '(A)' ) '<DSmartSpacesOn No>'
	CALL LOCCMD ( lunhlp, luntpl, 'Page', .true., cmd, ier )
	CALL LOCCMD ( lunhlp, luntpl, 'PageType BodyPage', .true.,
     +		      cmd, ier )
	CALL LOCCMD ( lunhlp, luntpl, 'ID', .true., cmd, ier )
	CALL STKELT  ( cmd, 2, ' ', ' ', narg, arg, iret )
	READ ( arg, '(I2)' ) idxfrm
	CALL LOCCMD ( lunhlp, luntpl, 'TextFlow', .true., cmd, ier )
	WRITE ( outstr, '(A, I2)' ) 'TextRectID', idxfrm
	CALL CNTCMD ( lunhlp, luntpl, 'Para', outstr, .true., cmd,
     +		      ier )
	frstpr = .true.
 100	CONTINUE
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE WTLINE ( lunhlp, cline, iret )
C************************************************************************
C*									*
C*  This subroutine writes a line of text to the MIF file.		*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	CLINE		CHAR*		Line to print out		*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	 9/94 Added special processing for first "pr"	*
C************************************************************************
	CHARACTER*(*)	cline
C*
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
C*
	CHARACTER	apos, outstr*256, tmps*256
	DATA		apos /"'"/
C------------------------------------------------------------------------
	iret = 0
C*
	outstr = ' '
	CALL ST_RXBL ( cline, tmps, llstr, ier )
	IF ( .not. frstpr ) THEN
	    outstr = 'ln `' // tmps (1:llstr) // ' ' // apos // '>>'
	ELSE
	    WRITE ( lunhlp, '(A)' ) '<ParaLine'
	    WRITE ( lunhlp, '(A, I2, A)' ) '<TextRectID ', idxfrm, '>'
	    outstr =
     +		'<String `' // tmps (1:llstr) // ' ' // apos // '>>'
	    frstpr = .false.
	END IF
	CALL PUTSPC ( outstr, llstr, ier )
	WRITE ( lunhlp, 101 ) outstr (1:llstr)
101	FORMAT (A)
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE WTENDP ( lunhlp, iret )
C************************************************************************
C*									*
C*  This subroutine writes a paragraph end marker to the MIF file.	*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	CLINE		CHAR*		Line to print out		*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	09/94	Count MIF command closure.		*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
C------------------------------------------------------------------------
	iret = 0
	ipropn = 0
	nopen = nopen - 1
	WRITE ( lunhlp, 101 )
101	FORMAT ( '>' )
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE PUTTAB ( record, lrecl, iret )
C************************************************************************
C*									*
C*  This subroutine replaces all tabs with \t.				*
C*									*
C*  Input parameters:							*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	LRECL		INTEGER		Length of output record		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	 8/94						*
C* T. Piper/SAIC	11/02	Replaced tab with CHTAB			*
C************************************************************************
	INCLUDE		"GEMPRM.PRM"
C*
	CHARACTER*(*)	record
	LOGICAL         prvtab
	CHARACTER*132	cnew
C------------------------------------------------------------------------
	iret = 0
	cnew = ' '
C*
	CALL ST_LSTR (record, linrec, ier)
C*
	ipos = 0
C
C*	ITUSED = 1, to account for implied margin.
C
	itused = 1
	ichout = 1
	prvtab = .false.
	DO ichin = 1, linrec
C
C*	    We are at a tab, record the new resulting position.
C
	    IF ( record (ichin:ichin) .eq. CHTAB ) THEN
		ipos = ipos / 8 * 8 + 8
		prvtab = .true.
C
C*	    We are at a space, record the new resulting position.
C
	    ELSE IF ( record (ichin:ichin) .eq. ' ' ) THEN
		IF ( prvtab .or.
     +		     record (ichin:ichin+2) .eq. '   ' ) THEN
		    prvtab = .true.
		ELSE
		    cnew (ichout:ichout) = ' '
		    ichout = ichout + 1
		ENDIF
		ipos = ipos + 1
	    ELSE
C
C*		We are in the middle of a word, keep transferring it.
C
		IF ( prvtab .eqv. .false. ) THEN
		    cnew (ichout:ichout) = record (ichin:ichin)
		    ichout = ichout + 1
		    ipos = ipos + 1
C
C*		We are not in the middle of a word, we are at the
C*		beginning, locate its start.
C
		ELSE
		    itabs = INT ((ipos) / 4) - itused
		    icdiff = ipos - itused * 4 - itabs * 4
C
C*		    Add the tabulation characters.
C
		    DO ich = 1, itabs
			cnew (ichout:ichout+1) = '\t'
			ichout = ichout + 2
		    END DO
		    itused = itused + itabs
C
C*		    If the virtual output location is to the left of
C*		    the tabbed location, then assume that we need a
C*		    single space, otherwise if it is to the right,
C*		    insert that number of spaces.  Assume that if the
C*		    locations match (icdiff .eq. 0), the current
C*		    location is the intended location.
		    IF ( icdiff .lt. 0 ) THEN
			cnew (ichout:ichout) = ' '
			ichout = ichout + 1
		    ELSE IF ( icdiff .gt. 0 ) THEN
			DO ich = 1, icdiff
			    cnew (ichout:ichout) = ' '
			    ichout = ichout + 1
			END DO
		    END IF
		    cnew (ichout:ichout) = record (ichin:ichin)
		    ichout = ichout + 1
		    ipos = ipos + 1
		ENDIF
		prvtab = .false.
	    ENDIF
	END DO
	record = cnew( 1:ichout - 1 )
	lrecl = ichout - 1
	RETURN
	END 
C
C========================================================================
C
	SUBROUTINE CHKLST ( record, ienum, cnew, iret )
C************************************************************************
C*									*
C*  This subroutine checks for an enumerated list element.		*
C*									*
C*  Input parameters:							*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	IENUM		INTEGER		Flag for enumerated line	*
C*					  1 = enumerated		*
C*					  0 = not enumerated		*
C*	CNEW		CHAR*		Record w/number removed		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C* T. Piper/SAIC	10/02	Initialized ij				*
C* T. Piper/SAIC	11/02	Added cnew output argument		*
C************************************************************************
	CHARACTER*(*)	record, cnew
C------------------------------------------------------------------------
	ij = 0
	iret = 0
	ienum = 0
C*
	CALL ST_LDSP ( record, cnew, nco, ier )
	i = 1
	isum = 0
	DO WHILE ( cnew (i:i) .ne. '.' .and. cnew (i:i) .ne. ' ' .and.
     +		   i .lt. 6 )
	    ij = i
	    CALL ST_ALNM ( cnew(i:i), ityp, ier )
	    IF ( ityp .eq. 1 ) isum = isum + 1
	    i = i + 1
	END DO	
	IF ( ij .eq. isum .and. cnew (i:i) .eq. '.' ) THEN
	    ienum = 1
	    cnew = cnew(i+1:)
	END IF
C*
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE TBLIST ( record, ienum, lrecl, iret )
C************************************************************************
C*									*
C*  This subroutine sets tabs for enumerated listings.			*
C*									*
C*  Input parameters:							*
C*	RECORD		CHAR*		Record to check out		*
C*	IENUM		INTEGER		Flag for first record		*
C*									*
C*  Output parameters:							*
C*	LRECL		INTEGER		Length of output record		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C************************************************************************
	CHARACTER*(*)	record
C*
	CHARACTER*132	cnew
C------------------------------------------------------------------------
	iret = 0
	IF ( ienum .eq. 1 ) THEN
	    ip = INDEX ( record, '.' )
	    cnew = record (1:ip) // '\t'
	    istrt = ip + 1
	    ip = ip + 2
	ELSE
	    cnew = '\t'
	    ip = 2
	    istrt = 1
	END IF
	cnew = cnew (1:ip) // record (istrt:)
	record = cnew
	CALL ST_LSTR (record, lrecl, ier)
	RETURN
	END 
C
C========================================================================
C
	SUBROUTINE CHKREC ( record, lrecl, iret )
C************************************************************************
C*									*
C*  This subroutine checks a record for MIF control characters and	*
C*  precedes them with a backslash.					*
C*									*
C*  Input and Output parameters:					*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	LRECL		INTEGER		Length of string		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	 9/94	Added code to prevent double quoting	*
C************************************************************************
	CHARACTER*(*)	record
C*
	CHARACTER*132	cnew
C------------------------------------------------------------------------
	iret = 0
C*
	CALL ST_LSTR (record, lrecl, ier)
C
C*	Check for > and '.
C
	iq = INDEX ( record, '>' ) +
     +	     INDEX ( record, "'" )
C*
	IF ( iq .ne. 0 ) THEN
C*
	  lcn = 1
	  pic = 1
	  DO ic = 1, lrecl
	    IF ( (record (ic:ic) .eq. '>' .or.
     +		  record (ic:ic) .eq. "'") .and.
     +		 record (pic:pic) .ne. "\" ) THEN
		cnew (lcn:lcn) = "\"
		lcn = lcn + 1
		cnew (lcn:lcn) = record (ic:ic)
		lcn = lcn + 1
		lrecl = lrecl + 1
	    ELSE
		cnew (lcn:lcn) = record (ic:ic)
		lcn = lcn + 1
	    END IF
	    pic = ic
	  END DO
	  record = cnew (1:lrecl)
	END IF
C*
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE SP2TAB ( record, lrecl, iret )
C************************************************************************
C*									*
C*  This subroutine replaces all 3-space intervals with \t.		*
C*									*
C*  Input parameters:							*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	LRECL		INTEGER		Length of output record		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C************************************************************************
	CHARACTER*(*)	record
C*
	CHARACTER*132	cnew
C------------------------------------------------------------------------
	iret = 0
	cnew=' '
	CALL ST_LSTR (record, lrecl, ier)
	io = 0
	ic = 0
	DO WHILE ( ic .lt. lrecl )
	    ic = ic + 1
	    io = io + 1
	    IF ( ic .lt. lrecl-3 ) THEN
	      IF ( record (ic:ic+2) .eq. '   ' ) THEN
		cnew (io:io+1) = '\t'
		io = io + 1
		ic = ic + 2
	      ELSE
		cnew (io:io) = record (ic:ic)
	      END IF
	    ELSE
	      cnew (io:io) = record (ic:ic)
	    END IF
	END DO
	record = cnew(1:io)
	CALL ST_LSTR (record, lrecl, ier)
	RETURN
	END 
C
C========================================================================
C
	SUBROUTINE PUTSPC ( record, lrecl, iret )
C************************************************************************
C*									*
C*  This subroutine makes sure that periods are followed by two spaces.	*
C*									*
C*  Input and output parameters:					*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	LRECL		INTEGER		Length of output record		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C************************************************************************
	CHARACTER*(*)	record
C*
	CHARACTER*132	cnew
C*
C------------------------------------------------------------------------
	iret = 0
	CALL ST_LSTR (record, lrecl, ier)
	io = 2
	cnew (1:2) = record (1:2)
	DO ic = 3, lrecl-1
	    io = io + 1
	    IF ( record (ic-1:ic-1) .eq. '.' .and.
     +	         record (ic  :ic  ) .eq. ' ' .and.
     +		 record (ic+1:ic+1) .ne. ' ' ) THEN
			cnew (io  :io  ) = ' '
			io = io + 1
			cnew (io  :io  ) = ' '
	    ELSE
		cnew (io:io) = record (ic:ic)
	    END IF
	END DO
        io = io + 1
        cnew (io:io) = record (lrecl:lrecl)
	IF ( cnew (io-1:io-1) .eq. '.' .and.
     +	     cnew (io  :io  ) .eq. ' ' ) THEN
	    io = io + 1
	    cnew (io:io) = ' '
	END IF
	IF ( cnew (io:io) .eq. '.' ) THEN
	    io = io + 2
	    cnew ( io-1:io) = '  '
	END IF
	record = cnew(1:io)
	lrecl = io
	RETURN
	END 
C
C========================================================================
C
	SUBROUTINE WTGMTB ( lunhlp, luntpl, iret )
C************************************************************************
C*									*
C*  This subroutine writes the GEMTAB paragraph style, which defines	*
C*  the	paragraph formatting tables in the GEMPAK documentation.	*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	 8/94						*
C*  G. Krueger/EAI	 5/95	Fixed end of section comments		*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
C*
C*	SRCSPC = source doc. space; DSTSPC = dest. doc. space.
	PARAMETER ( SRCSPC = 8., DSTSPC = 6.5 )
C------------------------------------------------------------------------
	iret = 0
	tsstrt = .4 * dstspc / srcspc
	tsdiff = .4 * dstspc / srcspc
	tstop = tsstrt
	ntabs = 20
C
C*	Write the GEMTAB paragraph definition.
C
	WRITE ( lunhlp, '(A)' ) ' <Pgf'
	nopen = nopen + 1
	WRITE ( lunhlp, '(A)' ) '  <PgfTag `gemtab''>'
	WRITE ( lunhlp, '(A)' ) '  <PgfAlignment Left >'
	WRITE ( lunhlp, '(A)' ) '  <PgfFIndent  0.0">'
	WRITE ( lunhlp, '(A)' ) '  <PgfLIndent  0.0">'
	WRITE ( lunhlp, '(A)' ) '  <PgfRIndent  0.0">'
	WRITE ( lunhlp, '(A)' ) '  <PgfLineSpacing Fixed>'
	WRITE ( lunhlp, '(A)' ) '  <PgfWithPrev Yes>'
	WRITE ( lunhlp, '(A)' ) '  <PgfWithNext No>'
	WRITE ( lunhlp, '(A)' ) '  <PgfBlockSize 20>'
C
C*	Write the tab location information.
C
	WRITE ( lunhlp, '(A,I2,A)' ) '  <PgfNumTabs ', ntabs, '>'
	DO itno = 1, ntabs
	    WRITE ( lunhlp, '(A)' ) '  <TabStop'
	    nopen = nopen + 1
	    WRITE ( lunhlp, '(A,F4.2,A)' ) '   <TSX  ', tstop, '">'
	    tstop = tstop + tsdiff
	    WRITE ( lunhlp, '(A)' ) '   <TSType Left >'
	    WRITE ( lunhlp, '(A)' ) '   <TSLeaderStr ` ''>'
	    WRITE ( lunhlp, '(A)' ) '  > # end of TabStop'
	    nopen = nopen - 1
	END DO
	WRITE ( lunhlp, '(A)' ) '  <PgfLetterSpace No >'
	WRITE ( lunhlp, '(A)' ) '  <PgfMinWordSpace 200>'
	WRITE ( lunhlp, '(A)' ) '  <PgfOptWordSpace 200>'
	WRITE ( lunhlp, '(A)' ) '  <PgfMaxWordSpace 200>'
	WRITE ( lunhlp, '(A)' ) ' > # end of Pgf'
	nopen = nopen - 1
 200	CONTINUE
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE OPNCNT ( record, npopen, nnopen, iret )
C************************************************************************
C*									*
C*  This subroutine determines the total number of open carets as of	*
C*  the current record, assuming that NPOPN is set to the previous	*
C*  record's number of open carets.					*
C*									*
C*  Input parameters:							*
C*	RECORD		CHAR*		Line to scan			*
C*	NPOPEN		INTEGER		Number of prev. open carets	*
C*									*
C*  Output parameters:							*
C*	NNOPEN		INTEGER		Number of newly opened carets	*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	9/94						*
C************************************************************************
	CHARACTER*(*)	record
C*
	LOGICAL		done
C------------------------------------------------------------------------
	nopen = npopen
	done = .false.
	ich = 1
C*	Locate all of the open carets, and count them.
	DO WHILE ( .not. done )
	    ilcart = INDEX ( record (ich:), '<' )
	    IF ( ilcart .eq. 0 ) THEN
		done = .true.
	    ELSE
		ich = ich + ilcart
		nopen = nopen + 1
	    END IF
	END DO
	done = .false.
	ich = 1
C*	Locate all of the close carets, and count them.
	DO WHILE ( .not. done )
	    ircart = INDEX ( record (ich:), '>' )
	    IF ( ircart .eq. 0 ) THEN
		done = .true.
	    ELSE
		ich = ich + ircart
		nopen = nopen - 1
	    END IF
	END DO
	nnopen = nopen
	RETURN
	END
	    
C
C========================================================================
C
	SUBROUTINE WTSLIN ( lunhlp, cline, iret )
C************************************************************************
C*									*
C*  This subroutine writes a line of text, including spaces to the MIF	*
C*  file.								*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	CLINE		CHAR*		Line to print out		*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  K. Brill/NMC	11/92						*
C*  G. Krueger/EAI	09/94	Open count; Spec. proc. for first "pr"	*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
	CHARACTER*(*)	cline
C*
	CHARACTER	apos, outstr*256, tmps*256
	DATA		apos /"'"/
C------------------------------------------------------------------------
	iret = 0
C*
	outstr = ' '
	CALL ST_LSTR ( cline, llstr, ier )
	IF ( .not. frstpr ) THEN
	    outstr = 'ln `' // cline (1:llstr) // ' ' // apos // '>>'
	ELSE
	    WRITE ( lunhlp, '(A)' ) '<ParaLine'
	    WRITE ( lunhlp, '(A, I2, A)' ) '<TextRectID ', idxfrm, '>'
	    outstr =
     +		'<String `' // tmps (1:llstr) // ' ' // apos // '>>'
	    frstpr = .false.
	END IF
	CALL PUTSPC ( outstr, llstr, ier )
	WRITE ( lunhlp, 101 ) outstr (1:llstr)
101	FORMAT (A)
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE GETVRT ( index, record, ivloc, iret )
C************************************************************************
C*									*
C*  This subroutine returns the virtual column of the current character	*
C*  in a character array.  That is, it takes into account tab stops,	*
C*  and returns the character column where the selected character would	*
C*  display, given eight space tab stops.				*
C*									*
C*  Input parameters:							*
C*	INDEX		INTEGER		Location in array		*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	IVLOC		INTEGER		Output char column position	*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	8/94						*
C* T. Piper/SAIC	11/02	Replaced tab with CHTAB			*
C************************************************************************
	INCLUDE		"GEMPRM.PRM"
C*
	CHARACTER*(*)	record
C*
C------------------------------------------------------------------------
	iret = 0
	CALL ST_LSTR (record, lrecl, ier)
C*
	ipos = 0
	ichin = 1
C
C*	While we have not run out of characters in the record, and
C*	we have not reached the requested input character, determine
C*	the new virtual location.
C
	DO WHILE ( ichin .le. lrecl .and. ichin .le. index )
C
C*	    We are at a tab, record the new resulting position.
C
	    IF ( record (ichin:ichin) .eq. CHTAB ) THEN
		ipos = ipos / 8 * 8 + 8
C
C*	    We are at a space, record the new resulting position.
C
	    ELSE
		ipos = ipos + 1
	    ENDIF
	    ichin = ichin + 1
	END DO

	ivloc = ipos

	RETURN
	END
C
C========================================================================
C
	SUBROUTINE GETIDX ( ivloc, record, index, iret )
C************************************************************************
C*									*
C*  This subroutine returns the character index of the requested	*
C*  virtual character column.  That is, it takes into account tab	*
C*  stops.  It assumes eight space tab stops.				*
C*									*
C*  Input parameters:							*
C*	IVLOC		INTEGER		Output char column position	*
C*	RECORD		CHAR*		Record to check out		*
C*									*
C*  Output parameters:							*
C*	INDEX		INTEGER		Location in array		*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	8/94						*
C* T. Piper/SAIC	11/02	Replaced tab with CHTAB			*
C************************************************************************
	INCLUDE		"GEMPRM.PRM"
C*
	CHARACTER*(*)	record
C------------------------------------------------------------------------
	iret = 0
	CALL ST_LSTR (record, lrecl, ier)
C*
	ipos = 0
	ichin = 1
C
C*	While we have not run out of characters in the input record,
C*	and we have not passed the virtual character column, compute
C*	the current virtual character column.
C
	DO WHILE ( ichin .le. lrecl .and. ipos .lt. ivloc )
C
C*	    We are at a tab, record the new resulting position.
C
	    IF ( record (ichin:ichin) .eq. CHTAB ) THEN
		ipos = ipos / 8 * 8 + 8
C
C*	    We are at a space, record the new resulting position.
C
	    ELSE
		ipos = ipos + 1
	    ENDIF
	    ichin = ichin + 1
	END DO

	index = ichin - 1

	RETURN
	END
C
C========================================================================
C
	SUBROUTINE WTFNSH ( lunhlp, luntpl, iret )
C************************************************************************
C*									*
C*  This subroutine finishes writing out the remaining parts of the	*
C*  input template to the output MIF file.				*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	LUNTPL		INTEGER		Unit number of MIF template	*
C*									*
C*  Output parameters:							*
C*	IRET		INTEGER		Return code			*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	 9/94						*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
C*
	CHARACTER	record*256, outstr*256, cmd*64, arg*32
C------------------------------------------------------------------------
	iret = 0
	CALL LOCCMD ( lunhlp, luntpl, 'Page', .false., cmd, ier )
	CALL LOCCMD ( lunhlp, luntpl, 'PageType BodyPage', .false.,
     +		      cmd, ier )
	CALL LOCCMD ( lunhlp, luntpl, 'ID', .false., cmd, ier )
	CALL STKELT  ( cmd, 2, ' ', ' ', narg, arg, iret )
	READ ( arg, '(I2)' ) idxfrm
	CALL LOCCMD ( lunhlp, luntpl, 'TextFlow', .false., cmd, ier )
	WRITE ( outstr, '(A, I2)' ) 'TextRectID', idxfrm
	CALL LOCCMD ( lunhlp, luntpl, outstr, .false., cmd, ier )
	iopens = 3
	DO WHILE ( iopens .gt. 1 )
	    READ ( luntpl, '(A)' ) record
	    CALL OPNCNT ( record, iopens, iopens, ier )
	END DO
C
C*	Synchronize the number of open commands before copying the
C*	template.
C
	nropen = 1
	IF ( nropen .ne. nopen ) THEN
	    WRITE (*, *)
     +		'Warning:  Incorrect number of open MIF commands.'
	    DO WHILE ( nopen .gt. nropen )
		WRITE ( lunhlp, '(A)' ) '>'
		nopen = nopen - 1
	    END DO
	    DO WHILE ( nopen .lt. nropen )
		READ ( luntpl, '(A)', END = 100 ) outstr
		CALL OPNCNT ( outstr, nropen, nropen, ier )
	    END DO
	END IF
C
C*	Transfer the remaining template.
C
	DO WHILE ( .true. )
	    READ ( luntpl, '(A)', END = 100 ) outstr
	    CALL ST_LSTR ( outstr, llstr, ier )
	    WRITE ( lunhlp, '(A)' ) outstr (1:llstr)
	END DO
 100	CONTINUE
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE LOCCMD ( lunhlp, luntpl, inline, cpyflg, commnd,
     +			    iret )
C************************************************************************
C*									*
C*  This subroutine locates a specific MIF command, while transferring	*
C*  preceding records, followed by the record containing the command.	*
C*  Then it returns the command's record.				*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	LUNTPL		INTEGER		Unit number of MIF template	*
C*	INLINE		CHAR*		The command name to locate	*
C*	CPYFLG		LOGICAL		Whether to transfer records	*
C*									*
C*  Output parameters:							*
C*	COMMND		CHAR*		The command line		*
C*	IRET		INTEGER		Return code			*
C*						0=normal		*
C*					       -7 = End of file		*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	 9/94						*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
	LOGICAL		cpyflg
	CHARACTER*(*)	inline, commnd
C*
	INTEGER		argno
	LOGICAL		found
	CHARACTER	record*256, cmd*64, incmd*64, arg*64, inarg*64
C------------------------------------------------------------------------
	iret = 0
	commnd = ' '
	found = .false.
C
C*	While we haven't found the appropriate command and arguments,
C*	keep looking.
C
	DO WHILE ( .not. found )
	    cmd = ' '
	    incmd = inline
	    DO WHILE ( incmd .ne. cmd )
		READ ( luntpl, '(A)', END = 100 ) record
		CALL ST_LSTR ( record, llstr, ier )
		IF ( cpyflg ) THEN
		    CALL OPNCNT ( record, nopen, nopen, ier )
		    WRITE ( lunhlp, '(A)' ) record (1:llstr)
		END IF
		ilcart = INDEX ( record, '<' )
		ircart = INDEX ( record, '>' )
		IF ( ircart .gt. ilcart ) THEN
		    iend = ircart - 1
		ELSE
		    iend = llstr
		END IF
		IF ( ilcart .gt. 0 ) THEN
		    CALL STKELT  ( record (ilcart+1:iend), 1, ' ', ' ',
     +				   nelt, cmd, iret )
		    CALL STKELT  ( inline, 1, ' ', ' ', narg, incmd,
     +				   iret )
		END IF
	    END DO
C
C*	    Check the arguments (if any).
C
	    found = .true.
	    argno = 2
	    DO WHILE ( found .and. argno .le. narg )
		CALL STKELT  ( record (ilcart+1:iend), argno, ' ', ' ',
     +			       nelt, arg, iret )
		CALL STKELT  ( inline, argno, ' ', ' ', narg, inarg,
     +			       iret )
		IF ( arg .ne. inarg ) found = .false.
		argno = argno + 1
	    END DO
	END DO
	commnd = record (ilcart+1:iend)
	RETURN
 100	CONTINUE
	iret = -7
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE CNTCMD ( lunhlp, luntpl, inlin1, inlin2, cpyflg,
     +			    commnd, iret )
C************************************************************************
C*									*
C*  This subroutine locates a specific MIF command (parent), which	*
C*  contains another specific MIF command (child), while transferring	*
C*  records preceding the parent command, followed by the record	*
C*  containing the parent command.  Then it returns the parent		*
C*  command's initial record.						*
C*									*
C*  Input parameters:							*
C*	LUNHLP		INTEGER		Unit number of MIF file		*
C*	LUNTPL		INTEGER		Unit number of MIF template	*
C*	INLIN1		CHAR*		The parent command to locate	*
C*	INLIN2		CHAR*		The child command to locate	*
C*	CPYFLG		LOGICAL		Whether to transfer records	*
C*									*
C*  Output parameters:							*
C*	COMMND		CHAR*		Parent command's initial record	*
C*	IRET		INTEGER		Return code			*
C*						0 = normal		*
C*					       -7 = End of file		*
C*									*
C*  Log:								*
C*  G. Krueger/EAI	 9/94						*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
	LOGICAL		cpyflg
	CHARACTER*(*)	inlin1, inlin2, commnd
C*
	INTEGER		argno
	LOGICAL		found
	CHARACTER	record*256, cmd*64, incmd*64, tcmd*64, arg*64,
     +			inarg*64
C------------------------------------------------------------------------
	iret = 0
	commnd = ' '
	found = .false.
C
C*	While we haven't found the appropriate command and arguments,
C*	keep looking.
C
	DO WHILE ( .not. found )
	    CALL LOCCMD ( lunhlp, luntpl, inlin1, cpyflg, tcmd, ier )
	    cmd = ' '
	    iopens = 1
	    reccnt = 0
	    incmd = inlin2
	    DO WHILE ( incmd .ne. cmd .and. iopens .gt. 0 )
		READ ( luntpl, '(A)', END = 100 ) record
		reccnt = reccnt + 1
		CALL ST_LSTR ( record, llstr, ier )
		CALL OPNCNT ( record, iopens, iopens, ier )
		ilcart = INDEX ( record, '<' )
		ircart = INDEX ( record, '>' )
		IF ( ircart .gt. ilcart ) THEN
		    iend = ircart - 1
		ELSE
		    iend = llstr
		END IF
		IF ( ilcart .gt. 0 ) THEN
		    CALL STKELT  ( record (ilcart+1:iend), 1, ' ', ' ',
     +				   nelt, cmd, iret )
		    CALL STKELT  ( inlin2, 1, ' ', ' ', narg, incmd,
     +				   iret )
		END IF
	    END DO
C
C*	    Check the arguments (if any).
C
	    found = .true.
	    argno = 2
	    DO WHILE ( found .and. argno .le. narg )
		CALL STKELT  ( record (ilcart+1:iend), argno, ' ', ' ',
     +			       nelt, arg, iret )
		CALL STKELT  ( inlin2, argno, ' ', ' ', narg, inarg,
     +			       iret )
		IF ( arg .ne. inarg ) found = .false.
		argno = argno + 1
	    END DO
	    DO WHILE ( reccnt .gt. 0 )
		BACKSPACE luntpl
		reccnt = reccnt - 1
	    END DO
	END DO
	commnd = record (ilcart+1:iend)
	RETURN
 100	CONTINUE
	iret = -7
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE STKELT  ( string, ielt, sep, cdef, nelt, celt,
     +			      iret )
C************************************************************************
C* STKELT								*
C*									*
C* This subroutine returns (picks) the specified element of a string	*
C* containing a list of strings delimited by the SEP string.  The	*
C* SEP string separates each of the elements.  If IELT is less than or	*
C* equal to zero, the number of elements, less the number of trailing	*
C* blank elements will be returned in NELT.				*
C*									*
C* STKELT  ( STRING, IELT, SEP, CDEF, NELT, NVECT, CELT, IRET )		*
C*									*
C* Input parameters:							*
C*	STRING		CHAR*		String 				*
C*      IELT            INTEGER         The element to be returned      *
C*	SEP		CHAR*		Separator			*
C*	CDEF		CHAR*		Default string 			*
C*									*
C* Output parameters:							*
C*	NELT		INTEGER		Total number of scalar elements	*
C*	CELT		CHAR*		The returned element		*
C*	IRET		INTEGER 	Return code			*
C*				   	  0 = normal return		*
C**									*
C* Log:									*
C* M. Goodman/RDS	10/84	Original source for STLIST		*
C* M. desJardins/GSFC	11/84						*
C* M. desJardins/GSFC	 2/85	Modified for ST_CLST			*
C* M. desJardins/GSFC	 6/88	Documentation				*
C* G. Krueger/EAI	 5/93	Modified from ST_CLST to ST_PELT	*
C* G. Krueger/EAI	10/93	Added ignore trailing blank commands	*
C* G. Krueger/EAI	 9/94	User specified separators		*
C************************************************************************
	CHARACTER*(*) 	string, celt, cdef, sep
C*
C------------------------------------------------------------------------
	iret = 0
	nelt  = 0
	nbelt = 0
	celt = ' '
C
C*	Get string length
C
	CALL ST_LSTR ( string, isize, iret )
	CALL ST_LSTR ( sep, issize, iret )
	IF ( sep .eq. ' ' ) issize = 1
C
C*	Check for zero length input string.
C
	IF  ( isize .eq. 0 )  THEN
	    nelt = 0
C
C*	    Check for separator and find list elements.
C
	ELSE
	    iend   = 0
	    ibegin = 1
	    DO WHILE  ( ibegin .le. isize )
	        loc = INDEX  ( string ( ibegin: ), sep )
	        IF  ( loc .eq. 0 )  THEN
		    iend = isize
	        ELSE
		    iend = ibegin + loc - 2
	        END IF
		IF ( ibegin .le. iend ) THEN
		    nelt = nelt + 1
		    IF ( string ( ibegin : iend ) .ne. ' ' ) THEN
			nbelt = nelt
		    ENDIF
		    IF  ( nelt .le. ielt )  THEN
			celt = string ( ibegin : iend )
		    END IF
		ELSE IF ( ibegin .eq. iend + 1 ) THEN
		    nelt = nelt + 1
		    IF ( nelt .le. ielt ) celt = ' '
		ENDIF
		ibegin = iend + 1 + issize
	    END DO
	    IF ( string ( isize-issize+1 : isize ) .eq. sep ) THEN
		nelt = nelt + 1
		IF ( nelt .le. ielt ) celt = ' '
	    ENDIF
	END IF
	IF ( nelt .eq. 0 ) THEN
	    celt = cdef
	ENDIF
	IF ( ielt .le. 0 ) THEN
	    nelt = nbelt
	ENDIF
C*
	RETURN
	END
C
C========================================================================
C
	SUBROUTINE SETOPN ( mopen, iret )
C************************************************************************
C* SETOPN								*
C*									*
C* This subroutine sets the variable that records the current count of	*
C* open MIF commands.							*
C*									*
C* SETOPN  ( MOPEN, IRET )						*
C*									*
C* Input parameters:							*
C*	MOPEN		INTEGER		The new open MIF command count	*
C*									*
C* Output parameters:							*
C*	IRET		INTEGER 	Return code			*
C*				   	  0 = normal return		*
C**									*
C* Log:									*
C* G. Krueger/EAI	 9/94						*
C************************************************************************
	LOGICAL frstpr
	COMMON /wtcmn/  ipropn, nopen, frstpr, idxfrm
C------------------------------------------------------------------------
	iret = 0
	nopen = mopen
C*
	RETURN
	END
C
C========================================================================
C
