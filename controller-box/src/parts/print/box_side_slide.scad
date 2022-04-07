include <../../../config/parameters.scad>
use <../../parts/box_side_slide.scad>

module print_box_side_slide() {
    translate([0,0,-box_bottom_base_thick])
    box_side_slide();

//    support_l = antenna_hole_w-layer_w*2;
//
//    color("red")
//    translate([0,box_wall_thick+box_inner_l-support_l-antenna_side_margin-card_play+antenna_play-layer_w,0])
//    cube([layer_w,support_l,layer_h*2]);
};
