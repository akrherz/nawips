#!/bin/sh
#-----------------------------------------------------------------------
# chkList.sh
#
# Cross-checks *.list files with *.sub files for completeness.
#
# Input parameters:
#	$1	    Input file (*.sub file)
#	$2	    Output file (*.list file)
#	$3	    Main directory being processed
#	$4	    Subdirectory being processed
#	$5,$6,...   All *.f and *.c files
##
# Log:
# M. Linda/GSC		 9/97	Original
#-----------------------------------------------------------------------

inpFil="$1"
outFil="$2"
oneDir="$3"
oneSubd="$4"

shift 4
while [ "$1" != "" ] ; do
    allNames="$allNames $1"
    shift 1
done

#-----------------------------------------------------------------------
# Check the output file for entries that have no description.

allLines=`cat $outFil | tr -d " " | tr -d "	" | grep -v '^$' | \
	grep -v '^#' | grep -v "$oneDir/$oneSubd/test"`

for oneLine in $allLines
do
    description=`echo $oneLine | cut -d"-" -f2-`

    # If item does not have a description, add item to the list of missing.
    if  [ "$description" = "" ] ; then
	missingDescr=`echo "$missingDescr | $oneLine"`
    fi
done

# If the list of items with missing descriptions is not empty, display it.
if  [ "$missingDescr" != "" ] ; then
    echo ""
    echo "NOTE:"
    echo "-----"
    echo "    The following items have no description so they will not"
    echo "    appear in the final book.  To correct this, edit"
    echo "    $inpFil"
    echo $missingDescr | tr -d "-" | tr "|" "\012"
    echo ""
fi

missingDescr=""

#-----------------------------------------------------------------------
# Cross-check the output file vs. the input file.

# Loop through all entries in the input file.
allInput=`cat $inpFil | grep -v '^[ 	]*#' | grep -v '^[ 	]*$' | \
	  cut -d"-" -f1`

for oneItem in $allInput
do
    # Try to find the same item in the output file.
    item=`grep $oneItem $outFil`

    # If item does not exist in output file, add it to the list of missing.
    if  [ "$item" = "" ] ; then
	fullItem=`grep $oneItem $inpFil`
	allMissing=`echo "$allMissing | $fullItem"`
    fi
done

# If the list of missing items is not empty, then display it.
if  [ "$allMissing" != "" ] ; then
    echo ""
    echo "NOTE:"
    echo "-----"
    echo "    The following items were not found under $oneDir."
    echo "    These items should be removed from"
    echo "        $inpFil"
    echo $allMissing | tr "|" "\012"
    echo ""
fi

allMissing=""

#-----------------------------------------------------------------------
# Check that the output file represents all of the source code.

for oneItem in $allNames
do
    # Try to find the same item in the output file.
    item=`grep $oneItem $inpFil`

    # If item does not exist in output file, add it to list of missing.
    if  [ "$item" = "" ] ; then
	missingFiles=`echo "$missingFiles | $oneDir/$oneSubd/$oneItem"`
    fi
done

# If the list of missing items is not empty, then display it.
if  [ "$missingFiles" != "" ] ; then
    echo ""
    echo "NOTE:"
    echo "-----"
    echo "    The following items were not found in the input file."
    echo "    Add an entry to"
    echo "        $inpFil"
    echo $missingFiles | tr "|" "\012"
    echo ""
fi

missingFiles=""

#-----------------------------------------------------------------------
