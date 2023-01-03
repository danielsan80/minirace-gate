//include <../../config/parameters.scad>
//use <../basement/values.scad>
//use <../basement/basement_box_controller_center_offset.scad>
//use <../gate/interparts/basement_upright.scad>
//use <../gate/interparts/upright_base_level1.scad>
//
//
//module _basement_bolting_guide_upright_base_level1_hole() {
//    p = basement_bolting_guide_play;
//
//    minkowski() {
//        upright_base_level1();
//        cylinder(r=p, h=a_few, center=true);
//    }
//}
//
//module _basement_bolting_guide_upright_base_level1_frame() {
//    p = basement_bolting_guide_play;
//    line_w = basement_bolting_guide_line_w;
//    thick = basement_bolting_guide_thick;
//
//    intersection() {
//        minkowski() {
//            upright_base_level1();
//            cylinder(r=line_w+p, h=thick, center=true);
//        }
//
//        translate([-a_lot/2,-a_lot/2])
//        cube([a_lot, a_lot, thick]);
//    }
//}
//
//module _basement_bolting_guide_grid_line() {
//    line_w=basement_bolting_guide_line_w;
//    thick=basement_bolting_guide_thick;
//
//    translate([-line_w/2,-a_lot/2,0])
//    cube([line_w,a_lot,thick]);
//}
//
//
//module _basement_bolting_guide_grid() {
//    grid_gap = basement_bolting_guide_grid_gap;
//
//    n=12;
//    for(i=[-n:n]) {
//        rotate([0,0,-45])
//        translate([grid_gap*i,0,0])
//        _basement_bolting_guide_grid_line();
//
//        rotate([0,0,45])
//        translate([grid_gap*i,0,0])
//        _basement_bolting_guide_grid_line();
//    }
//}
//
//function _basement_bolting_guide_transform_x(box) =
//    let(wall_thick = basement_bolting_guide_wall_thick)
//    let(p = basement_bolting_guide_play)
//    let(basement_w = basement_w(box=box))
//    wall_thick + p + basement_upright_margin + upright_base_level1_w()/2
//;
//
//
//function _basement_bolting_guide_transform_y(box) =
//    let(wall_thick=basement_bolting_guide_wall_thick)
//    let(p = basement_bolting_guide_play)
//    let(basement_w = basement_w(box=box))
//    wall_thick+p+basement_l()/2-basement_box_controller_center_offset().y;
//
//module _basement_bolting_guide_transform(box) {
//    translate([
//        -_basement_bolting_guide_transform_x(box),
//        -_basement_bolting_guide_transform_y(box),
//        0
//    ])
//    children();
//}
//
//module _basement_box_controller_bolting_guide_led_frame() {
//    cylinder(d=basement_box_controller_chip_led_hole_cap_d()+basement_bolting_guide_line_w*2+basement_bolting_guide_chip_led_hole_cap_play*2, h=basement_bolting_guide_thick);
//}
//
//module _basement_box_controller_bolting_guide_led_hole() {
//    translate([0,0,-fix2])
//    cylinder(d=basement_box_controller_chip_led_hole_cap_d()+basement_bolting_guide_chip_led_hole_cap_play*2, h=basement_bolting_guide_thick+fix2*2);
//}
//
//module _basement_box_controller_bolting_guide_blue_led_transform() {
//    p = basement_bolting_guide_play;
//    wall_thick=basement_bolting_guide_wall_thick;
//    blue_led_pos = basement_box_controller_chip_blue_led_hole_angle_pos();
//    red_led_pos = basement_box_controller_chip_red_led_hole_angle_pos();
//
//    translate([basement_w(box="controller")-p*2+wall_thick*2+blue_led_pos.x, basement_l()-p*2+wall_thick*2-blue_led_pos.y,0])
//    children();
//}
//
//module _basement_box_controller_bolting_guide_red_led_transform() {
//    p = basement_bolting_guide_play;
//    wall_thick=basement_bolting_guide_wall_thick;
//    blue_led_pos = basement_box_controller_chip_blue_led_hole_angle_pos();
//    red_led_pos = basement_box_controller_chip_red_led_hole_angle_pos();
//
//    translate([basement_w(box="controller")-p*2+wall_thick*2+red_led_pos.x, basement_l()-p*2+wall_thick*2-red_led_pos.y,0])
//    children();
//}
//
//module _basement_box_controller_bolting_guide_leds_frame() {
//
//    _basement_box_controller_bolting_guide_blue_led_transform()
//    _basement_box_controller_bolting_guide_led_frame();
//
//    _basement_box_controller_bolting_guide_red_led_transform()
//    _basement_box_controller_bolting_guide_led_frame();
//}
//
//module _basement_box_controller_bolting_guide_leds_holes() {
//
//    _basement_box_controller_bolting_guide_blue_led_transform()
//    _basement_box_controller_bolting_guide_led_hole();
//
//    _basement_box_controller_bolting_guide_red_led_transform()
//    _basement_box_controller_bolting_guide_led_hole();
//}
//
//module _basement_bolting_guide_main(box) {
//    assert(box=="controller" || box=="terminal");
//
//    h=basement_bolting_guide_h;
//    line_w=basement_bolting_guide_line_w;
//    thick=basement_bolting_guide_thick;
//    wall_thick=basement_bolting_guide_wall_thick;
//    p = basement_bolting_guide_play;
//    basement_w = basement_w(box=box);
//
//    difference() {
//        cube([basement_w+p*2+wall_thick*2,basement_l()+p*2+wall_thick*2,h]);
//
//        translate([wall_thick, wall_thick, thick])
//        cube([basement_w+p*2,basement_l()+p*2, a_lot]);
//
//        translate([wall_thick+p+line_w, wall_thick+p+line_w, -a_lot/2])
//        cube([basement_w-line_w*2, basement_l()-line_w*2, a_lot]);
//    }
//
//    intersection() {
//        cube([basement_w+p*2+wall_thick*2,basement_l()+p*2+wall_thick*2,h]);
//
//        translate([wall_thick+p+basement_w/2,wall_thick+p+basement_l()/2,0])
//        _basement_bolting_guide_grid();
//    }
//
//    translate([
//        _basement_bolting_guide_transform_x(box=box),
//        _basement_bolting_guide_transform_y(box=box),
//        0
//    ])
//    _basement_bolting_guide_upright_base_level1_frame();
//
//
//    if (box=="controller") {
//        _basement_box_controller_bolting_guide_leds_frame();
//    }
//}
//
//
//
//module basement_bolting_guide(box) {
//    assert(box=="controller" || box=="terminal");
//
//    h=basement_bolting_guide_h;
//    line_w=basement_bolting_guide_line_w;
//    thick=basement_bolting_guide_thick;
//    wall_thick=basement_bolting_guide_wall_thick;
//    p = basement_bolting_guide_play;
//    basement_w = basement_w(box=box);
//
//    _basement_bolting_guide_transform(box=box)
//    difference() {
//        _basement_bolting_guide_main(box=box);
//
//        translate([basement_upright_margin(),0,0])
//        translate([upright_base_level1_w()/2, basement_l()/2-basement_box_controller_center_offset().y,0])
//        translate([wall_thick+p, wall_thick+p,0])
//        _basement_bolting_guide_upright_base_level1_hole();
//
//        if (box=="controller") {
//            _basement_box_controller_bolting_guide_leds_holes();
//        }
//    }
//}
//
