include <config/parameters.scad>
use <src/parts/box_bottom.scad>
use <src/parts/box_side_slide.scad>
use <src/parts/box_top.scad>

use <src/parts/box_top_led_hole_cap.scad>
use <src/parts/sim/box_top_led_hole_cap.scad>

use <src/parts/sim/controller.scad>

//translate([100,0,0])
difference() {
    box_top();
//    translate([0,0,-1])
//    cube([100,100,100]);
}

//
//union() {
//    box_top();
//
//    sim_box_top_led_hole_cap_transform(led="blue")
//    sim_box_top_led_hole_cap_color(led="blue")
//    box_top_led_hole_cap();
//
//    sim_box_top_led_hole_cap_transform(led="red")
//    sim_box_top_led_hole_cap_color(led="red")
//    box_top_led_hole_cap();
//}

//box_top_led_hole_cap();

