#!/bin/csh

#
#  Set compilation and link flags for C and FORTRAN.
#

setenv AR	"ar"
setenv CC	"cc"
setenv FC	"f77"
setenv LD	"ld"
setenv RM	"rm -f"
setenv ARFLAGS	"crv"
setenv BUFRFLAGS "-O"
setenv LDFLAGS	"-L/awips2/python/lib -L$OS_LIB -s"
setenv INCLUDES	"-I$GEMINC -I$NAWIPS/os/$NA_OS/include"

switch ( $OS )
    case "AIX":
	setenv CC	"cc -qlanglvl=extc99"
	setenv CFLAGS	"$INCLUDES -D$OS $WITHPY"
	setenv FFLAGS	"$INCLUDES -qsuppress=1501-510"
	setenv XLIBS	"-lXm -lXt -lX11"
	setenv BUFRFLAGS "-O -D_SYS_TYPES_H"
	setenv OBJECT_MODE "32"
	breaksw

    case "HPUX":
	setenv FC	"f90"
	setenv CFLAGS	"$INCLUDES -D$OS +DA1.1 $WITHPY"
	setenv FFLAGS	"$INCLUDES +DA1.1 -w"
	setenv LDFLAGS	"$LDFLAGS +DA1.1"
	setenv XLIBS	"-lXm -lXt -lX11 -lXp -lXext -lmalloc"
	breaksw

    case "IRIX":
	setenv CFLAGS	"$INCLUDES -D$OS -DUNDERSCORE -I/usr/Motif-2.1/include $WITHPY"
	setenv FFLAGS	"$INCLUDES -I/usr/Motif-2.1/include"
	setenv LDFLAGS	"$LDFLAGS -L/usr/Motif-2.1/lib32 -Wl,-woff,85"
	setenv XLIBS	"-lXm -lXt -lX11 -lPW"
	breaksw

    case "Linux":
	setenv CC	"gcc"
	setenv FC	"g77"
# Uncomment the following for GFORTRAN
#	setenv FC	"gfortran"

	setenv BUFRFLAGS "-DNO_MSG_IPC -ansi $BUFRFLAGS"
	setenv CFLAGS	"$INCLUDES -D$OS -DUNDERSCORE -I/usr/X11R6/include $PYINC $WITHPY"
	setenv FFLAGS	"$INCLUDES -fno-second-underscore"
# Uncomment the following for GFORTRAN
#	setenv FFLAGS	"$INCLUDES -fno-range-check -fno-second-underscore -ffixed-line-length-none"

	setenv XLIBS	"-lXm -lXt -lX11 -lSM -lICE -lXp -lXext -lXmu -lXft -ljpeg -lpng -lz"

	if ( $bit == "i386" )  then
	    setenv LDFLAGS  "$LDFLAGS -L/usr/X11R6/lib"
	else
	    setenv CFLAGS   "$CFLAGS -DG_64BIT"
	    setenv LDFLAGS  "$LDFLAGS -L/usr/X11R6/lib64"
	endif
	breaksw

    case "SunOS":
	setenv CFLAGS	"$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	setenv FFLAGS	"$INCLUDES -silent"
	setenv XLIBS	"-lXm -lXt -lX11"
	breaksw

    case "OSF1":
	setenv CFLAGS	"$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	setenv FFLAGS	"$INCLUDES -O0"
	setenv XLIBS	"-lXm -lXt -lX11"
	breaksw

    case "ULTRIX":
	setenv CFLAGS	"$INCLUDES -D$OS -DUNDERSCORE $WITHPY"
	setenv FFLAGS	"$INCLUDES"
	setenv XLIBS	"-lXm -lXt -lX11"
	breaksw

    default:
	echo
	echo "WARNING..."
	echo
	echo "No compiler options have been set."
	echo
	breaksw
endsw
