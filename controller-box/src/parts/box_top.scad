include <../../config/parameters.scad>
use <../joints/nail_groove.scad>
use <../joints/cylinder_joint.scad>
use <../interparts/box_bottom-box_top.scad>

module _box_top_main() {
    difference() {
        cube([box_outer_w,box_outer_l,box_top_base_thick+box_joint_h-box_joint_play]);

        translate([box_wall_thick,box_wall_thick,box_bottom_base_thick])
            cube([box_inner_w,box_inner_l,a_lot]);
    }
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
//
//    translate([box_outer_w/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
//    union() {
//        cylinder_joint(void=false);
//
//        translate([0,box_inner_l+box_wall_half_thick*2])
//        cylinder_joint(void=false);
//    }
//}

module _box_top_cylinder_joints_void() {

    translate([box_outer_w/2,+box_wall_half_thick,box_top_base_thick+box_joint_h/2])
        union() {
            cylinder_joint(void=true);

            translate([0,box_inner_l+box_wall_half_thick*2])
                cylinder_joint(void=true);
        }
}

module _box_top_nail_groove() {
    translate([box_outer_w/2,0,box_top_base_thick])
        nail_groove();
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