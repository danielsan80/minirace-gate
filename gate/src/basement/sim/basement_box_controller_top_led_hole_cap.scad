include <../../../config/parameters.scad>
use <../../../vendor/controller-box/src/parts/sim/box_top_led_hole_cap.scad>


//TRANSFORM

module sim_basement_box_controller_top_led_hole_cap_transform(led) {
    assert(led=="blue" || led=="red");

    sim_box_top_led_hole_cap_transform(led=led)
    children();
}


//COLOR

module sim_basement_box_controller_top_led_hole_cap_color(led) {
    assert(led=="blue" || led=="red");

    sim_box_controller_top_led_hole_cap_color(led=led)
    children();
}

