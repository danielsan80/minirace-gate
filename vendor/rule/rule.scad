

module rule(x=0, y=0, z=0) {
    function xx() = x ? x : 10;
    function yy() = y ? y : 10;
    function zz() = z ? z : 10;

    function value_x() = x ? x : "?";
    function value_xy() = y ? y : value_x();
    function value_xyz() = z ? z : value_xy();
    function value() = str(value_xyz());

    translate([0,-11,0])
    text(value(), size=8);
    cube([xx(),yy(),zz()]);
}
