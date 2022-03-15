include <../../../config/parameters.scad>

module bolt_joint(side=3, h=10, void=false) {
    p = void?bolt_joint_play:0;
    s = side+p;

    linear_extrude(h)
    polygon([
        [-cos(60)*s,sin(60)*s],
        [cos(60)*s,sin(60)*s],
        [s,0],
        [cos(60)*s,-sin(60)*s],
        [-cos(60)*s,-sin(60)*s],
        [-s,0],
        [-cos(60)*s,sin(60)*s],
    ]);
}
