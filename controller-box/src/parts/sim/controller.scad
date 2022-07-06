include <../../../config/parameters.scad>

module _sim_card_hole() {
    translate([0,0,-card_thick])
    cylinder(d=3,h=card_thick*3);
}

module sim_card() {
    color("green")
    difference() {
        linear_extrude(card_thick)
        polygon([
            [card_overhang_l,0],
            [card_overhang_l+card_w,0],
            [card_overhang_l+card_w,card_l],
            [card_overhang_l,card_l],
            [card_overhang_l,card_l-card_overhang_offset],
            [0,card_l-card_overhang_offset],
            [0,card_l-card_overhang_offset-card_overhang_w],
            [card_overhang_l,card_l-card_overhang_offset-card_overhang_w],
        ]);

        translate([21.5,9.5,0])
        _sim_card_hole();

        translate([-3,-3,0])
        translate([8+36.5,83.5,0])
        _sim_card_hole();

        translate([-16,-3,0])
        translate([8+36.5,83.5,0])
        _sim_card_hole();

        translate([-16,-37,0])
        translate([8+36.5,83.5,0])
        _sim_card_hole();


    }

}

module sim_startlights_connector() {
    translate([startlights_connector_pos.x,startlights_connector_pos.y,0])
    translate([0,-startlights_connector_l/2,card_thick])
    color("white")
    cube([startlights_connector_w,startlights_connector_l,startlights_connector_h]);
}

module sim_antenna() {
    translate([-antenna_l, card_l-card_overhang_offset-card_overhang_w, 0])
    color("#aaaaaa")
    cube([antenna_l, antenna_w, antenna_thick]);

    translate([-antenna_l-antenna_end_l, card_l-card_overhang_offset-card_overhang_w, 0])
    color("green")
    cube([antenna_end_l, antenna_w, card_thick]);
}

module sim_chip_processor() {
    color("#9999aa")
    translate([chip_x+(chip_w-chip_processor_w)/2, chip_y+chip_l-chip_processor_margin-chip_processor_l, card_thick+chip_z_offset+chip_thick])
    cube([chip_processor_w, chip_processor_l, chip_processor_thick]);
}

module sim_chip_connector() {
    color("silver")
    translate([chip_x+(chip_w-chip_connector_w)/2, chip_y, card_thick+chip_z_offset+chip_thick])
    cube([chip_connector_w, chip_connector_l, chip_connector_h]);
}

module sim_chip() {
    color("#333333")
    translate([chip_x, chip_y, card_thick+chip_z_offset])
    cube([chip_w, chip_l, chip_thick]);
}

module sim_chip_blue_led() {
    color("#2222FF")
        translate([chip_x+chip_w+chip_blue_led_angle_pos.x, chip_y+chip_blue_led_angle_pos.y, card_thick+chip_z_offset+chip_thick])
        cylinder(r=0.5, h=1);
}

module sim_chip_red_led() {
    color("#FF2222")
        translate([chip_x+chip_w+chip_red_led_angle_pos.x, chip_y+chip_red_led_angle_pos.y, card_thick+chip_z_offset+chip_thick])
            cylinder(r=0.5, h=1);
}

module sim_controller() {
    sim_card();
    sim_startlights_connector();
    sim_antenna();
    sim_chip();
    sim_chip_blue_led();
    sim_chip_red_led();
    sim_chip_connector();
    sim_chip_processor();
}
