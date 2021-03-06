#earthquake data plot
#.dat file format should be: longitude latitude magnitude_scale
#usage perl quake_scale_plot.pl

#map boundaries in lat long
$west = -125.8;
$east = -120.8;
$south = 36.8;
$north = 42;


#create greyscale basemap
system"gmt pscoast -JM5i -R$west/$east/$south/$north -Df -N1 -W1p -G200 -Ba1 -BNSEW -Lfx2c/2c/$north/100+lkm -Tx1.5c/5c/2c -V -K > cal_quake_scale.eps";

#plot earthquakes with size scaled to magnitude
system"gmt psxy cal_scale.dat -J -R -Sc -Gbrown -V -O >> cal_quake_scale.eps";

#convert .eps file to .png
system"gmt psconvert cal_quake_scale.eps -A -P -Tg -V";


#pscoast
#-J defines the map projection and display in output
#-R defines the region of interest or map boundaries in a west/east/south/north order
#-D defines the resolution of coastal data to be used
#-N defines the level of political boundaries to be added to the map
#-W defines which shoreline to draw and the style of the lines
#-G defines the color fill for inland areas
#-B defines the format of axes plotting and labelling of tick marks
#-L draws and defines the scalebar to be added to the map
#-T draws and defines the size and location of the compass rose on the map
#-V defines the verbose level of how much text displays in command window
#-K informs gmt that more postscript will be added later
#-O informs gmt that the information is being overlayed


#psxy
#-S defines the symbol to be plotted at each location
#-G defines the color used to fill the plotted symbols


#psconvert
#-A adjust the boundary box to the minimum required by image content
#-P forces portrait mode
#-T sets the format to be converted to

