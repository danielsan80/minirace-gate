include <../../../../config/parameters.scad>
use <../../../gate/joints/ct_slide.scad>


module ct_slide_t_supports(l) {
    side = ct_slide_side;
    x = side/4;
    y = side/5;

    translate([x,0,0])
        cube([layer_w,y-layer_h,l]);

    translate([x*2-layer_w,0,0])
        cube([layer_w,y-layer_h,l]);

    translate([x,0,0])
        cube([x*2-layer_w,layer_h,l]);
}

module print_ct_slide_t(l) {
    ct_slide_t(l=l);
    ct_slide_t_supports(l=l);
}