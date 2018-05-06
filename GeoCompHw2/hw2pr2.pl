open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#initialize variable for counter
$n = 0;

#Calculate volume of tephra from prismand convert to volume of magma
foreach $line (@dataset) {
  ($wm, $dm, $hm) = split " ", $line;
  $vm = $wm * $dm * $hm;
  $tmass = $vm * 1000;
  $vmagma = $tmass / 2650;
  $n++;
  print ("The volume of the magma required to produce the volume of tephra from prism $n is $vmagma m^3 with a mass of $tmass kg\n");
}
