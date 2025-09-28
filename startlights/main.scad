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

//cover_cut()
//cover_welding_test_cut()
//translate([0,0,40])
//sim_cover_color()


translate([0,-cover_h,0])
translate([cover_l,cover_h,0])
rotate([0,0,180]) {
    l=12;
    w=2;
    t=0.2;
    cover();
    
    translate([cover_l/2,0,0])
    translate([-w/2,-l,0])
    translate([0,case_wall_w,0])
    cube([w,l,t]);
    
}
//print_cover();

//sim_cover_led_caps();

//led_cap_applier();

//translate([0,0,20])
//sim_board_zoffset_transform()
//sim_board_margin_transform()
//board();

//cover_cut()
//sim_case_transform()
//sim_case_color()
translate([0,25,0]) {
    l=12;
    w=2;
    t=0.2;
    case();
    
    translate([cover_l/2,0,0])
    translate([-w/2,-l,0])
    cube([w,l,t]);
}




//sim_case_transform() {
//    sim_rod_transform()
//    sim_clip_rod_transform()
//    sim_rod_rotate()
//    sim_rod_center()
//    sim_rod_color()
//    translate([0,20,0])
    translate([hanger_rod_l/2+1.5,0,0])
    translate([0,8,-ct_slide_side/4])
    rotate([-90,0,0])
    hanger_rod();
//    print_hanger_rod();

translate([8,0,0])
translate([cover_l,0,0]) {
    l=6;
    w=2;
    t=0.2;
    
    hanger_clip();
    
    translate([-hanger_clip_w,8+ct_slide_side/2,0])
    translate([-l,-w/2,0])
    cube([l,w,t]);
    
}

translate([-8,0,0])
translate([0,0,0]) {
    l=6;
    w=2;
    t=0.2;
 
    mirror([1,0,0])
    hanger_clip();
    
    translate([hanger_clip_w,8+ct_slide_side/2,0])
    translate([0,-w/2,0])
    cube([l,w,t]);
    
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



