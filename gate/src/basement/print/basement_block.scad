include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_block.scad>

module print_basement_block(with_hole=false) {
    basement_block(with_hole=with_hole);
}
