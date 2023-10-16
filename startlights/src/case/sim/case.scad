include <../../../config/parameters.scad>
use <../../../src/case/case.scad>


module sim_case_color() {
    color("gray")
    children();
}

module sim_case_cut() {
    difference() {
        children();
        
        translate([board_v1_l/2,0,0])
        translate([0, -a_lot/2, -a_lot/2])
        cube([a_lot, a_lot, a_lot]);
    }
}