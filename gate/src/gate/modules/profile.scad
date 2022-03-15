include <../../../config/parameters.scad>

function profile_outer_w(w=bar_w) = w/profile_w*profile_h*2+w;
function profile_inner_w(w=bar_w) = w;
function profile_w_diff(w=bar_w) = profile_outer_w(w)-profile_inner_w(w);

module profile(w = bar_w) {
    w1 = profile_w;
    s = 6;
    h = profile_h;
    a = 50;
    k = 2.5;

    w2 = 17.5;


    x0 = s/2;
    y0 = w1/2;

    x1 = s/2+cos(a)*h;
    y1 = w1/2+h;

    x2 = s/2+cos(a)*h+k;
    y2 = w1/2+h;

    x3 = w2/2;
    y3 = w2/2;


    scale([w/w1, w/w1])
    polygon([
        [x0,y0],
        [x1,y1],
        [x2,y2],

        [x3,y3],

        [y2,x2],
        [y1,x1],
        [y0,x0],
        [y0,-x0],
        [y1,-x1],
        [y2,-x2],

        [y3,-x3],

        [x2,-y2],
        [x1,-y1],
        [x0,-y0],
        [-x0,-y0],
        [-x1,-y1],
        [-x2,-y2],

        [-x3,-y3],

        [-y2,-x2],
        [-y1,-x1],
        [-y0,-x0],
        [-y0,x0],
        [-y1,x1],
        [-y2,x2],

        [-y3,x3],

        [-x2,y2],
        [-x1,y1],
        [-x0,y0],
    ]);
}