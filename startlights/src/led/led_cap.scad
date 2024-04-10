include <../../config/parameters.scad>

module _led_cap_dome() {
    cylinder(d=led_cap_dome_d, h=led_cap_dome_h);
}

module _led_cap_clip() {

    difference() {
        union() {
            cylinder(d=led_cap_dome_d, h=led_cap_foot_h);
            cylinder(d=led_cap_leg_d_outer, h=led_cap_clip_h);
        }
        translate([0, 0, -fix])
        cylinder(d=led_cap_leg_d_inner, h=led_cap_clip_h);
    }
    
}

module led_cap() {
    _led_cap_dome();
    translate([0, 0, -led_cap_clip_h])
    _led_cap_clip();
}
