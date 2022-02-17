include <../parameters.scad>
use <../interparts/ground-upright.scad>
use <../interparts/angle-traverse.scad>
use <../interparts/basement-ground.scad>
use <../interparts/upright_base_hole.scad>

module ground() {
    difference() {
        ground_base();
        translate([0,0,-a_lot/2])
        upright_base_hole();
    }
    ground_upright_joints();
}
