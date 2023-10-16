include <../../../config/parameters.scad>

use <../../../src/board/board.scad>

module sim_board_v1_transform() {
    translate([board_v1_margin.x, board_v1_margin.y, -board_thick-board_v1_cover_gap])
    children();
}

module sim_board_v1_transform_tmp() {
    translate([0, 0, -board_thick-board_v1_cover_gap])
        children();
}

module sim_board_v1() {
    sim_board_v1_transform()
    board_v1();
}