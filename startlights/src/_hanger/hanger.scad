include <../../config/parameters.scad>
use <../../src/_joint/ct_slide.scad>


module _hanger_clip_junction(thick,w,l) {
    p=bar_wrapper_play;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}

module hanger_clip(w=hanger_clip_w) {
//    bar_wrapper();
    
    hanger_clip_junction(thick=w, w=hanger_clip_junction_w, l=hanger_clip_junction_l);
    
    translate([
        hanger_clip_ct_slide_pos_x_offset(),
        hanger_clip_ct_slide_pos_y_offset(),
        0
    ])
    ct_slide_c(w=w);
}

module hanger_clip_junction(thick,w,l) {
    p=bar_wrapper_play;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}