include <../../parameters.scad>
use <../../gate/joints/button_joint.scad>


module upright_angle_joint(void=false) {
    r=upright_angle_joint_r;
    h=upright_angle_joint_h;
    if (void) {
        button_joint_void(r=r, h=h);
    } else {
        button_joint(r=r, h=h);
    }
}

module upright_angle_joints() {

    upright_angle_joint(void=false);

    translate([pylon_side, 0, 0])
        upright_angle_joint(void=false);

    translate([0, pylon_side, 0])
        upright_angle_joint(void=false);

    translate([pylon_side, pylon_side, 0])
        upright_angle_joint(void=false);

}

module upright_angle_joints_void() {

    upright_angle_joint(void=true);

    translate([pylon_side, 0, 0])
        upright_angle_joint(void=true);

    translate([0, pylon_side, 0])
        upright_angle_joint(void=true);

    translate([pylon_side, pylon_side, 0])
        upright_angle_joint(void=true);

}
