include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_groove.scad>
use <../../vendor/controller-box/src/parts/box_bottom.scad>
use <../../vendor/controller-box/src/parts/box_top.scad>
use <../../vendor/controller-box/src/parts/box_side_slide.scad>
use <../gate/interparts/angle-traverse.scad>

module basement_box_bottom() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_bottom();
}

module basement_box_top(with_hole=true, with_groove=true) {
    difference() {
        translate([-basement_w()/2,-basement_l()/2,0])
        box_top();
        if (with_hole) {
            upright_base_hole();
        }
        if (with_groove) {
            rotate([0,180,0])
            upright_base_groove();
        }
    }
}

module basement_box_side_slide() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_side_slide();
}