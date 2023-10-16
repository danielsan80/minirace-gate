include <../../config/parameters.scad>
include <../../src/led/led.scad>


module _board_v1_main() {
    cube([board_v1_l,board_v1_w,board_thick]);

}

module _board_v1_holes() {
    translate([-board_v1_margin.x, -board_v1_margin.y, 0]) {
        translate([cover_l/2+cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    
        translate([cover_l/2-cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    }
}

module _board_v1_welding() {
    translate([board_v1_l/2,board_v1_w-welding_y_offset,board_thick])
    translate([-welding_l/2, -welding_w/2,0])
    cube([welding_l, welding_w, welding_h]);
}

module _board_v1_leds() {
    led_color()
    led_on_board_v1_transform()
    led_x10_cover_transform()
    led();
}

module _board_v1_cable_connector() {
    translate([-board_v1_margin.x, , -board_v1_margin.y])
    translate([cover_l / 2, cover_h/2 + board_cable_connector_offset.y, - board_cable_connector_h])
    translate([-board_cable_connector_l / 2, -board_cable_connector_w/2, 0])
    cube([board_cable_connector_l, board_cable_connector_w, board_cable_connector_h]);
}

module board_v1() {

    color("darkgreen")
    difference() {
        _board_v1_main();
        _board_v1_holes();
    }

    color("silver")
    _board_v1_welding();

    color("white")
    _board_v1_cable_connector();

    _board_v1_leds();
}
