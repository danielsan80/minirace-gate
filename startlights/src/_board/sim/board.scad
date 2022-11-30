include <../../../config/parameters.scad>

use <../../../src/_board/board.scad>

module sim_board_transform() {
    translate([board_offset.x, board_offset.y, -board_thick-board_startlights_gap])
    children();
}

module sim_board() {
    sim_board_transform()
    board();
}