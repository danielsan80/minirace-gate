include <../../parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../interparts/angle-traverse.scad>

module sim_basement_box_R() {

    angle_traverse_cut_x_translate()
    translate([traverse_l(),0,0])
    angle_traverse_cut_x_translate()
    union() {
        sim_basement_box_bottom();
        sim_basement_box_top();
        sim_basement_box_side_slide();
    }
}

module sim_basement_box_bottom() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_bottom();
}

module sim_basement_box_top() {
    translate([0,0,-ground_thick-fix2])
    rotate([0,180,0])
    basement_box_top();
}

module sim_basement_box_side_slide() {
    translate([0,0,-ground_thick-fix2])
    translate([0,0,-basement_h()])
    basement_box_side_slide();
}