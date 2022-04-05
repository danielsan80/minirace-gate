$fn = 100;
fix = 0.01;
fix2 = 0.1;
a_lot = 1000;
a_few = 10;
play1 = 0.15;
play2 = 0.20;
play3 = 0.25;
layer_w = 0.45;
layer_h = 0.15;

box_wall_thick = 2.2;
box_wall_half_thick = box_wall_thick/2;
box_bottom_base_thick = 1;
box_top_base_thick = 1;

box_joint_h = 4;

card_w = 36.5;
card_l = 83.5;
card_thick = 0.8;
card_z_offset = 1;
card_play = play1;
card_overhang_l = 8;
card_overhang_offset = 4.5;
card_overhang_w = 31;

chip_x = card_overhang_l+4;
chip_y = -8;
chip_l = 44+(chip_y*-1);
chip_w = 28;
chip_thick = 3.8;
chip_play = 0.3;

chip_connector_w = 7.5;
chip_connector_l = 5;
chip_connector_h = 2.8;
chip_connector_plugin_w = 10;
chip_connector_plugin_h = 7;

chip_connector_hole_frame_thick = 0.6;
chip_connector_hole_margin_w = 0.3;
chip_connector_hole_margin_h = 0.3;
chip_connector_hole_w = chip_connector_w+chip_connector_hole_margin_w*2;
chip_connector_hole_h = chip_connector_h+chip_connector_hole_margin_h*2;
chip_connector_hole_thick = 1.8;

chip_connector_inner_niche_margin_w = 0.3;
chip_connector_inner_niche_margin_h = 0.3;
chip_connector_inner_niche_w = chip_w+chip_connector_inner_niche_margin_w*2;
chip_connector_inner_niche_h = chip_thick+chip_connector_h+chip_connector_inner_niche_margin_h*2;
chip_connector_inner_niche_offset = 0.5;

chip_connector_outer_niche_margin_w = 0.3;
chip_connector_outer_niche_margin_h = 0.3;
chip_connector_outer_niche_w = chip_connector_plugin_w+chip_connector_outer_niche_margin_w*2;
chip_connector_outer_niche_h = chip_connector_plugin_h+chip_connector_outer_niche_margin_h*2;
chip_connector_outer_niche_offset = chip_play-chip_connector_inner_niche_offset+box_wall_thick-chip_connector_hole_thick;

chip_processor_w = 20;
chip_processor_l = 20;
chip_processor_thick = 7-chip_thick;
chip_processor_margin = 5;

antenna_w = card_overhang_w;
antenna_play = 0.5;
antenna_thick = 0.5;
antenna_hole_thick = 1.5;
antenna_hole_w = antenna_w+antenna_play*2;
antenna_side_margin = card_overhang_offset;
antenna_start_margin = 6;
antenna_end_l = 15;
antenna_l = 198-antenna_end_l;

box_inner_w = card_w+card_overhang_l+antenna_start_margin+card_play*2;
box_inner_l = card_l+(chip_y*-1)+card_play+chip_play-chip_connector_inner_niche_offset;
box_inner_h = card_z_offset+card_thick+chip_thick+chip_connector_h+box_joint_h+chip_connector_hole_margin_h+chip_connector_hole_frame_thick;
//box_inner_w = 4;
//box_inner_l = 30;
//box_inner_h = 10;

box_outer_w = box_inner_w + box_wall_thick*2;
box_outer_l = box_inner_l + box_wall_thick*2;
box_outer_h = box_inner_h + box_bottom_base_thick + box_top_base_thick;

box_joint_play = play2;
box_side_slide_play = play1;
box_joint_half_play = box_joint_play/2;

cylinder_joint_play = play2;
cylinder_joint_margin = 6;
cylinder_joint_l = box_inner_w - cylinder_joint_margin*2 ;
cylinder_joint_r = 0.4;


nail_groove_margin = 6;
nail_groove_l = box_inner_w - nail_groove_margin*2 ;
nail_groove_r = 0.5;

keep_w = 1;
keep_wall_thick=1;
keep_h = card_z_offset;
keep_card_thick = card_thick;
keep_hold_r = 0.4;




