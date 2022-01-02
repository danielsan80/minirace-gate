include <../parameters.scad>
include <../modules/bar.scad>
include <../modules/pylon.scad>
include <../joints/upright-angle.scad>


module upright_base() {
    w = upright_base_w;
    l = upright_base_l;
    h = upright_base_h;

    r = 2;
    translate([-w/2,-l/2,0])
        minkowski() {
            cube([w, l, h]);
            cylinder(r=r, h= fix);
        }
}

module upright_counterfort(flip = false) {
    render()
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
    upright_base();

    translate([-pylon_side/2,-pylon_side/2,upright_base_h])
        pylon(l=upright_h-upright_base_h);

    upright_counterforts();
}
