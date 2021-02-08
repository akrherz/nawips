#-----------------------------------------------------------------------
# chkSrc.pl
#
# This is a source code checking library, written in Perl.
#
# @fileparts	= &SplitFRoutines($contents, \$iret);
# @fileparts	= &SplitCRoutines($contents, \$iret);
# ($head, $prologue, $code)
#		= &ExtractSections($contents, \$iret);
# $valid	= &ValidSub($header, \$iret);
# ($funcname, $functype, @funcparms)
#		= &ParseCall($header, \$iret);
# @inoutp	= &GetInOuts($prologue, \$iret);
# $iret		= &ParamCmp(@files);
# $iret		= &PTypCmpF($printbad, $printgood, @files);
# $iret		= &PTypCmpC($printbad, $printgood, @files);
#
## G. Krueger/EAI	4/99
# T. Piper/SAIC		11/01 Renamed from checksrc.pl to chkSrc.pl and 
#				fixed 'static void' function-type case
#-----------------------------------------------------------------------

$true = (1 == 1);
$false = (! $true);

#=======================================================================

sub SplitFRoutines {
	local ($contents, *iret) = @_;
#-----------------------------------------------------------------------
# SplitFRoutines($contents, \$iret)
#
# Given the contents of a FORTRAN language source code file, this
# function will split the contents into separate subroutines.
#
# @fileparts = &SplitFRoutines($contents, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPF.PERL
#-----------------------------------------------------------------------
	local ($part);
	local (@fileparts) = ();
#-----------------------------------------------------------------------
	$iret = 0;

	@fileparts = split ( /\nC\s*\nC={3,}\s*\nC\n/i, $contents );

	@fileparts = split ( /\n\s*end\s*\n/i, $contents )
		if ( $#fileparts <= 0 );

	for ( $part = 0; $part <= $#fileparts; $part++ ) {
	    while ( @fileparts[$part] =~ /^[c\*][^\n]*\n/i ) {
		@fileparts[$part] = $';
	    }
	    if ( @fileparts[$part] =~ /^\s*$/ ) {
		if ( $part < $#fileparts ) {
		    @fileparts = (@fileparts[0..$part-1],
				  @fileparts[$part+1..$#fileparts]);
		} else {
		    @fileparts = (@fileparts[0..$part-1]);
		}
	    }
	}

	return @fileparts;
}

#=======================================================================

sub SplitCRoutines {
	local ($contents, *iret) = @_;
#-----------------------------------------------------------------------
# SplitCRoutines($contents, \$iret)
#
# Given the contents of a C language source code file, this function
# will split the contents into separate subroutines.
#
# @fileparts = &SplitCRoutines($contents, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPC.PERL
#-----------------------------------------------------------------------
	local ($brcomment, $hasargs, $filehead, $lbcomment) =
		($false, $false, $false, $false);
	local ($braces, $line) = (0, 0);
	local ($divcontents) = ('');
	local (@fileparts) = ();
#-----------------------------------------------------------------------
	$iret = 0;

	foreach $line ( split ( /\n/, $contents ) ) {
	    $line =~ s/'[^']+'/''/g;
	    $line =~ s/"[^"]+"/""/g;
	    $line =~ s|\/\*[^=]*?\*\/||g;
	    if ( $line =~ /^\s*#/ ) {
		$lbcomment = $true;
	    } elsif ( $lbcomment && $line !~ /\\$/ ) {
		$lbcomment = $false;
	    } else {
		if ( $line =~ /\/\*/ ) {
		    $brcomment = $true;
		}
		$hasargs = $true if ( $braces == 0 && ! $brcomment &&
				      $line =~ /(^|\n)\s*[^\(]+\(/ );
		while ( $line =~ /\{/g ) {
		    $braces++;
		}
		while ( $line =~ /\}/g ) {
		    $braces--;
		}
		if ( $line =~ /\*\// ) {
		    $brcomment = $false;
		}
		$divcontents .= $line . "\n";
		$filehead = $true if ( $line =~ /\n\s\*\sCONTENTS:\s+\*\n/ );
		if ( $line =~ /\/\*\={20,}\*\// ||
		     ($braces == 0 && $line =~ /\}\s*$/ && $hasargs &&
		      ! $filehead && ! $brcomment && ! $lbcomment) ) {
		    $divcontents .= '==> BREAK <==';
		    $hasargs = $false;
		}
	    }
	}

	@fileparts = split ( /==> BREAK <==/, $divcontents );

	return @fileparts;
}

#=======================================================================

sub ExtractSections {
	local ($routine, *iret) = @_;
#-----------------------------------------------------------------------
# ExtractSections($routine, \$iret)
#
# Given a GEMPAK routine, this function will split the routine into
# its HEADER, PROLOGUE, and CODE parts.
#
# ($head, $prologue, $code) = &ExtractSections($contents, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPC.PERL & PTYPCMPF.PERL
#-----------------------------------------------------------------------
	local ($head, $prologue, $code) = ('', '', '');
	local (@parts) = ();
#-----------------------------------------------------------------------
	$iret = 0;

	$routine = "\n" . $routine;
	($head, $prologue, $code) =
		split ( /\n[C\/\s]?\/?\*{3,}/, $routine );

	while ( $code =~ /^[C\/\s]\*[^\n]\n/ ) {
	    $code = $';
	}
	while ( $head =~ s/(^|\n)\s*#[^\n]*?(\n|$)/$1/g ) {
	}
	@parts = ($head, $prologue, $code);

	$iret = 1 if ( $code eq '' );

	return @parts;
}

#=======================================================================

sub ValidSub {
	local ($header, *iret) = @_;
#-----------------------------------------------------------------------
# ValidSub($header, \$iret)
#
# Given a GEMPAK header, this function will identify whether the
# header belongs to a main program, in which case it is not a valid
# sub function.
#
# $valid = &ValidSub($header, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPC.PERL & PTYPCMPF.PERL
# R. Tian/SAIC		3/02	Modified to accept pointer to function args
#-----------------------------------------------------------------------
	local ($valid) = $false;
#-----------------------------------------------------------------------
	$iret = 0;

	$header =~ s/\/\*.*?\*\///gs;

        $valid = $true
                if ( $header =~ /(^|;)([^;]+?)\((.|\n)*\)\s*?(\n|$)/ ||
                     $header =~ /(^|;)\s+SUBROUTINE\s+(\w+)\s*(\n|$)/ );

	$valid = $false
		if ( $header =~ /((^|\n)\s*PROGRAM\s+\S+\s*(\n|$)|main\s*\()/ );

	return $valid;
}

#=======================================================================

sub ParseCall{
	local ($header, *iret) = @_;
#-----------------------------------------------------------------------
# ParseCall($header, \$iret)
#
# Given a GEMPAK header, this function returns the name of the function
# and the names and types of the parameters.
#
# ($funcname, $functype, @funcparms) = &ParseCall($header, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPC.PERL & PTYPCMPF.PERL
# R. Tian/SAIC		3/02	Handle ANSI style and pointer to function args
#-----------------------------------------------------------------------
	local ($parms, $hinfo, $definitions, $funcname, $functype, $rpre) =
	      ('',     '',     '',           '',        '',        '');
	local (@funcparms, @vals) = ();
#-----------------------------------------------------------------------
	$iret = 0;

	$header =~ s|\/\*.*?\*\/||sg;
	$header =~ s/(^|\n)(c\W|\*|\#)[\W][^\n]*[^;\)](\n|$)//ig;
	if ( $header =~ /(^|\n) {6,}(COMMON|DATA)[^\n]+(\n {5}\S[^\n]+)*/ig ) {
	    $header = $`;
	}
	if ( $header =~ /(^|;)([^;]+?)\(((\n|.)*)\)\s*(\n|$)/ ) {
	    $parms = $3;
	    $hinfo = $2;
	    $definitions = $';
	    $parms =~ s/(^\s*|(^|\n)     [\*\+]\s*|\s*$)//g;
	    $parms =~ s/\s+/ /g;
	    $parms =~ s/(^|\*)\s+/$1/g;
	    $parms =~ s/\s+$//;
	    $parms =~ s/^\s*void\s*$//;
	    @funcparms = split ( /\s*,\s*/, $parms );

            #
            # Handle the  ANSI style declaration
            #
            for($ind = 0; $ind <= $#funcparms; $ind++) {
              if($funcparms[$ind] =~ /(\w+\s+)+[\*]*\s*(\w+)\W*/ ||
                 $funcparms[$ind] =~ /(\w+\s+)+\(\s*\*\s*(\w+)\s*\)\W*/) {
                $definitions .= $funcparms[$ind].";\n";
                $funcparms[$ind] = $2;
              }
            }


	    if ( $hinfo =~ /(\**)(\S+)\s*$/ ) {
		$funcname = $2;
		$rpre = $1;
		$functype = $`;
		$functype = $` if ( $functype =~ /function/i );
		$functype =~ s/\#include[^\n]\n//g;
		$functype =~ s/\s+/ /g;
		$functype =~ s/\s+$//;
		$functype =~ s/CHARACTER/CHAR/ig;
		$functype =~ s/(char)\s*\*\s*\(\s*\*\s*\)/$1*/i;
		$functype =~ s/.*[^\w\s]+([\w\s]+)$/$1/g;
		$functype =~ s/^\s*(\w+)/$1$rpre/;

		if ( $functype =~ /subroutine/i ) {
		    $functype = '#Subroutine#';
		}
	    }
	} elsif ( $header =~ /(^|;)\s+SUBROUTINE\s+(\w+)\s*(\n|$)/ ) {
		$funcname = $2;
		$functype = '#Subroutine#';
	}

	@vals = ($funcname, $functype, $definitions, @funcparms);
	return @vals;
}


#=======================================================================

sub GetInOuts{
	local ($prologue, *iret) = @_;
#-----------------------------------------------------------------------
# GetInOuts($prologue, \$iret)
#
# Given a GEMPAK prologue, this function returns the list of parameters
# and their types.
#
# @inoutp = &GetInOuts($prologue, \$iret);
#
##
# Log:
# G. Krueger/EAI	4/99	Derived from PTYPCMPC.PERL & PTYPCMPF.PERL
# R. Tian/SAIC		3/02	Modified to handle no void return type
#-----------------------------------------------------------------------
	local ($recognized, $recogprev) = ($false, $false);
	local ($line, $tst1line, $tst2line, $prvline, $tryline) =
	      ('',    '',        '',        '',       '');
	local ($ioparms, $pextra, $parm, $type, $psub) =
	      ('',       '',      '',    '',    '');
	local ($fucname, $rtntype) = ('', '');
	local (@ioparts, @inoutp) = ();
	local $return = $false;

	@ioparts =
	    split ( /(^|\n).{2,7}((nput.*?)?put|eturn) [pP]arameters?:?\s{5,}\*|Return.*?:|\n[C ]\*{2}|\n[C ]\*\s*Log:/,
		    $prologue );

	
	#
	# Get the return type and name of the function
	#
	$ioparts[0] =~ /\* (\w+)\s+\*/;
	$fucname = $1;
	$ioparts[0] =~ /\* (.*)\s+\b\Q$fucname\E\b\s*\((.|\n)*\)\s+\*/;
	$rtntype = $1;
	$rtntype =~ s/\s+/ /g;
	$rtntype =~ s/(\w)\s+(\W)/$1$2/;
	$rtntype =~ s/(\W)\s+(\W)/$1$2/;
	$rtntype =~ s/^ //g;
	$rtntype =~ s/ $//g;
	$fucname =~ s/^ //g;
	$fucname =~ s/ $//g;
	$rtntype = "void" if("\U$fucname\E" eq "\U$rtntype\E");
	#
	
	$ioparms = join ( /\n/, @ioparts[1..$#ioparts-1] );

	@inoutp = ();
	$recogprev = $false;
	foreach $line ( split ( /\n/, $ioparms ) ) {
	    $recognized = $false;
	    $line =~ s/^[C ]\*\s+(NONE|NULL)\s+\*\s*$//i;
	    $line =~ s/\s+\*\s*$//;
	    if ( $line !~ /^[C ]\*\s+\d+\s+=|^[C ]\*((\t| {4}){4,})/ ) {
		if ( $line =~ /^[C\ ]\*(\ {1,10}|\ {0,5}\t\ {0,3})
				(\**)([^\(\s\[\)]+)
				((\s*[\(\[]\s*[^\)\]]*?\s*[\)\]])*)\s*/x ||
		     $line =~ /(\(\s*)(\*)\s*(\w+)\s*\)\s*(\(\s*\))/) {

		    $ppre = $2;
		    $pextra = $4;
		    $parm = $3;
		    $type = $';

		    $type =~ s/(((struct|auto|long|register|const|short|
				 unsigned|signed|volatile|static)\ {1,3})*
				([^\[\(\s]+)\ {0,3}([\[\(][^\]\)]+[\]\)]
				\ {0,3})*\**).*$/$1/x;
		    $type =~ s/(\w)([\(\[])/\1 \2/;
		    $psub = '';
		    $psub = ' ' . $&
			if ( $pextra =~ s/([\(\[][^\)\]]*[\)\]]\s*)+// );
		    $pextra =~ s/\s+//;
		    $type .= $ppre . $pextra;
		    $type =~ s/\s*\*\s*/\*/g;
		    $type = "($type\*)($2)"
			if ( $parm =~ s/\(\*([^\)]+)\)\s*\(([^\)]*)\)/$1/ );
		    $parm =~ s/\s+//g;
		    $type =~ s/\s+/ /g;
		    $type =~ s/\s+$//;
		    $type =~ s/^\s+//;
		    $psub =~ s/\s+//g;

		    #
		    # Handle no void return type
		    #
		    if($rtntype ne 'void' && $rtntype ne 'static void' && 
		        $rtntype =~ /\b\Q$parm\E\b/) {
		        $parm = $fucname;
		        $type = $rtntype;
	 	        $return = $true;
		    } elsif ("\U$parm\E" eq "\U$fucname\E") {
		        $return = $true; 
		    }
		    #

		    $parens = $unparens = 0;
		    while ( $type =~ /[\(\[]/g ) {
			$parens++;
		    }
		    while ( $type =~ /[\)\]]/g ) {
			$unparens++;
		    }
		    if ( $parm =~ /\w/ && $type =~ /\w/ &&
			 $parens == $unparens ) {
			$recognized = $true;
			push ( @inoutp, join ( '=|=', ($parm, $psub, $type) ) );
		    }
		}
	    }
	    $tst1line = $prvline;
	    $tst2line = $line;
	    $tst1line =~ s/\s*\*\s*$//;
	    $tst2line =~ s/^[C ]\*\s+//;
	    $tryline = $tst1line . ' '. $tst2line;
	    if ( ! $recogprev && ! $recognized &&
		 $tryline !~ /^[C ]\*\s+\d+\s+=|^[C ]\*((\t| {4}){4,})/ ) {
		if ( $tryline =~ /^[C\ ]\*(\ {1,10}|\ {0,5}\t\ {0,3})(\**)([^\(\s\[\)]+)
			((\s*[\(\[]\s*[^\)\]]*?\s*[\)\]])*)\s*/x ) {
		    $ppre = $2;
		    $pextra = $4;
		    $parm = $3;
		    $type = $';
		    $type =~ s/(((struct|auto|long|register|const|short|
				 unsigned|signed|volatile|static)\ {1,3})*
				([^\[\(\s]+)\ {0,3}([\[\(][^\]\)]+[\]\)]
				\ {0,3})*\**).*$/$1/x;
		    $type =~ s/(\w)([\(\[])/\1 \2/;
		    $psub = '';
		    $psub = ' ' . $&
			if ( $pextra =~ s/([\(\[][^\)\]]*[\)\]]\s*)+// );
		    $pextra =~ s/\s+//;
		    $type .= $ppre . $pextra;
		    $type =~ s/\s*\*\s*/\*/g;
		    $type = "($type\*)($2)"
			if ( $parm =~ s/[\(\[]\*([^\)\]]+)[\)\]]\s*
				[\(\[]([^\)\]]*)[\)\]]/$1/x );
		    $parm =~ s/\s+//g;
		    $type =~ s/\s+/ /g;
		    $type =~ s/\s+$//;
		    $psub =~ s/\s+//g;
		    $parens = $unparens = 0;
		    while ( $type =~ /[\(\[]/g ) {
			$parens++;
		    }
		    while ( $type =~ /[\)\]]/g ) {
			$unparens++;
		    }
		    if ( $parm =~ /\w/ && $type =~ /\w/ &&
			 $parens == $unparens ) {
			$recognized = $true;
			push ( @inoutp, join ( '=|=', ($parm, $psub, $type) ) );
		    }
		}
	    }
	    if ( $recogprev && ! $recognized &&
		 $line =~ /^[C ]\*\s+([\(\[][^\)\]]+[\)\]])\s*$/ &&
		 $line !~ /\([^\)\]]*\w \w[^\)\]]*[\)\]]/ ) {
		    ($parm, $psub, $type) = split ( /=\|=/, pop (@inoutp) );
		$line =~ /^[C ]\*\s+(([\(\[][^\)\]]+[\)\]])+)\s+\*\s*$/;
		$psub .= $1;
		$psub =~ s/\s+//g;
		$parens = $unparens = 0;
		while ( $type =~ /[\(\[]/g ) {
		    $parens++;
		}
		while ( $type =~ /[\)\]]/g ) {
		    $unparens++;
		}
		if ( $type =~ /\w/ && $parens == $unparens ) {
		    $recognized = $true;
		    push ( @inoutp, join ( '=|=', ($parm, $psub, $type) ) );
		}
	    }
	    $prvline = $line;
	    $recogprev = $recognized;
	}
	#
	# Handle no void return type
	#
	if($rtntype ne 'void' && $rtntype ne 'static void' && ! $return) {
	    push ( @inoutp, join ( '=|=', ($fucname, '', $rtntype) ) );
	} 
	#

	return @inoutp;
}

sub ParamCmp {
	local ($printbad, $printgood, @files) = @_;
#-----------------------------------------------------------------------
# ParamCmp($printbad, $printgood, @files)
#
# Given one or more names, @files, of a GEMPAK subroutine file
# (FORTRAN or C), this utility compares parameter names between the
# call declaration and the prologue.
#
# ($pcgood, $pcdisc, $pcrecg, $pcnotr, $pcprog, $iret) =
#	&ParamCmp($printbad, $printgood, @files);
#
# Example:
#	($pcgood, $pcdisc, $pcrecg, $pcnotr, $pcprog, $iret) =
#		&ParamCmp($true, $true,
#			  "$ENV{'GEMPAK'}/source/gemlib/er/ersmsg.c");
#
# Input Parameters:
#	PRINTBAD	STRING		Whether to print bad code entries
#	PRINTGOOD	STRING		Whether to print good code entries
#	FILES[]		STRING		List of files to check
#
# Output Parameters:
#	IRET		INTEGER		Exit Code
#					    4 = No files
#					    3 = Main Program
#					    2 = Unrecognized Format
#					    1 = Other discrepancy
#					    0 = Normal
#						  
##
# Log:
# G. Krueger/EAI	 2/00	Derived from PARAMCMP.PERL
#-----------------------------------------------------------------------
	local ($ier, $part) = (0, 0);
	local ($good, $disc, $recg, $notr, $prog, $iret) = (0, 0, 0, 0, 0, 0);
	local ($contents, $head, $prologue, $code, $procheck) =
		('', '', '', '', '');
	local ($funcname, $functype, $definitions, $funcparmstr) =
		('', '', '', '');
	local ($callparmstr, $parm, $tpname) = ('', '', '');
	local ($pp, $ps, $pt, $pptype, $ppname, $prmstr) =
		('', '', '', '', '', '');
	local ($inoutparmstr, $problems) = ('', '');
	local ($file, $ftype, $main) = ('', '', '');
	local ($RS) = ($/);
	local (@fileparts, @funcparms, @inoutp, @retvec) = ();

	if ( $#files < 0 ) {
	    $iret = 4;
	    @retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	}

	#---------------------------------------------------------------

	# Process each file:
	foreach $file ( @files ) {
	    undef $/;
	    open ( INFILE, "<$file" );
	    $contents = <INFILE>;
	    close ( INFILE );
	    $/ = $RS;

	    if ( $file =~ /([^\/]+)\.[fF]$/ ) {
		$main = $1;
		@fileparts = &SplitFRoutines($contents, \$ier);
		$ftype = 'FORTRAN';
	    } elsif ( $file =~ /([^\/]+)\.[cC]$/ ) {
		$main = $1;
		@fileparts = &SplitCRoutines($contents, \$ier);
		$ftype = 'C';
	    }

Part:	    for ( $part = 0; $part <= $#fileparts; $part++ ) {
		next Part if ( @fileparts[$part] !~ /\w/ );

		($head, $prologue, $code) =
			&ExtractSections(@fileparts[$part], \$ier);

		if ( $ier == 1 ) {
		    if ( $prologue !~
			/^\n?C\*\s{1,3}(PROGRAM\s+)?($main(\.f)?)\s+\*\s*\n/i
		       ) {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
		    } elsif ( $prologue !~ /^\n? \*\s{1,3}main\s+\*\s*\n/i ) {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
		    }
		    next Part;
		}

		if ( ! &ValidSub ($head, \$ier) ) {
		    if ( $prologue =~ /\n[ C]\*\ CONTENTS:\s+\*\s*\n/ ) {
			# A module listing.  Ignore it.
		    } elsif ( $prologue =~
			/^\n?[ C]\*\s{1,3}(PROGRAM\s+)?($main(\.[fc])?)\s+\*\s*\n/i
		       ) {
			$prog++;
		    } elsif ( $prologue =~ /^\n? \*\s{1,3}main\s+\*\s*\n/i ) {
			$prog++;
		    } else {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
		    }
		} else {
		    $recg++;

		    #---------------------------------------------------
		    # Extract the subroutine name and parameters from the call
		    # declaration.

		    ($funcname, $functype, $definitions, @funcparms) =
			&ParseCall($head, \$ier);
		    $callparmstr = '';
		    foreach $parm ( @funcparms ) {
			($pp, $ps, $pt) = split ( /=\|=/, $parm );
			$callparmstr .= "$pp ";
		    }
		    $funcparmstr = $callparmstr;
		    $funcparmstr .= $funcname
			if ( ($functype ne '' || $ftype eq 'FORTRAN') &&
			     ($functype ne 'void' && $functype ne 'static void')
			     && $functype ne '#Subroutine#' );
		    $funcparmstr =~ s/\s+$//;

		    #---------------------------------------------------
		    # Extract the subroutine name and parameters inside the
		    # prologue.

		    $tpname = '';
		    $procheck = $prologue;
		    if ( $prologue =~
 /(^|\n)[ C]\*\ {1,3}([\w\.]+(\s*\([\w,\s]*\))?)(\s+-\s+\w+)?\s+\*\s*(\n|$)/i ) {
			$tpname = $2;
			$procheck = $';
		    }

		    $pptype = $ppname = $prmstr = '';
		    if ( $procheck =~
 /(^|\n)[ C]\*\ {1,3}((\S[^\n<>=]{0,39}?)\s+)?\**(\w+)\s*\(\s*((\w|,\s*|\s*\*\s*|\s*\n\s*)*)\s*\)\s*\*\s*(\n|$)/is ) {
			$pptype = $3;
			$ppname = $4;
			$prmstr = $5;
		    } elsif ( $procheck =~
 /(^|\n)[ C]\*\ {1,3}((\S[^\n<>=]{0,39}?)\s+)?\**($main)\s*(\(\s*((\w|,\s*|\s*\*\s*|\s*\n\s*)*)\s*\))?\s*\*\s*(\n|$)/is ) {
			$pptype = $3;
			$ppname = $4;
			$prmstr = $6;
		    }

		    $prmstr =~ s/^\s*void\s*$//;
		    $prmstr =~ s/(^|\n)[ C]\*//g;
		    $prmstr =~ s/\*\s*$//g;
		    $prmstr =~ s/\n//g;
		    $prmstr =~ s/,/ /g;
		    $prmstr =~ s/\*//g;
		    $prmstr .= " $ppname"
			if ( $pptype ne '' && $pptype ne 'void' && $pptype ne 'static void' );
		    $prmstr =~ s/\s+/ /g;
		    $prmstr =~ s/(^\s+|\s+$)//g;

		    #---------------------------------------------------
		    # Extract the parameters from the input/output lists.

		    @inoutp = &GetInOuts($prologue, \$ier);
		    $inoutparmstr = '';
		    foreach $parm ( @inoutp ) {
#print "parm: ", $parm, "\n";
			($pp, $ps, $pt) = split ( /=\|=/, $parm );
			$inoutparmstr .= "$pp ";
		    }
		    $inoutparmstr =~ s/\s+$//;

		    #---------------------------------------------------
		    # Figure out if there are any problems, and what the
		    # problems are.

		    $problems = '';

		    if ( "\U$funcname\E" ne "\U$ppname\E" ||
			 "\U$funcname\E" ne "\U$tpname\E" ) {
			$problems .= "subroutine names do not match\n";
			$disc++;
		    }

		    if ( "\U$funcparmstr\E" ne "\U$prmstr\E" ||
			 "\U$funcparmstr\E" ne "\U$inoutparmstr\E" ) {
			$problems .= "parameter names do not match\n";
			$disc++;
		    }

		    if ( $ftype eq 'FORTRAN' ) {
			if ( $funcname =~ /[a-z]/ ) {
			    $problems .=
			    "subroutine name contains lower-case characters\n";
			    $disc++;
			}

			if ( $callparmstr =~ /[A-Z]/ ) {
			    $problems .=
				"parameters contain upper-case characters\n";
			    $disc++;
			}

			if ( $ppname =~ /[a-z]/ ) {
			    $problems .=
			    "subroutine name contains lower-case characters\n";
			    $disc++;
			}

			if ( $prmstr =~ /[a-z]/ ) {
			    $problems .=
				"parameters contain lower-case characters\n";
			    $disc++;
			}

			if ( $tpname =~ /[a-z]/ ) {
			    $problems .=
			    "subroutine name contains lower-case characters\n";
			    $disc++;
			}

			if ( $inoutparmstr =~ /[a-z]/ ) {
			    $problems .=
				"parameters contain lower-case characters\n";
			    $disc++;
			}
		    }

		    #---------------------
		    # Display the results.

		    if ( $printbad && ($disc || $notr) ||
			 $printgood && ! ($disc || $notr) ) {
			$outstr =
			    sprintf ( "    <%s><%s>", $funcname, $funcparmstr );
			printf ( "%.78s\n", $outstr );
			$outstr = sprintf ( "    <%s><%s>", $ppname, $prmstr );
			printf ( "%.78s\n", $outstr );
			$outstr =
			    sprintf ( "    <%s><%s>", $tpname, $inoutparmstr );
			printf ( "%.78s\n", $outstr );

			printf ( "%s", $problems );
		    }
		}
	    }
	}

	#---------------------------------------------------------------
	# Set the return code.

	if ( $iret == 0 ) {
	    $iret = 1 if ( $disc != 0 );
	    if ( $recg == 0 ) {
		$iret = 3 if ( $prog != 0 );
		$iret = 2 if ( $notr != 0 );
	    }
	}
	$good = 1 if ( ! ($disc || $notr) );

	@retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	return @retvec;
}

sub PTypCmpF {
	local ($printbad, $printgood, @files) = @_;
#-----------------------------------------------------------------------
# PTypCmpF($printbad, $printgood, @files)
#
# Given one or more names, @files, of a GEMPAK subroutine file
# (FORTRAN), this utility compares parameter types between the call
# declaration and the prologue.
#
# ($good, $disc, $recg, $notr, $prog, $iret) =
#	&PTypCmpF($printbad, $printgood, @files);
#
# Example:
#	($ptgood, $ptdisc, $ptrecg, $ptnotr, $ptprog, $rtCode2) =
#		&PTypCmpF($true, $true, "$GEMPAK/source/appl/plot/gline.f");
#
# Input Parameters:
#	PRINTBAD	STRING		Whether to print bad code entries
#	PRINTGOOD	STRING		Whether to print good code entries
#	FILES[]		STRING		List of files to check
#
# Output Parameters:
#	IRET		INTEGER		Exit Code
#					    4 = Missing file name argument
#					    3 = Main program (must be a
#							      function)
#					    2 = Unrecognized format
#					    1 = Mismatched parameters
#					    0 = Normal
##
# Log:
# G. Krueger/EAI		 2/00	Derived from PTYPCMPF.PERL
#-----------------------------------------------------------------------
	local ($ier, $part, $parmno) = (0, 0, 0);
	local ($good, $adisc, $disc, $recg, $notr, $prog, $iret) =
		(0, 0, 0, 0, 0, 0, 0);
	local ($file, $contents, $head, $prologue, $code, $rest, $main) =
		('', '', '', '', '', '');
	local ($definitions, $def, $type, $statements) = ('', '', '', '');
	local ($funcname, $functype) = ('', '');
	local ($parm, $ptype, $qtype, $pchar, $pextra, $pparm, $psub, $qsub) =
		('', '', '', '', '', '', '', '');
	local ($ppp, $pp, $ps, $pt, $qqq, $qpm, $qs, $qt) =
		('', '', '', '', '', '', '', '');
	local ($psmatch, $qsmatch, $qtmatch) = ('', '', '');
	local ($RS) = ($/);
	local (@fileparts, @callPrms, @allParms, @funcparms, @parmlist) = ();
	local (@inoutp) = ();

	if ( $#files < 0 ) {
	    $iret = 4;
	    @retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	    return @retvec;
	}

	# Process each file:
	foreach $file ( @files ) {
	    undef $/;
	    open ( INFILE, "<$file" );
	    $contents = <INFILE>;
	    close ( INFILE );
	    $/ = $RS;

	    if ( $file =~ /([^\/]+)\.[fF]$/ ) {
		$main = $1;
		@fileparts = &SplitFRoutines($contents, \$ier);
		$ftype = 'FORTRAN';
	    }

	    @fileparts = &SplitFRoutines($contents, \$ier);

Part:	    for ( $part = 0; $part <= $#fileparts; $part++ ) {
		($head, $prologue, $code) =
			&ExtractSections(@fileparts[$part], \$ier);
		if ( $ier == 1 ) {
		    printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
		    $notr++;
		    next Part;
		}

		if ( ! &ValidSub ($head, \$ier) ) {
		    if ( $prologue =~
			/^\n?C\*\s{1,3}(PROGRAM\s+)?($main(\.f)?)\s+\*\s*\n/i
		       ) {
			$prog++;
		    } elsif ( $prologue =~ /^\n? \*\s{1,3}main\s+\*\s*\n/i ) {
			$prog++;
		    } else {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
		    }
		} else {
		    @callPrms = ();
		    @allParms = ();

		    #---------------------------------------------------
		    # Extract the parameters from the call declaration.

		    ($funcname, $functype, @funcparms) =
			&ParseCall($head, \$ier);
			push ( @callPrms, @funcparms );
		    if ( $functype ne '#Subroutine#' ) {
			push ( @callPrms, $funcname );
			push ( @allParms,
			       join ( '=|=', ($funcname, '', $functype) ) );
		    }

		    #---------------------------------------------------
		    # Get the parameter types defined below the prologue.

		    if ( $code eq '' ) {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
			next Part;
		    }
		    $recg++;

		    ($definitions, $statements) =
    split ( /(^|\n)C-{3,}|(^|\n)\s+\w+\s*(\(\s*[^\)]+\s*\)\s*)?=|(^|\n)\s+DO\s/,
	    $code );
		    $definitions =~ s/\n\s{5}\+\s+/ /g;
		    $definitions =~
    s/(^|\n)\s{6,}(INCLUDE|PARAMETER|COMMON|DATA)[^\n]+(\n {5}\S[^\n]+)*//ig;
		    $definitions =~ s/CHARACTER/CHAR/ig;
		    foreach $def ( split ( /\n/, $definitions ) ) {
			if ( $def =~ /^\s*(\S+(\s*\([^\)]+\))?)/ ) {
			    $type = $1;
			    $rest = $';
			    @parmlist = split (/,/, $rest);
			    for ( $parmno = $#parmlist; $parmno >= 0;
				  $parmno-- ) {
				if ( @parmlist[$parmno] =~ /^[^\(]+\)/ ) {
				    @parmlist[$parmno-1] .=
					',' . @parmlist[$parmno];
				    @parmlist = (@parmlist[0..$parmno-1],
					     @parmlist[$parmno+1..$#parmlist]
						);
				}
			    }
			    foreach $parm ( @parmlist ) {
				$ptype = $type;
				# Shorten CHAR*(*) entries to match
				# in/out list.
				$ptype =~ s/(char)\s*\*\s*\(\s*\*\s*\)/$1*/i;

				$pchar = '';
				if ( $parm =~ /^\s*([^\*\s\(]+)/ ) {
				    $pextra = $';
				    $pparm = $1;
				    # Shorten CHAR*(*) entries to match
				    # in/out list.
				    $pextra =~ s/^\s*\*\s*\(\s*\*\s*\)/\*/i
					    if ( $ptype =~ /^char/i );
				    $pparm =~ s/\s+//;
				    $psub = '';
				    $psub = ' ' . $&
					if ( $pextra =~ s/\([^\)]+\)// );
				    $pextra =~ s/\s+//;
				    $ptype .= $pextra;
				} else
				{
				    $pparm = $parm;
				}
				$pparm =~ s/\s+/ /g;
				$ptype =~ s/\s+$//;
				$ptype =~ s/\s+/ /g;
				$psub =~ s/\s+//g;
				push ( @allParms,
				       join ( '=|=',
					      ($pparm, $psub, $ptype) ) );
			    }
			}
		    }

		    #---------------------------------------------------
		    # Extract the parameters from the input/output lists.

		    @inoutp = &GetInOuts($prologue, \$ier);

		    #---------------------------------------------------
		    # Match the parameters in the two lists using call
		    # definition as a guide.

Item:		    foreach $parm ( @callPrms ) {
			$ppp = $psub = $ptype = '';
			foreach $pparm ( @allParms ) {
			    ($pp, $ps, $pt) = split ( /=\|=/, $pparm );
			    if ( $parm !~ /\s+/ && $pp =~ /^$parm$/i ) {
				$ppp = $pp;
				$psub = $ps;
				$ptype = $pt;
			    }
			}

			$qqq = $qsub = $qtype = '';
			foreach $qparm ( @inoutp ) {
			    ($qp, $qs, $qt) = split ( /=\|=/, $qparm );
			    if ( $parm !~ /\s+/ && $qp =~ /^$parm$/i ) {
				$qqq = $qp;
				$qsub = $qs;
				$qtype = $qt;
			    }
			}

			if ( $ptype =~ /^\s*$/ ) {
			    $ppp = $parm;
			    $ptype = 'INTEGER' if ( $ppp =~ /^[i-n]/i );
			    $ptype = 'REAL' if ( $ppp =~ /^[^i-n]/i );
			}
			next Item if ( $ppp =~ /^\s*$/ && $qqq =~ /^\s*$/ );

			$psmatch = $psub;
			$qsmatch = $qsub;
			$qsmatch =~ s/^\(($1)[^\)]+/\(\1\*/
			    if ( $psmatch =~ /^\(([^\*]*)\*[^\)]*\)/ );
			$qtmatch = $qtype;
			$qtmatch =~ s/char\*(\([\w\+]+\)|[\w\+]+)/char\*/i
				if ( $ptype =~ /char\*(\s+|$)/i );
			if ( "\U$ppp\E"	eq "\U$qqq\E"	  &&
			     "\U$psmatch\E"	eq "\U$qsmatch\E" &&
			     "\U$ptype\E"	eq "\U$qtmatch\E" ) {
			    printf ( "    %-15s %-15s  %-15s %-15s\n",
				     $ppp . ' ' . $psub, $ptype,
				     $qqq . ' ' . $qsub, $qtype )
				if ( $printgood );
			} else
			{
			    printf ( "--> %-15s %-15s  %-15s %-15s\n",
				     $ppp . ' ' . $psub, $ptype,
				     $qqq . ' ' . $qsub, $qtype )
				if ( $printbad );
			    $adisc = 1;
			    $disc++;
			}
		    }

		    #---------------------------------------------------
		    # Display the results.

		    if ( $adisc != 0 ) {
			if ( $printbad ) {
			    printf ( "parameter types do not match\n", $file );
		#	    printf ( "   -- %s\n", $file );
			}
			$adisc = 0;
		    } else
		    {
		#	printf ( "OK -- %s\n", $file ) if ( $printgood );
			$good++;
		    }
		}
	    }
	}
	@retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	return @retvec;
}

sub PTypCmpC {
	local ($printbad, $printgood, @files) = @_;
#-----------------------------------------------------------------------
# PTypCmpC($printbad, $printgood, @files)
#
# Given one or more names, @files, of a GEMPAK subroutine file (C
# language), this utility compares parameter types between the call
# declaration and the prologue.
#
# ($good, $disc, $recg, $notr, $prog, $iret) =
#	&PTypCmpC($printbad, $printgood, @files);
#
# Example:
#	($ptgood, $ptdisc, $ptrecg, $ptnotr, $ptprog, $rtCode2) =
#		&PTypCmpC($true, $true,
#			  "$GEMPAK/source/appl/plot/ctbastn.c");
#
# Exit Codes:
#
#	5 = Bad parameter list arguments
#	4 = Missing file name argument
#	3 = Main program (must be a function)
#	2 = Unrecognized format
#	1 = Mismatched parameters
##
# Log:
# G. Krueger/EAI	 2/00	Derived from PTYPCMPC.PERL
# R. Tian/SAIC		 3/02	Handle ANSI style and pointer to function args 
#-----------------------------------------------------------------------
	local ($ier, $part, $parmno) = (0, 0, 0);
	local ($good, $adisc, $disc, $recg, $notr, $prog, $iret) =
		(0, 0, 0, 0, 0, 0, 0);
	local ($file, $contents, $head, $prologue, $code, $main) =
		('', '', '', '', '');
	local ($funcname, $functype, $definitions, $def) =
		('', '', '', '');
	local ($type, $rest, $parm, $badels, $reparm) = ('', '', '', '', '');
	local ($ptype, $pparm, $psub, $ppp, $pp, $ps, $pt, $ppre, $pextra) =
		('', '', '', '', '', '', '', '', '');
	local ($qtype, $qparm, $qsub, $qqq, $qp, $qs, $qt) =
		('', '', '', '', '', '', '');
	local ($pmatch, $qmatch) = ('', '');
	local ($RS) = ($/);
	local (@fileparts, @callPrms, @allParms, @funcparms, @parmlist) = ();
	local (@inoutp) = ();

	if ( $#files < 0 ) {
	    $iret = 4;
	    @retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	    return @retvec;
	}

	# Process each file:
	foreach $file ( @files ) {
	    undef $/;
	    open ( INFILE, "<$file" );
	    $contents = <INFILE>;
	    close ( INFILE );
	    $/ = $RS;

	    if ( $file =~ /([^\/]+)\.[cC]$/ ) {
		$main = $1;
		@fileparts = &SplitCRoutines($contents, \$ier);
		$ftype = 'C';
	    }

	    @fileparts = &SplitCRoutines($contents, \$ier);

Part:	    for ( $part = 0; $part <= $#fileparts; $part++ ) {
		next Part if ( @fileparts[$part] !~ /\n\/\*{3,}/ );

		($head, $prologue, $code) =
			&ExtractSections(@fileparts[$part], \$ier);
		if ( $ier == 1 ) {
		    printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
		    $notr++;
		    next Part;
		}

		if ( ! &ValidSub ($head, \$ier) ) {
		    if ( $prologue =~ /\n[ C]\*\ CONTENTS:\s+\*\s*\n/ ) {
			# A module listing.  Ignore it.
		    } elsif ( $prologue =~
			/^\n? \*\s{1,3}(PROGRAM\s+)?($main(\.c)?)\s+\*\s*\n/i
		       ) {
			$prog++;
		    } elsif ( $prologue =~ /^\n? \*\s{1,3}main\s+\*\s*\n/i ) {
			$prog++;
		    } else {
			printf ( "%s", <<EOFN ) if ( $printbad );
ERROR: format is not recognized.
       $file

EOFN
			$notr++;
		    }
		} else {
		    $recg++;
		    @callPrms = ();
		    @allParms = ();

		    #---------------------------------------------------
		    # Extract the parameters from the call declaration.

		    ($funcname, $functype, $definitions, @funcparms) =
			&ParseCall($head, \$ier);
		    $functype =~ s/(\w)\s+(\W)/$1$2/;
		    $functype =~ s/(\W)\s+(\W)/$1$2/;
		    push ( @callPrms, @funcparms );
		    push ( @callPrms, $funcname );
		    push ( @allParms,
			   join ( '=|=', ($funcname, '', $functype) ) )
			if ( $functype !~ /^\s*$/ && $functype !~ /void/i );

		    #---------------------------------------------------
		    # Get the parameter types defined above the prologue.

		    foreach $def ( split ( /;/, $definitions ) ) {
			$def =~ s|\/\*.*\*\/||g;
			if ($def =~ /(?:\w+\s+)*\w+\b\s*(\**\s*\w+)\W*/) { 
			    $def =~ /\Q$1\E\b/;
			    $type = $`;
			    $def =~ /\Q$type\E/;
			    $rest = $';

			    @parmlist = split (/,/, $rest);
			    for ( $parmno = $#parmlist; $parmno >= 0;
				  $parmno-- ) {
				if ( @parmlist[$parmno] =~ /^[^\[]+\]/ ) {
				    @parmlist[$parmno-1] .=
					',' . @parmlist[$parmno];
				    @parmlist =
					(@parmlist[0..$parmno-1],
					 @parmlist[$parmno+1..$#parmlist]);
				}
			    }
			    foreach $parm ( @parmlist ) {
				$type =~ s/\s+/ /g;
				$type =~ s/\s+$//;
				$type =~ s/^\s+//;
				$type =~ s/\s*\*\s*/*/g;
				$ptype = $type;
				$ptype = "($ptype\*)$2"
				    if ( $parm =~
					 s/\(\*([^\)]+)\)\s*(\([^\)]*\))/$1/ );
				$psub = '';
				if ( $parm =~
					/^\s*(((struct|auto|long|register|
						const|short|unsigned|
						signed|volatile|static)
				   \ {1,3})*\**)\s*([^\[\s]+[\s*\)\(]*)/x ) {
				    $ppre = $1;
				    $pextra = $';
				    $pparm = $4;
				    $pparm =~ s/\s+//;
				    $psub = '';
				    $psub = ' ' . $&
					if ( $pextra =~ s/(\[[^\]]*\]\s*)+// );
				    $pextra =~ s/\s+//;
				    $ptype .= $ppre . $pextra;
				} else
				{
				    $pparm = $parm;
				}
				$pparm =~ s/\s+/ /g;
				$ptype =~ s/\s+$//;
				$ptype =~ s/\s+/ /g;
				$psub =~ s/\s+//g;
				push ( @allParms,
				       join ( '=|=', ($pparm, $psub, $ptype) ) );
			    }
			}
			elsif ($def =~ /(\w+\s+)+\(\s*\*\s*(\w+)\s*\)(\W*)/) {
			    $pparm = $2;
			    $psub  = $3;
			    $ptype = $1.'*';
			    $pparm =~ s/\s+/ /g;
			    $ptype =~ s/\s+//g;
			    $psub =~ s/\s+//g;
			    push ( @allParms, join ( '=|=', ($pparm, $psub, $ptype) ) );
			}
		    }

		    #---------------------------------------------------
		    # Extract the parameters from the input/output lists.

		    @inoutp = &GetInOuts($prologue, \$ier);

		    #---------------------------------------------------
		    # Match the parameters in the two lists using call
		    # definition as a guide.
		    $badels = '';
	Item:	    foreach $parm ( @callPrms ) {
			$reparm = $parm;
			$reparm =~ s/[\*\[\]]/\\$&/g;
			$ppp = $psub = $ptype = '';
			foreach $pparm ( @allParms ) {
			    ($pp, $ps, $pt) = split ( /=\|=/, $pparm );

			    if ( $pp =~ /^$reparm$/i ) {
				$ppp = $pp;
				$psub = $ps;
				$ptype = $pt;
			    }
			}

			$qqq = $qsub = $qtype = '';
			foreach $qparm ( @inoutp ) {
			    ($qp, $qs, $qt) = split ( /=\|=/, $qparm );
			    if ( $qp =~ /^$reparm$/i ) {
				$qqq = $qp;
				$qsub = $qs;
				$qtype = $qt;
			    }
			}

			if ( $parm =~ /\w+\W+\w+/ ) {
			    $badels .= $parm . ', ';
			    $iret = 5;
			}
			next Item if ( $ppp =~ /^\s*$/ && $qqq =~ /^\s*$/ );

			$pmatch = $psub;
			$qmatch = $qsub;
			$qmatch =~
				s/^(\[[^\]]+\])/\[\]/ if ( $pmatch =~ /^\[\]/ );
			if ( "\U$ppp\E"    eq "\U$qqq\E"    &&
			     "\U$pmatch\E" eq "\U$qmatch\E" &&
			     "\U$ptype\E"  eq "\U$qtype\E"  ) {
			    printf ( "    %-15s %-15s  %-15s %-15s\n",
				     $ppp . ' ' . $psub, $ptype,
				     $qqq . ' ' . $qsub, $qtype )
				if ( $printgood );
			} else
			{
			    printf ( "--> %-15s %-15s  %-15s %-15s\n",
				     $ppp . ' ' . $psub, $ptype,
				     $qqq . ' ' . $qsub, $qtype )
				if ( $printbad );
			    $adisc = 1;
			    $disc++;
			}
		    }

		    if ( length ($badels) > 0 ) {
			$badels =~ s/,\s*$//;
			printf ( "ERROR: bad parameter list elements\n\t%s\n",
				 $badels ) if ( $printbad );
		    }

		    #---------------------------------------------------
		    # Display the results.

		    if ( $adisc != 0 ) {
			if ( $printbad ) {
			    printf ( "parameter types do not match\n", $file );
		#	    printf ( "   -- %s\n", $file );
			}
			$adisc = 0;
		    } else
		    {
		#	printf ( "OK -- %s\n", $file ) if ( $printgood );
			$good++;
		    }
		}
	    }
	}
	@retvec = ($good, $disc, $recg, $notr, $prog, $iret);
	return @retvec;
}
1;
