include <../parameters.scad>
use <../modules/profile.scad>
use <../modules/bar.scad>
use <../modules/pylon.scad>
use <../interparts/angle-traverse.scad>
use <../joints/ct_slide.scad>


module traverse_transform() {
    rotate([0,90,0])
    translate([-pylon_side-bar_w/2,-pylon_side/2,play2])
    children();
}

module traverse_pylon(traverse_l=traverse_l()) {
    step = pylon_side*2+reinforcement_gap*2;
    l_ext = step*ceil(traverse_l/step)+pylon_side+reinforcement_gap+pylon_side;
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

module traverse_v_bars(side="left", traverse_l=traverse_l()) {
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

    traverse_side_transform(side=side, traverse_l=traverse_l)
    body();
}

module traverse_hooks(side="left", traverse_l=traverse_l()) {
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

    traverse_side_transform(side=side, traverse_l=traverse_l)
    body();
}

module traverse_main(traverse_l=traverse_l()) {
    traverse_pylon(traverse_l=traverse_l);
    traverse_v_bars(side="left", traverse_l=traverse_l);
    traverse_v_bars(side="right", traverse_l=traverse_l);
//    traverse_hooks(side="left", traverse_l=traverse_l);
//    traverse_hooks(side="right", traverse_l=traverse_l);
}

module traverse(traverse_l=traverse_l()) {

//    render()

    difference() {
        traverse_main(traverse_l=traverse_l);

        traverse_plate_cut(side="left", traverse_l=traverse_l);
        traverse_plate_cut(side="right", traverse_l=traverse_l);

        traverse_angle_joints_void(side="left", traverse_l=traverse_l);
        traverse_angle_joints_void(side="right", traverse_l=traverse_l);
    }

}
