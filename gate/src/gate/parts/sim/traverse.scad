include <../../../../config/parameters.scad>
use <../../../gate/modules/profile.scad>
use <../../../gate/parts/traverse.scad>
use <../../../gate/interparts/angle-traverse.scad>
use <../../../startlights/values.scad>

module sim_traverse(mode="basement") {
    translate([0,0,upright_h])
        angle_traverse_cut_translate()
        traverse(mode=mode);
}
