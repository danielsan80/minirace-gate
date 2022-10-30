include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_groove.scad>

module basement_block(with_hole=false, with_groove=true) {
    difference() {
        translate([-basement_block_w()/2,-basement_l()/2,0])
        cube([basement_block_w(), basement_l(),basement_h()]);
        if (with_hole) {
            upright_base_hole();
        }
        if (with_groove) {
            translate([0,0,basement_h()])
            upright_base_groove();
        }
    }
}