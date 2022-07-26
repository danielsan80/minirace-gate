include <../../config/parameters.scad>

module box_top_led_hole_cap() {

    cylinder(r=chip_led_hole_cap_r,h=box_top_base_thick);
    difference() {
        cylinder(r=chip_led_hole_r-chip_led_hole_cap_play, h=box_top_base_thick+chip_led_hole_tube_h1+chip_led_hole_tube_h2);
        translate([0,0,box_top_base_thick])
        cylinder(r=chip_led_hole_r-chip_led_hole_cap_play-chip_led_hole_cap_inner_thick, h=chip_led_hole_tube_h1+chip_led_hole_tube_h2+fix2);
    }
}
