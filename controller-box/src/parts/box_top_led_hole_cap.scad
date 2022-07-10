include <../../config/parameters.scad>

module box_top_led_hole_cap() {

    cylinder(r=chip_led_hole_cap_r,h=box_top_base_thick);
    cylinder(r=chip_led_hole_r-chip_led_hole_cap_play, h=box_top_base_thick+chip_led_hole_tube_h+chip_led_hole_cap_ring_play);
    translate([0,0,box_top_base_thick+chip_led_hole_tube_h+chip_led_hole_cap_ring_play-fix])
    cylinder(r=chip_led_hole_r-chip_led_hole_cap_play/3*2, h=chip_led_hole_cap_ring_h);

}
