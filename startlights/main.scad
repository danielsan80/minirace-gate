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



cover();

sim_board_transform()
board();

//sim_case_cut()
sim_case_color()
case();


translate([0,0,-3])
sim_rod_transform()
sim_board_transform()
sim_clip_rod_transform()
sim_rod_rotate()
sim_rod_center()
sim_rod_color()
hanger_rod();

sim_clip_x2_transform()
sim_board_transform()
sim_clip_rod_transform()
sim_clip_rotate()
sim_clip_center()
sim_clip_color()
hanger_clip();




//translate([0,-30,0])
//ruler(startlights_length);

//echo ("led distance x", led_distance_x);
//echo ("led distance y", led_distance_y);

//startlights_2();
//leds_2();
