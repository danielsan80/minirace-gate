stl_dir = "../../stl/gate";

module upright() {
    translate([63.15,26.7,0])
    import(str(stl_dir,"/Gaslands_Gate_Tower_Scafflod_Tall_v1.stl"));
}

module angle_L() {
    translate([-241.37,-47.87,0])
    import(str(stl_dir,"/Gaslands_Gate_-_Span_Angle_L.stl"));
}

module traverse150() {
    translate([-285.45,2.52,0])
    import(str(stl_dir,"/Gaslands_Gate_-_Span_for_150mm_gate_v2.stl"));
}

module traverse186() {
    translate([-270.83,-3.18,0])
    import(str(stl_dir,"/Gaslands_Gate_-_Span_for_186mm_gate_v2.stl"));
}

module angle_R() {
    translate([-465.52,-47.87,0])
    import(str(stl_dir,"/Gaslands_Gate_-_Span_Angle_R.stl"));
}
