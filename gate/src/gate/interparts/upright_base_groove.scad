include <../../../config/parameters.scad>
use <../../gate/interparts/upright_base_level1.scad>

module upright_base_groove() {

    color("blue")
    translate([0,0,-upright_base_groove_depth])
    difference() {
        minkowski() {
            upright_base_level1();
            cylinder(r=upright_base_groove_thick, h=fix, center=true);
        }
        minkowski() {
            upright_base_level1();
            cylinder(r=fix, h=fix*2, center=true);
        }
    }
}