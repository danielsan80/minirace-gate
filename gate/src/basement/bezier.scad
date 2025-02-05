function deltat() = 0.02;

function slice_list(list,start,length) =
    is_undef(length)?[for (i = [start:len(list)-1]) list[i]]:
        length==0?[]:
        start+length>=len(list)?[for (i = [start:len(list)-1]) list[i]]:
            [for (i = [start:start+length-1]) list[i]];

function cubic_bezier(p0,p1,p2,p3) =
    let (points = [for (t=[0:deltat():1+deltat()]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3])
    slice_list(points, 0, len(points)-1);

function project_point(pa, pb) =
    [for (i = [0:1]) pb[i]+(pb[i]-pa[i])];


module line(p1,p2,w) {
    hull() {
        translate(p1) circle(r=w,$fn=20);
        translate(p2) circle(r=w,$fn=20);
    }
}

module polyline(points, w=1) {
    for(i=[0:len(points)-2]) {
        line(points[i], points[i+1],w);
    }
}
