include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_level1.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_groove.scad>
use <../gate/interparts/basement_upright_margin.scad>
use <../../vendor/controller-box/src/parts/box_bottom.scad>
use <../../vendor/controller-box/src/parts/box_top.scad>
use <../../vendor/controller-box/src/parts/box_side_slide.scad>
use <../gate/interparts/angle-traverse.scad>


function _basement_center_x_offset() = -(basement_box_w()-upright_base_level1_w())/2+basement_upright_margin();

module basement_box_bottom() {
    translate([-basement_box_w()/2-_basement_center_x_offset(),-basement_l()/2,0])
    box_bottom();
}

module basement_box_top(with_hole=true, with_groove=true) {
    difference() {
        translate([-basement_box_w()/2+_basement_center_x_offset(),-basement_l()/2,0])
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
    translate([-basement_box_w()/2-_basement_center_x_offset(),-basement_l()/2,0])
    box_side_slide();
}