//include <../../vendor/controller-box/config/parameters.scad>
//use <../gate/interparts/upright_base_level1.scad>
//use <../gate/interparts/basement_upright.scad>
//
//function basement_box_controller_w() = box_outer_w;
//function basement_block_w() = upright_base_level1_w()+basement_upright_margin()*2;
//function basement_box_terminal_w() = basement_block_w();
//function basement_w(box) =
//    assert(box=="controller" || box=="terminal")
//    box=="controller"?basement_box_controller_w():box=="terminal"?basement_box_terminal_w():undef;
//function basement_l() = box_outer_l;
//function basement_h() = box_outer_h;
//function box_top_base_thick() = box_top_base_thick;
////function basement_box_controller_card_pos() = box_card_pos;
//function basement_box_controller_card_startlights_connector_pos() = startlights_connector_pos;
//
//function basement_box_controller_chip_led_hole_cap_d() = chip_led_hole_cap_d;
//function basement_box_controller_chip_blue_led_hole_angle_pos() = chip_blue_led_hole_angle_pos;
//function basement_box_controller_chip_red_led_hole_angle_pos() = chip_red_led_hole_angle_pos;
