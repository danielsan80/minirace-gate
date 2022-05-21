include <../../../config/parameters.scad>
use <../../gate/joints/bolt_joint.scad>

module bolting_upright_joint() {
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=false);
}

module bolting_upright_joint_void() {
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=true);
}

module upright_bolting_joints_void() {
    translate([0,pylon_side,-fix])
    bolting_upright_joint_void();

    translate([0,-pylon_side,-fix])
    bolting_upright_joint_void();
}

module bolting_upright_joints() {
    translate([0,pylon_side,-fix])
    bolting_upright_joint();

    translate([0,-pylon_side,-fix])
    bolting_upright_joint();
}


