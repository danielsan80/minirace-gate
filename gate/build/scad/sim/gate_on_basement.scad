include <../../../config/parameters.scad>

use <../../../src/gate/parts/sim/bolting_transform.scad>
use <../../../src/gate/parts/sim/bolting.scad>
use <../../../src/gate/parts/sim/upright.scad>
use <../../../src/gate/parts/sim/angle.scad>
use <../../../src/gate/parts/sim/traverse.scad>
use <../../../src/gate/parts/sim/hanger.scad>
use <../../../src/gate/interparts/basement_upright.scad>

use <../../../src/startlights/sim/startlights.scad>
use <../../../src/startlights/sim/board.scad>

use <../../../vendor/car/src/cars.scad>
use <../../../vendor/ruler/ruler.scad>
use <../../../src/startlights/sim/startlights_transform.scad>

use <../../../src/basement/sim/_basement.scad>
use <../../../src/basement/sim/_basement_transform.scad>

//$vpt = [ uprights_distance(startline_mode="basement")/2, 0, upright_h()/2-5];
//$vpr = [ 60,0,-20 ];
//$vpd = 500;

//sim_basement_box_terminal_L();
_sim_basement_L();

_sim_on_basement_transform()
union() {

    sim_bolting_L();

    sim_on_bolting_transform()
    union() {
        sim_upright_L();
        sim_angle_L();

        sim_traverse(startline_mode="basement", startline_l=startline_l);

        sim_angle_R(startline_mode="basement", startline_l=startline_l);
        sim_upright_R(startline_mode="basement", startline_l=startline_l);
    }

    sim_bolting_R(startline_mode="basement", startline_l=startline_l);
}



//sim_basement_box_controller_R(startline_l=startline_l);
//    sim_basement_box_controller_R_top_hole_cap();
_sim_basement_R(startline_l=startline_l);

_sim_on_basement_transform()
sim_on_bolting_transform()
union() {
    sim_startlights_transform(startline_mode="basement", startline_l=startline_l)
    union() {
        sim_startlights_front();
        sim_startlights_board();
    }

    sim_hanger_clips(startline_mode="basement", startline_l=startline_l);
    sim_hanger_rod(startline_mode="basement", startline_l=startline_l);
}

translate([5,-30,0])
translate([35,26,0])
cars(5);

translate([basement_w()/2, -100, 0])
ruler(x=startline_l);

translate([-40,0,0])
_sim_on_basement_transform()
sim_on_bolting_transform()
ruler(z=upright_h);