include <../../../config/parameters.scad>
use <../../basement/_basement.scad>
use <../../basement/sim/_basement_transform.scad>

module _sim_basement_L() {
    _basement();
}

module _sim_basement_R(startline_l=startline_l) {
    _sim_basement_R_transform(startline_mode="basement", startline_l=startline_l)
    _basement();
}

module _sim_basement_deflector_L() {
    _basement_deflector_L();
}

module _sim_basement_deflector_R(startline_l=startline_l) {
    _sim_basement_R_transform(startline_mode="basement", startline_l=startline_l)
    _basement_deflector_R();
}
