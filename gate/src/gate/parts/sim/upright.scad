include <../../../../config/parameters.scad>

use <../../../gate/parts/print/upright.scad>
use <../../../gate/interparts/angle-traverse.scad>

module _sim_upright_angle_joint_stick() {
    translate([0,0,-upright_angle_joint_stick_l/2])
    rotate([0,-90,0])
    translate([0,0,layer_h-stick_d/2])
    print_upright_angle_joint_stick();
}

module _sim_upright_angle_joint_sticks() {
    translate([0,0,upright_h+upright_angle_joint_button_h])
    union() {
        translate([pylon_side/2,pylon_side/2,0])
        _sim_upright_angle_joint_stick();

        translate([-pylon_side/2,pylon_side/2,0])
        _sim_upright_angle_joint_stick();

        translate([-pylon_side/2,-pylon_side/2,0])
        _sim_upright_angle_joint_stick();

        translate([pylon_side/2,-pylon_side/2,0])
        _sim_upright_angle_joint_stick();
    }
}

module sim_upright() {
    print_upright();
}

module sim_upright_with_angle_joints_holes() {
    print_upright_with_angle_joints_holes();
    _sim_upright_angle_joint_sticks();
}

module sim_upright_L() {
    sim_upright_with_angle_joints_holes();
}


module sim_upright_R(mode="basement") {
    angle_traverse_cut_x_translate()
    translate([traverse_l(mode=mode),0,0])
    angle_traverse_cut_x_translate()
    sim_upright_with_angle_joints_holes();
}
