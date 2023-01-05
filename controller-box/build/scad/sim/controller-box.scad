include <../../../config/parameters.scad>

use <../../../src/parts/box_bottom.scad>
use <../../../src/parts/box_side_slide.scad>
use <../../../src/parts/box_top.scad>

use <../../../src/parts/box_top_led_hole_cap.scad>
use <../../../src/parts/sim/box_top_led_hole_cap.scad>

use <../../../src/parts/sim/controller.scad>

translate([100,0,0])
union() {
    box_bottom();
    
    translate([0,0,30])
    box_side_slide();
    
    translate([0,0,60])
    translate([0,0,box_outer_h+fix])
    translate([box_outer_w,0,0])
    rotate([0,180,0])
    union() {
        box_top();
        
        sim_box_top_led_hole_cap_transform(led="blue")
        sim_box_top_led_hole_cap_color(led="blue")
        %box_top_led_hole_cap();
        
        sim_box_top_led_hole_cap_transform(led="red")
        sim_box_top_led_hole_cap_color(led="red")
        %box_top_led_hole_cap();
    }
    
    translate([ box_card_pos.x, box_card_pos.y, 0])
    translate([0,0,box_card_pos.z])
    sim_controller();
}