include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>
use <../../gate/joints/ct_slide.scad>
use <../../gate/joints/bar_wrapper.scad>
use <../../startlights/values.scad>

//use <../../gate/joints/print/ct_slide.scad>

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

module hanger_clip_generic() {
    hook_bar_thick = 5;//bar_wrapper_l;
    hook_bar_w = hanger_clip_junction_w;
    hook_l1 = 15;
    hook_l2 = 13;
    hook_inner_w = 5;
    hook_outer_w = hook_inner_w+hook_bar_w*2;
    hook_tilt = 5;

    module hook() {
        cube([hook_bar_w,hook_l1,hook_bar_thick]);

//        translate([-hook_inner_w,hook_l1-hook_bar_w,0])
//        cube([hook_inner_w,hook_bar_w,hook_bar_thick]);

        translate([hook_bar_w-hook_outer_w/2,hook_l1-fix,0])
        difference() {
            cylinder(d=hook_outer_w, h=hook_bar_thick);
            translate([0,0,-fix])
            cylinder(d=hook_inner_w, h=hook_bar_thick+fix*2);

            translate([-(hook_outer_w+fix*2)/2,-(hook_outer_w+fix*2),-fix])
            cube([hook_outer_w+fix*2, hook_outer_w+fix*2, hook_bar_thick+fix*2]);
        }

        translate([-hook_inner_w-hook_bar_w,hook_l1-hook_l2,0])
        translate([0,hook_l2,0])
        rotate([0,0,hook_tilt])
        translate([0,-hook_l2,0])
        cube([hook_bar_w,hook_l2,hook_bar_thick]);
    }


    hook();

    translate([
        0,
        -ct_slide_side,
        0
    ])
    ct_slide_c(l=hook_bar_thick);
}

module hanger_clip_junction(thick,w,l) {
    p=bar_wrapper_play;
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


module hanger_rod() {

    l=startlights_board_l();
    hook_offset = l/2-startlights_board_hole_x_offset();

    hanger_rod_ct_slide_transform()
    ct_slide_t(l=l);

    translate([hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook();

    translate([-hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook();

}

module hanger_rod_ct_slide_transform() {
    translate([startlights_board_l()/2,0,0])
    rotate([0,0,-90])
    rotate([90,0,0])
    children();
}

module hanger_rod_hook(
    d=hanger_rod_hook_d(),
    l=hanger_rod_hook_l
) {
    r=hanger_rod_hook_r;
    angle=hanger_rod_hook_angle;
    w = hanger_rod_hook_w;

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
}

function hanger_rod_hook_d() = startlights_board_hole_d()-hanger_rod_hook_play*2;


hanger_clip_generic();
