include <../parameters.scad>
include <../modules/profile.scad>
include <../modules/hook.scad>

module bar_c_junction(thick,w,l) {
    p=play2;
    translate([-w/2,-l-profile_outer_w()/2-p,0])
    cube([w,l,thick]);
}

module bar_c_hook(l=bar_wrapper_l) {
    junction_l = bar_c_junction_l;
    junction_w = bar_c_junction_w;
    p = play2;

    bar_wrapper();

    bar_c_junction(thick=l, w=junction_w, l=junction_l);


    translate([-c_joint_profile_side/2,-c_joint_profile_side-profile_outer_w()/2-p-junction_l,0])
    c_joint_outer(l=l);

}

module bar_c_stick_hook(d, l) {
    r=6;
    angle=30;
    w = 2;

    intersection() {
        union() {
            cylinder(d=d, h=l);

            translate([-r,0,l])
            rotate([90,0,0])
            rotate_extrude(angle=angle, convexity=10)
            translate([r,0])
            circle(d=d);
        }
        translate([-a_lot/2,-w/2,-a_lot/2])
        cube([a_lot,w,a_lot]);
    }
}

module bar_c_stick(l, hook_offset, hook_d) {
    junction_l = 4;
    junction_w = 2;
    p = play2;


    translate([-c_joint_profile_side/2,-c_joint_profile_side-profile_outer_w()/2-p-junction_l,0])
    union() {
        c_joint_inner(l=l);

        translate([c_joint_profile_side,c_joint_profile_side/2,hook_offset])
        rotate([-90,0,0])
        rotate([0,90,0])
        bar_c_stick_hook(d=3-play2*2, l=5);

        translate([c_joint_profile_side,c_joint_profile_side/2,l-hook_offset])
        rotate([-90,0,0])
        rotate([0,90,0])
        bar_c_stick_hook(d=3-play2*2, l=5);

    }

}
