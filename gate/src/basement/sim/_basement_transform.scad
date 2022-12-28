include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../gate/interparts/angle-traverse.scad>


//TRANSFORM

module _sim_basement_R_transform(startline_mode, startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    angle_traverse_cut_x_translate()
    translate([traverse_l(startline_mode=startline_mode, startline_l=startline_l),0,0])
    angle_traverse_cut_x_translate()
    children();
}

module _sim_on_basement_transform() {
    translate([0,0,fix2])
    translate([0,0,basement_h])
    children();
}
