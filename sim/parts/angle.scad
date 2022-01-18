include <../../src/gate/parameters.scad>
use <../../src/gate/parts/angle.scad>
use <../../src/gate/joints/angle-traverse.scad>

module sim_angle_L() {
    translate([0,0,upright_h])
        angle();
}

module sim_angle_R() {
    translate([traverse_l(),0,0])
        angle_traverse_cut_x_translate()
        angle_traverse_cut_x_translate()
        translate([0,0,upright_h])
            rotate([0,0,180])
                angle();
}