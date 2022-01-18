include <../parameters.scad>
use <../functions.scad>
use <../modules/profile.scad>
use <../modules/slide_joint.scad>

traverse_angle_align_offset = pylon_side + bar_w + profile_w_diff()/2;

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
    sin(45)*r + base_h + hp(bar_w)/2 - traverse_angle_align_offset
;

function traverse_l() = uprights_distance - angle_traverse_pos_x_offset()*2;

module traverse_side_transform(side="left") {
    if (side=="left") {
        children();
    } else if (side=="right"){
        translate([traverse_l(),0,0])
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

module traverse_plate_cut(side="left") {
    module body() {
        x_offset = hp(profile_outer_w()+pylon_side) - traverse_angle_align_offset;

        translate([x_offset,0,0])
        translate([-a_lot,-a_lot/2,-a_lot])
        cube([a_lot, a_lot, a_lot]);
    }

    traverse_side_transform(side=side)
    body();
}

module traverse_angle_joints_void(side="left") {
    module body() {
        translate([-fix,-pylon_side/2,-a_lot/2])
        slide_joint(h=a_lot,void=true);

        translate([-fix,pylon_side/2,-a_lot/2])
        slide_joint(h=a_lot,void=true);
    }

    traverse_side_transform(side=side)
    body();
}


module angle_traverse_joints() {
    c=1.1;
    translate([-fix,-pylon_side/2,0])
    slide_joint(h=pylon_side+bar_w*c);

    translate([-fix,pylon_side/2,0])
    slide_joint(h=pylon_side+bar_w*c);
}