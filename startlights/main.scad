include <config/specials.scad>
include <config/parameters.scad>
use <vendor/ruler/ruler.scad>
use <src/board/board.scad>
use <src/board/sim/board.scad>
use <src/hanger/clip.scad>
use <src/hanger/rod.scad>
use <src/hanger/clip_rod_joint.scad>
use <src/hanger/sim/hanger.scad>
use <src/hanger/print/rod.scad>
use <src/cover/cover.scad>
use <src/cover/assembly/cover.scad>
use <src/led/led_cap.scad>
use <src/cover/sim/cover.scad>
use <src/cover/print/cover.scad>
use <src/case/sim/case.scad>
use <src/case/case.scad>


module cover_cut() {
    difference() {
        children();
        
        translate([-10+side/2,-2,-10])
        cube([10, 30, 20]);
    }
}

module cover_welding_test_cut() {
    intersection() {
        children();
        
        translate([side*2+space_x*2,-side*2,-fix])
        cube([side, side*4, board_welding_h]);
    }
}

module bridge(l, os=0.4, conn="both") {
    w=2;
    h=1.5;
    t=0.5;
    tl = conn=="left"||conn=="both"?t:h;
    tr = conn=="right"||conn=="both"?t:h;
    
    color("cyan")
//    translate([0,0,-fix])
    translate([-w/2,0,0]) {
        cube([w,l/2,tl]);
        translate([0,l/2,0])
        cube([w,l/2,tr]);
        hull() {
            translate([0,os,0])
            cube([w,l-os*2,t]);
            
            translate([0,os+h,0])
            cube([w,l-os*2-h*2,h]);
        }
    }
}

//cover_cut()
//cover_welding_test_cut()
//translate([0,0,40])
//sim_cover_color()
//print_cover();

//led_cap_applier();

//translate([0,0,30])
//rotate([0,180,0])
//cover_led_caps_applier();


translate([0,-cover_h,0])
translate([cover_l,cover_h,0])
rotate([0,0,180]) {
    l=8.2;
    cover();

    translate([side/2,0,0])
    translate([0,-l,0])
    translate([0,case_wall_w,0])
    bridge(l, conn="right");

    translate([cover_l-side/2,0,0])
    translate([0,-l,0])
    translate([0,case_wall_w,0])
    bridge(l,  conn="right");

}

//translate([0,0,20])
//sim_board_zoffset_transform()
//sim_board_margin_transform()
//board();

//cover_cut()
//sim_case_transform()
//sim_case_color()
translate([0,25,0]) {
    l=9.2;
    case();

    translate([side/2,0,0])
    translate([0,-l,0])
    bridge(l, conn="right");

    translate([cover_l-side/2,0,0])
    translate([0,-l,0])
    bridge(l, conn="right");
}




translate([hanger_rod_l/2+1.5,0,0])
translate([0,8,]) {
    l = 4;

    translate([0,0,-ct_slide_side/4])
    rotate([-90,0,0])
    hanger_rod();

    translate([-l,0,0])
    translate([-hanger_rod_l/2,0,0])
    translate([0,ct_slide_side/2,0])
    rotate([0,0,-90])
    bridge(l, conn="right");

    translate([l,0,0])
    translate([hanger_rod_l/2,0,0])
    translate([0,ct_slide_side/2,0])
    rotate([0,0,90])
    bridge(l, conn="right");

}



translate([13,-4,0])
translate([cover_l,0,0]) {
    l=13.1;

    hanger_clip();

    translate([-0.85,0,0])
    translate([0,6.7+ct_slide_side/2,0])
    translate([-hanger_clip_w,0,0])
    rotate([0,0,90])
    bridge(l, conn="left");

    translate([-1.80,0,0])
    translate([0,17.3+ct_slide_side/2,0])
    translate([-hanger_clip_w,0,0])
    rotate([0,0,90])
    bridge(l-0.95, conn="left");

    translate([-hanger_clip_w-6,0,0])
    translate([0,5.2,0])
    translate([0,4,0])
    bridge(12, conn="none");
}

translate([-13,-4,0])
translate([0,0,0]) {
    l=13.1;

    mirror([1,0,0])
    hanger_clip();

    translate([0.85,0,0])
    translate([0,6.7+ct_slide_side/2,0])
    translate([hanger_clip_w,0,0])
    rotate([0,0,-90])
    bridge(l, conn="left");

    translate([1.80,0,0])
    translate([0,17.3+ct_slide_side/2,0])
    translate([hanger_clip_w,0,0])
    rotate([0,0,-90])
    bridge(l-0.95, conn="left");


    translate([hanger_clip_w+6,0,0])
    translate([0,5.2,0])
    translate([0,4,0])
    bridge(12, conn="none");

}



//    sim_clip_x2_transform()
//    sim_clip_rod_transform()
//    sim_clip_rotate()
//    sim_clip_center()
//    sim_clip_color()
//}




//translate([0,-30,0])
//ruler(cover_l);

//echo ("led distance x", led_distance_x);
//echo ("led distance y", led_distance_y);

//startlights_2();
//leds_2();



