include <../parameters.scad>
include <../modules/bolt_joint.scad>

module upright_ground_joints_void() {
    translate([0,pylon_side,-fix])
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=true);

    translate([0,-pylon_side,-fix])
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=true);
}

module ground_upright_joints() {
    translate([0,pylon_side,-fix])
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=false);

    translate([0,-pylon_side,-fix])
    bolt_joint(side=bolt_d/2, h=upright_base_h+bolt_h, void=false);
}

