include <../parameters.scad>
include <../modules/bar.scad>
include <../modules/pylon.scad>
include <../joints/angle-traverse.scad>
include <../joints/upright-angle.scad>

module angle_base() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;

    translate([-w/2,-w/2,0])
        minkowski() {
            cube([l, w, h]);
            cylinder(r=base_curvature_r, h=fix);
        }
}

module angle_pylon_main() {
    translate([0,0,-pylon_side-reinforcement_gap])
        pylon_main(l=80);
}

module angle_reinforcements1() {
    rotate([0,0,90])
        reinforcement();

    translate([pylon_side,0,0])
        rotate([0,0,180])
            reinforcement();

    translate([pylon_side,pylon_side,0])
        rotate([0,0,180])
            reinforcement();
}



module angle_reinforcements2() {
    side = pylon_side;
    gap = reinforcement_gap;
    translate([0,0,side+gap])
        union() {
            translate([0,side,0])
                rotate([0,0,-90])
                    reinforcement();

            translate([side,side,0])
                rotate([0,0,180])
                    reinforcement();

            translate([side,0,0])
                rotate([0,0,180])
                    reinforcement();

            translate([side,0,0])
                rotate([0,0,90])
                    reinforcement();

            translate([side,side,0])
                rotate([0,0,-90])
                    reinforcement();
        }
}

module angle_pylon() {
    angle_pylon_main();
    angle_reinforcements1();
    angle_reinforcements2();
}


module angle_bottom_cut() {
    translate([-angle_base_w/2-base_curvature_r,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
}



module angle() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;

    gap = reinforcement_gap;

    angle_base();

    //    angle_traverse_cut_translate()
    //    #traverse_plate_cut();

    //    #angle_traverse_cut();

    //    %translate([-pylon_side/2,-pylon_side/2,0])
    //    main();

    render()
        difference() {
            intersection() {

                translate([-pylon_side/2,-pylon_side/2,0])
                    translate([0,0,angle_base_h])
                        rotate([0,45,0])
                            angle_pylon();

                angle_bottom_cut();
            }
            angle_traverse_cut();
        }

    angle_traverse_cut_translate()
    angle_traverse_joints()

    translate([10,0,10])
        traverse();



}