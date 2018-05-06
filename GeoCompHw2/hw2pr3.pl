open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#set parameter for width and depth in meters and initialize total volume variable
$wm = 90;
$dm = 90;
$vtotal = 0;

#calculate total volume of prisms in m^3
foreach $line (@dataset) {
  ($hm) = split " ", $line;
  $vprism = $wm * $dm * $hm;
  $vtotal = $vtotal + $vprism;
}
#calculate mass of granite in kg
$mtotal = $vtotal * 2670;

print ("The volume of the granite above sea-level is $vtotal m^3 with a mass of $mtotal kg\n");

