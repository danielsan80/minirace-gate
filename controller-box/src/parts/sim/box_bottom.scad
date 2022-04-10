include <../../../config/parameters.scad>
use <../../parts/box_bottom.scad>

module sim_box_bottom(box, box_terminal_outer_w=box_terminal_outer) {
    box_bottom(box=box, box_terminal_outer_w=box_terminal_outer);
}
