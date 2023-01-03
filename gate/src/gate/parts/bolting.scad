include <../../../config/parameters.scad>
use <../../gate/interparts/bolting-upright.scad>
use <../../gate/interparts/bolting_base.scad>
use <../../gate/interparts/upright_base_hole.scad>

module bolting(with_hole=true) {
    difference() {
        bolting_base();

        translate([0,0,-a_lot/2])
        if (with_hole) {
            upright_base_hole();
        }
    }
    translate([0,0,bolting_base_thick-fix])
    bolting_upright_joints();
}
