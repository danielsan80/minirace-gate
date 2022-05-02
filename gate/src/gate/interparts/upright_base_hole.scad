include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>

module upright_base_hole(void=true) {
    play = void?0:upright_base_hole_play;
    hole_side = pylon_side-base_curvature_r*2-profile_outer_w()-base_hole_margin;

    color("blue")
    translate([-hole_side/2,-hole_side/2,-fix])
    minkowski() {
        cube([hole_side, hole_side, a_lot]);
        cylinder(r=base_curvature_r-play, h=fix);
    }
}