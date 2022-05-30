use <../../../gate/interparts/bolting-upright.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_upright_R_transform(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    angle_traverse_cut_x_translate()
    translate([traverse_l(startline_mode=startline_mode, startline_l=startline_l),0,0])
    angle_traverse_cut_x_translate()
    children();
}
