include <../../../config/parameters.scad>
use <../../basement/basement.scad>
use <../../basement/sim/basement_transform.scad>

module sim_basement_L() {
    basement();
}

module sim_basement_R(startline_l=startline_l) {
    sim_basement_R_transform(startline_mode="basement", startline_l=startline_l)
    basement();
}

module sim_basement_deflector_L() {
    basement_deflector_L();
}

module sim_basement_deflector_R(startline_l=startline_l) {
    sim_basement_R_transform(startline_mode="basement", startline_l=startline_l)
    basement_deflector_R();
}
