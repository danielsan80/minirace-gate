use <../../parts/parts.scad>

module sim_upright_150_L() {
    upright();
}

module sim_upright_150_R() {
    translate([172.65,0,0])
    upright();
}

module sim_angle_150_L() {
    translate([1,16.7,77.6])
    angle_L();
}

module sim_traverse_150() {
    translate([28.68,17.52,88.11])
    traverse150();
}

module sim_angle_150_R() {
    translate([193.64,16.7,77.6])
    angle_R();
}



module sim_upright_186_L() {
    upright();
}

module sim_upright_186_R() {
    translate([203.85,0,0])
    upright();
}

module sim_angle_186_L() {
    translate([1,16.7,77.6])
    angle_L();
}

module sim_traverse_186() {
    translate([28.68,17.52,88.11])
    traverse186();
}

module sim_angle_186_R() {
    translate([224.9,16.7,77.6])
    angle_R();
}
