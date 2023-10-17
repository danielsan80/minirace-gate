include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

module sim_board_transform() {
    translate([board_margin.x, board_margin.y, -board_thick-board_cover_gap])
    children();
}

module sim_board_transform_tmp() {
    translate([0, 0, -board_thick-board_cover_gap])
        children();
}

module sim_board() {
    sim_board_transform()
    board();
}