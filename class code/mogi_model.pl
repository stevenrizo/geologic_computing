#mogi model of volcanic deformation as a function of horizontal distance from intrusion

#initialize variables for shear modulus G, radius of source a, excess pressure P, and depth of intrusion d
$G = 50 * (10 ** 9);
$a = 10;
$P = 2 * (10 ** 6);
$d = 1000;
$r = 0;
$Vz = 0;

#print label for output columns
print("Horizontal Distance from Intrusion      Vertical Deformation \n");

for (my $i = 1; $i < 11; $i++) {
#set horizontal distance from intrusion center
$r = $i * 10;

#calculate vertical deformation
$Vz = (3 * ($a ** 3) * $P * $d) / (4 * $G * ( (($d ** 2) + ($r ** 2)) ** (3/2) ));

#print values for horizontal distance and vertical deformation
print("$r m	                                $Vz m \n");

}

