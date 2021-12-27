include <vendor/ruler/ruler.scad>

module upright() {
    translate([63.15,26.7,0])
    import("vendor/gate/Gaslands_Gate_Tower_Scafflod_Tall_v1.stl");
}

module angle_L() {
    translate([-241.37,-47.87,0])
    import("vendor/gate/Gaslands_Gate_-_Span_Angle_L.stl");
}

module traverse150() {   
        translate([-285.45,2.52,0])
    import("vendor/gate/Gaslands_Gate_-_Span_for_150mm_gate_v2.stl");
}

module traverse186() {   
    translate([-270.83,-3.18,0])
    import("vendor/gate/Gaslands_Gate_-_Span_for_186mm_gate_v2.stl");
}

module angle_R() {
    translate([-465.52,-47.87,0])
    import("vendor/gate/Gaslands_Gate_-_Span_Angle_R.stl");
}

module car() {
    translate([-4.5,0,0])
    import("vendor/cars/Subaru2.stl");
}

module car1() {
    translate([35,26,0])
    car();
}

module cars(n) {
    for(i=[0:n-1]) {
        translate([i*29,0,0])
        car1();
    }
}

module upright_L_150() {
    upright();
}

module upright_R_150() {
    translate([172.65,0,0])
    upright();
}


module angle_L_150() {
    translate([1,16.7,77.6])
    angle_L();
}



module traverse150_150() {
    translate([28.68,17.52,88.11])
    traverse150();
}


module angle_R_150() {
    translate([193.64,16.7,77.6])
    angle_R();
}



module upright_L_186() {
    upright();
}

module upright_R_186() {
    translate([203.85,0,0])
    upright();
}


module angle_L_186() {
    translate([1,16.7,77.6])
    angle_L();
}



module traverse186_186() {
    translate([28.68,17.52,88.11])
    traverse186();
}


module angle_R_186() {
    translate([224.9,16.7,77.6])
    angle_R();
}


module gate_150() {
    

    upright_L_150();
    angle_L_150();
    traverse150_150();
    angle_R_150();
    upright_R_150();

    cars(5);

    translate([22.2,-20,0])
    ruler(x=150);
}


module gate_186() {

    upright_L_186();
    angle_L_186();
    traverse186_186();
    angle_R_186();
    upright_R_186();

    cars(6);

    translate([22.2,-20,0])
    rule(x=181.5);
}


//translate([0,120,0])
//gate_150();

//gate_186();

//projection(cut = true)
//translate([0,0,-15])
//rotate([0,45,0])
//upright();



pylon_base_w = 20;
pylon_base_l = 40;
pylon_base_h = 2.5;

pylon_side = 13;

bar_w = 4;


function hp(l) = pow(pow(l,2) + pow(l,2),1/2);

module profile(width = 10) {
    w = 20;
    s = 6;
    h = 2;
    a = 50;
    k = 2.5;
    
    w2 = 17.5;
    
    
    x0 = s/2;
    y0 = w/2;
    
    x1 = s/2+cos(a)*h;
    y1 = w/2+h;
    
    x2 = s/2+cos(a)*h+k;
    y2 = w/2+h;
    
    x3 = w2/2;
    y3 = w2/2;
    
    
    
    scale([width/w, width/w])
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
    profile(width=w);
}

function bar_cut_offset(w = bar_w) = bar_w*2/6;

module bar_L_cut(side, offset = 0) {
    a_lot = 1000;
    difference() {
        children();
        translate([-a_lot+offset,-a_lot/2,-a_lot/2])
        cube([a_lot,a_lot,a_lot]);
    }
}

module bar_R_cut(side, offset = 0) {
    a_lot = 1000;
    difference() {
        children();
        translate([side-offset,-a_lot/2,-a_lot/2])
            cube([a_lot,a_lot,a_lot]);
    }
}


module reinforcement(side=pylon_side, w=bar_w) {
    offset = bar_cut_offset(w=w);

    intersection() {
        rotate([0,45,0])
        bar(l=hp(side), w=w);

        translate([offset,-side/2,-side*2])
            cube([side-offset*2,side,side*4]);
    }
}

module pylon(side = pylon_side, l=100, gap = 0, bar_w = bar_w) {

    module main() {
        bar(l=l, w=bar_w);
        
        translate([side,0,0])
        bar(l=l, w=bar_w);
        
        translate([0,side,0])
        bar(l=l, w=bar_w);
        
        translate([side,side,0])
        bar(l=l, w=bar_w);
    }

    module reinforcementsR() {
        
        reinforcement();

        rotate([0,0,90])
        reinforcement();

        
        translate([side,side,0])
        rotate([0,0,180])
        reinforcement();
        
        translate([side,side,0])
        rotate([0,0,-90])
        reinforcement();
    }
    
    module reinforcementsL() {
        translate([side,0,0])
        rotate([0,0,180])
        reinforcement();
        
        translate([0,side,0])        
        rotate([0,0,-90])
        reinforcement();
        
        translate([side,0,0])
        rotate([0,0,90])
        reinforcement();
        
        translate([0,side,0])
        rotate([0,0,0])
        reinforcement();
    }
    
    difference() {
        union() {
            main();
            for(i=[0:l/side/2]) {
                translate([0,0,(side+gap)*i*2])
                reinforcementsL();
                translate([0,0,(side+gap)+(side+gap)*i*2])
                reinforcementsR();
            }
        }
        translate([-side*2,-side*2,-side])
        cube([side*4,side*4,side]);
        translate([-side*2,-side*2,l])
        cube([side*4,side*4,l*10]);
    }
    
}

module pylon_base() {
    w = pylon_base_w;
    l = pylon_base_l;
    h = pylon_base_h;
    $fn=100;
    fix = 0.01;

    r = 2;
    translate([-w/2,-l/2,0])
    minkowski() {
        cube([w, l, h]);
        cylinder(r=r, h= fix);
    }
}

module new_gate() {
    gap = 4;

    pylon_base();

    translate([-pylon_side/2,-pylon_side-pylon_side/2,pylon_base_h])
    rotate([-45,0,0])
    bar(l=hp(pylon_side));

    translate([-pylon_side/2,-pylon_side/2,pylon_base_h])
    pylon(side=pylon_side, l=150, gap=gap, bar_w=bar_w);
}

translate([11,90,0])
new_gate();


//difference() {
    translate([0,120,0])
    gate_150();
//
//    translate([-500,-500,50])
//    cube([1000,1000,1000]);
//}



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
