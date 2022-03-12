include <../../parameters.scad>
use <../../parts/board.scad>

module sim_board() {
    translate([(startlights_length-board_l)/2,(startlights_height-board_w)/2,-board_thick-board_startlights_gap])
    board();
}