include <../../../../config/parameters.scad>


//TODO move it
module sim_on_bolting_transform() {
    translate([0,0,fix2])
    translate([0,0,bolting_base_thick])
    children();
}

