include <../../../config/parameters.scad>
use <../../parts/box_side_slide.scad>

module sim_box_side_slide(box, box_terminal_outer_w=box_terminal_outer) {
    box_side_slide(box=box, box_terminal_outer_w=box_terminal_outer);
};
