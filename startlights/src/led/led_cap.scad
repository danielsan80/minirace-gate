include <../../config/parameters.scad>

module led_cap_dome() {
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
    led_cap_dome();
    translate([0, 0, -led_cap_leg_h])
    _led_cap_leg();
}
