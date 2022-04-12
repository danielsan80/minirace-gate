# MiniRace Gate Project: gate

This subproject assembles the gate and all other stuff together to simulate
and build the printable parts in stl files.
It adds the joint to hang up the startlights on the traverse.
It uses the controller box as basement for one of its uprights.
It uses the rules to show the measures in the simulation context.

## Getting started
Tested on Ubuntu 20.04.

You must have OpenSCAD Installed (>=2019.05):

```
sudo apt-get install openscad
```

To build the gate you have to clone this project:

```
git clone git@github.com:danielsan80/minirace-gate.git
```

Enter the project dir:

```
cd minirace-gate
```

## Setup
After cloning the project fron Github and moving into the project dir you must setup the project.

Enter in gate subdir:

```
cd gate
```

Run the setup script:

```
bin/setup
```

Now all should be ok.

## Rendering
The `gate/main.scad` is a "whiteboard" I used to see the simulation of the whole gate and its parts,
adding and removing modules to see if all fit together.

It is worth to grasp the whole idea.

## Build

It's time to build the .stl files from the .scad files.


Run the build script:

```
bin/build
```

At the end of the build script running you should have a new directory `gate/build/stl`
with all updated .stl files

If you have to rebuild them you can delete the stl dir and rerun the `bin/build` script. 

The dir `gate/build/scad` contains the .scad version of the generated .stl files. 

## Configuration

If you need to change the configuration you can edit the `gate/config/parameters.scad` file.

I tried to put all values in a parameter in this file. Tha major part of them should be considered as constants.

It makes sense to change only a few of them. 
