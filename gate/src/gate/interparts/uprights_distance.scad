include <../../../config/parameters.scad>
use <../../functions.scad>
use <../../basement/values.scad>
use <../../gate/interparts/upright_base_level1.scad>

//mode="basement"|"upright"|"center"
function uprights_distance(mode="center") =
    let(base_w = mode=="upright"?upright_base_level1_w():mode=="basement"?basement_block_w():mode=="center"?0:0)
    intra_uprights_space_l + base_w
;
