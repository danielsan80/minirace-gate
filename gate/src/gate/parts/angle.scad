include <../../parameters.scad>
use <../../gate/modules/profile.scad>
use <../../gate/modules/bar.scad>
use <../../gate/modules/pylon.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/interparts/upright-angle.scad>
use <../../gate/parts/angle.scad>

module angle_base() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;
    h2 = h*angle_base_h2_c;

    hole_w= pylon_side-base_curvature_r*2-profile_outer_w()-base_hole_margin;
    hole_l= pylon_side-bar_w-h;

    module hole_profile() {
        minkowski() {
            cube([hole_l, hole_w, fix]);
            cylinder(r=base_curvature_r, h=fix);
        }
    }

    difference() {
        union() {
            translate([-w/2,-w/2,0])
            minkowski() {
                cube([l, w, h]);
                cylinder(r=base_curvature_r, h=fix);
            }

            translate([-w/2+h2,-w/2+h2,h])
            minkowski() {
                cube([l-h2*2, w-h2*2, h2]);
                cylinder(r=base_curvature_r, h=fix);
            }
        }

        translate([-hole_l/2,-hole_w/2,-fix])
        hull() {
            translate([h+h2+fix,0,h+h2+fix])
            hole_profile();
            hole_profile();
        }
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
    translate([-angle_base_w/2-base_curvature_r,-a_lot/2,angle_base_h])
        cube([a_lot,a_lot,a_lot]);
}



module angle() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;

    gap = reinforcement_gap;


//    render()
    union() {
        difference() {
            union() {
                angle_base();

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

            }

            translate([- pylon_side / 2, - pylon_side / 2, - fix])
            upright_angle_joints_void();
        }

        //    angle_traverse_cut_translate()
        //    #traverse_plate_cut();

        //    #angle_traverse_cut();

        //    %translate([-pylon_side/2,-pylon_side/2,0])
        //    main();

        angle_traverse_cut_translate()
        angle_traverse_joints();
    }
}

