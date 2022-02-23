include <../parameters.scad>
use <../basement/values.scad>
use <../interparts/upright_base_hole.scad>
use <../../vendor/controller-box/src/parts/box_block.scad>

module basement_block(with_hole=false) {
    difference() {
        translate([-basement_w()/2,-basement_l()/2,0])
        box_block();
        if (with_hole) {
            upright_base_hole();
        }
    }
}