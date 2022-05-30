include <../../../config/parameters.scad>
use <../../gate/modules/profile.scad>
use <../../gate/modules/bar.scad>
use <../../gate/modules/pylon.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/joints/ct_slide.scad>


module traverse_transform() {
    rotate([0,90,0])
    translate([-pylon_side-bar_w/2,-pylon_side/2,traverse_play])
    children();
}



module traverse_pylon(startline_mode="basement") {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    traverse_l = traverse_l(startline_mode=startline_mode);
    step = pylon_side*2+reinforcement_gap*2;
    l_ext = step*ceil(traverse_l/step)+pylon_side+reinforcement_gap+pylon_side;
    l = traverse_l-traverse_play*2;
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

module traverse_h_bar() {
    traverse_transform()
    rotate([-90,0,0])
    bar(l=pylon_side);
}

module traverse_v_bars(side="left", startline_mode="basement") {
    assert(side=="left" || side=="right");
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    module body() {
        difference() {
            union() {
                traverse_v_bar();

                translate([0,pylon_side,0])
                traverse_v_bar();

                traverse_h_bar();

                translate([0,0,-pylon_side])
                traverse_h_bar();
            }

            translate([-a_lot+traverse_play,-a_lot/2,-a_lot/2])
            cube([a_lot, a_lot, a_lot]);
        }
    }

    traverse_side_transform(side=side, startline_mode=startline_mode)
    body();
}

module traverse_hooks(side="left", startline_mode="basement") {
    assert(side=="left" || side=="right");
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    traverse_l = traverse_l(startline_mode=startline_mode);
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

    traverse_side_transform(side=side, startline_mode=startline_mode)
    body();
}

module traverse_main(startline_mode="basement") {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    traverse_pylon(startline_mode=startline_mode);
    traverse_v_bars(side="left", startline_mode=startline_mode);
    traverse_v_bars(side="right", startline_mode=startline_mode);
//    traverse_hooks(side="left", startline_mode=startline_mode);
//    traverse_hooks(side="right", startline_mode=startline_mode);
}

module traverse(startline_mode="basement") {
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center");

    difference() {
        traverse_main(startline_mode=startline_mode);

        traverse_plate_cut(side="left", startline_mode=startline_mode);
        traverse_plate_cut(side="right", startline_mode=startline_mode);

        traverse_angle_joints_void(side="left", startline_mode=startline_mode);
        traverse_angle_joints_void(side="right", startline_mode=startline_mode);
    }

}
