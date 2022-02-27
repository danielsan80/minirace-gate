include <../../parameters.scad>
use <../../gate/modules/profile.scad>

module upright_base_hole() {
    hole_side = pylon_side-base_curvature_r*2-profile_outer_w()-base_hole_margin;

    translate([-hole_side/2,-hole_side/2,-fix])
    minkowski() {
        cube([hole_side, hole_side, a_lot]);
        cylinder(r=base_curvature_r, h=fix);
    }
}