include <../../../config/specials.scad>
include <../../../config/parameters.scad>

use <../../../src/board/board.scad>
use <../../../src/board/sim/board.scad>

use <../../../src/hanger/clip.scad>
use <../../../src/hanger/rod.scad>
use <../../../src/hanger/clip_rod_joint.scad>
use <../../../src/hanger/sim/hanger.scad>

use <../../../src/cover/cover.scad>
use <../../../src/cover/sim/cover.scad>

use <../../../src/case/case.scad>
use <../../../src/case/sim/case.scad>



sim_hanging_startlights_transform() {

    sim_cover_color()
    cover();

    sim_cover_led_caps();

//    sim_case_cut()
    sim_case_transform()
    sim_case_color()
    case();
    
    sim_board_zoffset_transform()
    sim_board_margin_transform()
    board();

    sim_case_transform()
    sim_rod_transform()
    sim_clip_rod_transform()
    sim_rod_rotate()
    sim_rod_center()
    sim_rod_color()
    hanger_rod();
    
    sim_case_transform()
    sim_clip_x2_transform()
    sim_clip_rod_transform()
    sim_clip_rotate()
    sim_clip_center()
    sim_clip_color()
    hanger_clip();
    
}
