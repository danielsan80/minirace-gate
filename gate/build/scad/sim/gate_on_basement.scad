include <../../../config/parameters.scad>

use <../../../sim/modules/new_gate.scad>
use <../../../src/gate/parts/upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/gate/modules/profile.scad>
use <../../../src/startlights/values.scad>
use <../../../src/gate/interparts/angle-traverse.scad>
use <../../../src/gate/interparts/bolting-upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_transform.scad>
use <../../../src/gate/parts/sim/bolting_transform.scad>
use <../../../src/basement/sim/basement_block.scad>
use <../../../src/gate/parts/sim/bolting.scad>
use <../../../src/gate/parts/sim/upright.scad>
use <../../../src/gate/parts/sim/angle.scad>
use <../../../src/gate/parts/sim/traverse.scad>
use <../../../src/gate/parts/sim/hanger.scad>

use <../../../src/startlights/sim/startlights.scad>
use <../../../src/startlights/sim/leds.scad>
use <../../../src/startlights/sim/board.scad>

use <../../../vendor/car/src/cars.scad>
use <../../../vendor/ruler/ruler.scad>


//$vpt = [ uprights_distance(mode="basement")/2, 0, upright_h()/2-5];
//$vpr = [ 60,0,-20 ];
//$vpd = 500;

sim_basement_box_terminal_L();

sim_on_basement_transform()
union() {

    sim_bolting_L();

    sim_on_bolting_transform()
    union() {
        sim_upright_L();
        sim_angle_L();

        sim_traverse(mode="basement");

        sim_angle_R(mode="basement");
        sim_upright_R(mode="basement");
    }

    sim_bolting_R(mode="basement");
}



sim_basement_box_controller_R();
//    sim_basement_box_controller_R_top_hole_cap();

sim_on_basement_transform()
sim_on_bolting_transform()
union() {
    translate([0,0,-profile_w_diff()/2-bar_wrapper_play-hanger_clip_junction_l-ct_slide_side/2])
    translate([0,0,startlights_board_margin()+startlights_board_hole_y_offset()])
    translate([0,-startlights_board_thick()-startlights_board_startlights_gap(),0])
    translate([0,-pylon_side/2-ct_slide_side/2,0])
    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_startlights_height()])
    translate([(uprights_distance(mode="basement")-startlights_startlights_length())/2,0,0])
    rotate([90,0,0])
    union() {
        sim_startlights_front();
        sim_startlights_leds();
        sim_startlights_board();
    }

    sim_hanger_clips(mode="basement");
    sim_hanger_rod(mode="basement");
}

translate([5,-30,0])
translate([35,26,0])
cars(5);

translate([basement_w(box="terminal")/2, -70, 0])
ruler(x=intra_uprights_space_l);

translate([-40,0,0])
sim_on_basement_transform()
sim_on_bolting_transform()
ruler(z=upright_h);