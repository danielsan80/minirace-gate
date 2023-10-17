include <../../config/parameters.scad>
include <../../src/led/led.scad>


module _board_main() {
    cube([board_l,board_w,board_thick]);

}

module _board_holes() {
    translate([-board_margin.x, -board_margin.y, 0]) {
        translate([cover_l/2+cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    
        translate([cover_l/2-cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    }
}

module _board_welding() {
    translate([board_l/2,board_w/2+board_welding_offset.y,board_thick])
    translate([-board_welding_l/2, -board_welding_w/2,0])
    cube([board_welding_l, board_welding_w, board_welding_h]);
}

module _board_leds() {
    led_color()
    led_on_board_transform()
    led_x10_cover_transform()
    translate([0,0,board_cover_gap])
    led();
}

module _board_cable_connector() {
    translate([-board_margin.x, , -board_margin.y])
    translate([cover_l / 2, cover_h/2 + board_cable_connector_offset.y, - board_cable_connector_h])
    translate([-board_cable_connector_l / 2, -board_cable_connector_w/2, 0])
    cube([board_cable_connector_l, board_cable_connector_w, board_cable_connector_h]);
}

module board() {

    color("darkgreen")
    difference() {
        _board_main();
        _board_holes();
    }

    color("silver")
    _board_welding();

    color("white")
    _board_cable_connector();

    _board_leds();
}
