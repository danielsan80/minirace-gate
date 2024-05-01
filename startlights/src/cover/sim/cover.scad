include <../../../config/parameters.scad>

use <../../../src/cover/cover.scad>
use <../../../src/led/led_cap.scad>
use <../../../src/led/led.scad>


module sim_hanging_startlights_transform() {
    rotate([90,0,0])
    children();
}

module sim_cover_led_caps() {
    %translate([0,0,-circle_estrusion_depth])
    %translate([0,0,startlight_circle_estrusion])
    %translate([0,0,thick])
    led_x10_cover_transform()
    led_cap();
}
