use <../../../gate/parts/ground.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_ground_L() {
    ground();
}

module sim_ground_R() {
    angle_traverse_cut_x_translate()
    translate([traverse_l(mode="basement"),0,0])
    angle_traverse_cut_x_translate()
    ground();
}