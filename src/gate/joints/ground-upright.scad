include <../parameters.scad>
include <../modules/bolt_joint.scad>

module grount_upright_joint() {
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=false);
}

module grount_upright_joint_void() {
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=true);
}

module upright_ground_joints_void() {
    translate([0,pylon_side,-fix])
    grount_upright_joint_void();

    translate([0,-pylon_side,-fix])
    grount_upright_joint_void();
}

module ground_upright_joints() {
    translate([0,pylon_side,-fix])
    grount_upright_joint();

    translate([0,-pylon_side,-fix])
    grount_upright_joint();
}


