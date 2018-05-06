open (IN, "<$ARGV[0]") || die ("Cannot open $ARGV[0]: $!");
@dataset = <IN>;

#create vairable for counting
$n = 0;

#Calculate volume of prisms in m^3 and km^3
foreach $line (@dataset) {
  ($wm, $dm, $hm) = split " ", $line;
  $vm = $wm * $dm * $hm;
  $wkm = $wm / 1000;
  $dkm = $dm / 1000;
  $hkm = $hm / 1000;
  $vkm = $wkm * $dkm * $hkm;
  $n++;
  print ("The volume of the prism $n is $vm m^3 or $vkm km^3\n");
}
