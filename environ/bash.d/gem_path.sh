#!/bin/sh

# Add the GEMPAK directories to the PATH

# Prepend directories in reverse order
for adir in $OS_BIN . ; do
    if [ -d $adir ]; then
	if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
	    export PATH=${adir}:$PATH
	fi  
    fi  
done

# Append more directories
for adir in $NAWIPS/bin $NAWIPS/scripts/ez $NAWIPS/scripts/nawips $NAWIPS/scripts/prnt $NAWIPS/scripts/decoder ; do
    if [ -d $adir ]; then
	if ! echo "$PATH" | /bin/egrep -q "(^|:)${adir}($|:)" ; then
	    export PATH=${PATH}:${adir}
	fi  
    fi
done
