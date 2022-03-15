include <../../../config/parameters.scad>
use <../../functions.scad>
use <../../basement/values.scad>

//mode="basement"|"upright"|"center"
function uprights_distance(mode="center") =
    let(base_w = mode=="upright"?upright_base_w+base_curvature_r*2:mode=="basement"?basement_w():mode=="center"?0:0)
    intra_uprights_space_l + base_w
;
