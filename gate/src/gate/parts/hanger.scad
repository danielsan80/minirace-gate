include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>
use <../../gate/joints/ct_slide.scad>
use <../../gate/joints/bar_wrapper.scad>
use <../../startlights/values.scad>
use <../../startlights/hanger.scad>

module _hanger_clip_junction(thick,w,l) {
    translate([0,-bar_wrapper_offset(),0])
    translate([-w/2,-l,0])
    cube([w,l,thick]);
}

function hanger_clip_rod_joint_pos_offset() = [
    -startlights_hanger_clip_rod_joint_pixel().x*4/2,
    
    -startlights_hanger_clip_rod_joint_pixel().y*5
    -bar_wrapper_offset()
    -hanger_clip_junction_l
];


module hanger_clip(l=bar_wrapper_l) {
    bar_wrapper();

    _hanger_clip_junction(thick=l, w=hanger_clip_junction_w, l=hanger_clip_junction_l);

    translate([
        hanger_clip_rod_joint_pos_offset().x,
        hanger_clip_rod_joint_pos_offset().y,
        0
        ])
        startlights_hanger_clip_c(w=l);
}
