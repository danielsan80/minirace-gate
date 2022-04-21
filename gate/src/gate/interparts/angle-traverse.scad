include <../../../config/parameters.scad>
use <../../functions.scad>
use <../../gate/modules/profile.scad>
use <../../gate/joints/v_slide.scad>
use <../../gate/interparts/uprights_distance.scad>

function traverse_angle_align_offset() = pylon_side + bar_w + profile_w_diff()/2;

function angle_traverse_pos_x_offset() =
        let(gap = reinforcement_gap)
        let(side=pylon_side)
        let(r=side+gap+side)
        cos(45)*r-side/2
;

function angle_traverse_pos_z_offset() =
    let(gap = reinforcement_gap)
    let(side=pylon_side)
    let(base_h=angle_base_h)
    let(r=side+gap+side)
    sin(45)*r + base_h + hp(bar_w)/2 - traverse_angle_align_offset()
;

// mode="basement"|"upright"|"center"
function traverse_l(mode="basement") = uprights_distance(mode=mode) - angle_traverse_pos_x_offset()*2;

// mode="basement"|"upright"|"center"
module traverse_side_transform(side="left", mode="basement") {
    traverse_l = traverse_l(mode=mode);

    if (side=="left") {
        children();
    } else if (side=="right"){
        translate([traverse_l,0,0])
            rotate([0,0,180])
                children();
    }
}

module angle_traverse_cut_x_translate() {
    translate([angle_traverse_pos_x_offset(),0,0])
    children();
}

module angle_traverse_cut_z_translate() {
    translate([0,0,angle_traverse_pos_z_offset()])
    children();
}

module angle_traverse_cut_translate() {
    angle_traverse_cut_x_translate()
    angle_traverse_cut_z_translate()
    children();
}

module angle_traverse_cut() {
    angle_traverse_cut_translate()
    translate([0,-a_lot/2,0])
    cube([a_lot,a_lot,a_lot]);
}

// mode="basement"|"upright"|"center"
module traverse_plate_cut(side="left", mode="basement") {
    module body() {
        x_offset = hp(profile_outer_w()+pylon_side) - traverse_angle_align_offset();

        translate([x_offset,0,0])
        translate([-a_lot,-a_lot/2,-a_lot])
        cube([a_lot, a_lot, a_lot]);
    }

    traverse_side_transform(side=side, mode=mode)
    body();
}

// mode="basement"|"upright"|"center"
module traverse_angle_joints_void(side="left", mode="basement") {
    traverse_l=traverse_l(mode=mode);
    module body() {
        translate([-fix,-pylon_side/2,-a_lot/2])
        v_slide(h=a_lot,void=true);

        translate([-fix,pylon_side/2,-a_lot/2])
        v_slide(h=a_lot,void=true);
    }

    traverse_side_transform(side=side, mode=mode)
    body();
}


module angle_traverse_joints() {
    c=1.1;
    translate([-fix,-pylon_side/2,0])
    v_slide(h=pylon_side+bar_w*c);

    translate([-fix,pylon_side/2,0])
    v_slide(h=pylon_side+bar_w*c);
}