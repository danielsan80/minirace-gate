include <../../config/parameters.scad>


function ct_slide_pixel() = [ct_slide_side/4, ct_slide_side/5];
function ct_slide_size() = [4, 5];

module ct_slide_t_profile() {
    side = ct_slide_side;
    x = side/4;
    y = side/5;
    
    polygon([
        [x,y],
        [x,y*4],
        [x*2,y*4],
        [x*2,y*3],
        [x*3,y*3],
        [x*3,y*5],
        [x*4,y*5],
        [x*4,0],
        [x*3,0],
        [x*3,y*2],
        [x*2,y*2],
        [x*2,y*1],
    ]);
}

module ct_slide_c_profile() {
    
    side = ct_slide_side;
    x = side/4;
    y = side/5;
    p = ct_slide_play;
    
    difference() {
        square([x*4,y*5]);
        minkowski() {
            ct_slide_t_profile();
            
            translate([-p, -p])
            square([p*2, p*2]);
        }
    }
}

module ct_slide_t(w) {
    linear_extrude(w)
    ct_slide_t_profile();
};

module ct_slide_c(w) {
    linear_extrude(w)
    ct_slide_c_profile();
};


