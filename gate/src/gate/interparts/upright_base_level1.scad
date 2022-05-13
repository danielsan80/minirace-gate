include <../../../config/parameters.scad>

module upright_base_level1() {
    w = upright_base_w;
    l = upright_base_l;
    h = upright_base_h;

    translate([-w/2, -l/2, 0])
    minkowski() {
        cube([w, l, h]);
        cylinder(r = base_curvature_r, h = fix);
    }
}

function upright_base_level1_w() = upright_base_w+base_curvature_r*2;
function upright_base_level1_l() = upright_base_l+base_curvature_r*2;
