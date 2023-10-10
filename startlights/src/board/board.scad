include <../../config/parameters.scad>
include <../../src/led/led.scad>


module _board_main() {
    cube([board_l,board_w,board_thick]);

}

module _board_holes() {
    translate([board_hole_offset.x, board_w-board_hole_offset.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);

    translate([board_l-board_hole_offset.x, board_w-board_hole_offset.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
}

module _board_welding() {
    translate([board_l/2,board_w-welding_y_offset,board_thick])
    translate([-welding_l/2, -welding_w/2,0])
    cube([welding_l, welding_w, welding_h]);
}

module _board_leds() {
    led_color()
    led_on_board_transform()
    led_x10_cover_transform()
    led();
}

module _board_cable_connector() {
    translate([board_l / 2, board_cable_connector_y_offset, - board_cable_connector_h])
    translate([- board_cable_connector_l / 2, 0, 0])
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
