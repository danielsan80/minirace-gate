include <../parameters.scad>
use <../modules/profile.scad>
use <../joints/ct_slide.scad>
use <../joints/bar_wrapper.scad>
use <../startlights/values.scad>

use <../joints/print/ct_slide.scad>

module hanger_clip(l=bar_wrapper_l) {
    bar_wrapper();

    hanger_clip_junction(thick=l, w=hanger_clip_junction_w, l=hanger_clip_junction_l);

    translate([
        hanger_clip_ct_slide_pos_x_offset(),
        hanger_clip_ct_slide_pos_y_offset(),
        0
        ])
        ct_slide_c(l=l);
}


module hanger_clip_junction(thick,w,l) {
    p=play2;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}


function hanger_clip_ct_slide_pos_x_offset() =
    -ct_slide_side/2
;

function hanger_clip_ct_slide_pos_y_offset() =
    -ct_slide_side
    -profile_outer_w()/2
    -bar_wrapper_play
    -hanger_clip_junction_l
;


module hanger_rod(with_supports=false) {

    l=startlights_board_l();
    hook_offset = l/2-startlights_board_hole_x_offset();

    if (with_supports) {
        hanger_rod_ct_slide_transform()
        print_ct_slide_t(l=l);
    } else {
        hanger_rod_ct_slide_transform()
        ct_slide_t(l=l);
    }

    translate([hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook(with_supports=with_supports);

    translate([-hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook(with_supports=with_supports);

}

module hanger_rod_ct_slide_transform() {
    translate([startlights_board_l()/2,0,0])
    rotate([0,0,-90])
    rotate([90,0,0])
    children();
}

module hanger_rod_hook(
    d=hanger_rod_hook_d(),
    l=hanger_rod_hook_l,
    with_supports=false
) {
    r=6;
    angle=30;
    w = 2;

//    translate([ct_slide_side,ct_slide_side/2,0])
//        rotate([-90,0,0])
//            rotate([0,90,0])
    translate([0,0,ct_slide_side/2])
    rotate([90,0,0])
    intersection() {
        union() {
            cylinder(d=d, h=l);

            rotate([0,0,-90])
            translate([-r,0,l])
            rotate([90,0,0])
            rotate_extrude(angle=angle, convexity=10)
            translate([r,0])
            circle(d=d);
        }
        translate([-w/2, -a_lot/2,-a_lot/2])
        cube([w,a_lot,a_lot]);
    }

    if (with_supports) {
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
}


function hanger_rod_hook_d() = startlights_board_hole_d()-hanger_rod_hook_play*2;



