include <../../../config/parameters.scad>

function _gear_points(n_tooths, r1, r2,i=0) =
    let(n_tooth_steps=6)
    let(steps=n_tooths*n_tooth_steps)
    let(alpha=360/steps*i)
    let(beta=360/n_tooth_steps*(i%n_tooth_steps))
    let(r=(cos(beta)+1)/2*(r1-r2)+r2)
    i<steps?concat([[r*cos(alpha), r*sin(alpha)]], _gear_points(n_tooths, r1,r2,i+1)):[]
;

module _upright_angle_joint_button(r=3, h=6) {
    cylinder(r=r, h=h);
}

module _upright_angle_joint_button_void(r=3, h=6) {
    tooth_l = upright_angle_joint_button_play;

    linear_extrude(height=h+upright_angle_joint_button_play)
    polygon(points = _gear_points(n_tooths = 16, r1=r+tooth_l*4/5, r2=r-tooth_l*1/5));
}

module _upright_angle_joint_bar_top(void=false, rotation=0) {
    p = void?upright_angle_joint_bar_top_play:0;
    w = upright_angle_joint_bar_top_w+p*2;
    l = pylon_side;
    h = upright_angle_joint_button_h+p;

    rotate([0,0,rotation])
    translate([-w/2,0,0])
    cube([w, l, h]);
}

module _upright_angle_joint_bar_bottom(rotation=0) {
    w = bar_w;
    l = pylon_side;
    h = upright_angle_joint_bar_bottom_h;

    rotate([0,0,rotation])
    translate([-w/2,0,-h])
    cube([w, l, h]);
}

module upright_angle_joint(void=false, rotation=0, with_top=true) {
    r=upright_angle_joint_button_r;
    h=upright_angle_joint_button_h;
    if (void) {
        _upright_angle_joint_button_void(r=r, h=h);
        if (with_top) {
            _upright_angle_joint_bar_top(void = void, rotation = rotation);

        }
        _upright_angle_joint_bar_bottom(rotation=rotation);
    } else {
        _upright_angle_joint_button(r=r, h=h);
        if (with_top) {
            _upright_angle_joint_bar_top(void = void, rotation = rotation);
        }
        _upright_angle_joint_bar_bottom(rotation=rotation);
    }
}

module upright_angle_joints() {

    upright_angle_joint(void=false, rotation=0);

    translate([pylon_side, 0, 0])
    upright_angle_joint(void=false, rotation=90);

    translate([0, pylon_side, 0])
    upright_angle_joint(void=false, rotation=270);

    translate([pylon_side, pylon_side, 0])
    upright_angle_joint(void=false, rotation=180, with_top=false);

}

module upright_angle_joints_void() {

    upright_angle_joint(void=true, rotation=0);

    translate([pylon_side, 0, 0])
        upright_angle_joint(void=true, rotation=90);

    translate([0, pylon_side, 0])
        upright_angle_joint(void=true, rotation=270);

    translate([pylon_side, pylon_side, 0])
        upright_angle_joint(void=true, rotation=180, with_top=false);

}
