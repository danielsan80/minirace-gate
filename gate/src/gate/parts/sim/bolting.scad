include <../../../../config/parameters.scad>
use <../../../gate/parts/bolting.scad>
//use <../../../gate/interparts/angle-traverse.scad>
use <../../../gate/interparts/sim/upright-transform.scad>

module sim_bolting_L() {
    bolting();
}

module sim_bolting_R(startline_mode="basement", startline_l=startline_l) {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    sim_upright_R_transform(startline_mode=startline_mode, startline_l=startline_l)
    bolting();
}