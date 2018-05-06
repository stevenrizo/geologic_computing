#Filter for XYZ format Data with rectangular and elevation parameters
#usage perl xyz_lake_filter.pl bathymetry2.dem.xyz > filtered_crater_lake_data.xyz

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#set boundary conditions for edge of rectangle in utm coordinates and elevation boundary in m
$max_easting = 577500;
$min_easting = 568000;
$max_northing = 4758500;
$min_northing = 4750500;
$elevation_bound = 1883;

#open the lines of data and assign easting, northing, and meters-above-sea-level (masl)
foreach $line (@dataset) {
  ($easting, $northing, $masl) = split " ", $line;

  #restrict the data to the boundary conditions and print only values within the boundary for each line
  if ($easting < $max_easting && $easting > $min_easting && $northing < $max_northing &&$northing > $min_northing && $masl < $elevation_bound) {
    print("$easting $northing $masl\n");
  }
}

