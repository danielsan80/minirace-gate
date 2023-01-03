include <../../../config/parameters.scad>
use <../../gate/interparts/basement_upright.scad>
use <../../gate/interparts/upright_base_level1.scad>

function uprights_distance(startline_mode="center", startline_l=startline_l) =
    assert(startline_mode=="basement" || startline_mode=="upright" || startline_mode=="center")
    let(base_w = startline_mode=="upright"?upright_base_level1_w():startline_mode=="basement"?basement_w():startline_mode=="center"?0:0)
    startline_l + base_w
;
