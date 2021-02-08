      SUBROUTINE WRITE_DENSITY ( dattim, gparm, kx, ky, density_grid,
     .                           gdfile, lllat, lllon, urlat, urlon,
     .                           iret ) 
C************************************************************************
C* WRITE_DENSITY							*
C*									*
C* This subroutine creates a GEMPAK grid file and writes a lightning    *
C* strike density dataset to that file.					*
C*                                                                      *
C*									*
C* WRITE_DENSITY ( DATTIM, GPARM, KX, KY, DENSITY_GRID, GDFILE, LLLAT,  *
C*		   LLLON, URLAT, URLON, IRET )                          *
C*                                                                      *
C* Input parameters:							*
C*	DATTIM          CHAR*        Date/time of dataset		*
C*	GPARM           CHAR*        GEMPAK parameter name of strike    *
C*				     densities				*
C*      KX              INTEGER      Number of points in the x direction*
C*      KY              INTEGER      Number of points in the y direction*
C* DENSITY_GRID(KX,KY)  REAL         Contains strike densities dataset. *
C*	GDFILE          CHAR*        Name of GEMPAK output grid file    * 
C*	LLLAT           REAL         Latitude of lower left corner of   *
C*                                   dataset                            *
C*	LLLON           REAL         Longitude of lower left corner of  *
C*                                   dataset                            *
C*	URLAT           REAL         Longitude of upper right corner of *
C*                                   dataset                            *
C*	URLON           REAL         Longitude of upper right corner of *
C*                                   dataset                            *
C*									*
C* Output parameters:							*
C*	IRET		INTEGER      Return code			*
C*									*
C**									*
C* Log:									*
C* G. McFadden/SAIC	12/12						*
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
C*
	CHARACTER*(*)	dattim
	CHARACTER*(*)	gdfile
	CHARACTER*(*)   gparm	
C*
	REAL	        density_grid(kx,ky)
	REAL	        lllat, lllon, urlat, urlon 
	INTEGER	        kx,ky
	INTEGER	        ipktyp,nbits,iret
C*
        INCLUDE         'ERMISS.FNC'
C-----------------------------------------------------------------------
C
C*      Create the GEMPAK grid file.
C
        WRITE(6,*) 'WRITE_GRID pre crtfil'
        WRITE(6,102) gdfile, dattim 
 102      FORMAT(A,A)
        WRITE(6,103) lllat, lllon 
 103      FORMAT(F7.2,1X,F7.2)

        CALL CRTFIL (gdfile, igdfil, kx, ky, lllat, lllon,
     .               urlat, urlon, ipktyp, nbits, iret)
C
        IF (iret .ne. 0) THEN
           iret = -1 
           RETURN
        END IF
        WRITE(6,*) 'post crtfil'
C
C*      Write the data to the grid file. 
C
        WRITE(6,*) 'pre wrtgrd'
        CALL WRTGRD ( igdfil, kx, ky, ipktyp, nbits, dattim, gparm,
     +                density_grid, iret) 
        IF ( iret .ne. 0) THEN
           CALL ER_WMSG ( 'GD', iret, ' ', ier )
        ENDIF
        WRITE(6,*) 'post wrtgrd'
C
C*      Close the grid file.
C
	CALL GD_CLOS (igdfil, iret) 
C
        RETURN
        END
