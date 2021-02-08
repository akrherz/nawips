#!/bin/sh
#-----------------------------------------------------------------------
# chkSub.sh
#
# Checks that there are no superfluous *.sub files.
#
# Input parameters:
#	$1	    Directory where the *.sub files reside.
#	$2,$3...    One or more source code super-directories.	
##
# Log:
# M. Linda/GSC		 8/97	Original
#-----------------------------------------------------------------------

inoDir="$1"
shift 1

while [ "$1" != "" ] ; do
    srcRaw="$srcRaw $1"
    shift 1
done

#-----------------------------------------------------------------------
# Check that a subdirectory exists for each *.sub file.

allSub=`ls $inoDir/*.sub`
extraFiles=""

for oneSubd in $allSub
do
    oneName=`basename $oneSubd .sub`

    exists=""
    for oneDir in $srcRaw
    do
	dirExp=`csh -fc "echo $oneDir"`;  # Expand path using the C shell.

	if  [ -d $dirExp/$oneName ] ; then
	    exists="yes"
	fi
    done

    if  [ "$exists" != "yes" ] ; then
	extraFiles=`echo "$extraFiles | $oneSubd"`
    fi
done

# If the list of extra files is not empty, then display it.
if  [ "$extraFiles" != "" ] ; then
    echo ""
    echo "NOTE:"
    echo "-----"
    echo "    The following are extra.  They may be deleted."
    echo $extraFiles | tr "|" "\012"
    echo ""
fi

#-----------------------------------------------------------------------
