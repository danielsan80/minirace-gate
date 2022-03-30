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
    keep(l=keep_l, with_wall=false);
}

module _box_right_back_keep() {
    keep_l = (card_w-chip_w)/2-chip_play;

    translate([
        box_inner_w-keep_l,
        box_inner_l-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    keep(l=keep_l, with_wall=true);
}

module _box_right_front_keep() {
    keep_l = (card_w-chip_w)/2-chip_play;

    translate([
        box_inner_w-card_w-card_play*2,
        box_inner_l-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    keep(l=keep_l, with_wall=true);
}

module _box_front_right_keep() {
    keep_l = (card_w-chip_w)/2-chip_play + keep_wall_thick;

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
    keep_l = (card_w-chip_w)/2-chip_play;

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
    translate([0,-antenna_w + box_wall_thick + box_inner_l-antenna_side_margin,0])
    rotate([0,-45,0])
    translate([-a_lot/2,0,-antenna_thick_void/2])
    cube([a_lot,antenna_w,antenna_thick_void]);
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
    }
}

module box_bottom() {
    difference() {
        box_bottom_complete();
        box_side_slide_shape(void=true);
    }
}
