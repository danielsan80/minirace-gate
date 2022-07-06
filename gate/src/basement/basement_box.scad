include <../../config/parameters.scad>
use <../basement/values.scad>
use <../gate/interparts/upright_base_level1.scad>
use <../gate/interparts/upright_base_hole.scad>
use <../gate/interparts/upright_base_groove.scad>
use <../gate/interparts/basement_upright_margin.scad>
use <../../vendor/controller-box/src/parts/box_bottom.scad>
use <../../vendor/controller-box/src/parts/box_top.scad>
use <../../vendor/controller-box/src/parts/box_side_slide.scad>
//use <../gate/interparts/angle-traverse.scad>


//function _basement_box_controller_center_x_offset() = -(basement_box_controller_w()-upright_base_level1_w())/2+basement_upright_margin();
function _basement_box_controller_center_offset() = [
        -basement_box_controller_w()/2+upright_base_level1_w()/2+basement_upright_margin(),
        -basement_l()/2
        +basement_box_controller_card_pos().y
        +basement_box_controller_card_startlights_connector_pos().y
//            -upright_base_level1_l()/2
//        -basement_upright_margin()
];

module basement_box_controller_bottom() {
    translate([-_basement_box_controller_center_offset().x,-_basement_box_controller_center_offset().y,0])
    translate([-basement_box_controller_w()/2,-basement_l()/2,0])
    box_bottom(box="controller");
}

module basement_box_controller_top(with_hole=true, with_groove=true) {
    difference() {
        translate([+_basement_box_controller_center_offset().x,-_basement_box_controller_center_offset().y,0])
        translate([-basement_box_controller_w()/2,-basement_l()/2,0])
        box_top(box="controller");

        if (with_hole) {
            upright_base_hole();
        }
        if (with_groove) {
            rotate([0,180,0])
            upright_base_groove();
        }
    }
}

module basement_box_top_hole_cap() {
    minkowski() {
        intersection() {
            upright_base_hole(void=true);
            translate([-a_lot/2,-a_lot/2,0])
            cube([a_lot,a_lot,box_top_base_thick()]);
        }
        cylinder(r=box_top_base_thick(),h=fix);
    }

    translate([0,0,box_top_base_thick()-fix])
    intersection() {
        upright_base_hole(void=false);
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot,a_lot,box_top_base_thick()+basement_box_top_hole_cap_ring_h+basement_box_top_hole_cap_ring_play]);
    }

    translate([0,0,box_top_base_thick()*2+basement_box_top_hole_cap_ring_play-fix])
    intersection() {
        minkowski() {
            upright_base_hole(void=false);
            cylinder(r=upright_base_hole_play/2, h=fix);
        }
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot,a_lot,basement_box_top_hole_cap_ring_h]);
    }
}

module basement_box_controller_side_slide() {
    translate([-_basement_box_controller_center_offset().x,-_basement_box_controller_center_offset().y,0])
    translate([-basement_box_controller_w()/2,-basement_l()/2,0])
    box_controller_side_slide();
}


module basement_box_terminal_bottom() {
    translate([0,-_basement_box_controller_center_offset().y,0])
    translate([-basement_box_terminal_w()/2,-basement_l()/2,0])
    box_bottom(box="terminal", box_terminal_outer_w=basement_box_terminal_w());
}

module basement_box_terminal_top(with_hole=true, with_groove=true) {
    difference() {
        translate([0,-_basement_box_controller_center_offset().y,0])
        translate([-basement_box_terminal_w()/2,-basement_l()/2,0])
            box_top(box="terminal", box_terminal_outer_w=basement_box_terminal_w());

        if (with_hole) {
            upright_base_hole();
        }
        if (with_groove) {
            rotate([0,180,0])
                upright_base_groove();
        }
    }
}

module basement_box_terminal_side_slide() {
    translate([0,-_basement_box_controller_center_offset().y,0])
    translate([-basement_box_terminal_w()/2,-basement_l()/2,0])
        box_side_slide(box="terminal",box_terminal_outer_w=basement_box_terminal_w());
}