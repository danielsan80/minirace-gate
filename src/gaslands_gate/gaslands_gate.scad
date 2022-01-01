vendor_dir = "../../vendor";
gaslands_gate_dir = str(vendor_dir, "/gaslands_gate");
cars_dir = str(vendor_dir, "/cars");

module upright() {
    translate([63.15,26.7,0])
    import(str(gaslands_gate_dir,"/Gaslands_Gate_Tower_Scafflod_Tall_v1.stl"));
}

module angle_L() {
    translate([-241.37,-47.87,0])
    import(str(gaslands_gate_dir,"/Gaslands_Gate_-_Span_Angle_L.stl"));
}

module traverse150() {
    translate([-285.45,2.52,0])
    import(str(gaslands_gate_dir,"/Gaslands_Gate_-_Span_for_150mm_gate_v2.stl"));
}

module traverse186() {
    translate([-270.83,-3.18,0])
    import(str(gaslands_gate_dir,"/Gaslands_Gate_-_Span_for_186mm_gate_v2.stl"));
}

module angle_R() {
    translate([-465.52,-47.87,0])
    import(str(gaslands_gate_dir,"/Gaslands_Gate_-_Span_Angle_R.stl"));
}

module car() {
    translate([-4.5,0,0])
    import(str(cars_dir,"/Subaru2.stl"));
}

module car1() {
    translate([35,26,0])
    car();
}

module cars(n) {
    for(i=[0:n-1]) {
        translate([i*29,0,0])
        car1();
    }
}

module upright_L_150() {
    upright();
}

module upright_R_150() {
    translate([172.65,0,0])
    upright();
}


module angle_L_150() {
    translate([1,16.7,77.6])
    angle_L();
}



module traverse150_150() {
    translate([28.68,17.52,88.11])
    traverse150();
}


module angle_R_150() {
    translate([193.64,16.7,77.6])
    angle_R();
}



module upright_L_186() {
    upright();
}

module upright_R_186() {
    translate([203.85,0,0])
    upright();
}


module angle_L_186() {
    translate([1,16.7,77.6])
    angle_L();
}



module traverse186_186() {
    translate([28.68,17.52,88.11])
    traverse186();
}


module angle_R_186() {
    translate([224.9,16.7,77.6])
    angle_R();
}


module gate_150() {
    include <../../vendor/ruler/ruler.scad>

    upright_L_150();
    angle_L_150();
    traverse150_150();
    angle_R_150();
    upright_R_150();

    cars(5);

    translate([22.2,-20,0])
    ruler(x=150);
}

module gate_186() {
    include <../../vendor/ruler/ruler.scad>

    upright_L_186();
    angle_L_186();
    traverse186_186();
    angle_R_186();
    upright_R_186();

    cars(6);

    translate([22.2,-20,0])
    ruler(x=181.5);
}
