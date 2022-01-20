include <../../parameters.scad>
use <../../modules/profile.scad>
use <../../parts/traverse.scad>
use <../../interparts/angle-traverse.scad>
use <../../interparts/traverse-startlights.scad>
use <../../startlights/values.scad>

module sim_traverse() {
    translate([0,0,upright_h])
        angle_traverse_cut_translate()
        traverse();
}

module sim_traverse_c_hook() {
    rotate([90,0,-90])
        translate([0,0,-bar_wrapper_l/2])
            bar_c_hook(l=bar_wrapper_l);
}

module traverse_c_stick(with_supports=false) {
    bar_c_stick(l=startlights_board_l(), hook_offset=startlights_board_hole_x_offset(), hook_d=startlights_board_hole_d(), with_supports=with_supports);
}

module sim_traverse_c_hooks() {

    translate([0,0,bar_w/2])
        translate([0,-pylon_side/2,0])
            translate([traverse_l()/2,0,0])
                angle_traverse_cut_translate()
                translate([0,0,upright_h])
                    union() {
                        translate([pylon_side+reinforcement_gap,0,0])
                            sim_traverse_c_hook();
                        translate([-pylon_side-reinforcement_gap,0,0])
                            sim_traverse_c_hook();
                    }
}

module sim_traverse_c_stick() {
    p = play2;

    translate([0,0,bar_w/2])
    translate([0,-pylon_side/2,0])
    translate([traverse_l()/2,0,0])
    angle_traverse_cut_translate()
    translate([0,0,upright_h])
    translate([0,c_joint_profile_side/2,0])
    translate([0,0,-c_joint_profile_side-profile_outer_w()/2-p-bar_c_junction_l])
    traverse_c_stick();
}

