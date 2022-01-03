module new_gate() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/upright.scad>
    include <src/gate/parts/angle.scad>
    include <src/gate/parts/traverse.scad>

    upright();

    translate([0,0,upright_h])
    angle();

//    translate([0,0,upright_h])
//    traverse();

//    translate([pylon_side-0.5,0,angle_base_h+pylon_side])
//    rotate([0,90,0])
//    translate([-pylon_side/2,-pylon_side/2,0])
//    pylon(side=pylon_side, l=150, gap=gap, bar_w=bar_w);

}

//translate([11,90,0])
new_gate();


module tests() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/upright.scad>
    include <src/gate/parts/angle.scad>

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
//tests();


module old_gate() {
    include <src/gaslands_gate/gaslands_gate.scad>
    vendor_dir = "vendor";

//    difference() {
    translate([0,120,0])
    gate_150();

//        translate([-500,-500,50])
//        cube([1000,1000,1000]);
//    }
}
//old_gate();


//difference() {
//    pylon(side=20, length=170, offset=8);
//    
//    translate([0,0,150])
//    rotate([0,45,0])
//    translate([-500,-500,0])
//    cube([1000,1000,1000]);
//}
//
//translate([0,0,150])
//difference() {
//    translate([-10,0,0])
//    rotate([0,90,0])
//    pylon(side=20, length=170, offset=8);
//    
//    
//    rotate([0,45,0])
//    translate([-500,-500,-1000])
//    cube([1000,1000,1000]);
//}
