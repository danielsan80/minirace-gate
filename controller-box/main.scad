include <config/parameters.scad>
use <src/parts/box_bottom.scad>
use <src/parts/box_side_slide.scad>
use <src/parts/box_top.scad>
use <src/parts/box_block.scad>

use <src/parts/sim/controller.scad>


translate([100,0,0])
union() {
    box_bottom();

//    translate([0,0,10])
//    box_side_slide();
//
//    translate([0,0,20])
//    translate([0,0,box_outer_h+fix])
//    translate([box_outer_w,0,0])
//    rotate([0,180,0])
//    box_top();
}

//translate([-box_outer_w-20,0,0])
//box_block();

translate([
    box_wall_thick+antenna_start_margin+card_play,
    box_wall_thick+(chip_y*-1)+chip_play,
    box_bottom_base_thick+card_z_offset
])
translate([100,0,0])
sim_controller();