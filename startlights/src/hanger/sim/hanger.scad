include <../../../config/parameters.scad>
use <../../../src/hanger/clip_rod_joint.scad>
use <../../../src/joint/print/ct_slide.scad>


module sim_rod_center() {
    translate([
        0,
        hanger_clip_rod_joint_pixel().x*4/2,
        -hanger_clip_rod_joint_pixel().y*5/2
    ])
    children();
}

module sim_rod_rotate() {
    rotate([-90,0,0])
    children();
}

module sim_rod_transform() {
    translate([board_l/2,0,0])
    children();
}

module sim_rod_color() {
    color("darkgray")
    children();
}


module sim_clip_center() {
    translate([
        -hanger_clip_rod_joint_pixel().x*4/2,
        -hanger_clip_rod_joint_pixel().y*5/2,
        -hanger_clip_w/2
    ])
    children();
}

module sim_clip_rotate() {
    rotate([0,-90,0])
    children();
}

module sim_clip_x2_transform() {
    
    translate([board_hole_offset.x,0,0])
    children();
    translate([board_l-board_hole_offset.x,0,0])
    children();
}

module sim_clip_rod_transform() {
    translate([0,0,-4*hanger_clip_rod_joint_pixel().x/2])
    translate([0,-board_hole_offset.y,0])
    translate([0,board_w,0])
//    translate([0,-hanger_clip_rod_joint_pixel().y*5/2,0])
    children();
}


module sim_clip_color() {
    color("gray")
    children();
}
