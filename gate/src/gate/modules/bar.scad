include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>

module bar(l = 50, w = bar_w) {
    linear_extrude(l)
    profile(w=w);
}

module bar_ext(l = 50, w = bar_w) {
    translate([0,0,-l])
    linear_extrude(l*3)
    profile(w=w);
}

function bar_cut_offset(w = bar_w) = w*2/6;

module bar_top_cut(l, angle=45, offset = 0) {
    a_lot = 1000;
    intersection() {
        children();

        translate([0,0,l-offset])
        rotate([0,angle,0])
        translate([-a_lot/2,-a_lot/2,-a_lot])
        cube([a_lot,a_lot,a_lot]);
    }
}

module bar_bottom_cut(l, angle=45, offset = 0) {
    a_lot = 1000;
    intersection() {
        children();

        translate([0,0,offset])
        rotate([0,angle,0])
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
    }
}