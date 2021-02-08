#!/bin/sh
#########################################################################
#
#  gemdat.sh 
#
#  This Bourne-shell script sets the site-specific data environment variables.
#
##
# Log:
# S. Jacobs/NCEP	 4/01	Started log
# S. Jacobs/NCEP	 5/01	Changed SPDATA
# S. Jacobs/NCEP	12/02	Added MODEL_SND and MODEL_SFC
# S. Jacobs/NCEP	10/07	Added MSCDT
# T. Piper/SAIC         01/08   Added NADATA1 and NADATA2 definitions
#########################################################################

export NADATA1=/export-3/ncosrvnfs-cp
export NADATA2=/export-2/cdbsrv/ldm/data

export AFOS_ALARMS=/export-4/ncosrvnfs-cp/afos_alarms

export RAD=$NADATA1/images/radar
export SAT=$NADATA1/images/satellite

export MISC_DATA=$NADATA1/misc
export MSCDT=$NADATA1/misc

export SPDATA=$NADATA1/model
export MODEL=$NADATA1/model/grid/gempak
export MODEL_SFC=$NADATA1/model/sfc
export MODEL_SND=$NADATA1/model/snd
export NTRANS_META=$NADATA1/model/meta

#export OBS=$NADATA1/ldm/decoders
#export TEXT_DATA2=$NADATA1/ldm/newnwx
#export TEXT_DATA=$NADATA1/ldm/nwx
export OBS=$NADATA2/decoders
export TEXT_DATA2=$NADATA2/newnwx
export TEXT_DATA=$NADATA2/nwx

export GRPHGD=$HOME
