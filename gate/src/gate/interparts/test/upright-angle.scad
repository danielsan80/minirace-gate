include <../../../../config/parameters.scad>
use <../../../gate/parts/print/upright.scad>
use <../../../gate/parts/angle.scad>

module test_upright_button_joints() {

    module base() {
        translate([-pylon_side/2-bar_w/2,-bar_w/2,0])
        cube([pylon_side+bar_w,bar_w,2]);
    }

    translate([0,0,-upright_h+7])
    intersection() {
        print_upright();

        translate([0,0,upright_h-7])
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot, a_lot, a_lot]);
    }

    translate([0,pylon_side/2,0])
    base();

    translate([0,-pylon_side/2,0])
    base();

    translate([pylon_side/2,0,0])
    rotate([0,0,90])
    base();

    translate([-pylon_side/2,0,0])
    rotate([0,0,90])
    base();

}

module test_angle_button_joints() {
    intersection() {
        angle();

        translate([0,0,-a_lot+angle_base_h*(1+angle_base_h2_c)+5])
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot, a_lot, a_lot]);
    }
}


module test_upright_angle_joints() {
    translate([0,pylon_side,0])
    test_upright_button_joints();
    translate([0,-pylon_side,0])
    test_angle_button_joints();
}
