include <../../../config/parameters.scad>

function gear_points(n_tooths, r1, r2,i=0) =
    let(n_tooth_steps=6)
    let(steps=n_tooths*n_tooth_steps)
    let(alpha=360/steps*i)
    let(beta=360/n_tooth_steps*(i%n_tooth_steps))
    let(r=(cos(beta)+1)/2*(r1-r2)+r2)
    i<steps?concat([[r*cos(alpha), r*sin(alpha)]], gear_points(n_tooths, r1,r2,i+1)):[]
;

module button_joint(r=3, h=6) {
    cylinder(r=r, h=h);
}


module button_joint_void(r=3, h=6) {
    tooth_l = button_joint_play;
    linear_extrude(height=h)
    polygon(points = gear_points(n_tooths = 18, r1=r+tooth_l/2, r2=r-tooth_l/2));
}
