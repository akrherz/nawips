	SUBROUTINE DXNEWP ( )
C************************************************************************
C* DXNEWP								*
C*									*
C* This subroutine completes the current page, outputs the page, and	*
C* starts a new page.							*
C*									*
C* DXNEWP ( )								*
C*									*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
C*
	CHARACTER	chapst*128, pagest*10, pgnum*10
	CHARACTER	chff*1
C
	DATA		chff / 12 /
C------------------------------------------------------------------------
C
C*	Page one is 1 line longer because of the way page breaks work.
C
	icomp = 0
	IF ( ipgnm .eq. 1 .and. ichap .ne. 0 ) icomp = 1
	IF ( ipgnm .eq. 3 .and. ichap .eq. 0 ) icomp = 1
C
C*	Fill the rest of the current page with blank lines.
C
	DO  i = lncur + 1, LNPAGE - 1 + icomp
	    page ( i ) = ''
	END DO
C
C*	Add the footer as the last line on the page.
C
	page ( LNPAGE + icomp ) = footer
C
C*	Paste the page number into the footer.
C
	CALL ST_INLN ( ipgnm, pagest, ilnp, iret )
C
	IF  ( ichap .gt. 0 ) THEN
	    CALL ST_INLN ( ichap, chapst, ilnc, iret )
	ELSE
	    CALL ST_LSTR ( chnumb, ilnc, iret )
	    chapst = chnumb ( 1:ilnc )
	END IF
C
	IF  ( ichap .eq. 0 ) THEN
	    pgnum = pagest
	ELSE
	    pgnum = chapst ( 1:ilnc ) // '-' // pagest ( 1:ilnp )
	END IF
C
	CALL ST_LSTR ( pgnum, ilnw, iret )
	ibeg = ( CLPAGE / 2 ) - ( ilnw / 2 )
	iend = ibeg + ilnw
C
	page ( LNPAGE + icomp ) ( ibeg:iend ) = pgnum ( 1:ilnw )
C
C*	Add a form-feed at the end of the footer.
C
	page ( LNPAGE + icomp ) ( CLPAGE+1:CLPAGE+1 ) = chff
C
C*	Print the page to the output.
C
	DO  j = 1, LNPAGE + icomp
	    CALL ST_LSTR ( page ( j ), ilen, iret )
	    WRITE ( lunout, '(A)' ) page ( j ) ( 1:ilen )
	END DO
C
C*	Initialize the next page.
C
	ipgnm = ipgnm + 1
C
	page ( 1 ) = header
C
	DO  i = 2, LNHEAD
	    page ( i ) = ''
	END DO
C
	lncur = LNHEAD
C*
	RETURN
	END
