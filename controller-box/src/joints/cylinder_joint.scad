include <../parameters.scad>

module cylinder_joint(void=false) {
    l = cylinder_joint_l;
    r = cylinder_joint_r;
    p = void?cylinder_joint_play:0;

    translate([-l/2, -fix/2, -fix/2])
        minkowski() {
            cube([l, fix, fix]);
            sphere(r=r+p);
        }
}