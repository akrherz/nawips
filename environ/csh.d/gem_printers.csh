#!/bin/csh

#
#  Set printer variables.
#

setenv NPRINTER		""
setenv NLPDEST		""

switch ( $OS )
    case "AIX":
	setenv LP		"lpr"
	setenv LPFLAG		"-P"
	setenv LPAODT		"mpage -lo1 -z$LP -Z$LPFLAG"
	setenv LPAODTFLAG	"-P"
	breaksw
    case "HPUX":
	setenv LP		"lp"
	setenv LPFLAG		"-d"
	setenv LPAODT		"mpage -lo1 -z$LP -Z$LPFLAG"
	setenv LPAODTFLAG	"-P"
	breaksw
    case "IRIX":
	setenv LP		"lpr"
	setenv LPFLAG		"-P"
	setenv LPAODT		"mpage -lo1 -z$LP -Z$LPFLAG"
	setenv LPAODTFLAG	"-P"
	breaksw
    case "Linux":
	setenv LP		"lpr"
	setenv LPFLAG		"-P"
	setenv LPAODT		"mpage -lo1 -z$LP -Z$LPFLAG"
	setenv LPAODTFLAG	"-P"
	breaksw
    case "SunOS":
	setenv LP		"lpr"
	setenv LPFLAG		"-P"
	setenv LPAODT		"mpage -lo1 -z$LP -Z$LPFLAG"
	setenv LPAODTFLAG	"-P"
	breaksw
    default:
	echo
	echo "WARNING..."
	echo
	echo "The print command has not been set properly."
	echo
	breaksw
endsw
