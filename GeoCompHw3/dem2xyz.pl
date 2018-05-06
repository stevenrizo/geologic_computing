#!/bin/perl

# Program to convert USGS DEM files to xyz points
# Geoffrey Ely   12/27/97
#usage perl dem2xyz.pl input_file.dem

if( $#ARGV != 0 ) { print "usage: $0 DEM_file\n"; exit 0; }
$file = $ARGV[0];
$ofile = "$file.xyz";
$ubfile = "$file.ub";

open( FILE, "$file" );
while( <FILE> ) { $lines++; }
close FILE;
if( $lines == 1 ) { 
  $command = "dd if=$file of=$ubfile ibs=4096 cbs=1024 conv=unblock";
  print STDERR $command, "\n"; system "$command"; }
else { $ubfile = $file; }

open( UBFILE, "$ubfile" );
open( OFILE, "> $ofile" );
while( <UBFILE> ) {
chop;
if ( $. == 1 ) {
  $units	= substr($_, 529, 6);
  $zunits	= substr($_, 534, 6);
  $cols		= substr($_, 858, 6);
  $row		= 0;
  $col		= 0;
  if( $units == 2 )	{
    $delta	= 30;
    $x1		= int(substr($_,546,20)*10**substr($_,568,2)+.5);
    $y1		= int(substr($_,570,20)*10**substr($_,592,2)+.5);
    $x2		= int(substr($_,594,20)*10**substr($_,616,2)+.5);
    $y2		= int(substr($_,618,20)*10**substr($_,640,2)+.5);
    $x3		= int(substr($_,642,20)*10**substr($_,664,2)+.5);
    $y3		= int(substr($_,666,20)*10**substr($_,688,2)+.5);
    $x4		= int(substr($_,690,20)*10**substr($_,712,2)+.5);
    $y4		= int(substr($_,714,20)*10**substr($_,736,2)+.5);
    $agl	= ($y1+$y2-$y3-$y4-$x1+$x2+$x3-$x4)
		/(-$y1+$y2+$y3-$y4-$x1-$x2+$x3+$x4)*180/3.14159;
    printf STDERR "reading 7.5 min DEM file: %s\n", $ubfile;
    printf STDERR "The four corners in UTM coordinates are:\n", $agl;
    printf STDERR "LL: %d %d\n", $x1, $y1;
    printf STDERR "UL: %d %d\n", $x2, $y2;
    printf STDERR "UR: %d %d\n", $x3, $y3;
    printf STDERR "LR: %d %d\n", $x4, $y4;
    printf STDERR "UTM coordinates are rotated %.2f degrees from north.\n", $agl;
  }
  else			{
    $delta	= 3;
    printf STDERR "reading 1 degree DEM file: %s\n", $ubfile; }
  if( $zunits == 1 )	{ $zfactor = 3.1417; }
  else			{ $zfactor = 1; }
  printf STDERR "%s columns: %d delta: %d\n", substr($_, 0, 40), $cols, $delta;
  printf STDERR "writing file: %s\n", $ofile; }
else {
  if ( $row == 0 ) {
    $col	= substr($_,6,6);
    if ( $col == 0 ) { break };
    $rows	= substr($_,12,6);
    $x		= substr($_,24,20)*10**substr($_,46,2);
    if ( $x < 0 ) { $x=$x-1 }; $x = int($x+.5);
    $y		= substr($_,48,20)*10**substr($_,70,2);
    if ( $y < 0 ) { $y=$y-1 }; $y = int($y+.5);
    $zoff	= substr($_,72,20)*10**substr($_,94,2);
    if ( $zoff < 0 ) { $zoff=$zoff-1 }; $zoff = int($zoff+.5);
    $_		= substr($_,144); }
  $len = length;
  for ($i = 0; $i < $len; $i = $i + 6) {
    $z = (substr($_, $i, 6) + $zoff) * $zfactor;
    printf OFILE "%d %d %.2f\n", $x, $y, $z;
    $row++; $y = $y + $delta; }
  if( $row >= $rows ) { $row = 0; } }
}
close( OFILE );
close( UBFILE );
