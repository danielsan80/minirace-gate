include <../../src/parameters.scad>
use <../../src/modules/profile.scad>
use <../../src/startlights/values.scad>
use <../../src/interparts/angle-traverse.scad>
use <../../src/interparts/ground-upright.scad>
use <../../src/interparts/uprights_distance.scad>

use <../../src/basement/values.scad>
use <../../src/basement/sim/basement_box.scad>
use <../../src/basement/sim/basement_block.scad>
use <../../src/parts/sim/ground.scad>
use <../../src/parts/sim/upright.scad>
use <../../src/parts/sim/angle.scad>
use <../../src/parts/sim/traverse.scad>
use <../../src/parts/sim/hanger.scad>

use <../../src/startlights/sim/startlights.scad>
use <../../src/startlights/sim/leds.scad>
use <../../src/startlights/sim/board.scad>

use <../../lib/gaslands_gate/src/car/sim/cars.scad>
use <../../vendor/ruler/ruler.scad>



module sim_new_gate() {

    sim_basement_block_L();
    sim_ground_L();
    sim_upright_L();
    sim_angle_L();

    sim_traverse();

    sim_angle_R();
    sim_upright_R();
    sim_ground_R();
    sim_basement_box_R();

    translate([0,0,-profile_w_diff()/2-play2-hanger_clip_junction_l-ct_slide_side/2])
    translate([0,0,startlights_board_margin()+startlights_board_hole_y_offset()])
    translate([0,-startlights_board_thick()-startlights_board_startlights_gap(),0])
    translate([0,-pylon_side/2-ct_slide_side/2,0])
    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_startlights_height()])
    translate([(uprights_distance()-startlights_startlights_length())/2,0,0])
    rotate([90,0,0])
    union() {
        sim_startlights_front();
        sim_startlights_leds();
        sim_startlights_board();
    }

    sim_hanger_clips();
    sim_hanger_rod();

//    translate([-5,-30,0])
//    sim_cars(5);

    translate([
            intra_uprights_space_l_mode=="ground"?upright_base_w/2+base_curvature_r:
            intra_uprights_space_l_mode=="basement"?basement_w()/2:0
        ,
        -70,
        0
    ])
    ruler(x=intra_uprights_space_l);

    translate([-40,0,0])
    ruler(z=upright_h);

}