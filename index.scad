use <src/gate/sim/new_gate.scad>
use <src/gate/sim/old_gate.scad>
use <src/joints/test/button_joint.scad>
use <src/joints/test/slide_joint.scad>

use <src/parts/test/angle.scad>
use <src/interparts/test/ground-upright.scad>
use <src/parts/sim/traverse.scad>
use <src/interparts/ground-upright.scad>
use <src/interparts/print/bar_c_hook.scad>
use <src/interparts/print/traverse_c_stick.scad>
use <src/gate/print/gate.scad>

sim_new_gate();
//sim_old_gate();

//test_button_joint();
//test_slide_joint_m();
//test_slide_joint_f();


//test_angle(); // duplicated?
//test_ground_upright_bolt();

//print_traverse_c_stick();
//print_bar_c_hook();

print_gate();
