use <../../parts/sim/parts.scad>
use <../../car/sim/cars.scad>
use <../../../vendor/ruler/ruler.scad>

module sim_gate_150() {
    sim_upright_150_L();
    sim_angle_150_L();
    sim_traverse_150();
    sim_angle_150_R();
    sim_upright_150_R();
}

module sim_gate_186() {
    sim_upright_186_L();
    sim_angle_186_L();
    sim_traverse_186();
    sim_angle_186_R();
    sim_upright_186_R();
}

module sim_gate_150_with_more() {
    sim_gate_150();
    sim_cars(5);

    translate([22.2,-20,0])
    ruler(x=150);
}

module sim_gate_186_with_more() {
    sim_gate_186();
    sim_cars(6);

    translate([22.2,-20,0])
    ruler(x=181.5);
}


module sim_upright_section() {
    translate([0,-100,0])
    projection(cut = true)
    translate([0,0,-15])
    rotate([0,45,0])
    upright();
}
