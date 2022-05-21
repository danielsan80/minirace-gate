use <../../../gate/interparts/bolting-upright.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_upright_R_transform(mode="basement") {
    assert(mode=="basement" || mode=="upright" || mode=="center");

    angle_traverse_cut_x_translate()
    translate([traverse_l(mode=mode),0,0])
    angle_traverse_cut_x_translate()
    children();
}
