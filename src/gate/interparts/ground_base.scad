include <../../parameters.scad>
use <../../gate/interparts/upright_base_level1.scad>
use <../../basement/values.scad>

// fit_mode: "basement"|"upright"
module ground_base(fit_mode="upright") {
    intersection() {
        translate([-basement_w()/2, -basement_l()/2, -ground_thick+fix])
        cube([basement_w(), basement_l(), ground_thick]);

        if (fit_mode=="upright") {
            translate([0, 0, -ground_thick+fix])
            upright_base_level1();
        }
        if (fit_mode=="basement") {}
    }
}