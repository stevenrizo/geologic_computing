#Magnitude counter
#usage perl magnitude_csv.pl japan.csv > magnitude_japan.out

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#initialize array for earthquake counter by magnitude where M[0] to M[7] = 2 to 9 Richter magnitude
@M = (0, 0, 0, 0, 0, 0, 0, 0);

#initialize array for log of earthquake counter
@Log = (0, 0, 0, 0, 0, 0, 0, 0);


#open the lines of data and assign generic variables to unused lines and the magnitude values to the magnitude variable
foreach $line (@dataset) {
  ($time, $latitude, $longitude, $depth, $mag, $magType, $nst, $gap, $dmin, $rms, $net, $id, $updated, $place, $type, $horizontalError, $depthError, $magError, $magNst, $status, $locationSource, $magSource) = split ",", $line;


  #for each line of data, run a for-loop for magnitudes 2 to 9 increasing the counter for each bin if the earthquake has a magnitude greater than or equal to that of the loop
  for (my $i = 0; $i < @M; $i++) {
    if ($mag >= $i + 2){
      $M[$i]++;

    }
  }
}
 
#calculate the log value for the number of earthquakes by magnitude
for (my $i = 0; $i < @M; $i++) {
  use POSIX qw(log10);
  $Log[$i] = log10($M[$i]);
  
}

print("Number of events by Richter Magnitude \nM2 = $M[0] \nM3 = $M[1] \nM4 = $M[2] \nM5 = $M[3] \nM6 = $M[4] \nM7 = $M[5] \nM8 = $M[6] \nM9 = $M[7] \n\nLog number of events by Richter Magnitude \nM2 = $Log[0] \nM3 = $Log[1] \nM4 = $Log[2] \nM5 = $Log[3] \nM6 = $Log[4] \nM7 = $Log[5] \nM8 = $Log[6] \nM9 = $Log[7]")
