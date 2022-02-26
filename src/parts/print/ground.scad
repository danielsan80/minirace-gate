use <../../parts/ground.scad>

// fit_mode: "basement"|"upright"
module print_ground(fit_mode="upright", with_hole=true) {
    ground(fit_mode=fit_mode, with_hole=with_hole);
}