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
    translate([case_wall_w, case_wall_w, case_base_thick+fix])
    cube([cover_l-case_wall_w*2, cover_h-case_wall_w*2, a_lot]);
    
}

module _case_cable_connector_hole_x10() {
        translate([cover_l/2+board_cable_connector_offset.x,cover_h/2+board_cable_connector_offset.y,0])
        translate([
            -board_cable_connector_l/2-board_cable_connector_play,
            -board_cable_connector_w/2-board_cable_connector_play,
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
    translate([0, 0, -board_thick-board_cover_gap]) {
        translate([cover_l/2-cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
        cylinder(d=board_hole_d, h=a_lot);
        
        translate([cover_l/2+cover_hook_pos.x, cover_h/2+cover_hook_pos.y,-fix])
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
    translate([0,0,-case_thick-0.2])
    _case_x10();
}