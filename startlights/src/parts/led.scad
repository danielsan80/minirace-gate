include <../parameters.scad>

module led_3mm() {
    outer_d = 3.85;
    inner_d1 = 3;
    inner_d2 = 2.85;
    base_h = 1;
    h=4.3;

//    inner_d = led_d-0.55;
//    outer_d = led_d;
//    height = led_d*8.45/5.4;
//    base_h = led_base_h;

    #color("red")
    union() {
        translate([0,0,base_h+h-inner_d2/2-fix])
        sphere(d=inner_d2);

        translate([0,0,base_h-fix])
        cylinder(d1=inner_d1, d2=inner_d2, h=h-inner_d2/2);

        cylinder(r=outer_d/2, h=base_h);
    }
}


module led() {
    led_3mm();
}



module leds_2() {
    z_offset = led_base_h+startlight_led_jut_h;

    translate([side/2,side/2+space_y+side,thick-z_offset])
        led();

    translate([side/2,side/2,thick-z_offset])
        led();
}



module leds_10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j,0,0])
            leds_2();
    }
}
