include <../../../../config/parameters.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/angle-traverse.scad>


// mode="basement"|"upright"|"center"
module print_traverse(mode="basement") {
    rotate([0,-90,0])
    traverse(mode=mode);
}

module _treverse_stick_3of3() {
    l=traverse_stick_l/3*3;
    d=stick_d;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _treverse_stick_2of3() {
    l=traverse_stick_l/3*2;
    d=stick_d;

    translate([0,0,-l/2])
        cylinder(d=d, h=l);
}

module _treverse_stick_1of3() {
    l=traverse_stick_l/3*1;
    d=stick_d;

    translate([0,0,-l/2])
        cylinder(d=d, h=l);
}

module _treverse_stick_void() {
    l=traverse_stick_void_l;
    d=stick_d+stick_play*2;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _treverse_stick_voids() {

    translate([pylon_side/2,pylon_side/2,0])
        _treverse_stick_void();
    translate([pylon_side/2,-pylon_side/2,0])
        _treverse_stick_void();
    translate([-pylon_side/2,-pylon_side/2,0])
        _treverse_stick_void();
    translate([-pylon_side/2,pylon_side/2,0])
        _treverse_stick_void();


}


// mode="basement"|"upright"|"center"
module print_traverse_split_L(mode="basement") {

    difference() {
        translate([-pylon_side/2-bar_w/2,0,0])
        rotate([0,90,0])
        translate([-traverse_l(mode=mode)/2,0,0])
        intersection() {
            traverse(mode=mode);
            translate([-a_lot+traverse_l(mode=mode)/2,-a_lot/2,-a_lot/2])
                cube([a_lot,a_lot, a_lot]);
        }

        _treverse_stick_voids();
    }
}

// mode="basement"|"upright"|"center"
module print_traverse_split_R(mode="basement") {

    difference() {
        translate([pylon_side/2+bar_w/2,0,0])
        rotate([0,-90,0])
        translate([-traverse_l(mode=mode)/2,0,0])
        intersection() {
            traverse(mode=mode);
            translate([traverse_l(mode=mode)/2,-a_lot/2,-a_lot/2])
            cube([a_lot,a_lot, a_lot]);
        }
        _treverse_stick_voids();
    }
}

module print_traverse_split_stick_3of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_3of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}

module print_traverse_split_stick_2of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_2of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}

module print_traverse_split_stick_1of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_1of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}