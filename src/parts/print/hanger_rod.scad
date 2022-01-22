include <../../parameters.scad>
use <../../modules/profile.scad>
use <../../joints/ct_slide.scad>
use <../../joints/bar_wrapper.scad>
use <../../startlights/values.scad>
use <../../parts/hanger.scad>

use <../../joints/print/ct_slide.scad>

module print_hanger_rod() {
    l=startlights_board_l();
    hook_offset = l/2-startlights_board_hole_x_offset();

    hanger_rod();

    hanger_rod_ct_slide_transform()
    ct_slide_t_supports(l=l);

    translate([hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook_support();

    translate([-hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook_support();
}

