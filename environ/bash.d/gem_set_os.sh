#!/bin/sh

#
#  Set the operating system environment variable.
#  /bin/uname is available on most UNIX systems.
#
if [ -x /bin/uname ]
then
    export OS=`/bin/uname`
else
    echo
    echo "What type of workstation are you using?"
    echo
    echo "Find the command uname, and insert the correct"
    echo "information in this file."
    echo
fi

#
#  Set the OS version, OS_VER,
#  based on and the version, release, and build.
#
OS_VER=""

case $OS in
    AIX )
	# IBM
	export OS_VER=`uname -v`
	;;

    HP-UX )
	# Hewlett-Packard
	export OS="HPUX"
	export OS_VER=`uname -r | cut -f2 -d.`
	;;

    IRIX|IRIX64 )
	# Silicon Graphics
	ver=`uname -r | cut -f1 -d.`
	rel=`uname -r | cut -f2 -d.`

	export OS_VER=${ver}.${rel}

	# Fix for IRIX64
	if [ $OS = "IRIX64" ]
	then
	    export OS="IRIX"
	fi
	;;

    Linux )
	# Linux
	ver=`uname -r | cut -f1 -d.`
	rel=`uname -r | cut -f2 -d.`
	bld=`uname -r | cut -f3 -d. | cut -f1 -d-`
	bit=`uname -m`

	export OS_VER=${ver}.${rel}.${bld}_${bit}
	;;

    SunOS )
	# Sun Micro Systems
	export OS_VER=`uname -r | cut -f1 -d.`
	;;

    * )
	echo "What type of UNIX do you have?"
	echo
	echo "Find the command uname, and insert the correct"
	echo "information in the \$NAWIPS/environ/bash.d/gem_set_os.sh file."
	echo
	return 1
	;;
esac

#
#  Set NA_OS to the lowercase equivalent of OS and version number.
#
export NA_OS=`echo $OS | tr "[A-Z]" "[a-z]"``echo $OS_VER`
