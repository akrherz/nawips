#!/bin/sh
#-----------------------------------------------------------------------
# prolocmp.sh
#
# Given two GEMPAK subroutine files, $1 and $2, this script compares 
# their prologues.  The exit code is set to 0 if the prologues match; 
# it is set to 1 if the prologues do not match; and it is set to 2 if 
# the files do not appear to be GEMPAK source code.
#
# Example:
#		prolocmp.sh  $GEMPAK/source/appl/access/ginitp.f \
#			     $GEMPAK/source/gplt/access/ginitp.f
##
# Log:
# M. Linda/GSC		 4/97	Original
#-----------------------------------------------------------------------

if  [ "$1" = "" -o "$2" = "" ] ; then
    echo ""
    echo "ERROR: Two file names are required."
    echo ""
    exit
fi

# Get the prologue of the files.

prologue1=`awk 'NR==1,/^C\*\*[ 	]+\*[ 	]*$/' $1 2>/dev/null`
prologue2=`awk 'NR==1,/^C\*\*[ 	]+\*[ 	]*$/' $2 2>/dev/null`

# Test if the files appear to be GEMPAK (FORTRAN) source code.

linNoOne1=`grep -n '^C\*\*\*\*' $1 | cut -d":" -f1 | awk 'NR==1'`
if  [ "$linNoOne1" = "" ] ; then
    exit 2
fi

firstChr1=`awk "NR==$linNoOne1,/^C\*+[ 	]+\*[ 	]*$/" $1 | \
          cut -c1-2 | sort | uniq`

linNoOne2=`grep -n '^C\*\*\*\*' $2 | cut -d":" -f1 | awk 'NR==1'`
if  [ "$linNoOne2" = "" ] ; then
    exit 2
fi

firstChr2=`awk "NR==$linNoOne2,/^C\*+[ 	]+\*[ 	]*$/" $2 | \
          cut -c1-2 | sort | uniq`

if  [ "$firstChr1" != "C*" -o "$firstChr2" != "C*" ] ; then
    exit 2
fi

# Test for any differences between the two prologues.

if  [ "$prologue1" != "$prologue2" ] ; then
    exit 1
fi

exit 0
