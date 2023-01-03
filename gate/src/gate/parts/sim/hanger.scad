include <../../../../config/parameters.scad>
use <../../../gate/parts/hanger.scad>
use <../../../startlights/sim/hanger.scad>

use <../../../gate/interparts/angle-traverse.scad>

module sim_hanger_clip() {
    rotate([90, 0, - 90])
    translate([0, 0, - bar_wrapper_w / 2])
    hanger_clip();
}

module sim_hanger_clips(startline_mode = "basement", startline_l = startline_l) {
    assert(startline_mode == "basement" || startline_mode == "upright" || startline_mode == "center");
    
    translate([0, 0, bar_w / 2])
    translate([0, - pylon_side / 2, 0])
    translate([traverse_l(startline_mode = startline_mode, startline_l = startline_l) / 2, 0, 0])
    angle_traverse_cut_translate()
    translate([0, 0, upright_h])
    union() {
        translate([pylon_side + reinforcement_gap, 0, 0])
        sim_hanger_clip();
        translate([- pylon_side - reinforcement_gap, 0, 0])
        sim_hanger_clip();
    }
}


module sim_hanger_rod_transform(startline_mode = "basement", startline_l = startline_l) {
    assert(startline_mode == "basement" || startline_mode == "upright" || startline_mode == "center");
    
    translate([0, 0, bar_w / 2])
    translate([0, - pylon_side / 2, 0])
    translate([traverse_l(startline_mode = startline_mode, startline_l = startline_l) / 2, 0, 0])
    angle_traverse_cut_translate()
    translate([0, 0, upright_h])
    translate([0, 0, hanger_clip_rod_joint_pos_offset().y])
    translate([0, - hanger_clip_rod_joint_pos_offset().x, 0])
    children();
}

module sim_hanger_rod(startline_mode = "basement", startline_l = startline_l) {
    sim_hanger_rod_transform(startline_mode=startline_mode, startline_l=startline_l)
    sim_startlights_hanger_rod();
}
