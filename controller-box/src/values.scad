include <../config/parameters.scad>

function box_outer_w(box="controller", box_terminal_outer_w=box_terminal_outer_w) =
    assert(box=="controller" || box=="terminal")
    box=="controller"?box_controller_outer_w:box=="terminal"?box_terminal_outer_w:undef;

function box_inner_w(box="controller", box_terminal_outer_w=box_terminal_outer_w) =
    assert(box=="controller" || box=="terminal")
    let(box_terminal_inner_w=box_terminal_outer_w-box_wall_thick*2)
    box=="controller"?box_controller_inner_w:box=="terminal"?box_terminal_inner_w:undef;
