use <sim/modules/new_gate.scad>
use <sim/modules/old_gate.scad>
use <src/gate/joints/test/button_joint.scad>
use <src/gate/joints/test/v_slide.scad>
use <src/gate/joints/bar_wrapper.scad>
use <src/gate/joints/ct_slide.scad>

use <src/gate/parts/test/angle.scad>
use <src/gate/interparts/test/ground-upright.scad>
use <src/gate/parts/sim/traverse.scad>
use <src/gate/parts/upright.scad>
use <src/gate/interparts/ground-upright.scad>
use <src/gate/interparts/uprights_distance.scad>
use <src/gate/parts/print/hanger_clip.scad>
use <src/gate/parts/print/hanger_rod.scad>

use <src/gate/parts/hanger.scad>
use <src/gate/parts/sim/hanger.scad>
use <src/gate/interparts/test/upright-angle.scad>

use <src/basement/values.scad>

//
//$vpt = [ uprights_distance(mode="basement")/2, 0, upright_h()/2-5];
//$vpr = [ 60,0,-20 ];
//$vpd = 500;

//$vpt = [ 0, 0, 0];
//$vpr = [ 0,0,0];
//$vpd = 200;

//color("red")
//translate($vpt)
//sphere(d=5);


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