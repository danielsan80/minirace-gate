include <../parameters.scad>

module slide_joint(h=10,void=false) {
    function p() = void?0.2:0;
    w1=1;
    w2=1.6;
    l=1.2;
    minkowski() {
        linear_extrude(h)
            polygon([
                    [0,-w1/2],
                    [0,w1/2],
                    [l,w2/2],
                    [l,-w2/2],
                    [0,-w1/2]
                ]);

        cylinder(r=p(), h=fix);
    }
}

module joint(h=10,void=false) {
    slide_joint(h=h, void=void);
}