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

startlights_length = side*5+space_x*4;
startlights_height = side*2+space_y;

led_distance_x = side+space_x;
led_distance_y = side+space_y;

board_margin = bar_x_offset;
board_l = startlights_length-board_margin*2;
board_w = startlights_height-board_margin*2;
board_thick = 1.6;
board_hole_d = 3;
board_hole_x_offset = -board_margin + side + space_x/2;
board_hole_y_offset = -board_margin + side/2;
board_hole_offset = [board_hole_x_offset, board_hole_y_offset];
board_startlights_gap = 0.2;

board_offset = [(startlights_length-board_l)/2, (startlights_height-board_w)/2];

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