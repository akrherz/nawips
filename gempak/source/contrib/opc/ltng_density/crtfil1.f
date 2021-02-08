	SUBROUTINE CRTFIL1 ( gdfile, igdfil, kx, ky, lllat, lllon,
     .                      urlat, urlon, ipktyp, nbits, iret )
C************************************************************************
C* CRTFIL1								*
C*									*
C* This subroutine will create a dummy GEMPAK grid file so that GTRANS  *
C* will work later on in the program.                                   *
C*									*
C* CRTFIL1( GDFILE, IGDFIL, KX, KY, LLLAT, LLLON, URLAT, URLON,		*
C*		 IPKTYP, NBITS, IRET )				        *
C*                                                                      *
C* Input parameters:							*
C*	GDFILE          CHAR*        Grid file name                     *
C*	KX		INTEGER      Number of points in the x direction*
C*	KY		INTEGER      Number of points in the y direction*
C*	LLLAT		FLOAT        Latitude of lower left corner of   *
C*				     grid box				*
C*	LLLON		FLOAT        Longitude of lower left corner of  *
C*				     grid box				*
C*	URLAT		FLOAT        Latitude of upper right corner of  *
C*				     grid box				*
C*	URLON		FLOAT        Longitude of upper right corner of *
C*				     grid box				*
C*									*
C* Output parameters:							*
C*	IGDFIL		INTEGER      Grid file number   		*
C*	IPKTYP		INTEGER      Data packing type			*
C*	NBITS		INTEGER      Number of bits for packing		*
C*				     grid box				*
C*	IRET		INTEGER      Return code        		*
C*									*
C**									*
C* Log:									*
C* S. Jacobs/NCEP	 2/96						*
C* G. McFadden/SAIC	 5/03        Open grid file if it exists	*
C* G. McFadden/SAIC	 4/09        User specifies grid box and kx,ky. *
C*				     Call GR_SNAV so GTRANS will work 	*
C************************************************************************
	INCLUDE		'GEMPRM.PRM'
C*
        CHARACTER*(*)   gdfile
C*
	CHARACTER       newfil*132, cprj*4, gpack*12	
        INTEGER         iebnds (4), navsz
        INTEGER         igdfil, kx, ky, nbits, iret 
        REAL            rnvblk (LLNNAV), anlblk (LLNANL), dbnds(4)
        REAL            lllat, lllon, urlat, urlon 
        LOGICAL         exist, angflg, wrtflg
C-----------------------------------------------------------------------
        iret = 0
        navsz = LLNNAV 
	print *, 'navsz = ', navsz
C
C*      Set the data packing information.
C
        gpack = ' '
        CALL GR_PACK ( gpack, ipktyp, nbits, iret )

        WRITE(6,101) 'CRTFIL1, GR_PACK',iret
 101    FORMAT(A,I5)
 
        IF (iret.ne.0) THEN
           PRINT *, 'CRTFIL1, GR_PACK'
           CALL ER_WMSG('GR',iret,' ',ier)
        END IF
C
C*      Check for the grid file. Open the grid file if it exists.
C
        CALL FL_INQR ( gdfile, exist, newfil, iret )
        IF (iret.ne.0) THEN
           PRINT *, 'CRTFIL1, FL_INQR'
           CALL ER_WMSG('FL',iret,' ',ier)
        END IF
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
           cprj   = 'CED'
           ang1   = 0.0
           ang2   = -180.0
           ang3   = 0.0
           angflg = .false. 
           angflg = .true. 
C
C*      Set the lower left and upper right corner points.  
C
           alat1 =  lllat
           alon1 =  lllon
           alat2 =  urlat
           alon2 =  urlon

        WRITE(6,102) 'CRTFIL1, alat1', alat1
 102    FORMAT(A,F7.2)
        WRITE(6,102) 'CRTFIL1, alon1', alon1
        WRITE(6,102) 'CRTFIL1, alat2', alat2
        WRITE(6,102) 'CRTFIL1, alon2', alon2

        WRITE(6,103) 'CRTFIL1, kx', kx
        WRITE(6,103) 'CRTFIL1, ky', ky
 103    FORMAT(A,I6)


C        write (6, * ) 'rnvblk pre mnav'
C        do idx = 1 , 20
C           write (6, * ) rnvblk(idx)
C        enddo
        
C
C*      Construct the navigation block.
C
	   CALL GR_MNAV ( cprj, kx, ky, alat1, alon1, alat2, alon2,
     +                    ang1, ang2, ang3, angflg, rnvblk, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL1, GR_MNAV'
              CALL ER_WMSG('GR',iret,' ',ier)
           END IF

C        write (6, * ) 'rnvblk post mnav'
C        do idx = 1 , 20
C           write (6, * ) rnvblk(idx)
C        enddo

C*           CALL GR_SNAV ( navsz, rnvblk, iret ) 
	   CALL GSGPRJ (cprj, ang1,ang2,ang3, kx,ky, alat1,alon1,
     +	                alat2,alon2, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL1, GR_SNAV iret = ', iret
              CALL ER_WMSG('GR',iret,' ',ier)
              STOP
           END IF
C        write (6, * ) 'rnvblk post snav'
C        do idx = 1 , 20
C           write (6, * ) rnvblk(idx)
C        enddo

C
C*      Construct the analysis block.
C
           deltan = 4.0
           DO i = 1, 4
                  iebnds(i) = 2.0
                  dbnds(i) = RMISSD
           END DO
           CALL GR_MBN2 ( deltan, iebnds, dbnds, rnvblk, anlblk, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL1, GR_MBN2'
              CALL ER_WMSG('GR',iret,' ',ier)
           END IF
C
C*      Create the file with 'imxgrd' number of possible grids.
C
           PRINT *, 'CRTFIL1 pre-GD_CREF'
           ihd = 2
           imxgrd = 2000
           CALL GD_CREF ( gdfile, LLNNAV, rnvblk, LLNANL, anlblk,
     +                    ihd, imxgrd, igdfil, iret )
           IF (iret.ne.0) THEN
              PRINT *, 'CRTFIL1, GD_CREF'
              CALL ER_WMSG('GD',iret,' ',ier)
           END IF
           PRINT *, 'CRTFIL1 post-GD_CREF'
        END IF
C*
        RETURN
        END
