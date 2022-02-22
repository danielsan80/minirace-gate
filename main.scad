use <src/gate/sim/new_gate.scad>
use <src/gate/sim/old_gate.scad>
use <src/joints/test/button_joint.scad>
use <src/joints/test/v_slide.scad>
use <src/joints/bar_wrapper.scad>
use <src/joints/ct_slide.scad>

use <src/parts/test/angle.scad>
use <src/interparts/test/ground-upright.scad>
use <src/parts/sim/traverse.scad>
use <src/parts/upright.scad>
use <src/interparts/ground-upright.scad>
use <src/interparts/upright-upright.scad>
use <src/parts/print/hanger_clip.scad>
use <src/parts/print/hanger_rod.scad>
use <src/gate/print/gate.scad>

use <src/parts/hanger.scad>
use <src/parts/sim/hanger.scad>
use <src/interparts/test/upright-angle.scad>

$vpt = [ uprights_distance()/2, 0, upright_h()/2];
$vpr = [ 60,0,-20 ];
$vpd = 400;


sim_new_gate();
//sim_old_gate();

//test_upright_angle_joints();
//test_button_joint();

//test_v_slide_m();
//test_v_slide_f();


//test_angle(); // duplicated?
//test_ground_upright_bolt();
//test_ground_upright_bolts();

//print_hanger_rod();
//print_hanger_clip();

//print_gate();


//bar_wrapper();

//sim_hanger_clip();
//hanger_clip();
//print_hanger_rod();

//sim_hanger_rod();