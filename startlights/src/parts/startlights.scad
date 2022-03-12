include <../parameters.scad>
use <../joints/bar.scad>


module cowl(r = 6) {
    cone_r1 = r;
    h = cone_r1;
    cone_ratio = 5.5/6;
    thick1 = 1;
    thick2 = 0.5;
    fix = 0.1;


    cut_side = cone_r1*2+fix*2;

    module cone() {
        cylinder(h = h, r1 = cone_r1, r2 = cone_r1-thick2);
    }

    module void() {
        translate([0,0,-fix])
        cylinder(h = h+fix*2, r = cone_r1-thick1);

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
        //        #cut1();
        //        #cut2();
    }

}

module startlight() {

    play = 0.4;
    h = startlight_circle_estrusion;
    t = 1;
    fix = 0.1;
    jut_h = startlight_led_jut_h;
    a_few = 10;


    color("grey")
    union() {
        cowl(r);
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



module startlights_2() {
    translate([0, side+space_y, 0])
    startlight();

    startlight();

    color("grey")
    translate([0, side, 0])
    bar_y();
}

module startlights_10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j, 0, 0])
        startlights_2();
    }

    color("grey")
    for (i=[0:1]) {

        translate([0, (side+space_y)*i+bar_x_offset, 0])
        bar_x();

        translate([0, (side+space_y)*i+side-bar_x_offset-bar_thick, 0])
        bar_x();
    }
}

module startlights() {
    startlights_10();
}
