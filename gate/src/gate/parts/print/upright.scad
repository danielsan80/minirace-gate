include <../../../../config/parameters.scad>
use <../../../gate/parts/upright.scad>

module _upright_angle_joint_toothpick() {
    l=upright_angle_joint_toothpick_l;
    d=toothpick_d;

    translate([0,0,-l+fix])
    cylinder(d=d, h=l);
}

module _upright_angle_joint_toothpick_void() {
    l=upright_angle_joint_toothpick_void_l;
    d=toothpick_d+toothpick_play*2;

    translate([0,0,-l+fix])
    cylinder(d=d, h=l);
}

module _upright_angle_joint_hole() {
    _upright_angle_joint_toothpick_void();
}

module _upright_angle_joints_holes() {

    color("blue")
    translate([-pylon_side/2, -pylon_side/2,upright_h+upright_angle_joint_button_h])
    union() {
        _upright_angle_joint_hole();

        translate([pylon_side, 0, 0])
        _upright_angle_joint_hole();

        translate([0, pylon_side, 0])
        _upright_angle_joint_hole();

        translate([pylon_side, pylon_side, 0])
        _upright_angle_joint_hole();
    }

}

module print_upright() {
    difference() {
        upright();
//        _upright_angle_joints_holes();
    }
}