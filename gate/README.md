# Mini Race Challenge 3D printable parts: GATE

This project assembles the gate and the startlights to simulate
and build the printable parts in stl files.
It adds the joint to hang up the startlights on the traverse.
It uses the rules to show the measures in the simulation context.
It uses the car models (1:54) to show the aspect ratio of the gate in the simulation context.

## Getting started: easy way

Install [OpenSCAD](https://openscad.org/)

Download the project (Code -> Download ZIP) from [GitHub repository](https://github.com/danielsan80/minirace-gate).

![Download the project](doc/download-repository.png "Download the project")

Unzip the project in a directory (`<project-dir>`).

Create a link `<project-dir>/gate/vendor` -> `<project-dir>` 

Find and open with OpenSCAD or with a text editor the file `<project-dir>/gate/config/parameters.scad`.

Change the parameters.

> for example if you want to change the length of the traverse,
you must change the `startline_l` parameter, setting the distance (in millimeters) between the basements.

After changing some parameter you can open with OpenSCAD one of the files in `<project-dir>/gate/build/scad/print`.

> if you have changed the `startline_l` parameter you probably want to obtain the new stl traverse files:
> so open `<project-dir>/gate/build/scad/print/gate/traverse/traverse.scad`
> or one of his variants in `.../print/gate/traverse/variant/**/*.scad`.
 
Then render the model (Design -> Render [F6]) and export it as STL (File -> Export -> Export as STL [F7])

That's all. Enjoy!


## Getting started: easy way for Linux users

Tested on Ubuntu 20.04.

You must have OpenSCAD (>=2019.05), ImageMagick ang Git installed:

```
sudo apt-get install openscad imagemagick git
```

To build the gate you have to clone this project:

```
git clone git@github.com:danielsan80/minirace-gate.git
```

Enter the project dir:

```
cd minirace-gate
```

### Setup
After cloning the project from Github and moving into the project dir you must setup the project.

Enter in `gate` subdir:

```
cd gate
```

Run the setup script:

```
bin/setup
```

Now all should be ok.

### Rendering
The `<project-dir>/gate/build/scad/sim/*.scad` files are used to show a simulation of the whole gate
and to generate the preview images.
You can play with these files or with a copy of them.

It is worth to grasp the whole idea.

The `<project-dir>/gate/build/scad/print/*.scad` files contain the single printable parts
and are used to generate the `*.stl` files at build time. 


### Build

It's time to build the .stl files from the .scad files.


Run the build script:

```
bin/build
```

At the end of the build script running, you should have a new directory `gate/build/stl`
with all updated .stl files

If you have to rebuild them you can clean up the build dir running

```
bin/cleanup
```

and rerun the `bin/build` script. 

The dir `<project-dir>/gate/build/scad/print` contains the .scad version of the generated .stl files. 

### Configuration

If you need to change the configuration you can edit the `gate/config/parameters.scad` file.

I tried to put all values in a parameter in this file. Tha major part of them should be considered as constants.

It makes sense to change only a few of them. 

### Printing

The project has a lot of elements, so I added a little [Printing guide](doc/printing.md) to help you understanding it.

The guide refers to the Thingiverse built .stl files. 
