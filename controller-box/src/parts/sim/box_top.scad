include <../../../config/parameters.scad>
use <../../parts/box_top.scad>

module sim_box_top() {
    translate([0,0,box_outer_h+fix])
    translate([box_outer_w,0,0])
    rotate([0,180,0])
    box_top();
}
