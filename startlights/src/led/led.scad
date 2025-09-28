include <../../config/parameters.scad>


module led_3mm() {
    outer_d = 3.85;
    inner_d1 = 3;
    inner_d2 = 2.85;
    base_h = 1;
    h=4.3;

    union() {
        translate([0,0,base_h+h-inner_d2/2-fix])
        sphere(d=inner_d2);

        translate([0,0,base_h-fix])
        cylinder(d1=inner_d1, d2=inner_d2, h=h-inner_d2/2);

        cylinder(r=outer_d/2, h=base_h);
    }
}

module led_3mm_with_pin() {
    
    led_3mm();
    
    translate([-led_pin_thick/2,-led_pin_w/2,-led_pin_h])
    cube([led_pin_thick, led_pin_w, led_pin_h]);
}

module led_squared_3mm(void = false) {
    pw = void?led_play_w:0;
    pl = void?led_play_l:0;
    ph = void?led_play_h:0;
    
    w = led_squared_3mm_w+pw*2;
    l = led_squared_3mm_l+pl*2;
    h = led_squared_3mm_h+ph;
    
    translate([-w/2,-l/2,-fix])
    cube([w, l, h]);
}


module led() {
    led_squared_3mm();
}

module led_void() {
    led_squared_3mm(void=true);
}

module led_x2_cover_transform() {
    translate([side/2,side/2+space_y+side,0])
    children();

    translate([side/2,side/2,0])
    children();
}

module led_x10_cover_transform() {
    for (j=[0:4]) {
        translate([(side+space_x)*j,0,0])
            led_x2_cover_transform()
        children();
    }
}

module led_on_board_transform() {
    translate([-board_margin.x,-board_margin.y,board_thick])
    children();
}

module led_color() {
    color("red")
    children();
}