include <../../../config/parameters.scad>

module sim_board_transform() {
    translate([board_offset.x, board_offset.y, -board_thick-board_startlights_gap])
    children();
}