include <../../../config/parameters.scad>

use <../../../src/board/board.scad>
use <../../../src/cover/cover.scad>
use <../../../src/board/sim/board.scad>


sim_board_transform()
board();

cover();