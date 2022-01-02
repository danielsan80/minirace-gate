$fn=100;
fix = 0.01;
a_lot = 1000;
play = 0.25;

profile_w = 20;
profile_h = 2;

base_curvature_r = 2;

upright_base_w = 20;
upright_base_l = 47;
upright_base_h = 2.5;

angle_base_w = 20;
angle_base_l = 25;
angle_base_h = 2.5;

pylon_side = 13;

bar_w = 4;

reinforcement_gap = 4;

function hp(l) = pow(pow(l,2) + pow(l,2),1/2);


function profile_outer_w(w=bar_w) = w/profile_w*profile_h*2+w;
function profile_inner_w(w=bar_w) = w;
function profile_w_diff(w=bar_w) = profile_outer_w(w)-profile_inner_w(w);

module profile(w = bar_w) {
    w1 = profile_w;
    s = 6;
    h = profile_h;
    a = 50;
    k = 2.5;

    w2 = 17.5;


    x0 = s/2;
    y0 = w1/2;

    x1 = s/2+cos(a)*h;
    y1 = w1/2+h;

    x2 = s/2+cos(a)*h+k;
    y2 = w1/2+h;

    x3 = w2/2;
    y3 = w2/2;


    scale([w/w1, w/w1])
    polygon([
        [x0,y0],
            [x1,y1],
            [x2,y2],

            [x3,y3],

            [y2,x2],
            [y1,x1],
        [y0,x0],
        [y0,-x0],
            [y1,-x1],
            [y2,-x2],

            [y3,-x3],

            [x2,-y2],
            [x1,-y1],
        [x0,-y0],
        [-x0,-y0],
            [-x1,-y1],
            [-x2,-y2],

            [-x3,-y3],

            [-y2,-x2],
            [-y1,-x1],
        [-y0,-x0],
        [-y0,x0],
            [-y1,x1],
            [-y2,x2],

            [-y3,x3],

            [-x2,y2],
            [-x1,y1],
        [-x0,y0],
    ]);
}

module bar(l = 50, w = bar_w) {
    linear_extrude(l)
    profile(w=w);
}

module bar_ext(l = 50, w = bar_w) {
    translate([0,0,-l])
    linear_extrude(l*3)
        profile(w=w);
}

module joint(h=10,void=false) {
    function p() = void?0.2:0;
    w1=1;
    w2=1.6;
    l=1.2;
    minkowski() {
        linear_extrude(h)
        polygon([
                [0,-w1/2],
                [0,w1/2],
                [l,w2/2],
                [l,-w2/2],
                [0,-w1/2]
        ]);

        cylinder(r=p(), h=fix);
    }
}

function bar_cut_offset(w = bar_w) = w*2/6;

module bar_top_cut(l, angle=45, offset = 0) {
    a_lot = 1000;
    intersection() {
        children();

        translate([0,0,l-offset])
        rotate([0,angle,0])
        translate([-a_lot/2,-a_lot/2,-a_lot])
        cube([a_lot,a_lot,a_lot]);
    }
}

module bar_bottom_cut(l, angle=45, offset = 0) {
    a_lot = 1000;
    intersection() {
        children();

        translate([0,0,offset])
        rotate([0,angle,0])
        translate([-a_lot/2,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
    }
}

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

module upright_base() {
    w = upright_base_w;
    l = upright_base_l;
    h = upright_base_h;
    $fn=100;
    fix = 0.01;

    r = 2;
    translate([-w/2,-l/2,0])
    minkowski() {
        cube([w, l, h]);
        cylinder(r=r, h= fix);
    }
}

module upright_counterfort(flip = false) {
    render()
    translate([-pylon_side/2,-pylon_side-pylon_side/2,upright_base_h])
    rotate([0,0,flip?180:0])
    rotate([-45,0,0])
    rotate([0,0,90])
    bar_bottom_cut(l=hp(pylon_side), angle=-45)
    bar_top_cut(l=hp(pylon_side), offset=bar_cut_offset(w=bar_w))
    bar_ext(l=hp(pylon_side));
}

module upright_counterforts() {
    upright_counterfort();

    translate([pylon_side,0,0])
    upright_counterfort();

    translate([0,pylon_side*3])
    union() {
        upright_counterfort(flip=true);

        translate([pylon_side,0,0])
        upright_counterfort(flip=true);
    }
}

module upright() {
    upright_base();

    translate([-pylon_side/2,-pylon_side/2,upright_base_h])
    pylon(l=150);

    upright_counterforts();
}



module angle_base() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;

    translate([-w/2,-w/2,0])
    minkowski() {
        cube([l, w, h]);
        cylinder(r=base_curvature_r, h=fix);
    }
}

module angle() {
    w = angle_base_w;
    l = angle_base_l;
    h = angle_base_h;

    gap = reinforcement_gap;

    module main() {
        translate([0,0,-pylon_side-gap])
        pylon_main(l=80);
    }

    module reinforcements1() {
        rotate([0,0,90])
        reinforcement();

        translate([pylon_side,0,0])
        rotate([0,0,180])
        reinforcement();

        translate([pylon_side,pylon_side,0])
        rotate([0,0,180])
        reinforcement();
    }

    module reinforcements2() {
        translate([0,0,pylon_side+gap])
        union() {
            translate([0,pylon_side,0])
            rotate([0,0,-90])
            reinforcement(side=pylon_side, w=bar_w);

            translate([pylon_side,pylon_side,0])
            rotate([0,0,180])
            reinforcement(side=pylon_side, w=bar_w);

            translate([pylon_side,0,0])
            rotate([0,0,180])
            reinforcement(side=pylon_side, w=bar_w);

            translate([pylon_side,0,0])
            rotate([0,0,90])
            reinforcement(side=pylon_side, w=bar_w);

            translate([pylon_side,pylon_side,0])
            rotate([0,0,-90])
            reinforcement(side=pylon_side, w=bar_w);
        }
    }


    module bottom_cut() {
        translate([-angle_base_w/2-base_curvature_r,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
    }

    traverse_cut_z_offset = hp(bar_w)/2+hp(pylon_side)-pylon_side-bar_w;

    module traverse_cut_translate() {
        z_offset = -bar_w*0.10;
        translate([0,0,z_offset])
        translate([0,0,traverse_cut_z_offset])
        translate([-pylon_side/2,0,0])
        translate([0,0,angle_base_h])
        rotate([0,45,0])
        translate([pylon_side,0,pylon_side+gap])
        rotate([0,-45,0])
        children();
    }

    module traverse_cut() {
        traverse_cut_translate()
        translate([0,-a_lot/2,0])
        cube([a_lot,a_lot,a_lot]);
    }

    module traverse_plate() {
        x_fix = bar_w*0.27;
        x_offset = hp(traverse_cut_z_offset+x_fix);
        translate([x_offset,0,0])
        translate([-a_lot,-a_lot/2,-a_lot])
        cube([a_lot, a_lot, a_lot]);
    }

    module traverse() {
        render()
        traverse_cut_translate()
        difference() {
            rotate([0,90,0])
            translate([-pylon_side-bar_w/2,-pylon_side/2])
            union() {
                pylon(l=150);
                difference() {
                    rotate([0,90,0])
                    union() {
                        c=1.2;
                        translate([0,0,-bar_w*c/2])
                        bar(l=pylon_side+bar_w*c);

                        translate([0,pylon_side,0])
                        translate([0,0,-bar_w*c/2])
                        bar(l=pylon_side+bar_w*c);
                    }

                    translate([-a_lot/2,-a_lot/2,-a_lot])
                    cube([a_lot, a_lot, a_lot]);
                }
            }

            traverse_plate();


            union() {
                translate([-fix,-pylon_side/2,0])
                joint(h=a_lot,void=true);

                translate([-fix,pylon_side/2,0])
                joint(h=a_lot,void=true);
            }
        }
    }

    angle_base();

//    traverse_cut_translate()
//    traverse_plate();

//    #traverse_cut();

//    %translate([-pylon_side/2,-pylon_side/2,0])
//    main();

    render()
    difference() {

        intersection() {

            translate([-pylon_side/2,-pylon_side/2,0])
            translate([0,0,angle_base_h])
            rotate([0,45,0])
            union() {
                main();
                reinforcements1();
                reinforcements2();
            }


            bottom_cut();
        }
        traverse_cut();


    }

    traverse_cut_translate()
    union() {
        c=1.1;
        translate([-fix,-pylon_side/2,0])
            joint(h=pylon_side+bar_w*c);

        translate([-fix,pylon_side/2,0])
            joint(h=pylon_side+bar_w*c);
    }

//    translate([10,0,10])
    traverse();



}



module new_gate() {
    gap = reinforcement_gap;



    upright();

//    angle();

//    translate([pylon_side-0.5,0,angle_base_h+pylon_side])
//    rotate([0,90,0])
//    translate([-pylon_side/2,-pylon_side/2,0])
//    pylon(side=pylon_side, l=150, gap=gap, bar_w=bar_w);

}

//translate([11,90,0])
new_gate();


module old_gate() {
    include <src/gaslands_gate/gaslands_gate.scad>
    vendor_dir = "vendor";

//    difference() {
        translate([0,120,0])
        gate_150();

//        translate([-500,-500,50])
//        cube([1000,1000,1000]);
//    }
}
//old_gate();


//difference() {
//    pylon(side=20, length=170, offset=8);
//    
//    translate([0,0,150])
//    rotate([0,45,0])
//    translate([-500,-500,0])
//    cube([1000,1000,1000]);
//}
//
//translate([0,0,150])
//difference() {
//    translate([-10,0,0])
//    rotate([0,90,0])
//    pylon(side=20, length=170, offset=8);
//    
//    
//    rotate([0,45,0])
//    translate([-500,-500,-1000])
//    cube([1000,1000,1000]);
//}
