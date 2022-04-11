include <../../config/parameters.scad>
use <../functions.scad>
use <../values.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../joints/keep.scad>
use <../interparts/box_bottom-box_top.scad>
use <../interparts/box_bottom-box_side_slide.scad>

module _box_bottom_main(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    difference() {
        cube([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w),box_outer_l,box_outer_h-box_top_base_thick]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
        cube([box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w),box_inner_l,a_lot]);
    }
}

module _box_bottom_dock_void(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([0,0,box_outer_h-box_top_base_thick-box_joint_h])
    dock_shape(part="bottom", box=box, box_terminal_outer_w=box_terminal_outer_w);
}

module _box_bottom_cylinder_joints(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
    union() {
        cylinder_joint(void=false, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));

        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=false, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
    }
}

//module _box_bottom_cylinder_joints_void(box="controller", box_terminal_outer_w=box_terminal_outer_w) {
//
//    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,box_wall_half_thick,box_outer_h-box_top_base_thick-box_joint_h/2])
//    union() {
//        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
//    }
//}

module _box_bottom_nail_groove(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,0,box_outer_h-box_top_base_thick])
    nail_groove(w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
}

module _box_controller_angle_keep() {
    keep_l = card_keep_l;

    keep(l=keep_l, with_wall=true, with_hold=true);

    translate([0,keep_l-keep_wall_thick,0])
    rotate([0,0,-90])
    keep(l=keep_l, with_wall=true, with_hold=false);
}

module _box_controller_guide() {
    keep_l = card_keep_l;

    rotate([0,0,-90])
    keep(l=keep_l, with_wall=true, with_hold=false);
}

module _box_controller_front_right_keep() {
    translate([
        box_controller_inner_w-card_back_margin-card_w-card_play*2,
        box_inner_l-card_left_margin-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    _box_controller_angle_keep();
}

module _box_controller_front_left_keep() {
    translate([
        box_controller_inner_w-card_back_margin-card_w-card_play*2,
        box_inner_l-card_left_margin,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    _box_controller_angle_keep();
}

module _box_controller_back_right_keep() {
    translate([
        box_controller_inner_w-card_back_margin,
        box_inner_l-card_left_margin-card_l-card_play*2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([1,0,0])
    _box_controller_angle_keep();
}

module _box_controller_back_left_keep() {
    translate([
        box_controller_inner_w-card_back_margin,
        box_inner_l-card_left_margin,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([0,1,0])
    mirror([1,0,0])
    _box_controller_angle_keep();
}

module _box_controller_back_guide_keep() {
    translate([
        box_controller_inner_w-card_back_margin,
        box_inner_l-antenna_guide_side_margin-antenna_guide_thick-antenna_guides_distance,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    mirror([1,0,0])
    _box_controller_guide();
}

module _box_controller_front_guide_keep() {
    translate([
        box_controller_inner_w-card_back_margin-card_play*2-card_w,
        box_inner_l-antenna_guide_side_margin-antenna_guide_thick-antenna_guides_distance,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    _box_controller_guide();
}


module _box_controller_central_keep() {
    translate([
        box_controller_inner_w-card_back_margin-card_play-card_w/2,
        box_inner_l-card_left_margin-card_play-card_l/2,
        0
    ])
    translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
    cylinder(r=card_central_keep_r, h=card_z_offset);
}


module _box_controller_keeps() {
    _box_controller_front_right_keep();
    _box_controller_front_left_keep();

    _box_controller_back_left_keep();
    _box_controller_back_right_keep();

    _box_controller_central_keep();

    _box_controller_back_guide_keep();
    _box_controller_front_guide_keep();
}

module _box_controller_bottom_antenna_hole() {
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

module _box_terminal_bottom_antenna_hole(box_terminal_outer_w=box_terminal_outer_w) {
    translate([box_outer_w(box="terminal", box_terminal_outer_w=box_terminal_outer_w)/2,0,0])
    mirror([1,0,0])
    translate([-box_outer_w(box="terminal", box_terminal_outer_w=box_terminal_outer_w)/2,0,0])
    _box_controller_bottom_antenna_hole();
}

module _box_controller_bottom_chip_connector_central_hole() {
    color("blue")
    translate([-chip_connector_hole_w/2,-fix, -chip_connector_hole_h/2])
    cube([
        chip_connector_hole_w,
        box_wall_thick+fix*2,
        chip_connector_hole_h
    ]);
}

module _box_controller_bottom_chip_connector_inner_niche() {
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

module _box_controller_bottom_chip_connector_outer_niche() {
    color("blue")
    translate([-chip_connector_outer_niche_w/2,-box_wall_thick+chip_connector_outer_niche_offset, -chip_connector_outer_niche_h/2])
    cube([
        chip_connector_outer_niche_w,
        box_wall_thick,
        chip_connector_outer_niche_h
    ]);
}



module _box_controller_bottom_chip_connector_hole() {
    translate([
        box_wall_thick+antenna_start_margin+card_play+chip_x+chip_w/2,
        0,
        box_bottom_base_thick+card_z_offset+card_thick+chip_z_offset+chip_thick+chip_connector_h/2,
    ])
    union() {
        _box_controller_bottom_chip_connector_central_hole();
        _box_controller_bottom_chip_connector_inner_niche();
        _box_controller_bottom_chip_connector_outer_niche();
    }
}


module _box_terminal_antenna_guide(box_terminal_outer_w=box_terminal_outer_w) {
    cube([box_inner_w(box="terminal", box_terminal_outer_w=box_terminal_outer_w)-antenna_guide_play, antenna_guide_thick, box_inner_h-box_joint_h-box_joint_play]);
}

module _box_terminal_antenna_guide_ramp(box_terminal_outer_w=box_terminal_outer_w) {
    translate([0,antenna_guide_thick+antenna_hole_w,0])
    rotate([90,0,0])
    linear_extrude(height=antenna_guides_distance)
    difference() {
        square([box_inner_h/3,box_inner_h/3]);
        translate([box_inner_h/3,box_inner_h/3])
        circle(r=box_inner_h/3);
    }
}

module _box_terminal_antenna_guides(box_terminal_outer_w=box_terminal_outer_w) {

    translate([0, -antenna_guide_side_margin, 0])
    translate([0, box_inner_l, 0])
    translate([box_wall_thick, -antenna_guides_distance, box_bottom_base_thick])
    union() {
        _box_terminal_antenna_guide(box_terminal_outer_w=box_terminal_outer_w);

        translate([0,antenna_guide_thick+antenna_guides_distance,0])
        _box_terminal_antenna_guide(box_terminal_outer_w=box_terminal_outer_w);

        _box_terminal_antenna_guide_ramp(box_terminal_outer_w=box_terminal_outer_w);
    }
}

module box_controller_bottom_complete() {
    difference() {
        union() {
            difference() {
                _box_bottom_main(box="controller");
                _box_bottom_dock_void(box="controller");
                _box_bottom_nail_groove(box="controller");
            }
            _box_bottom_cylinder_joints(box="controller");

            _box_controller_keeps();
        }
        _box_controller_bottom_antenna_hole();
//        _box_bottom_cylinder_joints_void();
        _box_controller_bottom_chip_connector_hole();
    }
}

module box_controller_bottom() {
    difference() {
        box_controller_bottom_complete();
        box_controller_side_slide_shape(void=true);
    }
}

module box_terminal_bottom_complete(box_terminal_outer_w=box_terminal_outer_w) {
    difference() {
        union() {
            difference() {
                _box_bottom_main(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
                _box_bottom_dock_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
                _box_bottom_nail_groove(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
            }
            _box_bottom_cylinder_joints(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
        }
        _box_terminal_bottom_antenna_hole(box_terminal_outer_w=box_terminal_outer_w);
        //        _box_bottom_cylinder_joints_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
    }

    _box_terminal_antenna_guides(box_terminal_outer_w=box_terminal_outer_w);
}

module box_terminal_bottom(box_terminal_outer_w=box_terminal_outer_w) {
    difference() {
        box_terminal_bottom_complete(box_terminal_outer_w=box_terminal_outer_w);
        box_terminal_side_slide_shape(void=true, box_terminal_outer_w=box_terminal_outer_w);
    }
}

module box_bottom(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    if (box=="controller") {
        box_controller_bottom();
    }
    if (box=="terminal") {
        box_terminal_bottom(box_terminal_outer_w=box_terminal_outer_w);
    }
}
