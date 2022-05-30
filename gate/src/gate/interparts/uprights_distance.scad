include <../../../config/parameters.scad>
use <../../functions.scad>
use <../../basement/values.scad>
use <../../gate/interparts/upright_base_level1.scad>

function uprights_distance(mode="center") =
    assert(mode=="basement" || mode=="upright" || mode=="center")
    let(base_w = mode=="upright"?upright_base_level1_w():mode=="basement"?basement_block_w():mode=="center"?0:0)
    startline_l + base_w
;
