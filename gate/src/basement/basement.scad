include <../../config/parameters.scad>
use <../../src/gate/interparts/upright_base_hole.scad>
use <../../src/gate/interparts/basement_upright.scad>
use <../../src/basement/bezier.scad>

module _basement_deflector() {
    
    ratio1 = 0.3;
    ratio2 = 0.6;
    cut = 10;
    
    points = concat(
        cubic_bezier(
            [basement_w(),0],
            [basement_w(),basement_deflector_l*ratio1],
            [0,basement_deflector_l-basement_deflector_l*ratio2],
            [0,basement_deflector_l]
        ),
        [[0,0]]
    );
    
    
    translate([0, basement_l(), 0])
    translate([-basement_w() / 2, -basement_l() / 2, 0])
    intersection() {
        linear_extrude(basement_h)
        polygon(points);
        translate([0,-cut,-fix])
        cube([basement_w(),basement_deflector_l,basement_h+fix*2]);
    }
}

module basement_deflector_L() {
    _basement_deflector();
}

module basement_deflector_R() {
    mirror([1,0,0])
    _basement_deflector();
}

module basement() {
    difference() {
        translate([-basement_w() / 2, -basement_l() / 2, 0])
        cube([basement_w(), basement_l(), basement_h]);
        upright_base_hole();
    }
}
