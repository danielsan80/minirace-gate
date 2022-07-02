include <../../../../config/parameters.scad>
//use <../../../functions.scad>
//use <../../../gate/parts/upright.scad>
//use <../../../gate/parts/angle.scad>
use <../../../gate/interparts/upright-angle.scad>

module test_button_joint() {

    module f() {
        translate([-5,-5,0])
        cube([10,10,4]);
    }

    module m() {
        cylinder(r=2.5, h=3);
    }

    module joint() {
        translate([10,0,0])
        difference() {
            f();
            upright_angle_joint(void=true);
        }

        translate([0,0,3-fix])
        upright_angle_joint(void=false);

        m();
    }

//    difference() {
//        joint();
//        cube([a_lot, a_lot,a_lot]);
//    }
    joint();

}
