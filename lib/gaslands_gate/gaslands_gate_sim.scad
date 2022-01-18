include <gaslands_gate.scad>

translate([0,120,0])
gate_150();

gate_186();


translate([0,-100,0])
projection(cut = true)
translate([0,0,-15])
rotate([0,45,0])
upright();
