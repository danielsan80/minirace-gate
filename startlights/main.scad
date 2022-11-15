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

sim_startlights_case();
//translate([0,-30,0])
//ruler(startlights_length);

//echo ("led distance x", led_distance_x);
//echo ("led distance y", led_distance_y);

//startlights_2();
//leds_2();
