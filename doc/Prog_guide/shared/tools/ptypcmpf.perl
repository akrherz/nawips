#!/usr/gnu/bin/perl

push (@INC, "$ENV{'NAWIPS'}/doc/Prog_guide/shared/tools");
require "checksrc.pl";

#-----------------------------------------------------------------------
# ptypcmpf.perl
#
# Given one or more names, $*, of a GEMPAK subroutine file (FORTRAN),
# this utility compares parameter types between the call declaration
# and the prologue.
#
# Example:
#		ptypcmpf.perl  $GEMPAK/source/appl/plot/gline.f
#
# Exit Codes:
#
#	4 = Missing file name argument
#	3 = Main program (must be a function)
#	2 = Unrecognized format
#	1 = Mismatched parameters
##
# Log:
# G. Krueger/EAI	 1/99	Based on ptypcmpf.sh
# G. Krueger/EAI	 2/99	Improve PROGRAM,CHAR,subscript parse
# G. Krueger/EAI	 4/99	Use checkSrc library;ID COMMON&DATA
# G. Krueger/EAI	 2/00	Moved main portion of code to checksrc.pl
#-----------------------------------------------------------------------

$iret = 0;
$printbad = $true;
$printgood = $true;

#----------------------------------------------------------------------
# Process command line options:

while ($_ = $ARGV[0], /^[-\+]/)
{
    shift;
    last if /^--$/;
#   Get the overall argmode:
    if ( /^\+/ ) {
	$argmode = $true;
    } else {
	$argmode = $false;
    }
#   Get the bad files argmode:
    if ( /-b/i || (/b/i && !$argmode) ) {
	$printbad = $false;
    } elsif ( /\+b/i || (/b/i && $argmode) ) {
	$printbad = $true;
    }
#   Get the good files argmode:
    if ( /-g/i || (/g/i && !$argmode) ) {
	$printgood = $false;
    } elsif ( /\+g/i || (/g/i && $argmode) ) {
	$printgood = $true;
    }
}

if ( ! defined ($printgood) && ! defined ($printbad) ) {
    $printbad = $true;
    $printgood = $true;
}
$printbad = $false if ( ! defined ($printbad) );
$printgood = $false if ( ! defined ($printgood) );

($ptgood, $ptdisc, $ptrecg, $ptnotr, $ptprog, $iret) =
	&PTypCmpF($printbad, $printgood, @ARGV);

if ( $iret == 4 ) {
    printf ( "\nERROR: File name is required.\n" );

    printf ( "\n%s\n", <<EOU );
usage:  ptypcmpf.perl [+b] [+g] [file]...

	options:
		+b	Print only the bad entries.
		+g	Print only the good entries.
EOU
}

exit $iret;
