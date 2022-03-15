use <../../../gate/parts/ground.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_ground_L() {
    ground();
}

module sim_ground_R(mode="basement") {
    angle_traverse_cut_x_translate()
    translate([traverse_l(mode=mode),0,0])
    angle_traverse_cut_x_translate()
    ground();
}