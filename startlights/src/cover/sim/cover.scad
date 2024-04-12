include <../../../config/parameters.scad>

use <../../../src/cover/cover.scad>
use <../../../src/led/led_cap.scad>
use <../../../src/led/led.scad>


module sim_hanging_startlights_transform() {
    rotate([90,0,0])
    children();
}

module sim_cover_led_caps() {
    color("white")
    translate([0,0,thick+led_play_h/2])
    led_x10_cover_transform()
    led_cap();
}
