include <../../config/parameters.scad>

module keep(l, with_wall=true, with_hold=true) {

    cube([l,keep_w,keep_h]);

    if (with_wall) {
        translate([0,-keep_wall_thick,0])
        cube([l, keep_wall_thick, keep_h+keep_card_thick+keep_hold_r*2]);
    }

    if (with_hold) {
        translate([0,0,keep_h+keep_card_thick+keep_hold_r])
        translate([0,0,0])
        minkowski() {
            cube([l, fix, fix]);
            rotate([0,90,0])
            cylinder(r=keep_hold_r, h=fix, center=true);
        }
    }

}