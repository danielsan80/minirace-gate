include <../../config/parameters.scad>
use <../../src/joint/ct_slide.scad>


function hanger_rod_hook_d() = board_hole_d-hanger_rod_hook_play*2;


module hanger_rod_hook(
    d=hanger_rod_hook_d(),
    l=hanger_rod_hook_l
) {
    r=hanger_rod_hook_r;
    angle=hanger_rod_hook_angle;
    w = hanger_rod_hook_w;
    
    translate([0,0,ct_slide_side/2])
    rotate([90,0,0])
    intersection() {
        union() {
            cylinder(d=d, h=l);
            
            rotate([0,0,-90])
            translate([-r,0,l])
            rotate([90,0,0])
            rotate_extrude(angle=angle, convexity=10)
            translate([r,0])
            circle(d=d);
        }
        translate([-w/2, -a_lot/2,-a_lot/2])
        cube([w,a_lot,a_lot]);
    }
}

module hanger_rod_ct_slide_transform() {
    translate([board_l/2,0,0])
    rotate([0,0,-90])
    rotate([90,0,0])
    children();
}


module hanger_rod() {
    l=board_l;
    hook_offset = l/2-board_hole_x_offset;
    
    hanger_rod_ct_slide_transform()
    ct_slide_t(w=l);
    
    translate([hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook();
    
    translate([-hook_offset,0,0])
    translate([0,-ct_slide_side,0])
    hanger_rod_hook();
    
}

