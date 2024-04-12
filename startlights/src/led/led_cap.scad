include <../../config/parameters.scad>
include <../../src/led/led.scad>


module _led_cap_dome() {
    intersection(){
        scale([1, 1, 0.7])
        sphere(d=led_cap_dome_d);
        cylinder(d=led_cap_dome_d, h=led_cap_dome_d/2);
    }
}

module _led_cap_clip() {

    difference() {
        union() {
            cylinder(d=led_cap_foot_d, h=led_cap_foot_h);
            cylinder(d=led_cap_clip_d, h=led_cap_clip_h);
        }
        led_void();
    }
    
    
}

module led_cap() {
    _led_cap_dome();
    translate([0, 0, -led_cap_clip_h])
    _led_cap_clip();
}
