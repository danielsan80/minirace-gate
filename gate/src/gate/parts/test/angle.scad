include <../../../../config/parameters.scad>
use <../../../gate/modules/profile.scad>
use <../../../gate/interparts/angle-traverse.scad>
use <../../../gate/parts/angle.scad>


module test_angle() {
    difference() {
        intersection() {
            angle();

            translate([pylon_side/2+bar_w/2,-a_lot/2,angle_traverse_pos_z_offset()-angle_base_h])
                cube([a_lot, a_lot, a_lot]);
        }
        translate([angle_traverse_pos_x_offset()-a_lot-profile_outer_w()/2,-a_lot/2,angle_traverse_pos_z_offset()])
            cube([a_lot, a_lot, a_lot]);

        translate([0,-pylon_side/2+profile_outer_w()/2,angle_traverse_pos_z_offset()])
            cube([a_lot,pylon_side-profile_outer_w(),a_lot]);

    }
}