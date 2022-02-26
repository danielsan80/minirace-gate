include <../parameters.scad>
use <../interparts/ground-upright.scad>
use <../interparts/angle-traverse.scad>
use <../interparts/ground_base.scad>
use <../interparts/upright_base_hole.scad>

// fit_mode: "basement"|"upright"
module ground(fit_mode="upright", with_hole=true) {
    difference() {
        ground_base(fit_mode=fit_mode);
        translate([0,0,-a_lot/2])
        if (with_hole) {
            upright_base_hole();
        }
    }
    ground_upright_joints();
}
