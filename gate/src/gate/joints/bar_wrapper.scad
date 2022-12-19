include <../../../config/parameters.scad>
use <../../gate/modules/bar.scad>
use <../../gate/modules/profile.scad>

module bar_wrapper(w=bar_wrapper_w, thick=bar_wrapper_thick) {
    difference() {
        minkowski() {
            bar(l=w);
            cylinder(r=thick+bar_wrapper_play, h=fix);
        }
        minkowski() {
            translate([0,0,-fix])
            bar(l=w+fix*2);
            cylinder(r=bar_wrapper_play, h=fix);
        }
        translate([-a_lot,-bar_w/2,-a_few/2])
        cube([a_lot,bar_w,w+a_few]);
    }

}

function bar_wrapper_offset() = profile_outer_w()/2+bar_wrapper_play;