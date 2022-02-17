include <../../parameters.scad>
use <../../basement/values.scad>
use <../../../vendor/controller-box/src/parts/sim/box_bottom.scad>
use <../../../vendor/controller-box/src/parts/sim/box_top.scad>
use <../../../vendor/controller-box/src/parts/sim/box_side_slide.scad>
use <../../interparts/angle-traverse.scad>

module sim_basement_box_R() {

    angle_traverse_cut_x_translate()
    translate([traverse_l(),0,0])
    angle_traverse_cut_x_translate()

    translate([0,0,-ground_thick-fix2])
    translate([-basement_w()/2,-basement_l()/2,-basement_h()])
    union() {
        sim_box_bottom();
        sim_box_top();
        sim_box_side_slide();
    }
}