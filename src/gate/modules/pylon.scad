include <bar.scad>

module reinforcement(side=pylon_side, w=bar_w) {
    l=hp(side);
    offset = bar_cut_offset(w=w);

    rotate([0,45,0])
        bar_bottom_cut(l=l, offset=offset)
        bar_top_cut(l=l, offset=offset)
        bar(l=l, w=w);

}

module reinforcementsR(show=[1,1,1,1]) {
    side = pylon_side;

    if (show[0]==1) {
        reinforcement();
    }

    if (show[1]==1) {
        rotate([0, 0, 90])
            reinforcement();
    }

    if (show[2]==1) {
        translate([side, side, 0])
            rotate([0, 0, 180])
                reinforcement();
    }

    if (show[3]==1) {
        translate([side, side, 0])
            rotate([0, 0, - 90])
                reinforcement();
    }
}

module reinforcementsL(show=[1,1,1,1]) {
    side = pylon_side;

    if (show[0]==1) {
        translate([side, 0, 0])
            rotate([0, 0, 180])
                reinforcement();
    }

    if (show[1]==1) {
        translate([0, side, 0])
            rotate([0, 0, -90])
                reinforcement();
    }

    if (show[2]==1) {
        translate([side, 0, 0])
            rotate([0, 0, 90])
                reinforcement();
    }

    if (show[3]==1) {
        translate([0, side, 0])
            rotate([0, 0, 0])
                reinforcement();
    }
}



module pylon_main(l=100, show=[1,1,1,1]) {
    side = pylon_side;

    if (show[0]==1) {
        bar(l = l);
    }

    if (show[1]==1) {
        translate([side, 0, 0])
            bar(l = l);
    }

    if (show[2]==1) {
        translate([0, side, 0])
            bar(l = l);
    }

    if (show[3]==1) {
        translate([side, side, 0])
            bar(l = l);
    }
}

module pylon(l=100) {
    side = pylon_side;
    gap = reinforcement_gap;
    step = side+gap;

    render()
        intersection() {
            union() {
                pylon_main(l=l);
                for(i=[0:l/step]) {
                    translate([0,0,step*i*2])
                        reinforcementsL();
                    translate([0,0,step+step*i*2])
                        reinforcementsR();
                }
            }
            translate([-side*2,-side*2,0])
                cube([side*4,side*4,l]);
        }

}
