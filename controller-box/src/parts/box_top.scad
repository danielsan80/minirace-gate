include <../../config/parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../interparts/box_bottom-box_top.scad>

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

module _box_top_nail_groove(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    translate([box_outer_w(box=box, box_terminal_outer_w=box_terminal_outer_w)/2,0,box_top_base_thick])
    nail_groove(box_inner_w(box=box, box_terminal_outer_w=box_terminal_outer_w));
}

module _box_top_controller_chip_led_hole() {
//    translate([box_outer_w(box="controller"),0,0])
    translate([-chip_led_hole_angle_pos.x,chip_led_hole_angle_pos.y,0])
    translate([0,0,-fix])
    cylinder(r=chip_led_hole_r, h=box_top_base_thick+fix*2);
}

module box_controller_top() {
    difference() {
        _box_top_main(box="controller");

        translate([0,0,box_top_base_thick])
        _box_top_dock_void(box="controller");

        _box_top_cylinder_joints_void(box="controller");

        _box_top_nail_groove(box="controller");

        _box_top_controller_chip_led_hole();
    }
//    _box_top_cylinder_joints(box="controller");

}

module box_terminal_top(box_terminal_outer_w=box_terminal_outer_w) {
    difference() {
        _box_top_main(box="terminal", box_terminal_outer_w=box_terminal_outer_w);

        translate([0,0,box_top_base_thick])
        _box_top_dock_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);

        _box_top_cylinder_joints_void(box="terminal", box_terminal_outer_w=box_terminal_outer_w);

        _box_top_nail_groove(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
    }
    //    _box_top_cylinder_joints(box="terminal", box_terminal_outer_w=box_terminal_outer_w);
}

module box_top(box, box_terminal_outer_w=box_terminal_outer_w) {
    assert(box=="controller" || box=="terminal");

    if (box=="controller") {
        box_controller_top();
    }
    if (box=="terminal") {
        box_terminal_top(box_terminal_outer_w=box_terminal_outer_w);
    }
}