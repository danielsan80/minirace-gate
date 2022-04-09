include <../../../config/parameters.scad>
use <../../parts/box_top.scad>
use <../../values.scad>

module sim_box_top(box) {
    translate([0,0,box_outer_h+fix])
    translate([box_outer_w(box),0,0])
    rotate([0,180,0])
    box_top(box=box);
}
