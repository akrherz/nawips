	SUBROUTINE WRTGRD (igdfil, kx, ky, ipktyp, nbits, dattim,
     +                     parm, value, iret)
C************************************************************************
C* WRTGRD								*
C*									*
C* This subroutine will write the gridded lightning strike density data *
C* to the GEMPAK grid file.					 	*
C*                                                                      *
C*									*
C* WRTGRD ( IGDFIL, KX, KY, IPKTYP, NBITS, DATTIM, PARM, VALUE, IRET )  *
C*                                                                      *
C* Input parameters:							*
C*	IGDFIL		INTEGER      Grid file number   		*
C*	KX		INTEGER      Number of points in the x direction*
C*	KY		INTEGER      Number of points in the y direction*
C*	IPKTYP		INTEGER      Data packing type			*
C*	NBITS		INTEGER      Number of bits for packing		*
C*	DATTIM		CHAR*        GEMPAK date/time			*
C*	PARM		CHAR*        GEMPAK parameter name		*
C*	VALUE (KX,KY)	REAL         Grid point data			* 
C*                                                                      *
C* Output parameters:							*
C*	IRET		INTEGER      Return code        		*
C*									*
C**									*
C* Log:									*
C* S. Jacobs/NCEP	 2/96						*
C* G. McFadden/IMSG	12/12	Write lightning strike density to GEMPAK*
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
	INCLUDE		'LTNG_DENSITY.PRM'
C*
        PARAMETER ( ISIZE = IDENSX * IDENSY )
        CHARACTER*(*)   dattim, parm
        REAL            value(KX,KY)
C*
	CHARACTER       time(2)*20, ppp*12	
        INTEGER         ighdr(10), level(2)
        REAL            grid (ISIZE)
        LOGICAL         replac 
C*
        DATA            ighdr / 10 * 0 /
C-----------------------------------------------------------------------
        iret = 0
        time (1) = dattim
        time (2) = ' '
        level(1) = 0
        level(2) = -1
        ivcord = 0
        CALL ST_LCUC ( parm, ppp, ier )
        replac = .false.
        WRITE(6,103) kx, ky
 103    FORMAT (I5, 1X, I5) 
        WRITE(6,101) dattim
 101    FORMAT(A)
C
C*      Loop over the Y and X directions, and assign a value to the
C*      grid point. 
C*      GEMPAK works with single dimensional arrays for the grids.
C*      Note the equation used to index the variable 'grid'.
C*      Replace 'value' with the appropriate variable name.
C
        DO j = 1, ky
           DO i = 1, kx
              grid ( (j-1)*kx+i  ) = value ( i , j )
C              IF (value(i,j).ne.-9999.0) THEN
C                 WRITE(6,102) 'value is ',value(i,j)
C 102              FORMAT(A, F9.3)
C              ENDIF
           END DO
        END DO

        WRITE(6,101) 'wrtgrd past getting of array'
C
C*      Write the grid to the file.
C
        CALL GD_WPGD ( igdfil, grid, kx, ky, ighdr, time, 
     +                 level, ivcord, ppp, replac, ipktyp,
     +                 nbits, iret )
        IF (iret.ne.0) THEN
           PRINT *, 'WRTGRD, GD_WPGD'
           CALL ER_WMSG('GD',iret,' ',ier)
        END IF

        WRITE(6,101) 'wrtgrd post write of grid to file'
C*
        RETURN
        END
