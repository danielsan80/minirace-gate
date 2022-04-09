include <../../config/parameters.scad>
use <../functions.scad>
use <../values.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../joints/keep.scad>
use <../interparts/box_bottom-box_top.scad>
use <../interparts/box_bottom-box_side_slide.scad>

module _box_bottom_main(box="controller") {
    difference() {
        cube([box_outer_w(box),box_outer_l,box_outer_h-box_top_base_thick]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
        cube([box_inner_w(box),box_inner_l,a_lot]);

    }
}

module _box_bottom_dock_void(box="controller") {
    translate([0,0,box_outer_h-box_top_base_thick-box_joint_h])
    dock_shape(part="bottom", box=box);
}

module _box_bottom_cylinder_joints(box="controller") {

    translate([box_outer_w(box)/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
    union() {
        cylinder_joint(void=false, w=box_inner_w(box));

        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=false, w=box_inner_w(box));
    }
}

//module _box_bottom_cylinder_joints_void(box="controller") {
//
//    translate([box_outer_w(box)/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
//    union() {
//        cylinder_joint(void=true, w=box_inner_w(box));
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=true, w=box_inner_w(box));
//    }
//}

module _box_bottom_nail_groove(box="controller") {
    translate([box_outer_w(box)/2,0,box_outer_h-box_top_base_thick])
    nail_groove(w=box_inner_w(box));
}

module _box_left_back_keep() {
    keep_l = card_keep_l;

    translate([
        box_inner_w-card_back_margin-keep_l,
        box_inner_l-card_left_margin,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    keep(l=keep_l, with_wall=true, with_hold=true);
}

module _box_angle_keep() {
    keep_l = card_keep_l;

    keep(l=keep_l, with_wall=true, with_hold=true);

    translate([0,keep_l-keep_wall_thick,0])
    rotate([0,0,-90])
    keep(l=keep_l, with_wall=true, with_hold=false);
}

module _box_front_right_keep() {
    translate([
        box_inner_w-card_back_margin-card_w-card_play*2,
        box_inner_l-card_left_margin-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    _box_angle_keep();
}

module _box_front_left_keep() {
    translate([
        box_inner_w-card_back_margin-card_w-card_play*2,
        box_inner_l-card_left_margin,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    _box_angle_keep();
}

module _box_back_right_keep() {
    translate([
        box_inner_w-card_back_margin,
        box_inner_l-card_left_margin-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([1,0,0])
    _box_angle_keep();
}

module _box_back_left_keep() {
    translate([
        box_inner_w-card_back_margin,
        box_inner_l-card_left_margin,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    mirror([1,0,0])
    _box_angle_keep();
}

module _box_central_keep() {
    translate([
        box_inner_w-card_back_margin-card_play-card_w/2,
        box_inner_l-card_left_margin-card_play-card_l/2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    cylinder(r=card_central_keep_r, h=card_z_offset);
}


module _box_keeps() {
    _box_front_right_keep();
    _box_front_left_keep();

    _box_back_left_keep();
    _box_back_right_keep();

    _box_central_keep();
}

module _box_bottom_antenna_hole() {
    color("blue")
    translate([layer_w*2,0,0])
    translate([0, -antenna_w-antenna_play+box_wall_thick+box_inner_l-card_left_margin-card_play-antenna_side_margin, 0])
    union() {
        translate([0,0,box_bottom_base_thick])
        rotate([0,-45,0])
        translate([0,0,-antenna_hole_thick])
        translate([-a_few/2,0,0])
        cube([a_few,antenna_hole_w,antenna_hole_thick]);

        translate([-a_few,0,0])
        cube([a_few,antenna_hole_w,box_bottom_base_thick]);

        translate([box_bottom_base_thick,0,box_bottom_base_thick])
        cube([box_wall_thick,antenna_hole_w,box_bottom_base_thick]);
    }
}

module _box_terminal_bottom_antenna_hole() {
    translate([box_outer_w(box="terminal")/2,0,0])
    mirror([1,0,0])
    translate([-box_outer_w(box="terminal")/2,0,0])
    _box_bottom_antenna_hole();
}

module _box_bottom_chip_connector_central_hole() {
    color("blue")
    translate([-chip_connector_hole_w/2,-fix, -chip_connector_hole_h/2])
    cube([
        chip_connector_hole_w,
        box_wall_thick+fix*2,
        chip_connector_hole_h
    ]);
}

module _box_bottom_chip_connector_inner_niche() {
    color("blue")
    translate([
        -chip_connector_inner_niche_w/2,
        box_wall_thick-chip_connector_inner_niche_offset,
        -chip_connector_inner_niche_h+chip_connector_h/2+chip_connector_inner_niche_margin_h
    ])
    cube([
        chip_connector_inner_niche_w,
        box_wall_thick,
        chip_connector_inner_niche_h
    ]);
}

module _box_bottom_chip_connector_outer_niche() {
    color("blue")
    translate([-chip_connector_outer_niche_w/2,-box_wall_thick+chip_connector_outer_niche_offset, -chip_connector_outer_niche_h/2])
    cube([
        chip_connector_outer_niche_w,
        box_wall_thick,
        chip_connector_outer_niche_h
    ]);
}



module _box_bottom_chip_connector_hole() {
    translate([
        box_wall_thick+antenna_start_margin+card_play+chip_x+chip_w/2,
        0,
        box_bottom_base_thick+card_z_offset+card_thick+chip_z_offset+chip_thick+chip_connector_h/2,
    ])
    union() {
        _box_bottom_chip_connector_central_hole();
        _box_bottom_chip_connector_inner_niche();
        _box_bottom_chip_connector_outer_niche();
    }
}

module box_bottom_complete() {
    difference() {
        union() {
            difference() {
                _box_bottom_main();
                _box_bottom_dock_void();
                _box_bottom_nail_groove();
            }
            _box_bottom_cylinder_joints();

            _box_keeps();
        }
        _box_bottom_antenna_hole();
//        _box_bottom_cylinder_joints_void();
        _box_bottom_chip_connector_hole();
    }
}

module box_bottom() {
    difference() {
        box_bottom_complete();
        box_controller_side_slide_shape(void=true);
    }
}

module box_terminal_bottom_complete() {
    difference() {
        union() {
            difference() {
                _box_bottom_main(box="terminal");
                _box_bottom_dock_void(box="terminal");
                _box_bottom_nail_groove(box="terminal");
            }
            _box_bottom_cylinder_joints(box="terminal");
        }
        _box_terminal_bottom_antenna_hole();
        //        _box_bottom_cylinder_joints_void();
    }
}

module box_terminal_bottom() {
    difference() {
        box_terminal_bottom_complete();
        box_terminal_side_slide_shape(void=true);
    }
}
