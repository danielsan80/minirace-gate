include <../../config/parameters.scad>
use <../../src/joint/ct_slide.scad>


module _hanger_clip_hook(
    l1 = hanger_clip_hook_l1,
    l2 = hanger_clip_hook_l2,
    inner_w = hanger_clip_hook_inner_w,
    tilt = hanger_clip_hook_tilt,
    hook_w = hanger_clip_w
) {
    hook_thick = hanger_clip_hook_thick;
    outer_w = inner_w + hook_thick * 2;
    
    cube([hook_thick, l1, hook_w]);
    
    translate([hook_thick - outer_w / 2, l1 - fix, 0])
    difference() {
        cylinder(d = outer_w, h = hook_w);
        translate([0, 0, - fix])
        cylinder(d = inner_w, h = hook_w + fix * 2);
        
        translate([- (outer_w + fix * 2) / 2, - (outer_w + fix * 2), - fix])
        cube([outer_w + fix * 2, outer_w + fix * 2, hook_w + fix * 2]);
    }
    
    translate([- inner_w - hook_thick, l1 - l2, 0])
    translate([0, l2, 0])
    rotate([0, 0, tilt])
    translate([0, - l2, 0])
    cube([hook_thick, l2, hook_w]);
}

module hanger_clip_c(w = hanger_clip_w) {
    ct_slide_c(w = w);
}

module hanger_clip(w = hanger_clip_w) {
    
    translate([0, ct_slide_pixel().y*5, 0])
    _hanger_clip_hook(hook_w = w);
    
    hanger_clip_c(w = w);
}

