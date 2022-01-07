include <../parameters.scad>
include <../modules/bar.scad>

module traverse_hook(l=traverse_hook_l, w=traverse_hook_w, thick=traverse_hook_thick) {

    cube([l,w+thick*2,thick]);

    cube([l,thick, w+thick]);

    translate([0,w+thick,0])
    cube([l,thick, w+thick]);
}


module bar_wrapper(l=bar_wrapper_l, thick=bar_wrapper_thick) {
    difference() {
        minkowski() {
            bar(l=l);
            cylinder(r=thick+play2, h=fix);
        }
        minkowski() {
            translate([0,0,-fix])
            bar(l=l+fix*2);
            cylinder(r=play2, h=fix);
        }
        translate([-a_lot,-bar_w/2,-fix])
        cube([a_lot,bar_w,l+fix*2]);
    }

}

//bar_wrapper();

module c_joint_inner_profile() {
    side = c_joint_profile_side;
    x = side/4;
    y = side/5;

    polygon([
        [x,y],
        [x,y*4],
        [x*2,y*4],
        [x*2,y*3],
        [x*3,y*3],
        [x*3,y*5],
        [x*4,y*5],
        [x*4,0],
        [x*3,0],
        [x*3,y*2],
        [x*2,y*2],
        [x*2,y*1],

    ]);
}

module c_joint_outer_profile() {

    side = c_joint_profile_side;
    x = side/4;
    y = side/5;
    p = play2;

    difference() {
        square([x*4,y*5]);
        minkowski() {
            c_joint_inner_profile();

            translate([-p, -p])
            square([p*2, p*2]);
        }

    }
}

module c_joint_inner(l) {
    linear_extrude(l)
    c_joint_inner_profile();
};

module c_joint_outer(l) {
    linear_extrude(l)
    c_joint_outer_profile();
};
