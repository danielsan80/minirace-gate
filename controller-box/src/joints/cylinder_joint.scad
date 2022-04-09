include <../../config/parameters.scad>

module cylinder_joint(void=false, w) {
    l = w-cylinder_joint_margin*2;
    r = cylinder_joint_r;
    p = void?cylinder_joint_play:0;

    translate([-l/2, -fix/2, -fix/2])
        minkowski() {
            cube([l, fix, fix]);
            sphere(r=r+p);
        }
}