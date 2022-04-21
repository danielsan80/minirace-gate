include <../../../config/parameters.scad>
use <../../gate/joints/button_joint.scad>

module upright_angle_joint_traverse_top(void=false, rotation=0) {
    p = void?upright_angle_joint_traverse_play:0;
    w = 1+p*2;
    l = pylon_side;
    h = upright_angle_joint_h+p;

    rotate([0,0,rotation])
    translate([-w/2,0,0])
    cube([w, l, h]);
}

module upright_angle_joint_traverse_bottom(rotation=0) {
    w = bar_w;
    l = pylon_side;
    h = angle_base_h*angle_base_h2_c;

    rotate([0,0,rotation])
    translate([-w/2,0,-h])
    cube([w, l, h]);
}

module upright_angle_joint(void=false, rotation=0, with_top=true) {
    r=upright_angle_joint_r;
    h=upright_angle_joint_h;
    if (void) {
        button_joint_void(r=r, h=h);
        if (with_top) {
            upright_angle_joint_traverse_top(void = void, rotation = rotation);

        }
        upright_angle_joint_traverse_bottom(rotation=rotation);
    } else {
        button_joint(r=r, h=h);
        if (with_top) {
            upright_angle_joint_traverse_top(void = void, rotation = rotation);
        }
        upright_angle_joint_traverse_bottom(rotation=rotation);
    }
}

module upright_angle_joints() {

    upright_angle_joint(void=false, rotation=0);

    translate([pylon_side, 0, 0])
    upright_angle_joint(void=false, rotation=90);

    translate([0, pylon_side, 0])
    upright_angle_joint(void=false, rotation=270);

    translate([pylon_side, pylon_side, 0])
    upright_angle_joint(void=false, rotation=180, with_top=false);

}

module upright_angle_joints_holes() {

    upright_angle_joint(void=false);

    translate([pylon_side, 0, 0])
        upright_angle_joint(void=false);

    translate([0, pylon_side, 0])
        upright_angle_joint(void=false);

    translate([pylon_side, pylon_side, 0])
        upright_angle_joint(void=false);

}

module upright_angle_joints_void() {

    upright_angle_joint(void=true, rotation=0);

    translate([pylon_side, 0, 0])
        upright_angle_joint(void=true, rotation=90);

    translate([0, pylon_side, 0])
        upright_angle_joint(void=true, rotation=270);

    translate([pylon_side, pylon_side, 0])
        upright_angle_joint(void=true, rotation=180, with_top=false);

}
