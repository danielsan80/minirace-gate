module new_gate() {
    include <src/gate/parameters.scad>
    include <src/gate/functions.scad>
    include <src/gate/parts/ground.scad>
    include <src/gate/parts/upright.scad>
    include <src/gate/parts/angle.scad>
    include <src/gate/parts/traverse.scad>

    include <vendor/startlights/src/startlights/parts/startlight.scad>
    include <vendor/startlights/src/startlights/parts/led.scad>
    include <vendor/startlights/src/startlights/parts/board.scad>

    include <vendor/ruler/ruler.scad>


    sim_ground_L();
    sim_upright_L();
    sim_angle_L();

    sim_traverse();

    sim_angle_R();
    sim_upright_R();
    sim_ground_R();

    translate([0,0,-profile_w_diff()/2-play2-bar_c_junction_l-c_joint_profile_side/2])
    translate([0,0,board_margin+board_hole_y_offset])
    translate([0,-board_thick-board_startlights_gap,0])
    translate([0,-pylon_side/2-c_joint_profile_side/2,0])
    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_height])
    translate([(uprights_distance-startlights_length)/2,0,0])
    rotate([90,0,0])
    union() {
        sim_startlights();
        sim_leds();
        sim_board();
    }

    sim_traverse_c_hooks();
    sim_traverse_c_stick();


//    bar_c_hook();
//    traverse_c_stick(with_supports=true);

    module cars() {
        include <src/gaslands_gate/gaslands_gate.scad>
        lib_dir="lib";
        translate([-5,-30,0])
        cars(5);
    }
    cars();

    translate([upright_base_w/2,-70,0])
    ruler(x=intra_uprights_space_l);

    translate([-40,0,0])
    ruler(z=upright_h);

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
