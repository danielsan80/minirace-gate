include <../parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
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

module _box_bottom_rail() {
    translate([0,0,-rail_bottom_w])
    hull() {
        translate([0,0,rail_bottom_w])
        cube([box_inner_w, rail_bottom_w, fix]);
        cube([box_inner_w, fix, fix]);
    }
}

module _box_bottom_rails() {

    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick+card_z_offset])
    union() {
        translate([0,box_inner_l,0])
        mirror([0,1,0])
        _box_bottom_rail();

        _box_bottom_rail();
    }
}

module _box_top_rail() {

    translate([rail_top_left_r,box_inner_l,0])
    minkowski() {
        cube([box_inner_w-rail_top_left_r*2, fix, fix]);
        sphere(r=rail_top_left_r);
    }


    translate([rail_top_right_r,0,0])
    minkowski() {
        cube([box_inner_w-rail_top_right_r*2, fix, fix]);
        sphere(r=rail_top_right_r);
    }
}

module _box_top_rails() {

    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick+card_z_offset+card_thick+card_play*2])
    _box_top_rail();
}

module _box_bottom_antenna_hole() {
    translate([0,-antenna_w + box_wall_thick + box_inner_l-antenna_side_margin,0])
    rotate([0,-45,0])
    translate([-a_lot/2,0,-antenna_thick/2])
    cube([a_lot,antenna_w,antenna_thick]);
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

            _box_bottom_rails();
            _box_top_rails();
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
