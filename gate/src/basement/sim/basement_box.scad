include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../basement/sim/basement_transform.scad>
use <../../basement/sim/basement_box_controller_top_led_hole_cap.scad>
//use <../../gate/interparts/angle-traverse.scad>


//BOXES PARTS

module sim_basement_box_controller_bottom() {
    basement_box_controller_bottom();
}

module sim_basement_box_controller_side_slide() {
    basement_box_controller_side_slide();
}

module sim_basement_box_controller_top() {
    sim_basement_box_top_transform()
    basement_box_controller_top(with_hole=true, with_groove=false);


    sim_basement_box_top_transform()
    translate([+basement_box_controller_center_offset().x,-basement_box_controller_center_offset().y,0])
    translate([-basement_box_controller_w()/2,-basement_l()/2,0])
    sim_basement_box_controller_top_led_hole_caps();
}

module sim_basement_box_controller_top_hole_cap() {
    sim_basement_box_top_hole_cap_transform()
    basement_box_top_hole_cap();
}

module sim_basement_box_controller_top_led_hole_caps() {
    sim_basement_box_controller_top_led_hole_cap_transform(led="blue")
    sim_basement_box_controller_top_led_hole_cap_color(led="blue")
    basement_box_top_led_hole_cap();

    sim_basement_box_controller_top_led_hole_cap_transform(led="red")
    sim_basement_box_controller_top_led_hole_cap_color(led="red")
    basement_box_top_led_hole_cap();
}



module sim_basement_box_terminal_bottom() {
    basement_box_terminal_bottom();
}

module sim_basement_box_terminal_side_slide() {
    basement_box_terminal_side_slide();
}

module sim_basement_box_terminal_top() {
    sim_basement_box_top_transform()
    basement_box_terminal_top(with_hole=false, with_groove=false);
}


//BOXES

module sim_basement_box_controller() {
    sim_basement_box_controller_bottom();
    sim_basement_box_controller_side_slide();
    sim_basement_box_controller_top();
}

module sim_basement_box_terminal() {
    sim_basement_box_terminal_bottom();
    sim_basement_box_terminal_top();
    sim_basement_box_terminal_side_slide();
}

// BOXES IN POS



module sim_basement_box_controller_R(startline_l=startline_l) {
    sim_basement_box_R_tranform(startline_mode="basement", startline_l=startline_l)
    sim_basement_box_controller();
}

module sim_basement_box_controller_R_top_hole_cap(startline_l=startline_l) {
    sim_basement_box_R_tranform(startline_mode="basement", startline_l=startline_l)
    sim_basement_box_controller_top_hole_cap();
}

module sim_basement_box_terminal_L() {
    sim_basement_box_terminal();
}
