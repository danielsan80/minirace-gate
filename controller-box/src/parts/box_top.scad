include <../../config/parameters.scad>
use <../values.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../interparts/box_bottom-box_top.scad>
use <../parts/box_bottom.scad>

module _box_top_main(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    difference() {
        cube([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w),box_outer_l,box_top_base_thick+box_joint_h-box_joint_play]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
        cube([box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w),box_inner_l,a_lot]);
    }
}

module _box_top_dock_void(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    difference() {
        translate([-fix,-fix,0])
            cube([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)+fix*2, box_outer_l+fix*2, a_lot/2]);

        translate([0,0,-fix])
            dock_shape(part="top", box=box, box_terminal_outer_w=box_terminal_outer_w);
    }
}

//module _box_top_cylinder_joints(box, box_terminal_outer_w=box_terminal_outer_w) {
//    assert(box=="controller" || box=="terminal");
//
//    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
//    union() {
//        cylinder_joint(void=false, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=false, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
//    }
//}

module _box_top_cylinder_joints_void(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
    union() {
        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));

        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
    }
}

module _box_top_cylinder_joints_fix(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
    union() {
        translate([0,cylinder_joint_r+cylinder_joint_play,0])
        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));

        translate([0,-cylinder_joint_r-cylinder_joint_play,0])
        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=true, w=box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
    }
}

module _box_top_nail_groove(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,0,box_top_base_thick])
    nail_groove(box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
}

module _box_top_controller_chip_led_hole(angle_pos) {
    translate([-angle_pos.x,angle_pos.y,0])
    translate([0,0,-fix])
    cylinder(r=chip_led_hole_r, h=box_top_base_thick+fix*2);
}

module _box_top_controller_chip_blue_led_hole() {
    _box_top_controller_chip_led_hole(chip_blue_led_hole_angle_pos);
}

module _box_top_controller_chip_red_led_hole() {
    _box_top_controller_chip_led_hole(chip_red_led_hole_angle_pos);
}

module _box_top_controller_chip_led_hole_tube(angle_pos) {

    module body() {
        cylinder(r=chip_led_hole_tube_r+chip_led_hole_tube_r_ext, h=chip_led_hole_tube_h1+chip_led_hole_tube_h2);
    }

    module hole() {
        translate([0,0,-fix])
        cylinder(r=chip_led_hole_r, h=a_lot);

        translate([0,0,chip_led_hole_tube_h1])
        cylinder(r=chip_led_hole_r+chip_led_hole_tube_r_ext, h=a_lot);
    }

    translate([-angle_pos.x,angle_pos.y,0])
    difference() {
        body();
        hole();
    }
}

module _box_top_controller_chip_blue_led_hole_tube(angle_pos) {
    _box_top_controller_chip_led_hole_tube(chip_blue_led_hole_angle_pos);
}

module _box_top_controller_chip_red_led_hole_tube(angle_pos) {
    _box_top_controller_chip_led_hole_tube(chip_red_led_hole_angle_pos);
}

module _box_controller_top_startlight_cable_side_hole_transform() {
    translate([box_controller_outer_w,0,0])
    translate([0,0,box_outer_h])
    rotate([0,180,0])
    children();
}

module box_terminal_top(box_terminal_outer_w=box_terminal_outer_w) {
    difference() {
        union() {
            _box_top_main(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
            _box_top_cylinder_joints_fix(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
        }

        translate([0,0,box_top_base_thick])
        _box_top_dock_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);

        _box_top_cylinder_joints_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);

        _box_top_nail_groove(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
    }
    //    _box_top_cylinder_joints(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
}

module box_top() {
    difference() {
        union() {
            _box_top_main(box="controller");
            _box_top_cylinder_joints_fix(box="controller");
        }
        
        translate([0,0,box_top_base_thick])
        _box_top_dock_void(box="controller");
        
        _box_top_cylinder_joints_void(box="controller");
        
        _box_top_nail_groove(box="controller");
        
        _box_top_controller_chip_blue_led_hole();
        _box_top_controller_chip_red_led_hole();
        
        _box_controller_top_startlight_cable_side_hole_transform()
        box_controller_startlights_side_hole();
    }
    _box_top_controller_chip_blue_led_hole_tube();
    _box_top_controller_chip_red_led_hole_tube();
    //    _box_top_cylinder_joints(box="controller");
    
    intersection() {
        box_controller_bottom_complete();
        _box_controller_top_startlight_cable_side_hole_transform()
        difference() {
            box_controller_startlights_side_hole_cut(void=false);
            box_controller_startlights_side_hole();
        }
    }
}