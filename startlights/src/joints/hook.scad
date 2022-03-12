include <../parameters.scad>


module hook() {
    play=0.4;
    min_thick=0.15;

    module interconn() {
        translate([0,0,gate_hook_space])
            cube([gate_hook_space,bar_thick,gate_hook_thick]);
    }

    module hook_bar() {
        translate([0,0,gate_hook_space+gate_hook_thick])
            cube([startlights_length, bar_thick, bar_thick]);
    }

    translate([0,startlights_height-bar_thick-space_y,-gate_hook_space-gate_hook_thick-bar_thick])
        union() {
            translate([0,-gate_hook_space+bar_thick,0])
                cube([startlights_length, gate_hook_space, gate_hook_space]);

            interconn();

            translate([startlights_length-gate_hook_space,0,0])
                interconn();

            translate([(startlights_length-gate_hook_space)/2,0,0])
                interconn();

            hook_bar();

            for (j=[0:3]) {
                translate([(side+space_x)*j+side+play,0,0])
                    union(){
                        translate([0,-bar_thick*2,gate_hook_space+gate_hook_thick])
                            union() {

                                translate([0,bar_thick,0])
                                    cube([space_x-play*2,bar_thick, bar_thick]);

                                cube([space_x-play*2,bar_thick, bar_thick*3+play*2]);

                                translate([0,0,bar_thick*2+play*2])
                                    cube([space_x-play*2,bar_thick*3, bar_thick]);

                                translate([0,bar_thick*3-min_thick,0])
                                    cube([space_x-play*2,min_thick, bar_thick*3+play*2]);
                            }
                    }
            }
        }
}
