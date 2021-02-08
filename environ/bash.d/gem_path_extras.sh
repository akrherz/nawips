#!/bin/sh

# Add other useful system directories to the PATH

case $OS in
    Linux )
	# No additional path directories
	;;

    AIX )
	for adir in /usr/vac/bin /usr/ucb ; do
	  if [ -d $adir ]; then
	    if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
		export PATH=${PATH}:${adir}
	    fi
	  fi
	done
	;;

    HPUX )
	for adir in /usr/contrib/bin/X11 /usr/contrib/bin /opt/imake/bin ; do
	  if [ -d $adir ]; then
	    if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
		export PATH=${PATH}:${adir}
	    fi
	  fi
	done
	;;

    IRIX )
	for adir in /usr/bsd ; do
	  if [ -d $adir ]; then
	    if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
		export PATH=${PATH}:${adir}
	    fi
	  fi
	done
	;;

    SunOS )
	for adir in /usr/ccs/bin /usr/ucb /usr/openwin/bin ; do
	  if [ -d $adir ]; then
	    if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
		export PATH=${PATH}:${adir}
	    fi
	  fi
	done
	;;

    * )
	echo
	echo "WARNING..."
	echo
	echo "The path has not been set properly."
	echo
	;;
esac
