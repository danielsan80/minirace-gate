include <../parameters.scad>
use <../modules/profile.scad>
use <../joints/ct_slide.scad>
use <../joints/print/ct_slide.scad>
use <../joints/bar_wrapper.scad>
use <../startlights/values.scad>

module hanger_clip_junction(thick,w,l) {
    p=play2;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}

function hanger_clip_ct_slide_pos_y_offset() =
    -ct_slide_side
    -profile_outer_w()/2
    -bar_wrapper_play
    -hanger_clip_junction_l
;

function hanger_clip_ct_slide_pos_x_offset() =
    -ct_slide_side/2
;

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

function hanger_rod_hook_d() = startlights_board_hole_d()-hanger_rod_hook_play*2;

module hanger_rod_hook(d=hanger_rod_hook_d(), l=hanger_rod_hook_l, with_supports=false) {
    r=6;
    angle=30;
    w = 2;

    translate([ct_slide_side,ct_slide_side/2,0])
    rotate([-90,0,0])
    rotate([0,90,0])
    intersection() {
        union() {
            cylinder(d=d, h=l);

            translate([-r,0,l])
            rotate([90,0,0])
            rotate_extrude(angle=angle, convexity=10)
            translate([r,0])
            circle(d=d);
        }
        translate([-a_lot/2,-w/2,-a_lot/2])
        cube([a_lot,w,a_lot]);
    }

    if (with_supports) {
        difference() {
            union() {
                translate([ct_slide_side+layer_w,0,-layer_w/2])
                cube([
                    l+sin(angle)*(r+d/2)- layer_w,
                    ct_slide_side/2-d/2+((r+d/2)-cos(angle)*(r+d/2)),
                    layer_w
                ]);

                translate([ct_slide_side+layer_w,0,-6/2])
                cube([
                    l+sin(angle)*(r+d/2)- layer_w,
                    layer_h,
                    6
                ]);

            }
            hanger_rod_hook(d=d+layer_h*2,l=l);
        }
    }
}

module hanger_rod(l=startlights_board_l(), hook_offset=startlights_board_hole_x_offset(), hook_d=startlights_board_hole_d(), with_supports=false) {

    translate([startlights_board_l()/2,0,0])
    rotate([0,0,-90])
    rotate([90,0,0])
    union() {
        if (with_supports) {
            print_ct_slide_t(l=l);
        } else {
            ct_slide_t(l=l);
        }

        translate([0,0,hook_offset])
        hanger_rod_hook(with_supports=with_supports);

        translate([0,0,l-hook_offset])
        hanger_rod_hook(with_supports=with_supports);
    }

}
