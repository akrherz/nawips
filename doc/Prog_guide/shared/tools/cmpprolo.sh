#!/bin/sh
#-----------------------------------------------------------------------
# cmpprolo.sh
#
# Compares prologues between files of same names in two directories.
#
# Example:
#
#	cmpprolo.sh  $GEMPAK/source/appl  $GEMPAK/source/gplt
#	cmpprolo.sh  $GEMPAK/source/gplt/device  $GEMPAK/source/device
##
# Log:
# M. Linda/GSC		 4/97	Original
#-----------------------------------------------------------------------

if  [ "$1" = "" -o "$2" = "" ] ; then
    echo ""
    echo "ERROR: Two directory names are required."
    echo ""
    exit
fi

#-----------------------------------------------------------------------
# If part of $1 or $2 is a recognized environment variable, replace it.

envVariables='$GEMPAK'

dir1=`cd $1 ; pwd`
dir2=`cd $2 ; pwd`
for oneVar in $envVariables ; do

    expPath=`csh -fc "echo $oneVar"`;

    filePath=`echo $1 | sed "s,$expPath,,"`

    if  [ "$filePath" != "$1" ] ; then
        dir1=$oneVar$filePath
    fi

    filePath=`echo $2 | sed "s,$expPath,,"`

    if  [ "$filePath" != "$2" ] ; then
        dir2=$oneVar$filePath
    fi
done

#-----------------------------------------------------------------------

dateTimeNow=`date "+%d %h %y %T"`
echo ""
echo "  Comparing prologues between files: $dateTimeNow"
echo ""
echo "    dir1 = $dir1"
echo "    dir2 = $dir2"
echo ""
echo "           \$GEMPAK = $GEMPAK"
echo ""

# Get all file names in directory1.

allFiles1=`cd $1 ; find . -type f -print | sed 's,^\./,,'`
allFiles2=`cd $2 ; find . -type f -print | sed 's,^\./,,'`
allFiles=`echo $allFiles1 $allFiles2 | tr " " "\012" | sort | uniq`

# Step through the files, one by one.

same=0
diff=0
totl=0
onl1=0
onl2=0
notr=0

for oneFile in $allFiles ; do

    # Create the two full paths.

    path1=$1/$oneFile
    path2=$2/$oneFile

    if  [ -f $path1 -a -f $path2 ] ; then
	totl=`expr $totl + 1`

	# Compare the two prologues.

	subUtilPth=`dirname $0`
	$subUtilPth/prolocmp.sh $path1 $path2
	retCode=$? 

	# Test for any differences between the two prologues.

	case $retCode in
         0 )
	    echo "    Prologues are same for $oneFile"
	    same=`expr $same + 1`
            ;;
         1 )
	    echo "    Prologues  differ  for $oneFile"
	    diff=`expr $diff + 1`
            ;;
	 2 )
	    echo "                           $oneFile not recognized"
	    notr=`expr $notr + 1`
            ;;
	 * )
	    # Unexpected error.
	    echo "                           $oneFile -- ERROR --"
	    notr=`expr $notr + 1`
            ;;
	esac
    else
	if  [ -f $path1 ] ; then
	    echo "                           $oneFile only in dir1"
	    onl1=`expr $onl1 + 1`
	elif  [ -f $path2 ] ; then
	    echo "                           $oneFile only in dir2"
	    onl2=`expr $onl2 + 1`
	fi
    fi
done

echo ""
echo "  Of $totl files, $diff prologues were different, $same were same."
echo "  $onl1 files were only in dir1, $onl2 files only in dir2."
echo "  $notr files were not recognizable."
echo ""

