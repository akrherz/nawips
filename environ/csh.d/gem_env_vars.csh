#!/bin/csh

#
#  Set GEMPAK system environment variables.
#

setenv GEMPAK   $NAWIPS/gempak

setenv OS_ROOT  $NAWIPS/os/$NA_OS
setenv OS_BIN   $OS_ROOT/bin
setenv OS_INC   $OS_ROOT/include
setenv OS_LIB   $OS_ROOT/lib

setenv GEMDATA  $GEMPAK/data
setenv GEMERR   $GEMPAK/error
setenv GEMHLP   $GEMPAK/help
setenv GEMINC   $GEMPAK/include
setenv GEMMAPS  $GEMPAK/maps
setenv GEMNTS   $GEMPAK/nts
setenv GEMPARM  $GEMPAK/parm
setenv GEMPDF   $GEMPAK/pdf
setenv GEMTBL   $GEMPAK/tables
setenv GEMPTXT  $GEMPAK/txt/programs
setenv GEMGTXT  $GEMPAK/txt/gemlib

setenv MEL_BUFR_TABLES  $GEMPAK/tables/melbufr
setenv NMAP_RESTORE     $GEMNTS/nmap/restore
