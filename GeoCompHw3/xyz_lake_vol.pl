#Calculate the volume, surface area, and maximum depth from a fixed elevation for xyz data
#usage perl xyz_lake_vol.pl filtered_crater_lake_data.xyz > xyz_lake_vol.out

#open and read the input file
open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#set elevation boundary in m, spatial resolution of data, and initialize variables for depth, volume, and counter
$elevation_bound = 1883;
$spatial_res = 30;
$max_depth = 0;
$V_total = 0;
$n = 0;

#calculate area for each point from spatial resolution
$point_A = $spatial_res * $spatial_res;

#open the lines of data and assign easting, northing, and meters-above-sea-level (masl)
foreach $line (@dataset) {
  ($easting, $northing, $masl) = split " ", $line;

  #increase counter for number of points
  $n++;
  
  #find the depth of the point from the surface of the lake in m
  $point_D = $elevation_bound - $masl;

  #calculate the volume for the point of elevation in m^3
  $point_V = $point_A * $point_D;

  #add point volume to total volume in m^3
  $V_total = $V_total + $point_V;

  #determine if point is the new max depth in m
  if ($point_D > $max_depth){
    $max_depth = $point_D;
  }
}

#calculate surface area of lake in m^2
$surface_A = $n * $point_A;

#convert surface area to km^2 and volume to km^3
$A_km = $surface_A / 1000000;
$V_km = $V_total / 1000000000;

print("I found surface area of Crater Lake to be $surface_A m^2 or $A_km km^2\nI found the volume of Crater Lake to be $V_total m^3 or $V_km km^3\nI found the greatest depth in Crater Lake to be $max_depth m\n");

