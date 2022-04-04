include <../../../config/parameters.scad>
use <../../gate/interparts/ground-upright.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/interparts/ground_base.scad>
use <../../gate/interparts/upright_base_hole.scad>

module ground(with_hole=true) {
    difference() {
        ground_base();
        translate([0,0,-a_lot/2])
        if (with_hole) {
            upright_base_hole();
        }
    }
    ground_upright_joints();
}
