include <../../../config/parameters.scad>

use <../../../sim/modules/new_gate.scad>
use <../../../src/gate/parts/upright.scad>
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

function _sim_shift() = 10;

module _sim_on_plane_transform() {
    translate([0,0,pylon_side/2+profile_outer_w()/2])
    children();
}

module _sim_bar_cut() {
    translate([0,0,traverse_stick_l/2+stick_void_l_margin+0.5])
    translate([0,0,-traverse_stick_l])
    cube([profile_outer_w(),profile_outer_w(),traverse_stick_l]);
}

module _sim_traverse_split_L() {
    translate([-_sim_shift(),0,0])
    rotate([0,-90,0])

    difference() {
//    union() {

        print_traverse_split_L(startline_mode="upright", startline_l=startline_l);

        translate([0,0,-fix])
        translate([pylon_side/2,-pylon_side/2,0])
        translate([0,-profile_outer_w(),0])
        _sim_bar_cut();

        translate([0,0,-fix])
        translate([pylon_side/2,pylon_side/2,0])
        translate([0,-profile_outer_w(),0])
        _sim_bar_cut();
    }

    translate([-traverse_stick_l/2-stick_void_l_margin,0,0])
    translate([-_sim_shift(),0,0])
    translate([traverse_stick_l/3/2,0,0])
    translate([0, -pylon_side/2,pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("blue")
    print_traverse_split_stick_1of3();

    translate([-traverse_stick_l/2-stick_void_l_margin,0,0])
    translate([-_sim_shift(),0,0])
    translate([traverse_stick_l/3*2/2,0,0])
    translate([0, pylon_side/2,-pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("blue")
    print_traverse_split_stick_2of3();

    translate([-traverse_stick_l/2-stick_void_l_margin,0,0])
    translate([-_sim_shift(),0,0])
    translate([traverse_stick_l/2,0,0])
    translate([0, -pylon_side/2,-pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("red")
    print_traverse_split_stick_3of3();
}

module _sim_traverse_split_R() {
    translate([_sim_shift(),0,0])
    rotate([0,0,0])
    rotate([0,90,0])
    difference() {
//    union() {

        print_traverse_split_R(startline_mode = "upright", startline_l=startline_l);


        translate([0,0,-fix])
        translate([-pylon_side/2, -pylon_side/2, 0])
        translate([-profile_outer_w(), -profile_outer_w(), 0])
        _sim_bar_cut();

        translate([0, 0, - fix])
        translate([-pylon_side / 2, pylon_side / 2, 0])
        translate([-profile_outer_w(), -profile_outer_w(), 0])
        _sim_bar_cut();
    }

    translate([traverse_stick_l/2+stick_void_l_margin,0,0])
    translate([_sim_shift(),0,0])
    translate([-traverse_stick_l/3*2/2,0,0])
    translate([0, -pylon_side/2,pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("blue")
    print_traverse_split_stick_2of3();

    translate([traverse_stick_l/2+stick_void_l_margin,0,0])
    translate([_sim_shift(),0,0])
    translate([-traverse_stick_l/2,0,0])
    translate([0, pylon_side/2,pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("red")
    print_traverse_split_stick_3of3();

    translate([traverse_stick_l/2+stick_void_l_margin,0,0])
    translate([_sim_shift(),0,0])
    translate([-traverse_stick_l/3/2,0,0])
    translate([0, pylon_side/2,-pylon_side/2])
    translate([0, 0,-stick_d/2])
    color("blue")
    print_traverse_split_stick_1of3();
}

module _sim_instructions() {

    line_height = 15;

    color("black")
    text("glue the", size=8);
    color("blue")
    text("              blue sticks", size=8);

    translate([0,-line_height,0])
    color("black")
    text("(to reinforce the hoverhangs)", size=5);

    translate([0,-line_height*2,0])
    color("black")
    text("fit the", size=8);
    color("red")
    translate([0,-line_height*2,0])
    text("          red sticks", size=8);
}

module _sim_legenda() {
    line_height = 6;
    text_offset = 1;

    color("red")
    print_traverse_split_stick_3of3();

    translate([0,-line_height,0])
    translate([traverse_stick_l/3/2 - traverse_stick_l/2 - 0.5,0,0])
    union() {
        color("blue")
        print_traverse_split_stick_1of3();

        translate([0,-line_height-text_offset,0])
        color("blue")
        text("1cm", size=3, halign="center");
    }

    translate([0,-line_height,0])
    translate([traverse_stick_l/3*2/2 - traverse_stick_l/2 + traverse_stick_l/3 + 0.5,0,0])
    union() {
        color("blue")
        print_traverse_split_stick_2of3();

        translate([0,-line_height-text_offset,0])
        color("blue")
        text("2cm", size=3, halign="center");
    }


    translate([0,line_height-text_offset,0])
    color("red")
    text("3cm", size=3, halign="center");

}


_sim_traverse_split_L();
_sim_traverse_split_R();

translate([-50,-40,0])
_sim_instructions();

translate([0,-90,0])
_sim_legenda();