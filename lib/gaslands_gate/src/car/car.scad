stl_dir = "../car/stl";

module car() {
    translate([-4.5,0,0])
    import(str(stl_dir,"/Subaru2.stl"));
}
