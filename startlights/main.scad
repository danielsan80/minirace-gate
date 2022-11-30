include <src/../config/parameters.scad>
use <vendor/ruler/ruler.scad>
use <src/_board/sim/board.scad>
use <src/_cover/sim/cover.scad>

sim_board();

sim_cover();

//translate([0,-30,0])
//ruler(startlights_length);

//echo ("led distance x", led_distance_x);
//echo ("led distance y", led_distance_y);

//startlights_2();
//leds_2();
