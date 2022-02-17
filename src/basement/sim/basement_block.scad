include <../../parameters.scad>
use <../../basement/values.scad>
use <../../../vendor/controller-box/src/parts/sim/box_block.scad>

module sim_basement_block_L() {
    translate([0,0,-ground_thick-fix2])
    translate([-basement_w()/2,-basement_l()/2,-basement_h()])
    sim_box_block();
}