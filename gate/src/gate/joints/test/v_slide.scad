include <../../../../config/parameters.scad>
use <../../../functions.scad>
use <../../../gate/parts/upright.scad>
use <../../../gate/parts/angle.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/upright-angle.scad>
use <../../../gate/interparts/angle-traverse.scad>

module test_v_slide_m() {

    difference() {
        intersection() {
            angle();

            translate([10,-a_lot/2,0])
            cube([a_lot,a_lot, a_lot]);
        }

        translate([0,-10,15])
        cube([12.3,20,15]);

        translate([5,-4.08,15])
        cube([12.3,8,15]);

        translate([0,-15,0])
        cube([30,30,7]);
    }
}

module test_v_slide_f() {

    angle_traverse_cut_translate()
    intersection() {
        traverse();

        translate([0,-a_lot/2,-a_lot/2])
        cube([3,a_lot,a_lot]);
    }

    translate([2,-pylon_side/2-bar_w/2,0])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);

    translate([2,-pylon_side/2-bar_w/2,pylon_side])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);
}

