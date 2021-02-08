#!/bin/sh

#
#  Set X/Motif search paths.
#

export XMICONSEARCHPATH=$NAWIPS/icons/%N/%B

case $OS in

    # IRIX has an extra location to search
    IRIX )
	export XUSERFILESEARCHPATH=$HOME/.desktop-`hostname`/%N:./%N:$HOME/%N:$HOME/Resource/%N:$NAWIPS/resource/%N
	;;

    * )
	export XUSERFILESEARCHPATH=./%N:$HOME/%N:$HOME/Resource/%N:$NAWIPS/resource/%N
	;;

esac
