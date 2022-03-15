include <../../../config/parameters.scad>
use <../../gate/modules/bar.scad>

module bar_wrapper(l=bar_wrapper_l, thick=bar_wrapper_thick) {
    difference() {
        minkowski() {
            bar(l=l);
            cylinder(r=thick+bar_wrapper_play, h=fix);
        }
        minkowski() {
            translate([0,0,-fix])
            bar(l=l+fix*2);
            cylinder(r=bar_wrapper_play, h=fix);
        }
        translate([-a_lot,-bar_w/2,-a_few/2])
        cube([a_lot,bar_w,l+a_few]);
    }

}
