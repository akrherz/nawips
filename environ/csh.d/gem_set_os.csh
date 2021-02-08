#!/bin/csh

#
#  Set the operating system environment variable.
#  /bin/uname is available on most UNIX systems.
#
if ( -e /bin/uname ) then
    setenv OS `/bin/uname`
else
    echo
    echo "What type of workstation are you using?"
    echo
    echo "Find the command uname, and insert the correct"
    echo "information in this file."
    echo
endif

#
#  Set the OS version, OS_VER,
#  based on and the version, release, and build.
#
setenv OS_VER ""

switch ( $OS )
    case "AIX":
	# IBM
	setenv OS_VER	`uname -v`
	breaksw

    case "HP-UX":
	# Hewlett-Packard
	unsetenv OS
	setenv OS	HPUX
	setenv OS_VER	`uname -r | cut -f2 -d.`
	breaksw

    case "IRIX":
    case "IRIX64":
	# Silicon Graphics
	set ver	= `uname -r | cut -f1 -d.`
	set rel	= `uname -r | cut -f2 -d.`

	setenv OS_VER	${ver}.${rel}

        # Fix for IRIX64
	if  ( $OS == "IRIX64" )  then
	    setenv OS	IRIX
	endif
	breaksw

    case "Linux":
	# Linux
	set ver	= `uname -r | cut -f1 -d.`
	set rel	= `uname -r | cut -f2 -d.`
	set bld	= `uname -r | cut -f3 -d. | cut -f1 -d-`
	set bit	= `uname -m`

	setenv OS_VER	${ver}.${rel}.${bld}_${bit}
	breaksw

    case "SunOS":
	# Sun Micro Systems
	setenv OS_VER	`uname -r | cut -f1 -d.`
	breaksw

    default:
	echo "What type of UNIX do you have?"
	echo
	echo "Find the command uname, and insert the correct"
	echo "information in the \$NAWIPS/environ/csh.d/gem_set_os.csh file."
	echo
	exit 1
	breaksw
endsw

#
#  Set NA_OS to the lowercase equivalent of OS and version number.
#
setenv NA_OS	`echo $OS | tr "[A-Z]" "[a-z]"``echo $OS_VER`
