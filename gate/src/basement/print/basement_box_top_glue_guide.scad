include <../../../config/parameters.scad>
use <../../basement/values.scad>
use <../../basement/basement_box.scad>
use <../../../vendor/controller-box/src/parts/print/box_side_slide.scad>
use <../../gate/interparts/upright_base_level1.scad>


module upright_base_level1_hole() {
    p = 0.15;
    minkowski() {
        upright_base_level1();
        cylinder(r=p, h=a_few, center=true);
    }
}

module upright_base_level1_frame() {
    p = 0.15;
    border_w=layer_w*2;
    thick=layer_h*3;
    intersection() {
        minkowski() {
            upright_base_level1();
            cylinder(r=border_w+p, h=thick, center=true);
        }

        translate([-a_lot/2,-a_lot/2])
        cube([a_lot, a_lot, thick]);
    }
}

module grid_blade() {
    border_w=layer_w*2;
    thick=layer_h*3;


    translate([-border_w/2,-a_lot/2,0])
    cube([border_w,a_lot,thick]);
}


module grid() {
    blade_gap = 15;

    n=12;
    for(i=[-n:n]) {
        rotate([0,0,-45])
        translate([blade_gap*i,0,0])
        grid_blade();

        rotate([0,0,45])
        translate([blade_gap*i,0,0])
        grid_blade();
    }
}

module print_terminal_box_glue_guide_main() {
    h=2;
    border_w=layer_w*2;
    thick=layer_h*3;
    p = 0.15;

    difference() {
        cube([basement_box_terminal_w()+p*2+thick*2,basement_l()+p*2+thick*2,h]);

        translate([thick, thick, thick])
        cube([basement_box_terminal_w()+p*2,basement_l()+p*2, a_lot]);

        translate([thick+border_w, thick+border_w, -a_lot/2])
        cube([basement_box_terminal_w()-border_w*2, basement_l()-border_w*2, a_lot]);
    }

    intersection() {
        cube([basement_box_terminal_w()+p*2+thick*2,basement_l()+p*2+thick*2,h]);
        grid();
    }


    translate([basement_box_terminal_w()/2, basement_l()/2,0])
    translate([thick+p, thick+p,0])
    upright_base_level1_frame();
}



module print_terminal_box_glue_guide() {
    h=2;
    border_w=layer_w*2;
    thick=layer_h*3;
    p = 0.15;

    difference() {
        print_terminal_box_glue_guide_main();

        translate([basement_box_terminal_w()/2, basement_l()/2,0])
        translate([thick+p, thick+p,0])
        upright_base_level1_hole();
    }

}
