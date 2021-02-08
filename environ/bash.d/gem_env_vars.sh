#!/bin/sh

#
#  Set GEMPAK system environment variables.
#

export GEMPAK=$NAWIPS/gempak

export OS_ROOT=$NAWIPS/os/$NA_OS
export OS_BIN=$OS_ROOT/bin
export OS_INC=$OS_ROOT/include
export OS_LIB=$OS_ROOT/lib

export GEMDATA=$GEMPAK/data
export GEMERR=$GEMPAK/error
export GEMHLP=$GEMPAK/help
export GEMINC=$GEMPAK/include
export GEMMAPS=$GEMPAK/maps
export GEMNTS=$GEMPAK/nts
export GEMPARM=$GEMPAK/parm
export GEMPDF=$GEMPAK/pdf
export GEMTBL=$GEMPAK/tables
export GEMPTXT=$GEMPAK/txt/programs
export GEMGTXT=$GEMPAK/txt/gemlib

export MEL_BUFR_TABLES=$GEMPAK/tables/melbufr
export NMAP_RESTORE=$GEMNTS/nmap/restore
