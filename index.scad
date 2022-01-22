use <src/gate/sim/new_gate.scad>
use <src/gate/sim/old_gate.scad>
use <src/joints/test/button_joint.scad>
use <src/joints/test/v_slide.scad>
use <src/joints/bar_wrapper.scad>
use <src/joints/ct_slide.scad>

use <src/parts/test/angle.scad>
use <src/interparts/test/ground-upright.scad>
use <src/parts/sim/traverse.scad>
use <src/interparts/ground-upright.scad>
use <src/parts/print/hanger_clip.scad>
use <src/parts/print/hanger_rod.scad>
use <src/gate/print/gate.scad>

use <src/parts/hanger.scad>
use <src/parts/sim/hanger.scad>

//sim_new_gate();
//sim_old_gate();

//test_button_joint();

//test_v_slide_m();
//test_v_slide_f();


//test_angle(); // duplicated?
//test_ground_upright_bolt();

//print_hanger_rod();
//print_hanger_clip();

//print_gate();


//bar_wrapper();

//sim_hanger_clip();
//hanger_clip();
hanger_rod(with_supports=true);
//hanger_rod_hook(with_supports=true);

//sim_hanger_rod();