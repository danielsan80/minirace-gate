include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

module sim_board_margin_transform() {
    translate([board_margin.x, board_margin.y, 0])
    children();
}

module sim_board_zoffset_transform() {
    translate([0, 0, -board_thick-0.02])
    children();
}

module sim_board() {
    sim_board_zoffset_transform()
    sim_board_margin_transform()
    board();
}