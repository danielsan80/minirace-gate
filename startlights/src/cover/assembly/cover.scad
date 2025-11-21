include <../../../config/parameters.scad>
use <../../../src/led/led.scad>
use <../../../src/led/led_cap.scad>
use <../../../src/cover/cover.scad>

module _led_cap_applier_pusher(h=20) {
    depth = 1;
    do = led_cap_dome_d+1.0;
    di = led_cap_dome_d+0.4;
    cut_w = 0.5;
    
    difference() {
        translate([0, 0, fix])
        cylinder(d=do, h=h);
        cylinder(d=di, h=depth);
        translate([0, 0, depth-fix])
        resize([di, di, led_cap_dome_h])
        led_cap_dome();
        
        translate([-cut_w/2,-do/2-fix,0])
        cube([cut_w,do+fix*2,h+fix*2]);
    }
}

module led_cap_applier(h=20) {
    d = 10;
    
    translate([0, 0, h/2+fix])
    cylinder(d=d, h=h/2);
    
    _led_cap_applier_pusher(h=h);
}

module _cover_led_cap_applier(h) {
   
    translate([0,0,circle_estrusion_led_cap_base_h])
    translate([0,0,-circle_estrusion_depth])
    translate([0,0,startlight_circle_estrusion])
    translate([0,0,thick])
    translate([side/2,side/2,0])
    _led_cap_applier_pusher(h=h);
}

module cover_led_caps_applier() {
    base=2;
    h1 = cowl_r+1;
    h2 = h1+startlight_circle_estrusion-circle_estrusion_depth+circle_estrusion_led_cap_base_h;
    h3 = h2+base;

    from_cover_x2_to_cover_x10_transform()
    from_cover_x1_to_cover_x2_transform()
    union() {
        _cover_led_cap_applier(h=h1);
        
        translate([0,0,thick])
        difference() {
            
            union() {
                cube([side, side,h3]);
                
                translate([0,0,h3-base])
                translate([-space_x/2,-space_y/2,0])
                cube([side+space_x+fix,side+space_y+fix,base]);
            }
            
            translate([0,0,-fix])
            translate([side/2,side/2,0])
            cylinder(d=side-0.5, h=h2);
        }
    }
}

