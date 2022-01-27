include <../../parameters.scad>
use <../../interparts/ground-upright.scad>
use <../../parts/ground.scad>
use <../../parts/upright.scad>

module test_ground_upright_bolt() {
    ground_upright_joint();
}

module test_ground_upright_bolts() {
    translate([pylon_side*2,0,0])
    union() {
        translate([0,0,1])
        ground();
        translate([-upright_base_w/2, -upright_base_l/2,0])
        cube([upright_base_w,upright_base_l,1]);
    }

    intersection() {
        upright();
        translate([-a_lot/2,-a_lot/2,-a_lot+upright_base_h*2])
        cube([a_lot,a_lot,a_lot]);
    }
}