$fn = 100;
fix = 0.01;
fix2 = 0.1;
a_lot = 1000;
play1 = 0.15;
play2 = 0.20;
play3 = 0.25;

box_wall_thick = 2.2;
box_wall_half_thick = box_wall_thick/2;
box_bottom_base_thick = 1;
box_top_base_thick = 1;

box_joint_h = 4;

card_w = 44.5;
card_l = 91.5;
card_thick = 0.6;
card_z_offset = 2;
card_play = play1;

antenna_w = 35;
antenna_thick = 1.5;
antenna_side_margin = 3.5;

box_inner_w = card_w+card_play*2;
box_inner_l = card_l+card_play*2;
box_inner_h = 10;
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

rail_bottom_w = 1;
rail_top_right_r = 0.4;
rail_top_left_r = 0.15;



