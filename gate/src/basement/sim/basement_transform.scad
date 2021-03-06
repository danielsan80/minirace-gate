include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../gate/interparts/angle-traverse.scad>


//TRANSFORM

module sim_basement_box_R_tranform(startline_mode, startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    angle_traverse_cut_x_translate()
    translate([traverse_l(startline_mode=startline_mode, startline_l=startline_l),0,0])
    angle_traverse_cut_x_translate()
    children();
}

module sim_on_basement_transform() {
    translate([0,0,fix2])
    translate([0,0,basement_h()])
    children();
}

module sim_basement_box_top_transform() {
    translate([0,0,basement_h()])
    rotate([0,180,0])
    children();
}

module sim_basement_box_top_hole_cap_transform() {
    translate([0,0,box_top_base_thick()+fix*2])
    sim_basement_box_top_transform()
    children();
}

module sim_basement_bolting_guide_transform() {
    translate([0,0,basement_bolting_guide_thick+fix])
    sim_basement_box_top_transform()
    rotate([0,0,180])
    children();
}