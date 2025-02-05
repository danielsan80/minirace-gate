include <../../config/parameters.scad>

module _led_cap_dome() {
    h1 = 0.50;
    h2 = led_cap_dome_h-h1;
    cylinder(d=led_cap_dome_d, h=h1);
    translate([0, 0, h1])
    resize([led_cap_dome_d, led_cap_dome_d, h2*2])
    sphere(d=led_cap_dome_d, $fn=100);
}

module _led_cap_leg() {
    cylinder(d=led_cap_leg_d, h=led_cap_leg_h);
}

module led_cap() {
    _led_cap_dome();
    translate([0, 0, -led_cap_leg_h])
    _led_cap_leg();
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
