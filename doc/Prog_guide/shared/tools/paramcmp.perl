#!/usr/gnu/bin/perl

push (@INC, "$ENV{'NAWIPS'}/doc/Prog_guide/shared/tools");
require "checksrc.pl";

#-----------------------------------------------------------------------
# paramcmp.perl
#
# Given one or more names, $*, of a GEMPAK subroutine file (FORTRAN or
# C), this utility compares parameter names between the call
# declaration and the prologue.
#
# Example:
#		paramcmp.perl  $GEMPAK/source/appl/plot/gline.f
#		paramcmp.perl  $GEMPAK/source/gemlib/er/ersmsg.c
#
# Output Parameters:
#	PARAMCMP.PERL		INTEGER		Exit Code
#						  3 = Main Program
#						  2 = Unrecognized Format
#						  1 = Other discrepancy
#						  0 = Normal
#						  
##
# Log:
# G. Krueger/EAI	 4/99	Derived from PARAMCMP.SH
# G. Krueger/EAI	 2/00	Moved main portion of code to checksrc.pl
#-----------------------------------------------------------------------

$iret = 0;

#-----------------------------------------------------------------------
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

($pcgood, $pcdisc, $pcrecg, $pcnotr, $pcprog, $iret) =
	&ParamCmp($printbad, $printgood, @ARGV);

if ( $iret == 4 ) {
    printf ( "\n%s\n", <<EOU );
ERROR:  File name is required.

usage:  paramcmp.perl [+b] [+g] [file]...

	options:
		+b	Print only the bad entries.
		+g	Print only the good entries.
EOU
}

#-----------------------------------------------------------------------
# Set the return code.

exit $iret;

#-----------------------------------------------------------------------
