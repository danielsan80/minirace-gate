include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

module sim_board_transform() {
    translate([board_v1_margin.x, board_v1_margin.y, -board_thick-board_v1_cover_gap])
    children();
}

module sim_board() {
    sim_board_transform()
    board();
}