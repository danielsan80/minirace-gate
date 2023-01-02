include <../../../config/parameters.scad>
use <../../parts/box_top.scad>

module test_box_top_led_holes() {
    intersection() {
        box_top();

        translate([11,18,-fix])
        cube([23,12,20]);
    }

}

