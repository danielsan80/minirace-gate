include <vendor/rule/rule.scad>

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
    rule(x=150);
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

module bar(length = 50) {
    linear_extrude(length)
    profile(width=6);
}

module pylon(side = 20, length=100, offset = 0) {
    
    function hp(l) = pow(pow(l,2) + pow(l,2),1/2);
    module main() {
        bar(length=length);
        
        translate([side,0,0])
        bar(length=length);
        
        translate([0,side,0])
        bar(length=length);
        
        translate([side,side,0])
        bar(length=length);
    }
    
    module traverse() {
        offset = 2;
        
        intersection() {
            rotate([0,45,0])        
            bar(length=hp(side));
            
            translate([offset,-side/2,-side*2])
            cube([side-offset*2,side,side*4]);
        }
    }
    
    
    module traversesR() {
        
        traverse();

        rotate([0,0,90])
        traverse();        

        
        translate([side,side,0])
        rotate([0,0,180])
        traverse();
        
        translate([side,side,0])
        rotate([0,0,-90])
        traverse();
    }
    
    module traversesL() {
        translate([side,0,0])
        rotate([0,0,180])
        traverse();
        
        translate([0,side,0])        
        rotate([0,0,-90])
        traverse();
        
        translate([side,0,0])
        rotate([0,0,90])
        traverse();
        
        translate([0,side,0])
        rotate([0,0,0])
        traverse();
    }
    
    difference() {
        union() {
            main();
            for(i=[0:length/side/2]) {
                translate([0,0,(side+offset)*i*2])
                traversesL();
                translate([0,0,(side+offset)+(side+offset)*i*2])
                traversesR();
            }
        }
        translate([-side*2,-side*2,-side])
        cube([side*4,side*4,side]);
        translate([-side*2,-side*2,length])
        cube([side*4,side*4,length*10]);
    }
    
}

//pylon(side=20, length=150, offset=8);

difference() {
    pylon(side=20, length=170, offset=8);
    
    translate([0,0,150])
    rotate([0,45,0])
    translate([-500,-500,0])
    cube([1000,1000,100]);
}

translate([0,0,150])
difference() {
    translate([-10,0,0])
    rotate([0,90,0])
    pylon(side=20, length=170, offset=8);
    
    
    rotate([0,45,0])
    translate([-500,-500,-1000])
    cube([1000,1000,100]);
}
