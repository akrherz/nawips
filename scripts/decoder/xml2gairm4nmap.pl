#!/usr/bin/perl -w
use strict;
use XML::Twig;
use Switch;
use POSIX qw(strftime);
#################################################################
#
# Usage: xml2gairm4nmap.pl -i <xmlfile> -ofmt <outfilename>
#        [-outhour <hh>] [-offsetiss <hours>] [-append]
#
#    where -i is the input XML document
#    where -ofmt is the format string or flat filename.
#    where -outhour is the 2-digit hour the text is valid used 
#      in formatting the output filename.
#    where -offsetiss offsets the issue time by X hours.
#      This allows for time-binned displays in nmap2.
#    where -append is used to append the output to a pre-existing file.
#
# Purpose: This script builds airm text files for snapshots, to be 
#          rendered via NMAP2 MISC/AIRM option...
#          When managed by gairm_metwatch_processor.pl, this script
#             is used to build a single file "airmet.txt" which houses
#             the latest output from SIERRA/TANGO/ZULU hazards.
# Inputs: PreXML documents from the GFA BUFR Encoder...
# Outputs:  GEMPAK AIRMET Text files.  Formatted filenames can be
#    produced,(Example) YYYYMMDD_HH.airm. 
#
# Author:  Larry Hinson AWC, 8/06
#          Revised           4/10
################################################################ 

my ($inputfile,$infilesw,$outhoursw,$outhour,$outputfile,$outfilesw,$outputfmt);
my ($offsetisssw, $offsetisshr, $appendsw, $iseqsufffix);
my ($updatenum, $cancel, $correction, $iseqsuffix,$bulletin);
$infilesw = 0;
$outhoursw = 0;
$outfilesw = 0;
$offsetisssw = 0;
$offsetisshr = 0;
$appendsw = 0;
$cancel = 0;
$correction = 0;
$outputfmt = "%Y%m%d_%H.airm";
$updatenum = 1;
$bulletin="";

if (($#ARGV+1) < 2) {
  print "Usage: xml2gairm4nmap.pl -i <xmlfile> [-outhour <hh>]\n";
  print "       [-ofmt <output name format string>] [-offsetiss <hours>] [-append] [-updatenum number]\n";
  exit 1;
} else {
  while ($#ARGV+1) {
    if ($ARGV[0] eq "-i") {
      $inputfile=$ARGV[1];
      $infilesw = 1;
    }
    if ($ARGV[0] eq "-outhour") {
      $outhoursw = 1;
      $outhour=$ARGV[1];
    }
    if ($ARGV[0] eq "-ofmt") {
      $outfilesw=1;
      $outputfmt=$ARGV[1];
    }
    if ($ARGV[0] eq "-offsetiss") {
      $offsetisssw = 1;
      $offsetisshr = $ARGV[1];

    }
    if ($ARGV[0] eq "-append") {
      $appendsw = 1;
    }
    if ($ARGV[0] eq "-updatenum") {
      $updatenum = $ARGV[1];
    }
    if ($ARGV[0] eq "-bulletin") {
      $bulletin = $ARGV[1];
    }
    shift(@ARGV);
  }
}
if ( ! $infilesw) {
  print "No Input files specified...\n";
  exit 1;
}
print "Testline.\n";
if (! $offsetisssw) {
  $offsetisshr = 0;
}
$cancel = $correction = 0;
$iseqsuffix = 80;

# Decide what Output there is going to be...
if (! $outfilesw) {
  $outputfile=">&STDOUT";
} else {
  #From Output format, build outputfile name...
  #Assume base format of form "%Y%m%d_%H.airm
  #Replace Hour with $outhour
  if ($outputfmt =~ /%H/ && $outhoursw) {
    $outputfmt =~ s/%H/$outhour/;
  }
  $outputfile = (strftime $outputfmt , gmtime);
}
if ($appendsw) {
  open (OUTFILE,">>$outputfile");
} else {
  open (OUTFILE,">$outputfile");
}
my $new_gfaInfo = new XML::Twig();
$new_gfaInfo->parsefile($inputfile);
my $hdr = $new_gfaInfo->root->first_child('hdr');
my $issueTime = $hdr->field('issueTime');
my $untilTime = $hdr->field('untilTime');
my ($yy,$mm,$dd,$hh,$MM,$update);

my @objects = $new_gfaInfo->root->children( 'smear' );
foreach my $gfaObject (@objects) {
  my $hazard = $gfaObject->field( 'hazard' );
  my $tag = $gfaObject->field('tag');
  my $airstype;
  switch ($hazard) {
    case /IFR/ {$airstype = 'IR'};
    case /MT_OBSC/ {$airstype='MO'};
    case /ICE/ {$airstype='IC'};
    case /TURB-HI/ {$airstype='TB'};
    case /TURB-LO/ {$airstype='TB'};
    case /SFC_WND/ {$airstype='SW'};
    case /LLWS/ {$airstype='WS'};
    case /M_FZLVL/ {$airstype='MFZL'};
    case /FZLVL/ {$airstype='FZL'};
  }
  if ($airstype =~ /MFZL|FZL/) { last };
  my $issTime=sprintf("%s/%s",substr($issueTime,2,6),substr($issueTime,8,4));
  my $validFrom = $gfaObject->field('validFrom');
  my $startTime = sprintf("%s/%s",substr($validFrom,2,6),substr($validFrom,8,4));
  my $validUntil = $gfaObject->field('validUntil');
  my $stopTime = sprintf("%s/%s",substr($validUntil,2,6),substr($validUntil,8,4));
  if ($startTime eq $stopTime) {
    my $fltlvl1 = "";
    my $fltlvl2 = "";    
    $_ = $validFrom;
    my ($hhmm) = /\d{8}(\d{4})/;
    my $hhmindiff = sprintf("%04d",$hhmm % 300);
    $_ = $hhmindiff;
    ($hh,$MM) = /(\d{2})(\d{2})/;    
    my $hhminfract = $hh + $MM/60.0;
    
    # Obtain a new End Time, by subtracting hhminfract from starttime and
    #  add 3 hours.
    $_ = $validFrom;
    ($yy,$mm,$dd,$hh,$MM) = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})/;
    my $formatstr = sprintf("%02d/%02d/%02d %02d:%02d",$mm,$dd,$yy,$hh,$MM);
    my $epochtimestart = `date --date="$formatstr" '+%s'`;
    my $epochtimestop  = $epochtimestart - ($hhminfract*3600) + (3600*3) - 60;
    
    $stopTime = strftime ("%y%m%d/%H%M", localtime($epochtimestop));

    
    my $status = $gfaObject->field('Status');
    if ($airstype =~ /TB|IC/) {
      $fltlvl1 = $gfaObject->field('Base');
      $fltlvl2 = $gfaObject->field('Top');
    }
    # Write the Airmet Text Line for NMAP:
    printf(OUTFILE "|%s|%s|%s|%s|%s%02d|%s|%s|%s|%d|%d\n",$airstype,$issTime,$startTime,$stopTime,'KCI',$iseqsuffix,
        $updatenum,$fltlvl1,$fltlvl2,$correction,$cancel);
    my $latpts=$gfaObject->field('latPts');
    # Split the $latpts to array
    my @lats = split(' ',$latpts);
    my $lonpts=$gfaObject->field('lonPts');
    # Split the $lonpts to array
    my @lons = split(' ',$lonpts);
    my $numpts = $gfaObject->field('nLatLonPts');
    for (my $i = 0; $i < $numpts; $i++) {
      printf(OUTFILE "    %5.2f  %7.2f\n",$lats[$i],$lons[$i]);
    }
    my $closeFlag=$gfaObject->field('closeFlg');
    if ($closeFlag) {
      printf(OUTFILE "    %5.2f  %7.2f\n",$lats[0],$lons[0]);
    }
  }
}
# To insure that NMAP2 appropriately not displays on a forecast update,
# print out empty records with Hazards appropriate for the Bulletin Type.
# These must be for each valid forecast time of the product.
my @hazards=();

if ($bulletin =~ /S|SIERRA/) {
  @hazards = ('IR','MO');
}
if ($bulletin =~ /T|TANGO/) {
  @hazards =   ('TB','SW','WS');
}
if ($bulletin =~ /Z|ZULU/) {
  @hazards = ('IC');
}
# Calculate Initial Forecast Hour 0 Time
$_=$untilTime;
($yy,$mm,$dd,$hh,$MM) = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})/;
my $formatstr = sprintf("%02d/%02d/%02d %02d:%02d",$mm,$dd,$yy,$hh,$MM);
my $epochtimeuntil = `date --date="$formatstr" '+%s'`;
my $epochcycletimebegin = $epochtimeuntil - 6*3600;
my ($fcsthr,$hazard);
my ($fltlvl1,$fltlvl2);
$fltlvl1 = $fltlvl2 = "";
my $issTime = sprintf("%s/%s",substr($issueTime,2,6),substr($issueTime,8,4));
foreach $hazard (@hazards) {
  foreach ($fcsthr = 0; $fcsthr <=12; $fcsthr += 3) {
    my $epochvalidbegtime = $epochcycletimebegin + $fcsthr*3600;
    my $epochvalidendtime = $epochvalidbegtime+179*60;
    my $startTime = strftime("%y%m%d/%H%M",localtime($epochvalidbegtime));
    my $stopTime = strftime("%y%m%d/%H%M",localtime($epochvalidendtime));
   
    printf(OUTFILE "|%s|%s|%s|%s|%s%02d|%s|%s|%s|%d|%d\n",$hazard,$issTime,$startTime,$stopTime,'KCI',$iseqsuffix,
          $updatenum,$fltlvl1,$fltlvl2,$correction,$cancel);
  }
}
close(OUTFILE);
