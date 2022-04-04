include <../../../config/parameters.scad>
use <../../gate/interparts/upright_base_level1.scad>

module ground_base() {
    intersection() {
        translate([-upright_base_level1_w()/2, -upright_base_level1_l()/2, -ground_thick+fix])
        cube([upright_base_level1_w(), upright_base_level1_l(), ground_thick]);

        translate([0, 0, -ground_thick+fix])
        upright_base_level1();
    }
}