include <../../config/parameters.scad>


module _cowl(r = 6) {
    fix = 0.1;
    thick1 = 1;
    thick2 = 0.5;
    cone_r1 = r;
    cone_r2 = cone_r1-thick1;
    h = r;
    cone_ratio = 5.5/6;

    cut_side = cone_r1*2+fix*2;

    module cone() {
        cylinder(h = h, r1 = cone_r1, r2 = cone_r2);
    }

    module void() {
        translate([0,0,-fix])
        cylinder(h = h+fix*2, r = cone_r2);
    }

    module cut1() {
        side = cone_r1*15/6;
        offset_top = cone_r1*6.5/6;
        offset_bottom = cone_r1*8.5/6;
        hull() {
            translate([0,-offset_top,h])
                cube([side,side,fix], center=true);

            translate([0,-offset_bottom,0])
                cube([side,side,fix], center=true);
        }
    }

    module cut2() {
        side = cone_r1*15/6;
        z_offset_top = cone_r1*8.5/6;
        z_offset_bottom = cone_r1*7.5/6;
        a_few = 5;
        hull() {
            translate([0,cone_r1,z_offset_top])
            cube([side,fix,a_few], center=true);

            translate([0,0,z_offset_bottom])
            cube([side,fix,a_few], center=true);
        }
    }

    translate([side/2,side/2,thick+startlight_circle_estrusion])
    union() {
        difference() {
            cone();
            void();
            cut1();
            cut2();

        }
    }
}

module _cover_bar_x() {
    cube([side*5+space_x*4,bar_thick,bar_thick]);
}

module _cover_bar_y() {
    cube([side,space_y,bar_thick]);
}



module _cover_x1() {

    play = 0.4;
    h = startlight_circle_estrusion;
    t = 1;
    fix = 0.1;
    jut_h = startlight_led_jut_h;
    a_few = 10;


    color("grey")
    union() {
        _cowl(r);
        difference() {
            union() {
                cube([side,side,thick]);

                difference() {
                    translate([side/2,side/2,h])
                    cylinder(r=r, h=thick);

                    translate([side/2,side/2,h])
                    cylinder(r=r-t, h=thick+h);
                }
            }
            translate([side/2,side/2,-fix])
            cylinder(r=led_r, h=a_few);

            translate([side/2,side/2,-jut_h])
            cylinder(r=led_r+play, h=thick);

        }
    }
}



module _cover_x2() {
    translate([0, side+space_y, 0])
    _cover_x1();

    _cover_x1();

    color("grey")
    translate([0, side, 0])
    _cover_bar_y();
}

module _cover_x10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j, 0, 0])
        _cover_x2();
    }

    color("grey")
    for (i=[0:1]) {
        translate([0, (side+space_y)*i+bar_x_offset, 0])
        _cover_bar_x();

        translate([0, (side+space_y)*i+side-bar_x_offset-bar_thick, 0])
        _cover_bar_x();
    }
}

module _cover_welding_groove() {
    if (board_has_cover_welding_groove) {
        l = board_welding_l+board_welding_play*2;
        w = board_welding_w+board_welding_play*2;
        h = board_welding_h+board_welding_play;
        r = board_welding_r;
    
        translate([board_l/2, board_w/2+board_welding_offset.y,0])
        translate([board_margin.x,board_margin.y/2,0])
        translate([-l/2, -w/2,-fix])
        translate([r,r,0])
        //    cube([l, w, h]);
        minkowski() {
            cube([l-r*2, w-r*2, h]);
            cylinder(r=r, h=fix);
        }
    }
}

module cover() {
    difference() {
        _cover_x10();
        
        _cover_welding_groove();
        
        translate([cover_l,cover_h,0])
        rotate([0,0,180])
        _cover_welding_groove();
    }
}
