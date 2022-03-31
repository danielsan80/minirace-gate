include <../../../config/parameters.scad>

use <../../../sim/modules/new_gate.scad>
use <../../../sim/modules/old_gate.scad>
use <../../../src/gate/parts/upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/gate/modules/profile.scad>
use <../../../src/startlights/values.scad>
use <../../../src/gate/interparts/angle-traverse.scad>
use <../../../src/gate/interparts/ground-upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_block.scad>
use <../../../src/gate/parts/sim/ground.scad>
use <../../../src/gate/parts/sim/upright.scad>
use <../../../src/gate/parts/sim/angle.scad>
use <../../../src/gate/parts/sim/traverse.scad>
use <../../../src/gate/parts/sim/hanger.scad>

use <../../../src/startlights/sim/startlights.scad>
use <../../../src/startlights/sim/leds.scad>
use <../../../src/startlights/sim/board.scad>

use <../../../lib/gaslands_gate/src/car/sim/cars.scad>
use <../../../vendor/ruler/ruler.scad>


$vpt = [ uprights_distance(mode="basement")/2, 0, upright_h()/2-5];
$vpr = [ 60,0,-20 ];
$vpd = 500;

translate([0,0,basement_h()])
union() {
    sim_basement_block_L();
    translate([0,0,-fix2])
    sim_ground_L();

    sim_upright_L();
    sim_angle_L();

    sim_traverse(mode="basement");

    sim_angle_R(mode="basement");
    sim_upright_R(mode="basement");

    translate([0,0,-fix2])
    sim_ground_R(mode="basement");
    sim_basement_box_R();

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


translate([basement_w()/2, -70, 0])
ruler(x=intra_uprights_space_l);

translate([0,0,basement_h()])
translate([-40,0,0])
ruler(z=upright_h);