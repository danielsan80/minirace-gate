include <../../../../config/parameters.scad>

use <../../../gate/parts/upright.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_upright_L() {
    upright();
}

module sim_upright_R(mode="basement") {
    angle_traverse_cut_x_translate()
    translate([traverse_l(mode=mode),0,0])
        angle_traverse_cut_x_translate()
        upright();
}
