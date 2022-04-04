include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_block.scad>

module sim_basement_block_L() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_block(with_hole=false, with_groove=true);
}