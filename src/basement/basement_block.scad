include <../parameters.scad>
use <../basement/values.scad>
use <../../vendor/controller-box/src/parts/box_block.scad>

module basement_block() {
    translate([-basement_w()/2,-basement_l()/2,0])
    box_block();
}