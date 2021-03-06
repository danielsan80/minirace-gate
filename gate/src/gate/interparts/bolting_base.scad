include <../../../config/parameters.scad>
use <../../gate/interparts/upright_base_level1.scad>

module bolting_base() {
    intersection() {
        translate([-upright_base_level1_w()/2, -upright_base_level1_l()/2, 0])
        cube([upright_base_level1_w(), upright_base_level1_l(), bolting_base_thick]);

        translate([0, 0, 0])
        upright_base_level1();
    }
}