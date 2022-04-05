include <../../config/parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../joints/keep.scad>
use <../interparts/box_bottom-box_top.scad>
use <../interparts/box_bottom-box_side_slide.scad>

module _box_bottom_main() {
    difference() {
        cube([box_outer_w,box_outer_l,box_outer_h-box_top_base_thick]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
        cube([box_inner_w,box_inner_l,a_lot]);

    }
}

module _box_bottom_dock_void() {
    translate([0,0,box_outer_h-box_top_base_thick-box_joint_h])
    dock_shape(part="bottom");
}

module _box_bottom_cylinder_joints() {

    translate([box_outer_w/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
    union() {
        cylinder_joint(void=false);

        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=false);
    }
}

//module _box_bottom_cylinder_joints_void() {
//
//    translate([box_outer_w/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
//    union() {
//        cylinder_joint(void=true);
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=true);
//    }
//}

module _box_bottom_nail_groove() {
    translate([box_outer_w/2,0,box_outer_h-box_top_base_thick])
    nail_groove();
}

module _box_left_keep() {
    keep_l = card_w+card_play*2;

    translate([
        box_inner_w-keep_l,
        box_inner_l,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    keep(l=keep_l, with_wall=false, with_hold=true);
}

module _box_right_back_keep() {
    keep_l = (card_w-chip_w)/2-chip_play*2;

    translate([
        box_inner_w-keep_l,
        box_inner_l-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    keep(l=keep_l, with_wall=true, with_hold=true);
}

module _box_right_front_keep() {
    keep_l = (card_w-chip_w)/2-chip_play*2;

    translate([
        box_inner_w-card_w-card_play*2,
        box_inner_l-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    keep(l=keep_l, with_wall=true, with_hold=true);
}

module _box_front_right_keep() {
    keep_l = (card_w-chip_w)/2-chip_play*2 + keep_wall_thick;

    translate([
        box_inner_w-card_w-card_play*2,
        box_inner_l-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    translate([0,keep_l-keep_wall_thick,0])
    rotate([0,0,-90])
    keep(l=keep_l, with_wall=true, with_hold=false);
}

module _box_front_left_keep() {
    keep_l = (card_w-chip_w)/2-chip_play*2;

    translate([
        box_inner_w-card_w-card_play*2,
        box_inner_l,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    rotate([0,0,-90])
    keep(l=keep_l, with_wall=true, with_hold=false);
}

module _box_keeps() {
    _box_left_keep();
    _box_right_back_keep();
    _box_right_front_keep();
    _box_front_right_keep();
    _box_front_left_keep();
}

module _box_bottom_antenna_hole() {
    color("blue")
//    translate([0, -antenna_w + box_wall_thick + box_inner_l-antenna_side_margin, 0])
    translate([0, -antenna_w+box_wall_thick+box_inner_l-card_play-antenna_side_margin, 0])
    rotate([0,-45,0])
    translate([0,-antenna_play,0])
    translate([-a_lot/2,0,-antenna_hole_thick/2])
    cube([a_lot,antenna_hole_w,antenna_hole_thick]);
}

module _box_bottom_chip_connector_central_hole() {
//    translate([
//        box_wall_thick+antenna_start_margin+card_play+chip_x+(chip_w-chip_connector_w)/2,
//        0,
//        box_bottom_base_thick+card_z_offset+card_thick+chip_thick,
//    ])
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
//    translate([
//        box_wall_thick+antenna_start_margin+card_play+chip_x+chip_w/2,
//        0,
//        box_bottom_base_thick+card_z_offset+card_thick+chip_thick+chip_connector_h/2,
//    ])
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
        box_bottom_base_thick+card_z_offset+card_thick+chip_thick+chip_connector_h/2,
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
        box_side_slide_shape(void=true);
    }
}
