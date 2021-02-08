#!/bin/sh
#-----------------------------------------------------------------------
# unisub.sh
#
# This script is used for checking *.sub files (GEMPAK documentation).
#
# Checks that field 2 is unique in a file.  Filed 2 is whatever 
# string follows a dash ("-") character.  File name $1 may be specified
# using wild cards (i.e., it may be a list of files).
#
# Example:
#		unisub.sh  *.sub
#
## Log:
# M. Linda/GSC		 5/97	Original
#-----------------------------------------------------------------------

tmpFil=/tmp/`basename $0.$$`

trap 'rm -f $tmpFil ; exit' 2 1

while [ "$1" != "" ] ; do
    files="$files $1"
    shift 1
done

for oneFile in $files ; do

    grep -v '^$' $oneFile > $tmpFil
    exec 3< $tmpFil

    while true ; do

	read <&3 line

	if  [ "$line" = "" ] ; then
	    break
	fi

	if  [ `echo $line | cut -c1` != "#" ] ; then

	    string=`echo $line | cut -d"-" -f2`

	    if  [ "$string" != "" ] ; then

		numLin=`egrep -- "-[ 	]*${string}[ 	]*$" $oneFile | wc -l`

		if  [ "$numLin" -gt "1" ] ; then
		    echo ""
		    grep "$string" $oneFile
		fi
	    fi
	fi
        echo ".\c"
    done
done

rm -f $tmpFil

