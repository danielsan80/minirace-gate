use <../../../gate/parts/bolting.scad>
use <../../../gate/interparts/angle-traverse.scad>
use <../../../gate/interparts/sim/upright-transform.scad>

module sim_bolting_L() {
    bolting();
}

module sim_bolting_R(mode="basement") {
    assert(mode=="basement" || mode=="upright" || mode=="center");

    sim_upright_R_transform(mode=mode)
    bolting();
}