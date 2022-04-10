include <../../config/parameters.scad>
use <../interparts/box_bottom-box_side_slide.scad>
use <../parts/box_bottom.scad>

module box_controller_side_slide() {
    intersection() {
        box_controller_bottom_complete();
        box_controller_side_slide_shape(void=false);
    }
}

module box_terminal_side_slide(box_terminal_outer_w=box_terminal_outer_w) {
    intersection() {
        box_terminal_bottom_complete(box_terminal_outer_w=box_terminal_outer_w);
        box_terminal_side_slide_shape(void=false, box_terminal_outer_w=box_terminal_outer_w);
    }
}

module box_side_slide(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    if (box=="controller") {
        box_controller_side_slide();
    }
    if (box=="terminal") {
        box_terminal_side_slide(box_terminal_outer_w=box_terminal_outer_w);
    }
}
