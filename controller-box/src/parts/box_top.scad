include <../../config/parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../interparts/box_bottom-box_top.scad>
use <../parts/box_bottom.scad>

module _box_top_main() {
    translate([-10,-10,0])
    cube([20,20,box_bottom_base_thick]);

}

module _box_top_dock_void() {

    difference() {
        translate([-fix,-fix,0])
            cube([box_outer_w+fix*2, box_outer_l+fix*2, a_lot/2]);

        translate([0,0,-fix])
            dock_shape(part="top");
    }
}

//module _box_top_cylinder_joints() {
//    translate([box_outer_w/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
//    union() {
//        cylinder_joint(void=false, w=box_inner_w);
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=false, w=box_inner_w);
//    }
//}

module _box_top_cylinder_joints_void() {

    translate([box_outer_w/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
    union() {
        cylinder_joint(void=true, w=box_inner_w);

        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=true, w=box_inner_w);
    }
}

module _box_top_cylinder_joints_fix() {
    translate([box_outer_w/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
    union() {
        translate([0,cylinder_joint_r+cylinder_joint_play,0])
        cylinder_joint(void=true, w=box_inner_w);

        translate([0,-cylinder_joint_r-cylinder_joint_play,0])
        translate([0,box_inner_l+box_wall_half_thick*2])
        cylinder_joint(void=true, w=box_inner_w);
    }
}

module _box_top_nail_groove() {
    translate([box_outer_w/2,0,box_top_base_thick])
    nail_groove(box_inner_w);
}

module _box_top_chip_led_hole(angle_pos) {
    translate([0,0,-fix])
    cylinder(r=chip_led_hole_r, h=box_top_base_thick+fix*2);
}

module _box_top_chip_blue_led_hole() {
    _box_top_chip_led_hole(chip_blue_led_hole_angle_pos);
}

module _box_top_chip_red_led_hole() {
    _box_top_chip_led_hole(chip_red_led_hole_angle_pos);
}

module _box_top_chip_led_hole_tube(angle_pos) {
    ceil_thick = 1.5;
    tap_ext = 0.5;
    tap_thick = 0.5;

    module body() {
        cylinder(r=chip_led_hole_tube_r+chip_led_hole_tube_r_ext, h=chip_led_hole_tube_h1+chip_led_hole_tube_h2);
        cylinder(r=chip_led_hole_tube_r+chip_led_hole_tube_r_ext+tap_ext, h=ceil_thick+tap_thick);
    }

    module hole() {
        translate([0,0,-fix])
        cylinder(r=chip_led_hole_r, h=a_lot);

        translate([0,0,chip_led_hole_tube_h1])
        cylinder(r=chip_led_hole_r+chip_led_hole_tube_r_ext, h=a_lot);
        
        translate([0,0,-fix])
        cylinder(r=chip_led_hole_tube_r+chip_led_hole_tube_r_ext+tap_ext+fix, h=ceil_thick);
        
    }

    difference() {
        body();
        hole();
    }
}

module _box_top_chip_blue_led_hole_tube(angle_pos) {
    _box_top_chip_led_hole_tube(chip_blue_led_hole_angle_pos);
}

module _box_top_chip_red_led_hole_tube(angle_pos) {
    _box_top_chip_led_hole_tube(chip_red_led_hole_angle_pos);
}

module _box_top_startlight_cable_side_hole_transform() {
    translate([box_outer_w,0,0])
    translate([0,0,box_outer_h])
    rotate([0,180,0])
    children();
}

module box_top() {
    
//    difference() {
//        union() {
//            _box_top_main();
////            _box_top_cylinder_joints_fix();
//        }
//
////        translate([0,0,box_top_base_thick])
////        _box_top_dock_void();
//
////        _box_top_cylinder_joints_void();
//
////        _box_top_nail_groove();
//
//        _box_top_chip_blue_led_hole();
////        _box_top_chip_red_led_hole();
//
////        _box_top_startlight_cable_side_hole_transform()
////        box_startlights_side_hole();
//    }
//    _box_top_chip_blue_led_hole_tube();
    
//    translate([9,0,0])
//    _box_top_chip_blue_led_hole_tube();
    _box_top_chip_red_led_hole_tube();
    
//    intersection() {
//        box_bottom_complete();
//        _box_top_startlight_cable_side_hole_transform()
//        difference() {
//            box_startlights_side_hole_cut(void=false);
//            box_startlights_side_hole();
//        }
//    }
}