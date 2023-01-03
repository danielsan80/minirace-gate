include <../../../config/parameters.scad>
use <../../gate/interparts/upright_base_level1.scad>

function basement_upright_margin() = basement_upright_margin;
function basement_w() = upright_base_level1_w() + basement_upright_margin * 2;
function basement_l() = upright_base_level1_l() + basement_upright_margin * 2;