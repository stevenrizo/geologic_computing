#Magnitude counter
#usage perl magnitude_hash.pl earthquake_catalog_example.dat > magnitude_hash.out

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#initialize hash for earthquake counter by magnitude where M[0] to M[7] = 2 to 9 Richter magnitude
%M = (
  M2 => 0, 
  M3 => 0, 
  M4 => 0, 
  M5 => 0, 
  M6 => 0, 
  M7 => 0, 
  M8 => 0, 
  M9 => 0
);

#initialize hash for log of earthquake counter
%LogM = (
  LogM2 => 0, 
  LogM3 => 0, 
  LogM4 => 0, 
  LogM5 => 0, 
  LogM6 => 0, 
  LogM7 => 0, 
  LogM8 => 0, 
  LogM9 => 0
);


#open the lines of data and assign generic variables to unused lines and the magnitude values to the magnitude variable
foreach $line (@dataset) {
  ($v1, $v2, $v3, $v4, $v5, $v6, $v7, $v8, $magnitude, $v10, $v11, $v12) = split " ", $line;

#for each line of data, pass through a series of checks to determine whether a magnitude in %M increases its counter for each M2 to M9 term
  if ($magnitude >= 2) {
    $M2++;
    if ($magnitude >= 3) {
      $M3++;
      if ($magnitude >= 4) {
        $M4++;
        if ($magnitude >= 5) {
          $M5++;
          if ($magnitude >= 6) {
            $M6++;
            if ($magnitude >= 7) {
              $M7++;
              if ($magnitude >= 8) {
                $M8++;
                if ($magnitude >= 9) {
                  $M9++;
            
                }
              }
            }
          }
        }
      }
    }
  }
}
 
#calculate the log value for the number of earthquakes by magnitude
use POSIX qw(log10);
$LogM2 = log10($M2);
$LogM3 = log10($M3);
$LogM4 = log10($M4);
$LogM5 = log10($M5);
$LogM6 = log10($M6);
$LogM7 = log10($M7);
$LogM8 = log10($M8);
$LogM9 = log10($M9);

print("Number of events by Richter Magnitude \nM2 = $M2 \nM3 = $M3 \nM4 = $M4 \nM5 = $M5 \nM6 = $M6 \nM7 = $M7 \nM8 = $M8 \nM9 = $M9 \n\nLog number of events by Richter Magnitude \nM2 = $LogM2 \nM3 = $LogM3 \nM4 = $LogM4 \nM5 = $LogM5 \nM6 = $LogM6 \nM7 = $LogM7 \nM8 = $LogM8 \nM9 = $LogM9")
