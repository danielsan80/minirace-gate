use <car.scad>

module car1() {
    car();
}

module cars(n) {
    for(i=[0:n-1]) {
        translate([i*29,0,0])
        car1();
    }
}