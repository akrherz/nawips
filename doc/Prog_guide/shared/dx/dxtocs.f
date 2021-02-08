	SUBROUTINE DXTOCS ( entry )
C************************************************************************
C* DXTOCS								*
C*									*
C* This subroutine writes a Table Of Contents sub-entry.		*
C*									*
C* DXTOCS ( ENTRY )							*
C*									*
C* Input parameters:							*
C*	ENTRY		CHAR*		Text for the TOC entry		*
C**									*
C* Log:									*
C* M. Linda/GSC		12/97	Original				*
C************************************************************************
	INCLUDE		'dxcmn.cmn'
	INCLUDE		'dxtoc.cmn'
C*
	CHARACTER*(*)	entry
C
	CHARACTER	periods*128
	CHARACTER	chapst*10, pagest*10, pgnum*10
C------------------------------------------------------------------------
C
C*	Convert the chapter and page numbers to strings.
C
	CALL ST_INLN ( ichap, chapst, ilnc, iret )
	CALL ST_INLN ( ipgnm, pagest, ilnp, iret )
C
C*	Check for TOC overflow.
C
	IF  ( ( itocln + 1 ) .gt. TOCMAX ) THEN
	    CALL ER_WMSG ( 'DX', -8, chapst, ier )
	    RETURN
	END IF
C
	itocln = itocln + 1
C
C*	Start with a line-full of periods.
C
	periods = '.  .  .  .  .  .  .  .  .  .  ' //
     +		  '.  .  .  .  .  .  .  .  .  .  ' //
     +		  '.  .  .  .  .  .  .  .  .  .  ' //
     +		  '.  .  .  .  .  .  .  .  .  .  ' //
     +		  '.  .  . '
	toc ( itocln ) ( 1:CLPAGE ) = periods
C
C*	Paste the main text over the periods.
C
	CALL ST_LSTR ( entry, ilne, iret )
	toc ( itocln ) ( 1:ilne ) = entry ( 1:ilne )
C
C*	Construct a chapter-page combination.
C
	pgnum = chapst ( 1:ilnc ) // '-' // pagest ( 1:ilnp )
	CALL ST_LSTR ( pgnum, ilnw, iret )
C
C*	Paste the chapter-page combination into the TOC entry.
C
	toc ( itocln ) ( CLPAGE-RMARGN-LMARGN-6: ) = ''
	toc ( itocln ) ( CLPAGE-RMARGN-LMARGN-ilnw+1: ) = pgnum
C*
	RETURN
	END
