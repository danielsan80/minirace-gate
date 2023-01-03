include <../../config/parameters.scad>
use <../interparts/box_bottom-box_side_slide.scad>
use <../interparts/box_bottom-box_top.scad>
use <../parts/box_bottom.scad>

module box_side_slide() {
    difference() {
        intersection() {
            box_bottom_complete();
            box_side_slide_shape(void=false);
        }
        box_startlights_side_hole_cut(void=true);
    }
}
