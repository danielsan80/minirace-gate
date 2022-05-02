include <../../vendor/controller-box/config/parameters.scad>
use <../gate/interparts/upright_base_level1.scad>
use <../gate/interparts/basement_upright_margin.scad>

function basement_box_controller_w() = box_controller_outer_w;
function basement_block_w() = upright_base_level1_w()+basement_upright_margin()*2;
function basement_box_terminal_w() = basement_block_w();
function basement_l() = box_outer_l;
function basement_h() = box_outer_h;
function box_top_base_thick() = box_top_base_thick;