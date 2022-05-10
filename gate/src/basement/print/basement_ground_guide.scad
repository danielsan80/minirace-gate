include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../gate/interparts/basement_upright_margin.scad>
use <../../gate/interparts/upright_base_level1.scad>


module _basement_ground_guide_upright_base_level1_hole() {
    p = basement_ground_guide_play;

    minkowski() {
        upright_base_level1();
        cylinder(r=p, h=a_few, center=true);
    }
}

module _basement_ground_guide_upright_base_level1_frame() {
    p = basement_ground_guide_play;
    line_w = basement_ground_guide_line_w;
    thick = basement_ground_guide_thick;
    intersection() {
        minkowski() {
            upright_base_level1();
            cylinder(r=line_w+p, h=thick, center=true);
        }

        translate([-a_lot/2,-a_lot/2])
        cube([a_lot, a_lot, thick]);
    }
}

module _basement_ground_guide_grid_line() {
    line_w=basement_ground_guide_line_w;
    thick=basement_ground_guide_thick;

    translate([-line_w/2,-a_lot/2,0])
    cube([line_w,a_lot,thick]);
}


module _basement_ground_guide_grid() {
    grid_gap = basement_ground_guide_grid_gap;

    n=12;
    for(i=[-n:n]) {
        rotate([0,0,-45])
        translate([grid_gap*i,0,0])
        _basement_ground_guide_grid_line();

        rotate([0,0,45])
        translate([grid_gap*i,0,0])
        _basement_ground_guide_grid_line();
    }
}

module _basement_ground_guide_main(box) {
    assert(box=="controller" || box=="terminal");

    h=basement_ground_guide_h;
    line_w=basement_ground_guide_line_w;
    thick=basement_ground_guide_thick;
    p = basement_ground_guide_play;
    basement_w = basement_w(box=box);

    difference() {
        cube([basement_w+p*2+thick*2,basement_l()+p*2+thick*2,h]);

        translate([thick, thick, thick])
        cube([basement_w+p*2,basement_l()+p*2, a_lot]);

        translate([thick+p+line_w, thick+line_w, -a_lot/2])
        cube([basement_w-line_w*2, basement_l()-line_w*2, a_lot]);
    }

    intersection() {
        cube([basement_w+p*2+thick*2,basement_l()+p*2+thick*2,h]);
        _basement_ground_guide_grid();
    }

    translate([basement_upright_margin(),0,0])
    translate([upright_base_level1_w()/2+p, basement_l()/2,0])
    translate([thick+p, thick+p,0])
    _basement_ground_guide_upright_base_level1_frame();
}



module print_basement_ground_guide(box) {
    assert(box=="controller" || box=="terminal");

    h=basement_ground_guide_h;
    line_w=basement_ground_guide_line_w;
    thick=basement_ground_guide_thick;
    p = basement_ground_guide_play;
    basement_w = basement_w(box=box);

    difference() {
        _basement_ground_guide_main(box=box);

        translate([basement_upright_margin(),0,0])
        translate([upright_base_level1_w()/2+p, basement_l()/2,0])
        translate([thick+p, thick+p,0])
        _basement_ground_guide_upright_base_level1_hole();
    }
}

