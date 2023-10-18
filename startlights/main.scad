include <config/parameters.scad>
use <vendor/ruler/ruler.scad>
use <src/board/board.scad>
use <src/board/sim/board.scad>
use <src/hanger/clip.scad>
use <src/hanger/rod.scad>
use <src/hanger/clip_rod_joint.scad>
use <src/hanger/sim/hanger.scad>
use <src/cover/cover.scad>
use <src/cover/sim/cover.scad>
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
//cover();

//%sim_board_transform()
//board();

sim_case_color()
case();


//%translate([0,0,-2]) {
//    sim_rod_transform()
//    sim_board_transform_tmp()
//    sim_clip_rod_transform()
//    sim_rod_rotate()
//    sim_rod_center()
//    sim_rod_color()
//    hanger_rod();
//
//
//    sim_clip_x2_transform()
//    sim_board_transform_tmp()
//    sim_clip_rod_transform()
//    sim_clip_rotate()
//    sim_clip_center()
//    sim_clip_color()
//    hanger_clip();
//}



//translate([0,-30,0])
//ruler(cover_l);

//echo ("led distance x", led_distance_x);
//echo ("led distance y", led_distance_y);

//startlights_2();
//leds_2();
