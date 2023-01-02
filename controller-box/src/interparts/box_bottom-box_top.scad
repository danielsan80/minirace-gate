include <../../config/parameters.scad>
use <../../src/values.scad>


module dock_shape(part="bottom") {
    assert(part == "bottom" || part == "top");

    hp = part=="bottom"?box_joint_half_play:-box_joint_half_play;
    translate([
        box_wall_half_thick-hp,
        box_wall_half_thick-hp,
        0
    ])
    cube([
        box_outer_w()-box_wall_half_thick*2+hp*2,
        box_outer_l-box_wall_half_thick*2+hp*2,
        a_lot
    ]);
}


module box_startlights_side_hole_transform() {
    translate([0, startlights_cable_side_hole_pos.x, startlights_cable_side_hole_pos.y])
    translate([-a_few/2, -startlights_cable_side_hole_w/2, -startlights_cable_side_hole_h/2])
    children();
}

module box_controller_startlights_side_hole_cut(void=true) {
    p = void?0:startlights_cable_side_hole_play;
    box_startlights_side_hole_transform()
    translate([0, p, p])
    cube([a_few, startlights_cable_side_hole_w-p*2, a_lot]);
}