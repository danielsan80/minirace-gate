include <../../parameters.scad>
use <../../functions.scad>
use <../../parts/upright.scad>
use <../../parts/angle.scad>
use <../../parts/traverse.scad>
use <../../interparts/upright-angle.scad>
use <../../interparts/angle-traverse.scad>

module test_slide_joint_m() {

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

module test_slide_joint_f() {
    intersection() {
        traverse();

        angle_traverse_cut_translate()
        translate([0,-a_lot/2,-a_lot/2])
        cube([3,a_lot,a_lot]);
    }

    translate([2.3,-pylon_side/2-bar_w/2,0])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);

    translate([2.3,-pylon_side/2-bar_w/2,pylon_side])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);
}

