include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_groove.scad>
use <../../vendor/controller-box/src/parts/box_block.scad>

module basement_block(with_hole=false, with_groove=true) {
    difference() {
        translate([-basement_w()/2,-basement_l()/2,0])
        box_block();
        if (with_hole) {
            upright_base_hole();
        }
        if (with_groove) {
            translate([0,0,basement_h()])
            upright_base_groove();
        }
    }
}