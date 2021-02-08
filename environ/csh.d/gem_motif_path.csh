#!/bin/csh

#
#  Set X/Motif search paths.
#

setenv XMICONSEARCHPATH         $NAWIPS/icons/%N/%B

switch ( $OS )
    # IRIX has an extra location to search
    case "IRIX":
	setenv XUSERFILESEARCHPATH  $HOME/.desktop-`hostname`/%N:./%N:$HOME/%N:$HOME/Resource/%N:$NAWIPS/resource/%N
	breaksw

    default:
	setenv XUSERFILESEARCHPATH  ./%N:$HOME/%N:$HOME/Resource/%N:$NAWIPS/resource/%N
	breaksw

endsw

