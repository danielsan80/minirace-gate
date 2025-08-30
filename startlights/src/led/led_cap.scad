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

module led_cap_v2() {
    _led_cap_dome();
    translate([0, 0, -led_cap_leg_h])
    _led_cap_leg();
}


module led_cap_suared_5mm(void = false, for_cover = false) {
    p = void?led_play:0;
    ph = void?led_play_h:0;
    
    if (!void) {
        assert(!for_cover, "for_cover options is only for void");
    }
    
    w = led_squared_5mm_cap_w+p*2;
    l = led_squared_5mm_cap_l+p*2;
    h = led_squared_5mm_cap_base_h+ph;
    d = led_squared_5mm_cap_d+p*2;
    
//    translate([0,led_squared_5mm_cap_y_offset,0])
    union() {
        translate([-w/2, -l/2, 0])
        cube([w, l, h]);
        
        if (for_cover) {
            translate([0,0,1.7])
            intersection() {
                cylinder(d=d, h=led_squared_5mm_cap_h);
            }
        } else {
            translate([0,0,led_squared_5mm_cap_h-d/2])
            intersection() {
                sphere(d=d);
                translate([-d/2,-d/2,0])
                cube([d,d,d]);
            }
        }
    }
}


module led_cap() {
//    led_cap_v2();
    led_cap_suared_5mm();
}

module led_cap_void() {
    led_cap_suared_5mm(void=true, for_cover=true);
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
