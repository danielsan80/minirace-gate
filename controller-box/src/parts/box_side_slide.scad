include <../../config/parameters.scad>
use <../interparts/box_bottom-box_side_slide.scad>
use <../interparts/box_bottom-box_top.scad>
use <../parts/box_bottom.scad>

//module box_terminal_side_slide(box_terminal_outer_w=box_terminal_outer_w) {
////    intersection() {
////        box_terminal_bottom_complete(box_terminal_outer_w=box_terminal_outer_w);
////        box_terminal_side_slide_shape(void=false, box_terminal_outer_w=box_terminal_outer_w);
////    }
//}

module box_side_slide() {
    difference() {
        intersection() {
            box_bottom_complete();
            box_side_slide_shape(void=false);
        }
        box_controller_startlights_side_hole_cut(void=true);
    }
}
