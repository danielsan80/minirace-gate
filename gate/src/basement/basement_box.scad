include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../../vendor/controller-box/src/parts/box_bottom.scad>
use <../../vendor/controller-box/src/parts/box_top.scad>
use <../../vendor/controller-box/src/parts/box_side_slide.scad>
use <../gate/interparts/angle-traverse.scad>

module basement_box_bottom() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_bottom();
}

module basement_box_top(with_hole=true) {
    difference() {
        translate([-basement_w()/2,-basement_l()/2,0])
        box_top();
        if (with_hole) {
            upright_base_hole();
        }
    }
}

module basement_box_side_slide() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_side_slide();
}