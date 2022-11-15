include <../parameters.scad>

module board() {

    color("darkgreen")
    difference() {
        cube([board_l,board_w,board_thick]);

        translate([board_hole_x_offset, board_w-board_hole_y_offset,-fix])
        cylinder(d=board_hole_d, h=a_lot);

        translate([board_l-board_hole_x_offset, board_w-board_hole_y_offset,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    }

    color("silver")
    translate([board_l/2,board_w-welding_y_offset,board_thick])
    translate([-welding_l/2, -welding_w/2,0])
    cube([welding_l, welding_w, welding_h]);

    color("white")
    translate([board_l/2,board_cable_connector_y_offset,-board_cable_connector_h])
    translate([-board_cable_connector_l/2,0,0])
    cube([board_cable_connector_l, board_cable_connector_w, board_cable_connector_h]);
}
