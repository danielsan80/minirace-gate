include <../../config/parameters.scad>
use <../../vendor/startlights/src/hanger/clip.scad>
use <../../vendor/startlights/src/hanger/rod.scad>
use <../../vendor/startlights/src/hanger/clip_rod_joint.scad>

//TODO maybe is better to not include parameters.scad bat use a import_parameters.scad with var => var() to avoid global scope
//UPDATE check if global scope problem exists
module startlights_hanger_clip_c(w=bar_wrapper_w) {
    hanger_clip_c(w=w);
}

module startlights_hanger_clip() {
    hanger_clip();
}

module startlights_hanger_rod() {
    hanger_rod();
}

function startlights_hanger_clip_rod_joint_pixel() = hanger_clip_rod_joint_pixel();