include <../../../config/parameters.scad>
use <../../../src/joint/ct_slide.scad>


module ct_slide_t_supports(w) {
    side = ct_slide_side;
    x = side/4;
    y = side/5;
    
    translate([x,0,0])
    cube([layer_w,y-layer_h,w]);
    
    translate([x*2-layer_w,0,0])
    cube([layer_w,y-layer_h,w]);
    
    translate([x,0,0])
    cube([x*2-layer_w,layer_h,w]);
}

module print_ct_slide_t(w) {
    ct_slide_t(w=w);
    ct_slide_t_supports(w=w);
}
