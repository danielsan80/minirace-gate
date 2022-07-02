include <../../../../config/parameters.scad>
//use <../../../gate/modules/profile.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/angle-traverse.scad>
//use <../../../startlights/values.scad>

module sim_traverse(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    translate([0,0,upright_h])
        angle_traverse_cut_translate()
        traverse(startline_mode=startline_mode, startline_l=startline_l);
}
