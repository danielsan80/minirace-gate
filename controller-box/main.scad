include <config/parameters.scad>
use <src/parts/box_bottom.scad>
use <src/parts/box_side_slide.scad>
use <src/parts/box_top.scad>
use <src/parts/box_block.scad>

box_bottom();

translate([0,0,10])
box_side_slide();

translate([0,0,20])
translate([0,0,box_outer_h+fix])
translate([box_outer_w,0,0])
rotate([0,180,0])
box_top();

translate([-box_outer_w-20,0,0])
box_block();
