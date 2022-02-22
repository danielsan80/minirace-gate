include <../parameters.scad>
use <../basement/values.scad>
use <../../vendor/controller-box/src/parts/box_bottom.scad>
use <../../vendor/controller-box/src/parts/box_top.scad>
use <../../vendor/controller-box/src/parts/box_side_slide.scad>
use <../interparts/angle-traverse.scad>

module basement_box_bottom() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_bottom();
}

module basement_box_top() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_top();
}

module basement_box_side_slide() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_side_slide();
}