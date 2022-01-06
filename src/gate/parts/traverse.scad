include <../parameters.scad>
include <../modules/bar.scad>
include <../modules/pylon.scad>
include <../joints/angle-traverse.scad>


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


module traverse_main() {
    traverse_pylon();
    traverse_v_bars(side="left");
    traverse_v_bars(side="right");
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

module sim_traverse() {
    translate([0,0,upright_h])
    traverse();
}
