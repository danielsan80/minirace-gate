fix=0.01;
a_lot = 1000;
layer_h = 0.15;
layer_w = 0.46;

led_cap_h = 3.85;
led_cap_leg_h = 2.70;
led_cap_dome_h= led_cap_h-led_cap_leg_h;
led_cap_dome_d= 5;
led_cap_leg_d = 3.85;

thick = 4;
startlight_circle_estrusion = 1.4;
circle_estrusion_depth = 0.5;
circle_estrusion_led_cap_base_h = 0.7;

side_little = 10;
space_x_little = 2;
space_y_little = 1.2;
cowl_t_little = 1;
cowl_r_little = 4.3; //led_cap_dome_d/2+cowl_t+0.2;

side_big = 15;
space_x_big = 3;
space_y_big = 2;
cowl_t_big = 1.3;
cowl_r_big = 6;

BIG = "big";
LITTLE = "little";
dimension = BIG;

side = dimension==LITTLE ? side_little: dimension==BIG ? side_big : undef;
space_x = dimension==LITTLE ? space_x_little: dimension==BIG ? space_x_big: undef;
space_y = dimension==LITTLE ? space_y_little: dimension==BIG ? space_y_big: undef;
cowl_t = dimension==LITTLE ? cowl_t_little: dimension==BIG ? cowl_t_big: undef;
cowl_r = dimension==LITTLE ? cowl_r_little: dimension==BIG ? cowl_r_big: undef;

led_d = 3.4; //5.4;
led_r = led_d/2;
led_pin_thick = 0.4;
led_pin_w = 6;
led_pin_h = 1.5;

led_base_h = 1;
startlight_led_jut_h = 0.5;

led_squared_3mm_w = 2.80;
led_squared_3mm_l = 3.15;
led_squared_3mm_h = 2.0;
led_play = 0.20;
led_cap_play = 0.1;
led_play_h = 0.2;

led_squared_5mm_w = 5;
led_squared_5mm_l = 5;
led_squared_5mm_h = 1.7;

led_squared_5mm_cap_h = 4.83;
led_squared_5mm_cap_base_h = 2;
led_squared_5mm_cap_w = 8.60;
led_squared_5mm_cap_l = 9.60;
led_squared_5mm_cap_d = 6.90;
led_squared_5mm_cap_y_offset = -0.8;


bar_thick_little = 1.5;
bar_thick_big = 2.5;

bar_thick = dimension==LITTLE ? bar_thick_little : dimension==BIG ? bar_thick_big: undef;
bar_x_offset = bar_thick;

cover_l = side*5+space_x*4;
cover_h = side*2+space_y;
cover_hook_pos = [cover_l/2-side-space_x/2, cover_h/2 - side/2];
cover_recess_h = 2;
cover_recess_play = 0;

led_distance_x = side+space_x;
led_distance_y = side+space_y;

V1 = "v1";
V2 = "v2";
BIG_V1 = "big_v1";
board_v = BIG_V1;

board_thick = 1.5;
board_hole_d = 3;


board_v1_l = cover_l-bar_x_offset*2;
board_v1_w = cover_h-bar_x_offset*2;
board_v1_margin = [(cover_l-board_v1_l)/2, (cover_h-board_v1_w)/2];
board_v1_cover_gap = 0.2;

board_v2_l = 56;
board_v2_w = 19;
board_v2_margin = [(cover_l-board_v2_l)/2, (cover_h-board_v2_w)/2];
board_v2_cover_gap = 1.5;


board_big_v1_l = 82;
board_big_v1_w = 25;
board_big_v1_margin = [(cover_l-board_big_v1_l)/2, (cover_h-board_big_v1_w)/2];
board_big_v1_cover_gap = 1.5;

board_margin = board_v==V1 ? board_v1_margin: board_v == V2 ? board_v2_margin : board_v ==BIG_V1 ? board_big_v1_margin : undef;
board_l = board_v==V1 ? board_v1_l : board_v==V2 ? board_v2_l : board_v==BIG_V1 ? board_big_v1_l : undef;
board_w = board_v==V1 ? board_v1_w : board_v==V2 ? board_v2_w : board_v==BIG_V1 ? board_big_v1_w : undef;
board_cover_gap = board_v==V1 ? board_v1_cover_gap : board_v==V2 ? board_v2_cover_gap : board_v==BIG_V1 ? board_big_v1_cover_gap : undef;


board_cable_connector_l = 7.5;
board_cable_connector_w = 3.8;
board_cable_connector_h = 5.2;

board_v1_cable_connector_offset = [0,-cover_h/2 + bar_x_offset+5.8+board_cable_connector_w/2];
board_v2_cable_connector_offset = [0,-cover_h/2 + bar_x_offset+5.8+board_cable_connector_w/2];
board_big_v1_cable_connector_offset = [0,-1];

board_cable_connector_offset = board_v==V1 ? board_v1_cable_connector_offset : board_v==V2 ? board_v2_cable_connector_offset : board_v==BIG_V1 ? board_big_v1_cable_connector_offset : undef;




board_cable_connector_play = 0.5;

board_welding_l = 8.5;
board_welding_h = 0.8;
board_welding_w = 1.45;
board_welding_play = 0.1;
board_welding_r = 0.3;

board_v1_welding_offset = [0, -2.2];
board_v1_has_cover_welding_groove = true;

board_v2_welding_offset = [0, -0.8];
board_v2_has_cover_welding_groove = true;

board_big_v1_welding_offset = [0, 0];
board_big_v1_has_cover_welding_groove = true;

board_welding_offset = board_v==V1 ? board_v1_welding_offset : board_v==V2 ? board_v2_welding_offset : board_v==BIG_V1 ? board_big_v1_welding_offset : undef;
board_has_cover_welding_groove = board_v==V1 ? board_v1_has_cover_welding_groove : board_v==V2 ? board_v2_has_cover_welding_groove : board_v==BIG_V1 ? board_big_v1_has_cover_welding_groove : undef;


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
hanger_rod_hook_l = 6;
hanger_rod_hook_r = 6;
hanger_rod_hook_angle = 30;
hanger_rod_hook_w = 2; // = startlight:space_x

hanger_rod_margin = bar_x_offset;
hanger_rod_l = cover_l-hanger_rod_margin*2;

case_thick = 4.4;
case_base_thick = 1.0;
case_play = 0.3;
case_wall_w = 1;
