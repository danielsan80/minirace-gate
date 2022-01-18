include <../parameters.scad>
use <../functions.scad>
use <../modules/profile.scad>
use <../modules/bar.scad>
use <../modules/pylon.scad>
use <../interparts/ground-upright.scad>
use <../interparts/upright-angle.scad>
use <../interparts/angle-traverse.scad>


module upright_base() {
    w = upright_base_w;
    l = upright_base_l;
    h = upright_base_h;

    c=0.5;
    h2 = h*c;

    margin = 1;

    hole_side= pylon_side-base_curvature_r*2-profile_outer_w()-margin;

    module hole_profile() {
        minkowski() {
            cube([hole_side, hole_side, fix]);
            cylinder(r=base_curvature_r, h=fix);
        }
    }
    difference() {
        union() {
            translate([-w/2, -l/2, 0])
            minkowski() {
                cube([w, l, h]);
                cylinder(r = base_curvature_r, h = fix);
            }

            translate([-w/2 + h2, -l/2 + h2, h])
            minkowski() {
                cube([w-h2*2, l-h2*2, h2]);
                cylinder(r = base_curvature_r, h = fix);
            }
        }

        translate([-hole_side/2,-hole_side/2,-fix])
        minkowski() {
            cube([hole_side, hole_side, a_lot]);
            cylinder(r=base_curvature_r, h=fix);
        }

        upright_ground_joints_void();
    }

}

module upright_counterfort(flip = false) {
    translate([-pylon_side/2,-pylon_side-pylon_side/2,upright_base_h])
    rotate([0,0,flip?180:0])
    rotate([-45,0,0])
    rotate([0,0,90])
    bar_bottom_cut(l=hp(pylon_side), angle=-45)
    bar_top_cut(l=hp(pylon_side), offset=bar_cut_offset(w=bar_w))
    bar_ext(l=hp(pylon_side));
}

module upright_counterforts() {
    upright_counterfort();

    translate([pylon_side,0,0])
        upright_counterfort();

    translate([0,pylon_side*3])
        union() {
            upright_counterfort(flip=true);

            translate([pylon_side,0,0])
                upright_counterfort(flip=true);
        }
}

module upright() {
//    render()
    union() {
        upright_base();

        translate([-pylon_side/2,-pylon_side/2,upright_base_h])
        pylon(l=upright_h-upright_base_h);

        upright_counterforts();

        translate([0,0,upright_h])
        translate([-pylon_side/2,-pylon_side/2,0])
        upright_angle_joints();
    }
}

