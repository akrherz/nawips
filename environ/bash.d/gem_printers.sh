#!/bin/sh

#
#  Set printer variables. 
#

export NPRINTER=""
export NLPDEST=""

case $OS in
    AIX )
	export LP="lpr"
	export LPFLAG="-P"
	export LPAODT="mpage -lo1 -z$LP -Z$LPFLAG"
	export LPAODTFLAG="-P"
	;;
    HPUX )
	export LP="lp"
	export LPFLAG="-d"
	export LPAODT="mpage -lo1 -z$LP -Z$LPFLAG"
	export LPAODTFLAG="-P"
	;;
    IRIX )
	export LP="lpr"
	export LPFLAG="-P"
	export LPAODT="mpage -lo1 -z$LP -Z$LPFLAG"
	export LPAODTFLAG="-P"
	;;
    Linux )
	export LP="lpr"
	export LPFLAG="-P"
	export LPAODT="mpage -lo1 -z$LP -Z$LPFLAG"
	export LPAODTFLAG="-P"
	;;
    SunOS )
	export LP="lpr"
	export LPFLAG="-P"
	export LPAODT="mpage -lo1 -z$LP -Z$LPFLAG"
	export LPAODTFLAG="-P"
	;;
    * )
	echo
	echo "WARNING..."
	echo
	echo "The print command has not been set properly."
	echo
	;;
esac
