#!/bin/sh

#
# Set the default X server.
#
if [ ${DISPLAY:-setdisplay} = setdisplay ]
then
    if [ ${REMOTEHOST:-islocal} != islocal ]
    then
	export DISPLAY=${REMOTEHOST}:0
    else
	export DISPLAY=:0
    fi
fi
