	SUBROUTINE CRTFIL (gdfile, igdfil, kx, ky, lllat, lllon,
     .                     urlat, urlon, ipktyp, nbits, iret)
C************************************************************************
C* CRTFIL								*
C*									*
C* This subroutine will create a GEMPAK grid file to be used as the     *
C* output file for a dataset of gridded lightning strike densities data.*
C*                                                                      *
C*									*
C* CRTFIL ( GDFILE, IGDFIL, KX, KY, LLLAT, LLLON, URLAT, URLON, IPKTYP, *
C*          NBITS, IRET)						*
C*                                                                      *
C* Input parameters:							*
C*	GDFILE          CHAR*        Grid file name                     *
C*	KX		INTEGER      Number of points in the x direction*
C*	KY		INTEGER      Number of points in the y direction*
C*	LLLAT		FLOAT        Latitude of lower left corner of   *
C*				     dataset.				*
C*	LLLON		FLOAT        Longitude of lower left corner of  *
C*				     dataset.				*
C*	URLAT		FLOAT        Latitude of upper right corner of  *
C*				     dataset.				*
C*	URLON		FLOAT        Longitude of upper right corner of *
C*				     dataset.				*
C*									*
C* Output parameters:							*
C*	IGDFIL		INTEGER      Grid file number   		*
C*	IPKTYP		INTEGER      Data packing type			*
C*	NBITS		INTEGER      Number of bits for packing		*
C*	IRET		INTEGER      Return code        		*
C*									*
C**									*
C* Log:									*
C* S. Jacobs/NCEP	 2/96						*
C* G. McFadden/SAIC	 3/05        Adapted for converting to GEMPAK	*
C* 			             pressures.				*
C* G. McFadden/SAIC	 1/06        Workaround for edges on date line	*
C* G. McFadden/IMSG	12/12        Adapted for lightning strike 	*
C*				     densities				*
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
C*
        CHARACTER*(*)   gdfile
C*
	CHARACTER       newfil*132, cprj*4, gpack*12	
        INTEGER         kx,ky,iebnds (4)
        REAL            rnvblk (LLNNAV), anlblk (LLNANL), dbnds(4)
        REAL            urlat, urlon, lllat, lllon, alat1, alon1
        LOGICAL         exist, angflg, wrtflg
C-----------------------------------------------------------------------
        iret = 0
        alat1 = 0
        alon1 = 0

        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon
        WRITE(6,103) 'CRTFIL, gdfile is: ', gdfile 
 103    FORMAT(A,A)
C
C*      Set the data packing information.
C
        gpack = ' '
        CALL GR_PACK ( gpack, ipktyp, nbits, iret )

        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon
        WRITE(6,101) 'CRTFIL, GR_PACK',iret
 101    FORMAT(A,I5)
 
        IF (iret.ne.0) THEN
           PRINT *, 'CRTFIL, GR_PACK'
           CALL ER_WMSG('GR',iret,' ',ier)
        END IF
C
C*      Check for the grid file. Open the grid file if it exists.
C
        CALL FL_INQR ( gdfile, exist, newfil, iret )
        IF (iret.ne.0) THEN
           PRINT *, 'CRTFIL, FL_INQR'
           CALL ER_WMSG('FL',iret,' ',ier)
        END IF
        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon
        IF (exist) THEN
           wrtflg = .true. 
           CALL GD_OPNF ( gdfile, wrtflg, igdfil, navsz, rnvblk, 
     +                    ianlsz, anlblk, ihdrsz, maxgrd, iret )
           IF ( iret.ne.0) THEN
              WRITE ( 6, * ) 'The attempt to open the grid file failed.'
              iret = -1
              RETURN
           END IF
C
        ELSE
C
C*      Create the grid file
C       
C*      Set the map projection.
C
        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon
           cprj   = 'CED'
           ang1   = 0.0
           ang2   = -180.0
           ang3   = 0.0
           angflg = .false. 
C           angflg = .true. 
C
C*      Set the lower left and upper right corner points.  
C
        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon
        WRITE(6,102) 'CRTFIL, alat1', alat1 
        WRITE(6,102) 'CRTFIL, alon1', alon1 
           alat1 =  lllat 
           alon1 =  lllon 
           alat2 =  urlat 
           alon2 =  urlon
C
C*      We don''t have to worry about the workaround, because the
C*      grid is fixed, and no edge of the grid is coincident with 
C*      the date line.  
C
           if (alon1.eq.180.0) THEN
              alon1 = -179.5
           ENDIF
           if (alon2.eq.180.0) THEN
              alon2 = 179.5
           ENDIF
        
        WRITE(6,102) 'CRTFIL, lllat', lllat
        WRITE(6,102) 'CRTFIL, lllon', lllon

        WRITE(6,102) 'CRTFIL, alat1', alat1
 102    FORMAT(A,F7.2)
        WRITE(6,102) 'CRTFIL, alon1', alon1
        WRITE(6,102) 'CRTFIL, alat2', alat2
        WRITE(6,102) 'CRTFIL, alon2', alon2
C
C*      Construct the navigation block.
C
	   CALL GR_MNAV ( cprj, kx, ky, alat1, alon1, alat2, alon2,
     +                    ang1, ang2, ang3, angflg, rnvblk, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL, GR_MNAV'
              CALL ER_WMSG('GR',iret,' ',ier)
           END IF
C
C*      Construct the anlysis block.
C
           deltan = 4.0
           DO i = 1, 4
                  iebnds(i) = 2.0
                  dbnds(i) = RMISSD
           END DO
           CALL GR_MBN2 ( deltan, iebnds, dbnds, rnvblk, anlblk, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL, GR_MBN2'
              CALL ER_WMSG('GR',iret,' ',ier)
           END IF
C
C*      Create the file with 'imxgrd' number of possible grids.
C
           PRINT *, 'CRTFIL pre-GD_CREF'
           ihd = 2
           imxgrd = 2000
           CALL GD_CREF ( gdfile, LLNNAV, rnvblk, LLNANL, anlblk,
     +                    ihd, imxgrd, igdfil, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL, GD_CREF'
              CALL ER_WMSG('GD',iret,' ',ier)
           END IF
           PRINT *, 'CRTFIL post-GD_CREF'
        END IF
C*
        RETURN
        END
