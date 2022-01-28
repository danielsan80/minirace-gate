include <../../parameters.scad>
use <../../parts/traverse.scad>
use <../../interparts/angle-traverse.scad>


module print_traverse() {
    rotate([0,-90,0])
    traverse();
}


module _toothpick() {
    l=toothpick_l;
    d=toothpick_d;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _toothpick_void() {
    l=toothpick_void_l;
    d=toothpick_d+toothpick_play*2;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _toothpick_voids() {

    translate([pylon_side/2,pylon_side/2,0])
        _toothpick_void();
    translate([pylon_side/2,-pylon_side/2,0])
        _toothpick_void();
    translate([-pylon_side/2,-pylon_side/2,0])
        _toothpick_void();
    translate([-pylon_side/2,pylon_side/2,0])
        _toothpick_void();


}


module print_traverse_split_L() {

    difference() {
        translate([-pylon_side/2-bar_w/2,0,0])
        rotate([0,90,0])
        translate([-traverse_l()/2,0,0])
        intersection() {
            traverse();
            translate([-a_lot+traverse_l()/2,-a_lot/2,-a_lot/2])
                cube([a_lot,a_lot, a_lot]);
        }

        _toothpick_voids();
    }
}

module print_traverse_split_R() {

    difference() {
        translate([pylon_side/2+bar_w/2,0,0])
        rotate([0,-90,0])
        translate([-traverse_l()/2,0,0])
        intersection() {
            traverse();
            translate([traverse_l()/2,-a_lot/2,-a_lot/2])
            cube([a_lot,a_lot, a_lot]);
        }
        _toothpick_voids();
    }
}