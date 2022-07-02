include <../../../../config/parameters.scad>
use <../../../gate/parts/print/upright.scad>


module test_upright_holes() {
    z_offset = upright_h-15;
    intersection() {
        print_upright_with_angle_joints_holes();

        translate([-a_lot/2,-a_lot/2,z_offset])
        cube([a_lot, a_lot, a_lot]);
    }

    translate([-pylon_side/2,-pylon_side/2, z_offset])
    cube([pylon_side, pylon_side,1]);
}
