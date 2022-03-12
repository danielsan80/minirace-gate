include <src/parameters.scad>
use <vendor/ruler/ruler.scad>
use <src/parts/sim/board.scad>
use <src/parts/sim/startlights.scad>
use <src/parts/sim/led.scad>
use <src/parts/startlights.scad>
use <src/parts/led.scad>

sim_board();
sim_startlights();
sim_leds();

translate([0,-30,0])
ruler(startlights_length);

echo ("led distance x", led_distance_x);
echo ("led distance y", led_distance_y);

echo ("startlights height", startlights_height);
echo ("startlights length", startlights_length);


//startlights_2();
//leds_2();
