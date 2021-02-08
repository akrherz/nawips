	PROGRAM LTNG_DENSITY
C************************************************************************
C* PROGRAM LTNG_DENSITY							*
C*									*
C* This program creates a GEMPAK grid file of lightning strike density.	*
C* Arguements								*
C* (1)  GEMPAK Date and time of lightning strikes			*
C* (2)  GEMPAK parameter name used for lightning strike density		*
C* (3)  Filename of the ASCII n-minute lightning strikes file		*
C* (4)  Number of digits of "n" in the "n-minute file" filename		*
C* (5)  Time resolution of lightning strike density			*
C* (6)  Space resolution of lightning strike density			*
C**									*
C**									*
C* Log:									*
C* G. McFadden/IMSG	12/12	Started					*
C************************************************************************
C*
	INCLUDE		'GEMPRM.PRM'
	INCLUDE		'LTNG_DENSITY.PRM'
C*
	REAL lllat, lllon, urlat, urlon
	REAL lllatd, lllond, urlatd, urlond
	INTEGER kx, ky, gx, gy
	CHARACTER	 gdfile*72, dum_gdfile*72
        CHARACTER strikes_file*20, dattim*20, gparm*12
        CHARACTER*10 time_res, space_res
        CHARACTER*2 nmin_digits 
        REAL density_grid(IDENSX,IDENSY)
	INTEGER iperr, iret
	LOGICAL respnd
C*
C-----------------------------------------------------------------------
C*
C
C*	Identify output GEMPAK lightning density file
C 
 	gdfile = 'lightgem.grd'
C
C*	Identify the dimensions of the density grid
C
        ky = IDENSY
        kx = IDENSX 

        gy = ky 
        gx = kx
C
C*	Identify the corner points of the density grid
C
        lllat = LLLAT_COR 
        lllon = LLLON_COR
        urlat = URLAT_COR
        urlon = URLON_COR

        lllatd = lllat 
        lllond = lllon
        urlatd = urlat
        urlond = urlon
C
C*      Identify the dummy GEMPAK grid file
C
        dum_gdfile = 'light_dum.grd'
C
C*      Get the following arguements from the environment:
C*      Date and time of lightning strikes,
C*      GEMPAK parameter name used for lightning density,
C*      Filename of the ASCII lightning strikes file,
C*      Number of digits of "n" in the "n-minute file" filename,
C*      Time resolution of lightning density,
C*      Space resolution of lightning density.
C
        CALL getarg(1, dattim)
        CALL getarg(2, gparm)
        CALL getarg(3, strikes_file)
        CALL getarg(4, nmin_digits)
        CALL getarg(5, time_res)
        CALL getarg(6, space_res)
C
C*      Initialize GEMPAK
C
        WRITE (6,*) 'pre IP_INIT c'
C       CALL IN_BDTA (iret)
        CALL IP_INIT  ( respnd, iperr )
        mode = 1
        WRITE (6,*) 'pre GG_INIT'
        CALL GG_INIT ( 1, iret)
        WRITE (6,*) 'post GG_INIT'
C
C*      Create the dummy GEMPAK grid file
C
        WRITE (6,*) 'pre WRITE_DENSITY lllat is ',lllat
        WRITE (6,*) 'pre WRITE_DENSITY lllon is ',lllon
        WRITE (6,*) 'pre WRITE_DENSITY urlat is ',urlat
        WRITE (6,*) 'pre WRITE_DENSITY urlon is ',urlon
        WRITE (6,*) 'pre CRTFIL1'
        CALL CRTFIL1 ( dum_gdfile, igdfil, gx, gy, lllatd, lllond,
     +                 urlatd, urlond, ipktyp, nbits, iret )
        WRITE (6,*) 'post CRTFIL1'
C
C*      Get the ASCII lightning strikes dataset from the input file
C*      and calculate lightning strike density.
C
        WRITE(6,*) 'pre get_density'
        CALL GET_DENSITY ( strikes_file, nmin_digits, time_res,
     +                     space_res, kx, ky, density_grid )
        WRITE(6,*) 'post get_density'
C
C*      Write the lightning strike density grid to the GEMPAK output file
C
        WRITE (6,*) 'pre WRITE_DENSITY dattim is ',dattim
        WRITE (6,*) 'pre WRITE_DENSITY gparm is ',gparm
        WRITE (6,*) 'pre WRITE_DENSITY strikes_file is ',strikes_file
        WRITE (6,*) 'pre WRITE_DENSITY gdfile is ',gdfile
        WRITE (6,*) 'pre WRITE_DENSITY kx is ',kx
        WRITE (6,*) 'pre WRITE_DENSITY ky is ',ky
        WRITE (6,*) 'pre WRITE_DENSITY lllat is ',lllat
        WRITE (6,*) 'pre WRITE_DENSITY lllon is ',lllon
        WRITE (6,*) 'pre WRITE_DENSITY urlat is ',urlat
        WRITE (6,*) 'pre WRITE_DENSITY urlon is ',urlon
        CALL WRITE_DENSITY ( dattim, gparm, kx, ky, density_grid,
     +                       gdfile, lllat, lllon, urlat, urlon, iret)
        WRITE (6,*) 'post WRITE_DENSITY'
C
C*      Close the dummy GEMPAK file.
C
        CALL GD_CLOS ( igdfil, iret )
C
C*      All done.
C
	STOP	
	END
