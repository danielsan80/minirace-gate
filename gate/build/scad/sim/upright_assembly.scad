include <../../../config/parameters.scad>

use <../../../sim/modules/new_gate.scad>
use <../../../src/gate/parts/print/upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/gate/modules/profile.scad>
use <../../../src/startlights/values.scad>
use <../../../src/gate/interparts/angle-traverse.scad>
use <../../../src/gate/interparts/bolting-upright.scad>
use <../../../src/gate/interparts/uprights_distance.scad>

use <../../../src/basement/values.scad>
use <../../../src/basement/sim/basement_box.scad>
use <../../../src/basement/sim/basement_transform.scad>
use <../../../src/gate/parts/sim/bolting_transform.scad>
use <../../../src/basement/sim/basement_block.scad>
use <../../../src/gate/parts/sim/bolting.scad>
use <../../../src/gate/parts/sim/upright.scad>
use <../../../src/gate/parts/sim/angle.scad>
use <../../../src/gate/parts/print/traverse.scad>
use <../../../src/gate/parts/sim/hanger.scad>

use <../../../src/startlights/sim/startlights.scad>
use <../../../src/startlights/sim/leds.scad>
use <../../../src/startlights/sim/board.scad>

use <../../../vendor/car/src/cars.scad>
use <../../../vendor/ruler/ruler.scad>


//$vpt = [ 0, 0, 0];
//$vpr = [ 60,0,-15 ];
//$vpd = 300;


module _sim_bar_cut() {
    translate([0,0,-upright_angle_joint_stick_void_l-0.5])
    cube([profile_outer_w(),profile_outer_w(),upright_angle_joint_stick_void_l+0.5]);
}

module _sim_stick() {
    rotate([0,90,0])
    translate([0, 0,layer_h-stick_d/2])
    color("blue")
    print_upright_angle_joint_stick();
}

module _sim_stick_transform() {
    translate([0,0,upright_h+upright_angle_joint_button_h])
    translate([0,0,-upright_angle_joint_stick_l/2,])
    children();
}

module _sim_upright() {
    difference() {
//    union() {

        print_upright_with_angle_joints_holes();

        translate([0,0,fix])
        translate([0,0,upright_h+upright_angle_joint_button_h])
        translate([-pylon_side/2,-pylon_side/2,0])
        translate([-profile_outer_w(),-profile_outer_w(),0])
        _sim_bar_cut();
    }

    _sim_stick_transform()
    union() {
        translate([-pylon_side/2, -pylon_side/2,0])
        _sim_stick();

        translate([pylon_side/2, -pylon_side/2,0])
        _sim_stick();

        translate([-pylon_side/2, pylon_side/2,0])
        _sim_stick();

        translate([pylon_side/2, pylon_side/2,0])
        _sim_stick();
    }
}

module _sim_instructions() {

    line_height = 15;
    color("black")
    text("glue the", size=8);
    color("blue")
    text("              sticks", size=8);

    translate([0,-line_height,0])
    color("black")
    text("to reinforce the joints", size=8);
}

module _sim_legenda() {
    line_height = 6;
    text_offset = 1;

    color("blue")
    print_upright_angle_joint_stick();

    translate([0,line_height-text_offset,0])
    color("blue")
    text("1.5cm", size=3, halign="center");


}


_sim_upright();

translate([-40,-40,0])
_sim_instructions();

translate([0,-75,0])
_sim_legenda();