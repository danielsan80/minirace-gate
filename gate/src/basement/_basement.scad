include <../../config/parameters.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_level1.scad>

module _basement() {
    basement_w = upright_base_level1_w() + basement_upright_margin * 2;
    basement_l = upright_base_level1_l() + basement_upright_margin * 2;
    
    difference() {
        translate([-basement_w / 2, -basement_l / 2, 0])
        cube([basement_w, basement_l, basement_h]);
        upright_base_hole();
    }
}