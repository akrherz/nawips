#!/bin/sh
#-----------------------------------------------------------------------
# makelist.sh
#
# Builds *.list files from *.sub files and cross-checks the lists for 
# completeness.
#
# Input parameters:
#	$1	    Directory where *.sub and *.list files reside.
#	$2,$3...    One or more source code super-directories.
##
# Log:
# M. Linda/GSC		12/97	Original
#-----------------------------------------------------------------------

# Path to input and output files.
inoDir="$1"
shift 1

#-----------------------------------------------------------------------
# Source code super-directories.

while [ "$1" != "" ] ; do
    srcRaw="$srcRaw $1"
    shift 1
done

#-----------------------------------------------------------------------

curDir=`pwd`
dateTimeNow=`date "+%d %h %y %T"`
version=`ls -l $0 | awk '{print $7 " " $6 " " $8}'`
utlDir=`dirname $0`
utlNam=`basename $0`
fulPth=`cd $utlDir; pwd; cd $curDir`/$utlNam

#-----------------------------------------------------------------------

for oneDir in $srcRaw
do
    dirExp=`csh -fc "echo $oneDir"`;	# Expand path using the C shell.

    # Step through all sub-directories in source directory.
    for oneSubd in `ls -F $dirExp | grep "/$" | sed 's,/$,,'`
    do
      if [ -d $dirExp/$oneSubd ] ; then

	echo "Processing $oneSubd ..."

	# Derive input file name (file with descriptive names).
	inpFil=$inoDir/$oneSubd.sub

	# Derive output file name.
	outFil=$inoDir/$oneSubd.list

	# Initialize output file.
	echo "#---------------------------------------\c"           > $outFil
	echo "---------------------------------------"             >> $outFil
	echo "# `basename $outFil`"                                >> $outFil
	echo "#"                                                   >> $outFil
	echo "# This file contains full path to *.f and *.c \c"    >> $outFil
	echo "files that were found under"                         >> $outFil
	echo "# $oneDir/$oneSubd"                                  >> $outFil
	echo "#"                                                   >> $outFil
	echo "# This file was generated automatically on \c"       >> $outFil
	echo "<$dateTimeNow>"                                      >> $outFil
	echo "#    by $fulPth"                                     >> $outFil
	echo "#    ver <$version>"                                 >> $outFil
	echo "#---------------------------------------\c"          >> $outFil
	echo "---------------------------------------"             >> $outFil
	echo ""                                                    >> $outFil
	
	# Enter source sub-directory.
	cd $dirExp/$oneSubd

	# Find all *.f and *.c files.
	allNames=`ls *.[fc]`

	# Step through all file names.
	for fileName in $allNames
	do
	    # Find file description that corresponds to file name, extract it.
	    cd $curDir

	    if  [ -f $inpFil ] ; then
		descrLin=`grep "$fileName" $inpFil | cut -s -d"-" -f2-`
		notComnt=`grep "$fileName" $inpFil | tr -d "	" | \
			  tr -d " " | grep -v '^#'`
	    else
		descrLin=""
		notComnt=""
	    fi

	    if  [ "$notComnt" != "" ] ; then
		# Write file path, file name, and description to output.
		echo "$oneDir/$oneSubd/$fileName \t- $descrLin"    >> $outFil
	    fi
	done

	# Terminate output file.
	echo ""                                                    >> $outFil
	echo "#---------------------------------------\c"          >> $outFil
	echo "---------------------------------------"             >> $outFil

	# Cross-check the lists for completeness.
	$utlDir/chkList.sh $inpFil $outFil $oneDir $oneSubd $allNames
      fi
    done
done

# Check that there are no superfluous *.sub files.
$utlDir/chkSub.sh $inoDir $srcRaw

#-----------------------------------------------------------------------
