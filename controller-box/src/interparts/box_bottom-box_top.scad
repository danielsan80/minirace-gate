include <../../config/parameters.scad>
include <../../src/values.scad>


module dock_shape(part="bottom", box="controller") {

    hp = part=="bottom"?box_joint_half_play:-box_joint_half_play;
    translate([
        box_wall_half_thick-hp,
        box_wall_half_thick-hp,
        0
    ])
    cube([
        box_outer_w(box)-box_wall_half_thick*2+hp*2,
        box_outer_l-box_wall_half_thick*2+hp*2,
        a_lot
    ]);
}
