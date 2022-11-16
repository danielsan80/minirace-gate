include <../../../config/parameters.scad>

use <../../../src/_board/board.scad>
use <../../../src/_cover/cover.scad>
use <../../../src/_board/sim/board_transform.scad>


sim_board_transform()
board();

cover();