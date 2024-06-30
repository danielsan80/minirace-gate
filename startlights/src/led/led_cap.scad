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

module led_cap_applier() {
    depth = 1;
    d = 10;
    h = 20;
    do = led_cap_dome_d+1.0;
    di = led_cap_dome_d+0.4;
    translate([0, 0, h/2+fix])
        cylinder(d=d, h=h/2);
    difference() {
        translate([0, 0, fix])
            cylinder(d=do, h=h);
        cylinder(d=di, h=depth);
        translate([0, 0, depth-fix])
            resize([di, di, led_cap_dome_h])
                _led_cap_dome();
    }
}
