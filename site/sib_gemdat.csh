#!/bin/csh
#########################################################################
#
#  gemdat.csh 
#
#  This source file sets the site-specific data environment variables.
#
##
# Log:
# S. Jacobs/NCEP	 4/01	Started log
# S. Jacobs/NCEP	 5/01	Changed SPDATA
# S. Jacobs/NCEP	12/02	Added MODEL_SND and MODEL_SFC
# S. Jacobs/NCEP	10/07	Added MSCDT
# T. Piper/SAIC		01/08	Added NADATA1 and NADATA2 definitions
#########################################################################

setenv NADATA1		/export-3/ncosrvnfs-cp
setenv NADATA2		/export-2/cdbsrv/ldm/data

setenv AFOS_ALARMS	/export-4/ncosrvnfs-cp/afos_alarms

setenv RAD		$NADATA1/images/radar
setenv SAT		$NADATA1/images/satellite

setenv MISC_DATA	$NADATA1/misc
setenv MSCDT		$NADATA1/misc

setenv SPDATA		$NADATA1/model
setenv MODEL		$NADATA1/model/grid/gempak
setenv MODEL_SFC	$NADATA1/model/sfc
setenv MODEL_SND	$NADATA1/model/snd
setenv NTRANS_META	$NADATA1/model/meta

#setenv OBS		$NADATA1/ldm/decoders
#setenv TEXT_DATA2	$NADATA1/ldm/newnwx
#setenv TEXT_DATA	$NADATA1/ldm/nwx
setenv OBS		$NADATA2/decoders
setenv TEXT_DATA2	$NADATA2/newnwx
setenv TEXT_DATA	$NADATA2/nwx

setenv GRPHGD		$HOME
