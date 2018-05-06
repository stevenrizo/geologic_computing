#earthquake csv data sort
#usage perl csv_scale.pl north_cal.csv > cal_scale.dat

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@input = <IN>;

#sort the data by magnitude from highest to lowest
my @sorted = sort { (split(',', $b))[4] <=> (split(',', $a))[4] } @input;

#open the lines of data and assign variables for the dataset
foreach $line (@sorted) {
  ($time, $latitude, $longitude, $depth, $mag, $magType, $nst, $gap, $dmin, $rms, $net, $id, $updated, $place, $type, $horizontalError, $depthError, $magError, $magNst, $status, $locationSource, $magSource) = split ",", $line;

  #create a size scaling based on the magnitude for plotting in psxy
  $mag_scale = ($mag ** 3) / 500;
  
  #print the data in new format
  print("$longitude $latitude $mag_scale \n")

}
