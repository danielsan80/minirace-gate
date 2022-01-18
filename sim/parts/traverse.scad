include <../../src/gate/parameters.scad>
use <../../src/gate/parts/traverse.scad>

module sim_traverse() {
    translate([0,0,upright_h])
        traverse();
}



module sim_traverse_c_hook() {
    rotate([90,0,-90])
        translate([0,0,-bar_wrapper_l/2])
            bar_c_hook(l=bar_wrapper_l);
}

module traverse_c_stick(with_supports=false) {
    bar_c_stick(l=board_l, hook_offset=board_hole_x_offset, hook_d=board_hole_d, with_supports=with_supports);
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
    translate([0,0,bar_w/2])
        translate([0,-pylon_side/2,0])
            translate([traverse_l()/2,0,0])
                angle_traverse_cut_translate()
                translate([0,0,upright_h])
                    traverse_c_stick();
}

