include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../gate/interparts/angle-traverse.scad>

module sim_basement_box_controller_R() {

    angle_traverse_cut_x_translate()
    translate([traverse_l(mode="basement"),0,0])
    angle_traverse_cut_x_translate()
    union() {
        sim_basement_box_controller_bottom();
        sim_basement_box_controller_top();
        sim_basement_box_controller_side_slide();
    }
}

module sim_basement_box_controller_R_top_hole_cap() {

    angle_traverse_cut_x_translate()
    translate([traverse_l(mode="basement"),0,0])
    angle_traverse_cut_x_translate()
    union() {
        sim_basement_box_controller_top_hole_cap();
    }
}

module sim_basement_box_terminal_L() {
    sim_basement_box_terminal_bottom();
    sim_basement_box_terminal_top();
    sim_basement_box_terminal_side_slide();
}

module sim_basement_box_controller_bottom() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_controller_bottom();
}

module sim_basement_box_controller_top() {
    translate([0,0,-ground_thick-fix2])
    rotate([0,180,0])
    basement_box_controller_top(with_hole=true, with_groove=false);
}

module sim_basement_box_controller_side_slide() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_controller_side_slide();
}

module sim_basement_box_controller_top_hole_cap() {
    translate([0,0,box_top_base_thick()+fix*2])
    translate([0,0,-ground_thick-fix2])
    rotate([180,0,0])
    basement_box_top_hole_cap();
}


module sim_basement_box_terminal_bottom() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_terminal_bottom();
}

module sim_basement_box_terminal_top() {
    translate([0,0,-ground_thick-fix2])
    rotate([0,180,0])
    basement_box_terminal_top(with_hole=false, with_groove=false);
}

module sim_basement_box_terminal_side_slide() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_terminal_side_slide();
}