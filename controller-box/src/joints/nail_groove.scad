include <../parameters.scad>

module nail_groove() {
    l = nail_groove_l;
    r = nail_groove_r;

    translate([-l/2, -fix/2, -fix/2])
    minkowski() {
        cube([l, fix, fix]);
        sphere(r=r);
    }
}
