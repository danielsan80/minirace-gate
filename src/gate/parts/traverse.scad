include <../parameters.scad>
include <../modules/bar.scad>
include <../modules/pylon.scad>
include <../joints/angle-traverse.scad>


module traverse_transform() {
    rotate([0,90,0])
        translate([-pylon_side-bar_w/2,-pylon_side/2,play])
            children();
}

module traverse_pylon() {
    traverse_transform()
    pylon(l=traverse_l);
}

module traverse_v_bar() {
    traverse_transform()
    rotate([0,90,0])
    translate([0,0,-profile_outer_w()/2])
    bar(l=pylon_side+profile_outer_w());
}

module traverse_v_bars() {
    p = 0.15;
    difference() {
        union() {
            traverse_v_bar();

            translate([0,pylon_side,0])
                traverse_v_bar();
        }

        translate([-a_lot+p,-a_lot/2,-a_lot/2])
            cube([a_lot, a_lot, a_lot]);
    }
}


module traverse_main() {
    traverse_pylon();
    traverse_v_bars();
}

module traverse() {

    angle_traverse_cut_translate()
    difference() {
        traverse_main();

        traverse_plate_cut();
        traverse_angle_joints_void();
    }
}
