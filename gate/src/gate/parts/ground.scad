include <../../../config/parameters.scad>
use <../../gate/interparts/ground-upright.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/interparts/ground_base.scad>
use <../../gate/interparts/upright_base_hole.scad>

module bolting(with_hole=true) {
    difference() {
        bolting_base();
        translate([0,0,-a_lot/2])
        if (with_hole) {
            upright_base_hole();
        }
    }
    bolting_upright_joints();
}
