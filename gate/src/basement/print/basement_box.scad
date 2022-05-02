include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../../vendor/controller-box/src/parts/print/box_side_slide.scad>

module print_basement_box_controller_bottom() {
    basement_box_controller_bottom();
}

module print_basement_box_controller_side_slide() {
    print_box_side_slide(box="controller");
}

module print_basement_box_controller_top(with_hole=true, with_groove=true) {
    basement_box_controller_top(with_hole=with_hole, with_groove=with_groove);
}

module print_basement_box_top_hole_cap() {
    basement_box_top_hole_cap();
}



module print_basement_box_terminal_bottom() {
    basement_box_terminal_bottom();
}

module print_basement_box_terminal_side_slide() {
    print_box_side_slide(box="terminal", box_terminal_outer_w=basement_box_terminal_w());
}

module print_basement_box_terminal_top(with_hole=true, with_groove=true) {
    basement_box_terminal_top(with_hole=with_hole, with_groove=with_groove);
}
