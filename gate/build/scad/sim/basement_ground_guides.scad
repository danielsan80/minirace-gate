include <../../../config/parameters.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_block.scad>


sim_basement_box_terminal_L();
sim_ground_L();

sim_ground_R(mode = "basement");
sim_basement_box_controller_R();

sim_basement_box_controller_R_top_hole_cap();