include <../parameters.scad>
use <../modules/button_joint.scad>


module upright_angle_joint(void=false) {
    c=0.2;
    h=upright_angle_joint_h;
    if (void) {
        button_joint_void(r=bar_w/2-c, h=h);
    } else {
        button_joint(r=bar_w/2-c, h=h);
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
