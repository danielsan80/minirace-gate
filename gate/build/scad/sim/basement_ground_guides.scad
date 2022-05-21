include <../../../config/parameters.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_transform.scad>
use <../../../src/basement/sim/basement_block.scad>
use <../../../src/gate/parts/sim/ground.scad>

use <../../../src/basement/basement_ground_guide.scad>

module _sim_terminal_box() {
    sim_basement_box_terminal_L();

    color("red")
    sim_ground_L();

    color("blue")
    sim_basement_box_underplane_transform()
    sim_basement_ground_guide_transform()
    basement_ground_guide(box="terminal");
}


module _sim_controller_box() {
    color("red")
    sim_ground_R(mode = "basement");

    sim_basement_box_controller_R();

    //sim_basement_box_controller_R_top_hole_cap();

    color("blue")
    sim_basement_box_R_tranform(mode="basement")
    sim_basement_box_underplane_transform()
    sim_basement_ground_guide_transform()
    basement_ground_guide(box="controller");
}


module _sim_instructions() {
    line_height = 15;
    color("black")
        text("glue the", size=8);
    color("red")
        text("              bolting", size=8);

    translate([0,-line_height,0])
        color("black")
            text("to the", size=8);
    translate([0,-line_height,0])
        text("           box", size=8);

    translate([0,-line_height*2,0])
        color("black")
            text("using the", size=8);
    translate([0,-line_height*2,0])
        color("blue")
            text("                guide", size=8);

    translate([0,-line_height*3,0])
        color("black")
            text("than throw the guide", size=8);
}


_sim_terminal_box();

translate([-35,0,0])
_sim_controller_box();

translate([30,20,0])
_sim_instructions();


