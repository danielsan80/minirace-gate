include <../../../config/parameters.scad>

use <../../../src/cover/cover.scad>



module sim_hanging_startlights_transform() {
    rotate([90,0,0])
    children();
}


module sim_cover() {
    cover();
}