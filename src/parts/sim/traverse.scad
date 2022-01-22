include <../../parameters.scad>
use <../../modules/profile.scad>
use <../../parts/traverse.scad>
use <../../interparts/angle-traverse.scad>
use <../../startlights/values.scad>

module sim_traverse() {
    translate([0,0,upright_h])
        angle_traverse_cut_translate()
        traverse();
}
