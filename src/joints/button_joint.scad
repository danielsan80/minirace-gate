include <../parameters.scad>

module button_joint_ring(r, h, ring_r) {
    translate([0,0,h-ring_r])
    rotate_extrude(angle=360, convexity=10)
    translate([r,0])
    circle(r=ring_r);
}

module button_joint_outer_fillet(r, fillet_r) {
    rotate_extrude(angle=360, convexity=10)
    translate([r,0])
    difference() {
        square([fillet_r, fillet_r]);

        translate([fillet_r, fillet_r])
            circle(r = fillet_r);
    }
}

module button_joint_body(r, h, ring_r, fillet_r) {
    cylinder(r=r, h=h);
    button_joint_ring(r, h, ring_r);
    button_joint_outer_fillet(r-fix, fillet_r);
}

module button_joint_hole(r, h, t, fillet_r) {
    translate([0,0,-fix])
    union() {
        translate([0,0,fillet_r])
        cylinder(r1=r-t, r2=r-t/3*2, h=h-fillet_r+fix*2);

        cylinder(r=r-t, h=fillet_r+fix);
    }
}

module button_joint_inner_fillet(r, t, fillet_r) {
    rotate_extrude(angle=360, convexity=10)
    translate([r-t,0,0])
    difference() {
        translate([-fillet_r, 0])
        square([fillet_r, fillet_r]);

        translate([-fillet_r, fillet_r])
        circle(r = fillet_r);
    }
}

module button_joint_channel(w, offset) {
    translate([-w/2,-a_lot/2,offset])
    cube([w, a_lot, a_lot]);
}

module button_joint(r=3, h=6) {
    ring_r = 0.3;
    w = 0.5;
    t = 1.2;
    channel_offset = 1;

    fillet_r = 0.5;

    difference() {
        union() {
            difference() {
                button_joint_body(r, h, ring_r, fillet_r);
                button_joint_hole(r, h, t, fillet_r);
            }

            button_joint_inner_fillet(r, t, fillet_r);
        }

        button_joint_channel(w, channel_offset);

//        rotate([0,0,90])
//        button_joint_channel(w, channel_offset);
    }
}


module button_joint_void(r=3, h=6) {
    ring_r = 0.3;

    fillet_r = 0.5;
    p = play2;

    cylinder(r=r+p, h=h+p);
    button_joint_ring(r+p, h+p, ring_r+p);
    button_joint_outer_fillet(r+p-fix, fillet_r+p);
}

//difference() {
//    c=0.2;
//
//    translate([-10,-10,0])
//    cube([20,20,20]);
//
//    translate([0,0,-fix])
//    button_joint_void(r=bar_w/2-c, h=upright_angle_joint_h);
//
//}

//button_joint();
