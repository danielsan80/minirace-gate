include <../../../../config/parameters.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/angle-traverse.scad>


// mode="basement"|"upright"|"center"
module print_traverse(mode="basement") {
    rotate([0,-90,0])
    traverse(mode=mode);
}

module _treverse_toothpick() {
    l=traverse_toothpick_l;
    d=toothpick_d;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _treverse_toothpick_void() {
    l=traverse_toothpick_void_l;
    d=toothpick_d+toothpick_play*2;

    translate([0,0,-l/2])
    cylinder(d=d, h=l);
}

module _treverse_toothpick_voids() {

    translate([pylon_side/2,pylon_side/2,0])
        _treverse_toothpick_void();
    translate([pylon_side/2,-pylon_side/2,0])
        _treverse_toothpick_void();
    translate([-pylon_side/2,-pylon_side/2,0])
        _treverse_toothpick_void();
    translate([-pylon_side/2,pylon_side/2,0])
        _treverse_toothpick_void();


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

        _treverse_toothpick_voids();
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
        _treverse_toothpick_voids();
    }
}

module print_traverse_split_toothpick() {
    intersection() {
        translate([0,0,toothpick_d/2-layer_h])
        rotate([0,90,0])
        _treverse_toothpick();

        translate([-a_lot/2, -a_lot/2, 0])
        cube([a_lot, a_lot, a_lot]);
    }
}