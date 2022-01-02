include <../modules/slide_joint.scad>

traverse_angle_cut_z_offset = hp(bar_w)/2+hp(pylon_side)-pylon_side-bar_w;

module angle_traverse_cut_translate() {
    z_offset = -profile_w_diff()/2;
    gap = reinforcement_gap;

    translate([0,0,z_offset])
        translate([0,0,traverse_angle_cut_z_offset])
            translate([-pylon_side/2,0,0])
                translate([0,0,angle_base_h])
                    rotate([0,45,0])
                        translate([pylon_side,0,pylon_side+gap])
                            rotate([0,-45,0])
                                children();
}

module angle_traverse_cut() {
    angle_traverse_cut_translate()
    translate([0,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
}

module traverse_plate_cut() {
    x_fix = hp(profile_w_diff());
    x_offset = hp(traverse_angle_cut_z_offset+x_fix);

    translate([x_offset,0,0])
        translate([-a_lot,-a_lot/2,-a_lot])
            cube([a_lot, a_lot, a_lot]);
}

module traverse_angle_joints_void() {
    translate([-fix,-pylon_side/2,0])
        joint(h=a_lot,void=true);

    translate([-fix,pylon_side/2,0])
        joint(h=a_lot,void=true);
}


module angle_traverse_joints() {
    c=1.1;
    translate([-fix,-pylon_side/2,0])
        joint(h=pylon_side+bar_w*c);

    translate([-fix,pylon_side/2,0])
        joint(h=pylon_side+bar_w*c);
}