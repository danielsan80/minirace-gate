include <../../config/parameters.scad>
include <../../src/_led/led.scad>


module _board_main() {
    cube([board_l,board_w,board_thick]);

}

module _board_holes() {
    translate([board_hole_x_offset, board_w-board_hole_y_offset,-fix])
        cylinder(d=board_hole_d, h=a_lot);

    translate([board_l-board_hole_x_offset, board_w-board_hole_y_offset,-fix])
        cylinder(d=board_hole_d, h=a_lot);
}

module _board_weilding() {
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

module board() {

    color("darkgreen")
    difference() {
        _board_main();
        _board_holes();
    }

    color("silver")
    _board_weilding();


    _board_leds();
}
