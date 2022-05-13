include <../../../config/parameters.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_transform.scad>
use <../../../src/basement/sim/basement_block.scad>
use <../../../src/gate/parts/sim/ground.scad>

use <../../../src/basement/basement_ground_guide.scad>


sim_basement_box_terminal_L();
color("red")
sim_ground_L();

color("red")
sim_ground_R(mode = "basement");
sim_basement_box_controller_R();

sim_basement_box_controller_R_top_hole_cap();

color("blue")
sim_basement_box_underplane_transform()
sim_basement_ground_guide_transform()
basement_ground_guide(box="terminal");


color("blue")
    sim_basement_box_R_tranform(mode="basement")
    sim_basement_box_underplane_transform()
    sim_basement_ground_guide_transform()
    basement_ground_guide(box="controller");
