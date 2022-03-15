include <../../../../config/parameters.scad>
use <../../../gate/parts/angle.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_angle_L() {
    translate([0,0,upright_h])
        angle();
}

module sim_angle_R(mode="basement") {
    translate([traverse_l(mode=mode),0,0])
        angle_traverse_cut_x_translate()
        angle_traverse_cut_x_translate()
        translate([0,0,upright_h])
            rotate([0,0,180])
                angle();
}