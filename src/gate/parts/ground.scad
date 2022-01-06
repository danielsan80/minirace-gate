include <../parameters.scad>
include <../joints/ground-upright.scad>
include <../joints/angle-traverse.scad>


module ground() {
    ground_upright_joints();
}

module sim_ground_L() {
    ground();
}

module sim_ground_R() {
    angle_traverse_cut_x_translate()
    translate([traverse_l,0,0])
    angle_traverse_cut_x_translate()
    ground();
}