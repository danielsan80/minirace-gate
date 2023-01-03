include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>
use <../../startlights/values.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/interparts/uprights_distance.scad>



module sim_startlights_transform(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    translate([0,0,-profile_w_diff()/2-bar_wrapper_play-hanger_clip_junction_l-ct_slide_side/2])
    translate([0,0,startlights_board_margin()+startlights_board_hole_offset().y])
    translate([0,-startlights_board_thick()-startlights_board_startlights_gap(),0])
    translate([0,-pylon_side/2-ct_slide_side/2,0])
    translate([0,0,upright_h+angle_traverse_pos_z_offset()-startlights_startlights_height()])
    translate([(uprights_distance(startline_mode=startline_mode, startline_l=startline_l)-startlights_startlights_length())/2,0,0])
    rotate([90,0,0])
    children();
}
