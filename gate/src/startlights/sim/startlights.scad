use <../../../vendor/startlights/src/cover/cover.scad>
use <../../../vendor/startlights/src/cover/sim/cover.scad>
use <../../../vendor/startlights/src/case/case.scad>
use <../../../vendor/startlights/src/case/sim/case.scad>

module sim_startlights_cover() {
    sim_cover_color()
    cover();
}

module sim_startlights_cover_led_caps() {
    sim_cover_led_caps();
}

module sim_startlights_case() {
    sim_case_transform()
    sim_case_color()
    case();
}