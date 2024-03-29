include <../../config/parameters.scad>

module _box_side_slide_shape_profile() {
    half_thick = box_wall_half_thick+fix2;
    polygon([
        [0,0],
        [half_thick,half_thick],
        [half_thick,box_inner_l-half_thick],
        [0,box_inner_l],
        [-half_thick+fix,box_inner_l-half_thick],
        [-half_thick,half_thick]
    ]);
}

module _box_side_slide_shape_body(void=false) {
    p = void?box_side_slide_play:0;
    minkowski() {
        linear_extrude(a_lot)
        _box_side_slide_shape_profile();

        cylinder(r=p, h=fix);
    }
}

module box_side_slide_shape(void=false) {
    translate([
        box_wall_half_thick,
        box_wall_thick,
        box_top_base_thick
    ])
    _box_side_slide_shape_body(void=void);
}

