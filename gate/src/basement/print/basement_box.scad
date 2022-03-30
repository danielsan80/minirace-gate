include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../../vendor/controller-box/src/parts/print/box_side_slide.scad>

module print_basement_box_bottom() {
    basement_box_bottom();
}

module print_basement_box_side_slide() {
    print_box_side_slide();
}

module print_basement_box_top(with_hole=true) {
    basement_box_top(with_hole=with_hole);
}
