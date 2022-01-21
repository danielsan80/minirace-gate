include <../parameters.scad>
use <../modules/profile.scad>
use <../joints/ct_slide.scad>
use <../joints/print/ct_slide.scad>
use <../joints/bar_wrapper.scad>
use <../startlights/values.scad>

module bar_c_junction(thick,w,l) {
    p=play2;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}

module bar_c_hook(l=bar_wrapper_l) {
    junction_l = bar_c_junction_l;
    junction_w = bar_c_junction_w;
    p = play2;

    bar_wrapper();

    bar_c_junction(thick=l, w=junction_w, l=junction_l);


    translate([-ct_slide_side/2,-ct_slide_side-profile_outer_w()/2-p-junction_l,0])
    ct_slide_c(l=l);

}

module bar_c_stick_hook(d, l, with_supports=false) {
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
            bar_c_stick_hook(d=d+layer_h*2,l=l);
        }
    }
}

module bar_c_stick(l, hook_offset, hook_d, with_supports=false) {
    junction_l = bar_c_junction_l;
    junction_w = bar_c_junction_w;
    p = hanger_rod_hook_play;


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
        bar_c_stick_hook(d=startlights_board_hole_d()-p*2, l=5, with_supports=with_supports);

        translate([0,0,l-hook_offset])
        bar_c_stick_hook(d=startlights_board_hole_d()-p*2, l=5, with_supports=with_supports);
    }

}
