include <../../../parameters.scad>

use <../../../gate/parts/upright.scad>
use <../../../gate/interparts/angle-traverse.scad>

module sim_upright_L() {
    upright();
}

module sim_upright_R() {
    angle_traverse_cut_x_translate()
    translate([traverse_l(),0,0])
        angle_traverse_cut_x_translate()
        upright();
}
