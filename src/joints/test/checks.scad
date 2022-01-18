
module button_joint_tests() {
    include <../parameters.scad>
    include <../functions.scad>
    include <../parts/upright.scad>
    include <../parts/angle.scad>

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

    joint();

//    difference() {
//        translate([-5,-7.5,0])
//        cube([22,15,0.4]);
//
//        minkowski() {
//            translate([10,0,0])
//            f();
//            cylinder(r=fix,h=fix);
//        }
//
//        minkowski() {
//            m();
//            cylinder(r=fix,h=fix);
//        }
//    }

}
//button_joint_tests();

module slide_joint_m_test() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/upright.scad>
    include <src/gate/parts/angle.scad>

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
slide_joint_m_test();


module slide_joint_f_test() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/traverse.scad>
    traverse_l = 3;

//    render()
    traverse();

    translate([2.3,-pylon_side/2-bar_w/2,0])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);

    translate([2.3,-pylon_side/2-bar_w/2,pylon_side])
    angle_traverse_cut_translate()
    cube([1,pylon_side+bar_w,bar_w]);

}
//slide_joint_f_test();

