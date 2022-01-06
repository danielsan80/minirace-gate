module new_gate() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/ground.scad>
    include <src/gate/parts/upright.scad>
    include <src/gate/parts/angle.scad>
    include <src/gate/parts/traverse.scad>

    include <vendor/startlights/src/startlights/parts/startlight.scad>
    include <vendor/startlights/src/startlights/parts/led.scad>

    sim_ground_L();
    sim_upright_L();
    sim_angle_L();

    sim_traverse();

    sim_angle_R();
    sim_upright_R();
    sim_ground_R();

    translate([0,0,upright_h-13])
    translate([(uprights_distance-startlights_length)/2,0,0])
    rotate([90,0,0])
    union() {
        sim_startlights();
        sim_leds();
    }

}

//translate([11,90,0])
//render()
new_gate();



module old_gate() {
    include <src/gaslands_gate/gaslands_gate.scad>
    vendor_dir = "vendor";
    lib_dir = "lib";

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
