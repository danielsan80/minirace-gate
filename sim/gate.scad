//use <../src/gate/parameters.scad>
//use <../src/gate/functions.scad>
//use <../src/gate/parts/ground.scad>
//use <../src/gate/parts/upright.scad>
//use <../src/gate/parts/angle.scad>
//use <../src/gate/parts/traverse.scad>
//
//use <../vendor/startlights/src/startlights/parts/startlight.scad>
//use <../vendor/startlights/src/startlights/parts/led.scad>
//use <../vendor/startlights/src/startlights/parts/board.scad>
//
//use <../vendor/ruler/ruler.scad>
use <parts/ground.scad>
use <parts/upright.scad>
use <parts/angle.scad>
use <parts/traverse.scad>


module sim_new_gate() {

    sim_ground_L();
    sim_upright_L();
    sim_angle_L();

    sim_traverse();

    sim_angle_R();
    sim_upright_R();
    sim_ground_R();
//
//    translate([0,0,-profile_w_diff()/2-play2-bar_c_junction_l-c_joint_profile_side/2])
//    translate([0,0,board_margin+board_hole_y_offset])
//    translate([0,-board_thick-board_startlights_gap,0])
//    translate([0,-pylon_side/2-c_joint_profile_side/2,0])
//    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_height])
//    translate([(uprights_distance-startlights_length)/2,0,0])
//    rotate([90,0,0])
//    union() {
//        sim_startlights();
//        sim_leds();
//        sim_board();
//    }
//
//    sim_traverse_c_hooks();
//    sim_traverse_c_stick();

//
//
//    module cars() {
//        include <src/gaslands_gate/gaslands_gate.scad>
//        lib_dir="lib";
//        translate([-5,-30,0])
//        cars(5);
//    }
//    cars();
//
//    translate([upright_base_w/2,-70,0])
//    ruler(x=intra_uprights_space_l);
//
//    translate([-40,0,0])
//    ruler(z=upright_h);

//    bar_c_hook();
//    traverse_c_stick(with_supports=true);
//    grount_upright_joint();

//    test_angle();

}