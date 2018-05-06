#earthquake csv data sort
#usage perl csv_color.pl north_cal.csv > cal_color.dat

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@input = <IN>;

#sort the data by magnitude from highest to lowest
my @sorted = sort { (split(',', $b))[4] <=> (split(',', $a))[4] } @input;

#open the lines of data and assign variables from the dataset
foreach $line (@sorted) {
  ($time, $latitude, $longitude, $depth, $mag, $magType, $nst, $gap, $dmin, $rms, $net, $id, $updated, $place, $type, $horizontalError, $depthError, $magError, $magNst, $status, $locationSource, $magSource) = split ",", $line;

  #create a size scaling based on the magnitude for plotting in psxy
  $mag_scale = ($mag ** 3) / 600;

  #print the data in new format
  print("$longitude $latitude $depth $mag_scale \n")

}
