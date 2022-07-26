include <config/parameters.scad>
use <src/values.scad>
use <src/parts/box_bottom.scad>
use <src/parts/box_side_slide.scad>
use <src/parts/box_top.scad>
use <src/parts/box_block.scad>

use <src/parts/box_top_led_hole_cap.scad>
use <src/parts/sim/box_controller_top_led_hole_cap.scad>

//use <src/parts/print/box_side_slide.scad>

use <src/parts/sim/controller.scad>

translate([100,0,0])
union() {
    box_controller_bottom();

//    translate([0,0,10])
//    box_controller_side_slide();

//    translate([0,0,20])
//    translate([0,0,box_outer_h+fix])
//    translate([box_outer_w(box="controller"),0,0])
//    rotate([0,180,0])
//    union() {
//        box_controller_top();
//
//        sim_box_controller_top_led_hole_cap_transform(led="blue")
//        sim_box_controller_top_led_hole_cap_color(led="blue")
//        %box_top_led_hole_cap();
//
//        sim_box_controller_top_led_hole_cap_transform(led="red")
//        sim_box_controller_top_led_hole_cap_color(led="red")
//        %box_top_led_hole_cap();
//    }


    translate([ box_controller_card_pos.x, box_controller_card_pos.y, 0])
    translate([0,0,box_controller_card_pos.z])
    sim_controller();
}

//
//union() {
//    box_controller_top();
//
//    sim_box_controller_top_led_hole_cap_transform(led="blue")
//    sim_box_controller_top_led_hole_cap_color(led="blue")
//    box_top_led_hole_cap();
//
//    sim_box_controller_top_led_hole_cap_transform(led="red")
//    sim_box_controller_top_led_hole_cap_color(led="red")
//    box_top_led_hole_cap();
//}

//box_top_led_hole_cap();

//translate([-box_controller_outer_w-200,0,0])
//box_block();


translate([-100,0,0])
union() {
    w=box_controller_outer_w;

//    box_terminal_bottom(box_terminal_outer_w=w);

//    translate([0,0,50])
//    box_terminal_side_slide(box_terminal_outer_w=w);
//
//    translate([0,0,100])
//    translate([0,0,box_outer_h+fix])
//    translate([w,0,0])
//    rotate([0,180,0])
//    box_terminal_top(box_terminal_outer_w=w);
}