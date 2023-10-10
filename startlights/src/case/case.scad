include <../../config/parameters.scad>


module _case_base_x10() {
    translate([0,bar_x_offset, 0])
    cube([side*5+space_x*4,side*2+space_y-bar_x_offset*2,case_base_thick]);
    
}

module _case_block_x10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j, 0, 0])
        cube([side,side*2+space_y,case_thick]);
    }
}

module _case_solid_x10() {
    _case_base_x10();
    _case_block_x10();
}

module _case_void_x10() {
    translate([board_margin-case_play,board_margin-case_play, case_base_thick+fix])
    cube([board_l+case_play*2, board_w+case_play*2, a_lot]);
    
}

module _case_cable_connector_hole_x10() {
        translate([board_l/2+board_margin,board_cable_connector_y_offset+board_margin,0])
        translate([
            -board_cable_connector_l/2-board_cable_connector_play,
            -board_cable_connector_play,
            0
        ])
        translate([0,0,-a_lot/2])
        cube([
            board_cable_connector_l+board_cable_connector_play*2,
            board_cable_connector_w+board_cable_connector_play*2,
            a_lot
        ]);
}

module _case_hooks_holes() {
    translate([board_offset.x, board_offset.y, -board_thick-board_startlights_gap])
    union() {
        translate([board_hole_offset.x, board_w-board_hole_offset.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
        
        translate([board_l-board_hole_offset.x, board_w-board_hole_offset.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
    }
}


module _case_x10() {
    difference() {
        _case_solid_x10();
        _case_void_x10();
        _case_cable_connector_hole_x10();
        _case_hooks_holes();
    }
}

module case() {
    translate([0,0,-4.5])
    _case_x10();
}