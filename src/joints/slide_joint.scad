include <../parameters.scad>

module slide_joint(h=10,void=false) {
    p = void?play2:0;
    w1=0.7;
    w2=2.0;
    l=1.5;
    minkowski() {
        linear_extrude(h)
        polygon([
                [0,-w1/2],
                [0,w1/2],
                [l,w2/2],
                [l,-w2/2],
                [0,-w1/2]
            ]);

        cylinder(r=p, h=fix);
    }
}
