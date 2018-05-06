#crater lake bathymetry plot

#map boundaries in lat long
$west = -122.176257669;
$east = -122.043742331;
$south = 42.8997306397;
$north = 42.9805387205;

system"gmt surface -Rd$west/$east/$south/$north -I30e -Gcrater_lake.grd -V";
