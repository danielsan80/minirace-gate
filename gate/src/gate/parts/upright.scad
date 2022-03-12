include <../../parameters.scad>
use <../../functions.scad>
use <../../gate/modules/profile.scad>
use <../../gate/modules/bar.scad>
use <../../gate/modules/pylon.scad>
use <../../gate/interparts/ground-upright.scad>
use <../../gate/interparts/upright-angle.scad>
use <../../gate/interparts/angle-traverse.scad>
use <../../gate/interparts/upright_base_hole.scad>
use <../../gate/interparts/upright_base_level1.scad>


module upright_base() {
    w = upright_base_w;
    l = upright_base_l;
    h = upright_base_h;

    c=0.5;
    h2 = h*c;

    difference() {
        union() {
            upright_base_level1();

            translate([-w/2 + h2, -l/2 + h2, h])
            minkowski() {
                cube([w-h2*2, l-h2*2, h2]);
                cylinder(r = base_curvature_r, h = fix);
            }
        }

        upright_base_hole();
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

function upright_h() = upright_h;

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

