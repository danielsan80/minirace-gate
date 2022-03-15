use <../sim/modules/new_gate.scad>
use <../sim/modules/old_gate.scad>
use <../src/gate/parts/upright.scad>
use <../src/gate/interparts/uprights_distance.scad>

$vpt = [ uprights_distance(mode="basement")/2, 45, upright_h()/2-5];
$vpr = [ 30,0,-20 ];
$vpd = 750;


sim_new_gate();
sim_old_gate();