module _car_wheel() {
    rotate([0,90,0])
    cylinder(d=8, h=4, center=true);
}

module _car_wheels() {
    translate([10,-16.2,4])
    _car_wheel();

    translate([-10,-16.2,4])
    _car_wheel();

    translate([10,17,4])
    _car_wheel();

    translate([-10,17,4])
    _car_wheel();
}

module _car_side_profile() {
    polygon([
        [0,2.5],
        [12,2.6],
        [22,3],
        [29,3.2],
        [29,6],
        [29.5,6.3],
        [29.5,9],
        [28.3,9.5],
        [28.3,11.5],
        [27.5,14.5],
        [21.5,14.8],
        [16,18],
        [12,19.8],
        [8,20.1],
        [3,20.1],
        [0,19.8],
        [-3,19],
        [-10,14.8],
        [-13,13.2],
        [-16,12.9],
        [-22,12.1],
        [-25,11.3],
        [-27.1,10.3],
        [-28.2,8.0],
        [-28.2,4.2],
        [-27.6,3.6],
        [-27.6,2.6],
        [-21,2.5],
    ]);

}

module _car_front_profile_R() {
    polygon([
        [0.0, 2.5],
        [11.0, 2.5],
        [11.2, 4.0],
        [11.8, 7.0],
        [11.8, 11.0],
        [11.2, 12.8],
        [9.2, 16.8],
        [7.8, 19.2],
        [7.4, 19.7],
        [4.0, 20.0],
        [0.0, 20.2],
    ]);
}

module _car_front_profile_L() {
    mirror([1,0])
    _car_front_profile_R();
}

module _car_front_profile() {
    _car_front_profile_L();
    _car_front_profile_R();
}

module _car_body() {
    intersection() {
        rotate([90,0,0])
        translate([0,0,-500])
        linear_extrude(1000)
        _car_front_profile();

        rotate([0,90,0])
        rotate([0,0,90])
        translate([0,0,-500])
        linear_extrude(1000)
        _car_side_profile();
    }
}


module car() {
    _car_body();
    _car_wheels();
}
