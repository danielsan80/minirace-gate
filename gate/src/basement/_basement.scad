include <../../config/parameters.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/basement_upright.scad>

module _basement() {
    difference() {
        translate([-basement_w() / 2, -basement_l() / 2, 0])
        cube([basement_w(), basement_l(), basement_h]);
        upright_base_hole();
    }
}