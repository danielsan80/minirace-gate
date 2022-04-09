include <../../config/parameters.scad>

module nail_groove(w) {
    l = w-nail_groove_margin*2;
    r = nail_groove_r;

    translate([-l/2, -fix/2, -fix/2])
    minkowski() {
        cube([l, fix, fix]);
        sphere(r=r);
    }
}
