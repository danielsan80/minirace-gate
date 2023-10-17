$fn = 100;
fix=0.01;
a_lot = 1000;
layer_h = 0.15;
layer_w = 0.46;

thick = 2.0;
startlight_circle_estrusion = 1;
side = 10; //15;
space_x = 2; //3;
space_y = 1.2; //2;
r = 4.0; //6;

led_d = 3.4; //5.4;
led_r = led_d/2;

led_base_h = 1;
startlight_led_jut_h = 0.5;

bar_thick = 1.5;
bar_x_offset = bar_thick;

cover_l = side*5+space_x*4;
cover_h = side*2+space_y;
cover_hook_pos = [cover_l/2-side-space_x/2, cover_h/2 - side/2];

led_distance_x = side+space_x;
led_distance_y = side+space_y;

board_thick = 1.5;
board_hole_d = 3;

board_v1_margin = [bar_x_offset, bar_x_offset];
board_v1_l = cover_l-board_v1_margin.x*2;
board_v1_w = cover_h-board_v1_margin.y*2;
board_v1_cover_gap = 0.2;

board_v2_l = 56;
board_v2_w = 19;
board_v2_margin = [(cover_l-board_v2_l)/2, (cover_h-board_v2_w)/2];
board_v2_startlights_gap = 1.5;


board_cable_connector_l = 7.5;
board_cable_connector_w = 3.8;
board_cable_connector_h = 5.2;
board_cable_connector_offset = [0,-cover_h/2 + bar_x_offset+5.8+board_cable_connector_w/2];
board_cable_connector_play = 0.5;

welding_l = 8.5;
welding_w = 1;
welding_h = 0.8;
welding_y_offset = 10.5;
welding_play = 0.1;
welding_r = 0.3;


gate_hook_width = 17;
gate_hook_thick = 1.5;
gate_hook_space = 3;

gate_hook_x2_width = 54.4;

ct_slide_side = 7;
ct_slide_play = 0.20;

hanger_clip_w = 5;

hanger_clip_hook_l1 = 15;
hanger_clip_hook_l2 = 13;
hanger_clip_hook_inner_w = 5;
hanger_clip_hook_tilt = 5;

hanger_clip_hook_thick = 2;

hanger_rod_hook_play = 0.15;
hanger_rod_hook_l = 5;
hanger_rod_hook_r = 6;
hanger_rod_hook_angle = 30;
hanger_rod_hook_w = 2; // = startlight:space_x

hanger_rod_margin = bar_x_offset;
hanger_rod_l = cover_l-hanger_rod_margin*2;

case_thick = 4;
case_base_thick = 0.5;
case_play = 0.3;
case_wall_w = 0.8;