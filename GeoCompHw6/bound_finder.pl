#find the minimum and maximum location values in a dataset

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#initialize values with known values from data
$min_1 = -122.16;
$max_1 = -122.16;
$min_2 = 42.91;
$max_2 = 42.91;


#open the lines of data and assign generic variables to unused lines and the magnitude values to the magnitude variable
foreach $line (@dataset) {
  ($v1, $v2, $v3) = split " ", $line;


#check min and max values
  if ($v1 < $min_1) {
    $min_1 = $v1;
  }
  
  if ($v1 > $max_1) {
    $max_1 = $v1;
  }
  if ($v2 < $min_2) {
    $min_2 = $v2;
  }
  
  if ($v2 > $max_2) {
    $max_2 = $v2;
  }


}

#print minimum and maximum values
print("minimum 1 = $min_1 \nmaximum 1 = $max_1 \nminimum 2 = $min_2 \nmaximum 2 = $max_2 \n")
