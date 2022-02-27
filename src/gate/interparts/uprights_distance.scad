include <../../parameters.scad>
use <../../functions.scad>
use <../../basement/values.scad>

function uprights_distance() =
    let(base_w = intra_uprights_space_l_mode=="ground"?upright_base_w+base_curvature_r*2:intra_uprights_space_l_mode=="basement"?basement_w():0)
    intra_uprights_space_l + base_w
;
