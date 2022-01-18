use <../src/modules/car.scad>

module sim_car1() {
    translate([35,26,0])
        car();
}

module sim_cars(n) {
    for(i=[0:n-1]) {
        translate([i*29,0,0])
            sim_car1();
    }
}