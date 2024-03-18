include <../../../config/parameters.scad>

use <../../../src/cover/cover.scad>


module _cover_recess_support() {
    base_ext = 1;
    
    difference() {
        union() {
            translate([-base_ext,-base_ext,0])
                cube([cover_l+base_ext*2,cover_h+base_ext*2,layer_w]);
            cube([cover_l,cover_h,cover_recess_h-layer_h]);
        }
        
        translate([layer_w,layer_w,-fix])
            cube([cover_l-layer_w*2,cover_h-layer_w*2,cover_recess_h-layer_h+fix*2]);
    }
}

module print_cover() {
    cover();
    _cover_recess_support();
}