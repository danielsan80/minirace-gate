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

module led() {
    led_3mm();
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

module led_on_board_v1_transform() {
    translate([-board_v1_margin.x,-board_v1_margin.y,board_thick])
    children();
}

module led_color() {
    #color("red")
    children();
}