include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

module sim_board_transform() {
    translate([board_margin.x, board_margin.y, -board_thick-0.02])
    children();
}

module sim_board() {
    sim_board_transform()
    board();
}