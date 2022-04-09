include <../config/parameters.scad>

function box_outer_w(box="controller") =
    assert(box=="controller" || box=="terminal")
    box=="controller"?box_outer_w:box=="terminal"?box_terminal_outer_w:undef;

function box_inner_w(box="controller") =
    assert(box=="controller" || box=="terminal")
    box=="controller"?box_inner_w:box=="terminal"?box_terminal_inner_w:undef;