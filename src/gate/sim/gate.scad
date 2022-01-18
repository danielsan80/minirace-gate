include <../../parameters.scad>
include <../../modules/profile.scad>
include <../../startlights/values.scad>
include <../../interparts/angle-traverse.scad>
include <../../interparts/traverse-startlights.scad>
include <../../interparts/ground-upright.scad>

use <../../parts/sim/ground.scad>
use <../../parts/sim/upright.scad>
use <../../parts/sim/angle.scad>
use <../../parts/sim/traverse.scad>

use <../../startlights/sim/startlights.scad>
use <../../startlights/sim/leds.scad>
use <../../startlights/sim/board.scad>


use <../../../lib/gaslands_gate/src/car/sim/cars.scad>
use <../../../vendor/ruler/ruler.scad>
include <../../parts/angle.scad>


module sim_new_gate() {

//    sim_ground_L();
//    sim_upright_L();
//    sim_angle_L();
//
//    sim_traverse();
//
//    sim_angle_R();
//    sim_upright_R();
//    sim_ground_R();
//
//    translate([0,0,-profile_w_diff()/2-play2-bar_c_junction_l-c_joint_profile_side/2])
//    translate([0,0,board_margin+startlights_board_hole_y_offset()])
//    translate([0,-board_thick-board_startlights_gap,0])
//    translate([0,-pylon_side/2-c_joint_profile_side/2,0])
//    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_height])
//    translate([(uprights_distance-startlights_length)/2,0,0])
//    rotate([90,0,0])
//    union() {
//        sim_startlights_front();
//        sim_startlights_leds();
//        sim_startlights_board();
//    }
//
//    sim_traverse_c_hooks();
//    sim_traverse_c_stick();
//
//
//    translate([-5,-30,0])
//    sim_cars(5);
//
//    translate([upright_base_w/2,-70,0])
//    ruler(x=intra_uprights_space_l);
//
//    translate([-40,0,0])
//    ruler(z=upright_h);

    bar_c_hook();
    traverse_c_stick(with_supports=true);
    ground_upright_joint();

    test_angle();

}