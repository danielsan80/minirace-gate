include <../../../config/parameters.scad>
use <../../parts/box_side_slide.scad>

module print_box_side_slide() {
    translate([0,0,-box_bottom_base_thick])
    box_side_slide();
};
