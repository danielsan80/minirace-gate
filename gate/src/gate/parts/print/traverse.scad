include <../../../../config/parameters.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/angle-traverse.scad>


module print_traverse(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    rotate([0,-90,0])
    traverse(startline_mode=startline_mode, startline_l=startline_l);
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


module print_traverse_L(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    difference() {
        translate([-pylon_side/2-bar_w/2,0,0])
        rotate([0,90,0])
        translate([-traverse_l(startline_mode=startline_mode, startline_l=startline_l)/2,0,0])
        intersection() {
            traverse(startline_mode=startline_mode, startline_l=startline_l);
            translate([-a_lot+traverse_l(startline_mode=startline_mode, startline_l=startline_l)/2,-a_lot/2,-a_lot/2])
                cube([a_lot,a_lot, a_lot]);
        }

        _treverse_stick_voids();
    }
}

module print_traverse_R(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    difference() {
        translate([pylon_side/2+bar_w/2,0,0])
        rotate([0,-90,0])
        translate([-traverse_l(startline_mode=startline_mode, startline_l=startline_l)/2,0,0])
        intersection() {
            traverse(startline_mode=startline_mode, startline_l=startline_l);
            translate([traverse_l(startline_mode=startline_mode, startline_l=startline_l)/2,-a_lot/2,-a_lot/2])
            cube([a_lot,a_lot, a_lot]);
        }
        _treverse_stick_voids();
    }
}

module print_traverse_stick_3of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_3of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}

module print_traverse_stick_2of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_2of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}

module print_traverse_stick_1of3() {
    intersection() {
        translate([0,0,stick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_stick_1of3();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}