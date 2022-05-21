include <../../../../config/parameters.scad>
use <../../../gate/interparts/bolting-upright.scad>
use <../../../gate/parts/bolting.scad>
use <../../../gate/parts/upright.scad>

module test_bolting_upright_bolt() {
    bolting_upright_joint();
}

module test_bolting_upright_bolts() {
    translate([pylon_side*2,0,0])
    union() {
        translate([0,0,1])
        bolting();
        translate([-upright_base_w/2, -upright_base_l/2,0])
        cube([upright_base_w,upright_base_l,1]);
    }

    intersection() {
        upright();
        translate([-a_lot/2,-a_lot/2,-a_lot+upright_base_h*2])
        cube([a_lot,a_lot,a_lot]);
    }
}