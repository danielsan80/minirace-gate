include <../../../config/parameters.scad>

module button_joint(r=3, h=6) {
    cylinder(r=r, h=h);
}


module button_joint_void(r=3, h=6) {
    ring_r = 0.1;

    fillet_r = 0.5;
    p = button_joint_play;

    cylinder(r=r+p, h=h+p);
}
