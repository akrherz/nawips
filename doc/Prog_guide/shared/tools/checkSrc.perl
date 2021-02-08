#!/usr/bin/perl

push (@INC, "$ENV{'NAWIPS'}/doc/Prog_guide/shared/tools");
require "chkSrc.pl";

#-----------------------------------------------------------------------
# checkSrc.perl
#
# This script checks the module name and parameter names and types 
# between the call declaration and the prologue for all files under each
# directory that is given as an argument.
#
# This utility works only on FORTRAN and C files (it ignores all files
# named other than *.f and *.c).
#
# Example:
#
#	checkSrc.perl  $GEMPAK/source/appl/access
##
# Log:
# G. Krueger/EAI	 2/00	Based on checkSrc.sh
#-----------------------------------------------------------------------

$owd = `pwd`;
chomp $owd;

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

if ( $#ARGV < 0 ) {
    die "\nERROR:  At least one directory name is required.\n";
}

#-----------------------------------------------------------------------
# For each given directory, check over the files.

foreach $directory ( @ARGV ) {

    #-----------------------------------------------------------------------
    # If part of $directory is a recognized environment variable, replace it.

    $legend = '';
    @envVariables = ( '$NAWIPS', '$GEMPAK' );

    $dir1=`cd $directory ; pwd`;

    foreach $oneVar ( @envVariables ) {
	$expPath=`csh -fc "echo $oneVar"`;
	$dir1 =~ (s/$expPath/$oneVar/g) && ($legend .= "$oneVar = $expPath\n");
    }

    #-----------------------------------------------------------------------

    printf ( "\nChecking calling sequences in files:  %s\n\n",
	     `date "+%d %h %y %T"` );
    printf ( "    directory = %s\n\n", $dir1 );
    printf ( "                 %s\n", $legend );

    #-----------------------------------------------------------------------
    # Get all file names in directory.

    @allFiles1 = `find $directory -type f -print`;
    for ( $fileno = 0; $fileno <= $#allFiles1; $fileno++ ) {
	chomp @allFiles1[$fileno];
	@allFiles1[$fileno] =~ s|^\.\/||;
    }
    @sorted = sort @allFiles1;

    # Step through the files, one by one.

    $good = $disc = $totl = $recg = $notr = $errs = $prog = $ptyp = $othr = 0;
    $fgood = $fdisc = $frecg = $fnotr = $fprog = 0;

    foreach $oneFile ( @sorted ) {
	$pcgood = $pcdisc = $pcrecg = $pcnotr = $pcprog = $retCode = 0;
	$ptgood = $ptdisc = $ptrecg = $ptnotr = $ptprog = $rtCode2 = 0;
	$totl++;

	# Process only *.f and *.c files.

	$nameExt = '';
	$nameExt = $1 if ( $oneFile =~ m|\.([^\/\.]+)$| );

	if ( $nameExt eq 'c' || $nameExt eq 'f' ) {

	    # Create the full path.

	    $path1 = $oneFile;
	    $subUtilPth = $0;
	    $subUtilPth =~ s/[^\/]+$//;
	    $subUtilPth = ".\/$subUtilPth" if ( $subUtilPth !~ m|\/| );

	    # Compare the module and parameter names.
	    ($pcgood, $pcdisc, $pcrecg, $pcnotr, $pcprog, $retCode) =
		&ParamCmp($printbad, $printgood, $path1);

	    if ( $retCode == 0 || $retCode == 1 ) {

		# Compare the parameter types.
		if ( $nameExt eq 'f' ) {
		    ($ptgood, $ptdisc, $ptrecg, $ptnotr, $ptprog, $rtCode2) =
			&PTypCmpF($printbad, $printgood, $path1);
		} else {
		    ($ptgood, $ptdisc, $ptrecg, $ptnotr, $ptprog, $rtCode2) =
			&PTypCmpC($printbad, $printgood, $path1);
		}
		$ptyp++ if ( $rtCode2 != 0 );
	    }

	    if ( $pcrecg > 0 || $ptrecg > 0 ) {
		$frecg++;
		if ( $pcgood > 0 && $ptgood > 0 &&
		     $pcdisc == 0 && $ptdisc == 0 ) {
		    printf ( "OK -- %s\n\n", $path1 ) if ( $printgood );
		    $fgood++;
		} else {
		    printf ( "   -- %s\n\n", $path1 ) if ( $printbad );
		}
	    }

	    # Check the results.
	    if ( $pcgood < $ptgood ) {
		$good += $pcgood;
	    } else {
		$good += $ptgood;
	    }
	    $fdisc++ if ( ($pcdisc + $ptdisc) != 0 );
	    $disc += $pcdisc + $ptdisc;
	    $notr += $pcnotr + $ptnotr;
	    $fnotr++ if ( ($pcrecg + $ptrecg) == 0 &&
			  ($pcnotr + $ptnotr) != 0 );
	    if ( $pcrecg < $ptrecg ) {
		$recg += $pcrecg;
	    } else {
		$recg += $ptrecg;
	    }
	    $fprog++ if ( ($pcprog + $ptprog) != 0 );
	    if ( $pcprog > $ptprog ) {
		$prog += $pcprog;
	    } else {
		$prog += $ptprog;
	    }
	    if ( $retCode != 0 && ($pcdisc+$pcnotr+$pcprog) == 0 ||
		 $rtCode2 != 0 && ($ptdisc+$ptnotr+$ptprog) == 0 ) {
		$errs++
	    }
	} else {
	    $othr++;
	}

    }

    printf ( "\n" );
    printf ( "                   Modules   Other\n" );
    printf ( "                  Recognized File  Main              Other\n" );
    printf ( "       Total Good  Yes   No  Types Progs Disparities Errs\n" );
    printf ( "       ----- ---- ----- ---- ----- ----- ----------- -----\n" );
    printf ( "Files |%5d %4d %5d %4d %5d %5d %11d %5d\n",
	     $totl, $fgood, $frecg, $fnotr, $othr, $fprog, $fdisc, $errs );
    printf ( "Total |      %4d %5d %4d       %5d %11d\n",
	     $good, $recg, $notr, $prog, $disc );
    printf ( "\n" );

    $good = $disc = $recg = $totl = $notr = $errs = $prog = $ptyp = 0;
    $fgood = $fdisc = $frecg = $fnotr = $fprog = 0;
}
