#!/bin/sh

#
#  Set compilation and link flags for C and FORTRAN.
#

export AR="ar"
export CC="cc"
export FC="f77"
export LD="ld"
export RM="rm -f"
export ARFLAGS="rv"
export BUFRFLAGS="-O"
export LDFLAGS="-L/awips2/python/lib -L$OS_LIB -s"
export INCLUDES="-I$GEMINC -I$NAWIPS/os/$NA_OS/include"

case $OS in
    AIX )
	export CC="cc -qlanglvl=extc99"
	export CFLAGS="$INCLUDES -D$OS $WITHPY"
	export FFLAGS="$INCLUDES -qsuppress=1501-510"
	export XLIBS="-lXm -lXt -lX11"
	export BUFRFLAGS="-O -D_SYS_TYPES_H"
	export OBJECT_MODE="32"
	;;

    HPUX )
	export FC="f90"
	export CFLAGS="$INCLUDES -D$OS +DA1.1 $WITHPY"
	export FFLAGS="$INCLUDES +DA1.1"
	export LDFLAGS="$LDFLAGS +DA1.1"
	export XLIBS="-lXm -lXt -lX11 -lXp -lXext -lmalloc"
	;;

    IRIX )
	export CFLAGS="$INCLUDES -D$OS -DUNDERSCORE -I/usr/Motif-2.1/include $WITHPY"
	export FFLAGS="$INCLUDES -I/usr/Motif-2.1/include"
	export LDFLAGS="$LDFLAGS -L/usr/Motif-2.1/lib32 -woff 85"
	export XLIBS="-lXm -lXt -lX11 -lPW"
	;;

    Linux )
	export CC="gcc"
	export FC="g77"
# Uncomment the following for GFORTRAN
#	export FC="gfortran"

	export BUFRFLAGS="-DNO_MSG_IPC -ansi $BUFRFLAGS"
	export CFLAGS="$INCLUDES -D$OS -DUNDERSCORE -I/usr/X11R6/include $PYINC $WITHPY"

	export FFLAGS="$INCLUDES -fno-second-underscore"
# Uncomment the following for GFORTRAN
#	export FFLAGS="$INCLUDES -fno-range-check -fno-second-underscore -ffixed-line-length-none"

	export XLIBS="-lXm -lXt -lX11 -lSM -lICE -lXp -lXext -lXmu -lXft -ljpeg -lpng -lz"

	if [ $bit == "i386" ]
	then
	    export LDFLAGS="$LDFLAGS -L/usr/X11R6/lib"
	else
	    export CFLAGS="$CFLAGS -DG_64BIT"
	    export LDFLAGS="$LDFLAGS -L/usr/X11R6/lib64"
	fi
	;;

    SunOS )
	export CFLAGS="$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	export FFLAGS="$INCLUDES -silent"
	export XLIBS="-lXm -lXt -lX11"
	;;

    OSF1 )
	export CFLAGS="$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	export FFLAGS="$INCLUDES -O0"
	export XLIBS="-lXm -lXt -lX11"
	;;

    ULTRIX )
	export CFLAGS="$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	export FFLAGS="$INCLUDES"
	export XLIBS="-lXm -lXt -lX11"
	;;

    * )
	echo
	echo "WARNING..."
	echo
	echo "No compiler options have been set."
	echo
	;;
esac
