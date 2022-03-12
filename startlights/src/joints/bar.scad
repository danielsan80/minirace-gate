include <../parameters.scad>

module bar_x() {
    cube([side*5+space_x*4,bar_thick,bar_thick]);
}

module bar_y() {
    cube([side,space_y,bar_thick]);
}

