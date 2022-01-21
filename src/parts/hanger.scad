
//WIP unused

module hanger_rod() {
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

module hanger_clip_bar_wrapper() {

}

module hanger_clip_junction() {

}

module hanger_clip_ct_slide_c() {

}

module hanger_clip() {

}

module hanger_rod_hook() {

}

module hanger_rod_ct_slide_t() {

}

