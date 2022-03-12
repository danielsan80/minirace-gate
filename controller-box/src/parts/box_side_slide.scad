include <../parameters.scad>
use <../interparts/box_bottom-box_side_slide.scad>
use <../parts/box_bottom.scad>

module box_side_slide() {
    intersection() {
        box_bottom_complete();
        box_side_slide_shape(void=false);
    }
}
