include <../../../../config/parameters.scad>
use <../../../gate/modules/profile.scad>
use <../../../gate/joints/ct_slide.scad>
use <../../../gate/joints/bar_wrapper.scad>
use <../../../startlights/values.scad>
use <../../../gate/parts/hanger.scad>

use <../../../gate/joints/print/ct_slide.scad>

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


module hanger_rod_hook_support(
d=hanger_rod_hook_d(),
l=hanger_rod_hook_l
) {
    r=hanger_rod_hook_r;
    angle=hanger_rod_hook_angle;
    w = hanger_rod_hook_w;

    support_l = l+sin(angle)*(r+d/2);
    difference() {
        union() {
            translate([0,-support_l,0])
            translate([-layer_w/2,0,0])
            cube([
                layer_w,
                support_l-layer_w,
                ct_slide_side/2-d/2+((r+d/2)-cos(angle)*(r+d/2))
            ]);

            translate([0,-support_l])
            translate([-6/2,0,0])
            cube([
                6,
                l+sin(angle)*(r+d/2)- layer_w,
                layer_h
            ]);
        }
        hanger_rod_hook(d=d+layer_h*2,l=l);
    }
}

