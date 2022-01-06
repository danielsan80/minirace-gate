include <../modules/slide_joint.scad>

traverse_angle_cut_z_offset = hp(bar_w)/2+hp(pylon_side)-pylon_side-bar_w;

function angle_traverse_cut_x_offset() =
    let(gap = reinforcement_gap)
    let(x=pylon_side)
    let(z=pylon_side+gap)
    let(hypo = hp2(x, z))
    let(alpha=asin(z/hypo)-45)
    -pylon_side/2+cos(alpha)*hypo;

traverse_l = uprights_distance- angle_traverse_cut_x_offset()*2;

module traverse_side_transform(side="left") {
    if (side=="left") {
        children();
    } else if (side=="right"){
        translate([traverse_l,0,0])
            rotate([0,0,180])
                children();
    }
}

module angle_traverse_cut_x_translate() {
    translate([angle_traverse_cut_x_offset(),0,0])
    children();
}

module angle_traverse_cut_z_translate() {
    z_offset = -profile_w_diff()/2;
    gap = reinforcement_gap;

    x=pylon_side;
    z=pylon_side+gap;
    hypo = hp2(x, z);
    alpha=asin(z/hypo)-45;

    translate([0,0,z_offset])
    translate([0,0,angle_base_h])
    translate([0,0,traverse_angle_cut_z_offset])
    translate([0,0,sin(alpha)*hypo])
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
        x_fix = hp(profile_w_diff());
        x_offset = hp(traverse_angle_cut_z_offset+x_fix);

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