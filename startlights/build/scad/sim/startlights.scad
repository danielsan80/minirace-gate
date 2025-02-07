include <../../../config/specials.scad>
include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

use <../../../src/cover/cover.scad>
use <../../../src/cover/sim/cover.scad>

use <../../../src/case/case.scad>
use <../../../src/case/sim/case.scad>

use <../../../src/board/sim/board.scad>


sim_board_zoffset_transform()
sim_board_margin_transform()
board();

sim_cover_color()
cover();

sim_cover_led_caps();

//sim_case_cut()
sim_case_transform()
sim_case_color()
case();

