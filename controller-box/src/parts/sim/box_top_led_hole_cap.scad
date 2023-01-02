include <../../../config/parameters.scad>
use <../../parts/box_top_led_hole_cap.scad>

module sim_box_top_led_hole_cap_transform(led) {
    assert(led=="blue" || led=="red");

    if (led=="blue") {
        translate([
            -chip_blue_led_hole_angle_pos.x,
            chip_blue_led_hole_angle_pos.y,
            -box_top_base_thick
        ])
        children();
    }
    if (led=="red") {
        translate([
            -chip_red_led_hole_angle_pos.x,
            chip_red_led_hole_angle_pos.y,
            -box_top_base_thick
        ])
        children();
    }
}

module sim_box_top_blue_led_hole_cap_transform() {
    sim_box_top_led_hole_cap_transform(led="blue")
    children();
}

module sim_box_top_red_led_hole_cap_transform() {
    sim_box_top_led_hole_cap_transform(led="red")
    children();
}

module sim_box_top_led_hole_cap_color(led) {
    assert(led == "blue" || led == "red");

    if (led=="blue") {
        color("#8888ff77")
        children();
    }

    if (led=="red") {
        color("#ff888877")
        children();
    }

}

