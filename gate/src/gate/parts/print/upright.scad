include <../../../../config/parameters.scad>
use <../../../gate/parts/upright.scad>

module _upright_angle_joint_stick() {
    l=upright_angle_joint_stick_l;
    d=stick_d;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _upright_angle_joint_stick_void() {
    l=upright_angle_joint_stick_void_l;
    d=stick_d+stick_play*2;

    translate([0,0,-l+fix])
    cylinder(d=d, h=l);
}

module _upright_angle_joint_hole() {
    _upright_angle_joint_stick_void();
}

module _upright_angle_joints_holes() {

//    color("blue")
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
    upright();
}

module print_upright_with_angle_joints_holes() {
    difference() {
        upright();
        _upright_angle_joints_holes();
    }
}


module print_upright_angle_joint_stick() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _upright_angle_joint_stick();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}
