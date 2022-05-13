use <../../../gate/parts/ground.scad>
use <../../../gate/interparts/angle-traverse.scad>
use <../../../gate/interparts/sim/upright-transform.scad>

module sim_ground_L() {
    ground();
}

module sim_ground_R(mode="basement") {
    sim_upright_R_transform(mode=mode)
    ground();
}