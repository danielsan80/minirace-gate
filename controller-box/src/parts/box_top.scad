include <../../config/parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../interparts/box_bottom-box_top.scad>

module _box_top_main(box="controller") {
    difference() {
        cube([box_outer_w(box),box_outer_l,box_top_base_thick+box_joint_h-box_joint_play]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
            cube([box_inner_w,box_inner_l,a_lot]);
    }
}

module _box_top_dock_void(box="controller") {
    difference() {
        translate([-fix,-fix,0])
            cube([box_outer_w(box)+fix*2, box_outer_l+fix*2, a_lot/2]);

        translate([0,0,-fix])
            dock_shape(part="top");
    }
}

//module _box_top_cylinder_joints(box="controller") {
//
//    translate([box_outer_w(box)/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
//    union() {
//        cylinder_joint(void=false, w=box_inner_w(box));
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=false, w=box_inner_w(box));
//    }
//}

module _box_top_cylinder_joints_void(box="controller") {

    translate([box_outer_w(box)/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
        union() {
            cylinder_joint(void=true, w=box_inner_w(box));

            translate([0,box_inner_l+box_wall_half_thick*2])
            cylinder_joint(void=true, w=box_inner_w(box));
        }
}

module _box_top_nail_groove(box="controller") {
    translate([box_outer_w(box)/2,0,box_top_base_thick])
        nail_groove(box_inner_w(box));
}

module box_top() {
    difference() {
        _box_top_main();

        translate([0,0,box_top_base_thick])
        _box_top_dock_void();

        _box_top_cylinder_joints_void();

        _box_top_nail_groove();
    }
//    _box_top_cylinder_joints();

}

module box_terminal_top() {
    difference() {
        _box_top_main(box="terminal");

        translate([0,0,box_top_base_thick])
            _box_top_dock_void(box="terminal");

        _box_top_cylinder_joints_void(box="terminal");

        _box_top_nail_groove(box="terminal");
    }
    //    _box_top_cylinder_joints();

}