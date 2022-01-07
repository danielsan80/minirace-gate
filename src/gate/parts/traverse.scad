include <../parameters.scad>
include <../modules/bar.scad>
include <../modules/pylon.scad>
include <../joints/angle-traverse.scad>
include <../joints/traverse-startlights.scad>
include <../modules/hook.scad>


module traverse_transform() {
    rotate([0,90,0])
    translate([-pylon_side-bar_w/2,-pylon_side/2,play2])
    children();
}

module traverse_pylon() {
    step = pylon_side+reinforcement_gap;
    l_ext = step*ceil(traverse_l/step)+pylon_side;
    l = traverse_l-play2*2;
    offset = (l_ext-l)/2;


    traverse_transform()
    intersection() {
        translate([0,0,-offset])
        pylon(l=l_ext);

        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot,a_lot,l]);
    }
}

module traverse_v_bar() {
    traverse_transform()
    rotate([0,90,0])
    translate([0,0,-profile_outer_w()/2])
    bar(l=pylon_side+profile_outer_w());
}

module traverse_v_bars(side="left") {
    module body() {
        difference() {
            union() {
                traverse_v_bar();

                translate([0,pylon_side,0])
                    traverse_v_bar();
            }

            translate([-a_lot+play2,-a_lot/2,-a_lot/2])
            cube([a_lot, a_lot, a_lot]);
        }
    }

    traverse_side_transform(side=side)
    body();
}

module traverse_hooks(side="left") {
    module body() {
        translate([traverse_l/2-traverse_hooks_intra_space_l/2,0,0])
        translate([0,-pylon_side/2-profile_outer_w()/2,0])
        translate([-traverse_hook_l,-traverse_hook_w-traverse_hook_thick,0])
        traverse_hook();

        translate([traverse_l/2+traverse_hooks_intra_space_l/2,0,0])
        translate([0,-pylon_side/2-profile_outer_w()/2,0])
        translate([0,-traverse_hook_w-traverse_hook_thick,0])
        traverse_hook();
    }

    traverse_side_transform(side=side)
    body();
}

module traverse_main() {
    traverse_pylon();
    traverse_v_bars(side="left");
    traverse_v_bars(side="right");
//    traverse_hooks(side="left");
//    traverse_hooks(side="right");
}

module traverse() {

//    render()
    angle_traverse_cut_translate()
    difference() {
        traverse_main();

        traverse_plate_cut(side="left");
        traverse_plate_cut(side="right");

        traverse_angle_joints_void(side="left");
        traverse_angle_joints_void(side="right");
    }


}

module sim_traverse_c_hook() {
    rotate([90,0,-90])
    translate([0,0,-bar_wrapper_l/2])
    bar_c_hook(l=bar_wrapper_l);
}

module traverse_c_stick() {
    bar_c_stick(l=board_l, hook_offset=board_hole_x_offset, hook_d=board_hole_d);
}

module sim_traverse_c_hooks() {

    translate([0,0,bar_w/2])
    translate([0,-pylon_side/2,0])
    translate([traverse_l/2,0,0])
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
    translate([traverse_l/2,0,0])
    angle_traverse_cut_translate()
    translate([0,0,upright_h])
    rotate([90,0,0])
    rotate([0,-90,0])
    translate([0,0,-board_l/2])
    traverse_c_stick();
}

module sim_traverse() {
    translate([0,0,upright_h])
    traverse();
}
