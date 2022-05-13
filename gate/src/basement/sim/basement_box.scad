include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../basement/sim/basement_transform.scad>
use <../../gate/interparts/angle-traverse.scad>


//BOXES

module sim_basement_box_controller_bottom() {
    sim_basement_box_underplane_transform()
    basement_box_controller_bottom();
}


module sim_basement_box_controller_top() {
    sim_basement_box_underplane_transform()
    sim_basement_box_top_transform()
    basement_box_controller_top(with_hole=true, with_groove=false);
}

module sim_basement_box_controller_side_slide() {
    sim_basement_box_underplane_transform()
    basement_box_controller_side_slide();
}

module sim_basement_box_controller_top_hole_cap() {
    sim_basement_box_underplane_transform()
    sim_basement_box_top_hole_cap_transform()
    basement_box_top_hole_cap();
}


module sim_basement_box_terminal_bottom() {
    sim_basement_box_underplane_transform()
    basement_box_terminal_bottom();
}

module sim_basement_box_terminal_top() {
    sim_basement_box_underplane_transform()
    sim_basement_box_top_transform()
    basement_box_terminal_top(with_hole=false, with_groove=false);
}

module sim_basement_box_terminal_side_slide() {
    sim_basement_box_underplane_transform()
    basement_box_terminal_side_slide();
}


// BOXES IN POS

module sim_basement_box_controller_R() {
    sim_basement_box_R_tranform(mode="basement")
    union() {
        sim_basement_box_controller_bottom();
        sim_basement_box_controller_top();
        sim_basement_box_controller_side_slide();
    }
}

module sim_basement_box_controller_R_top_hole_cap() {
    sim_basement_box_R_tranform(mode="basement")
    sim_basement_box_controller_top_hole_cap();
}

module sim_basement_box_terminal_L() {
    sim_basement_box_terminal_bottom();
    sim_basement_box_terminal_top();
    sim_basement_box_terminal_side_slide();
}
