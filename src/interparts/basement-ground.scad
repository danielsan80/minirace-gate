include <../parameters.scad>
use <../interparts/ground.scad>
use <../basement/values.scad>

module ground_base() {
    translate([-basement_w()/2, -basement_l()/2, -ground_thick+fix])
    cube([basement_w(), basement_l(), ground_thick]);
}