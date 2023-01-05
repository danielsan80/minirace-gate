# Mini Race Challenge 3D printable parts

## Intro
This repository contains the 3D printable parts of the **Mini Race Challenge** Timing System.

It is a timing system specifically designed for extremely small sized radio controlled cars,
from 1:76 (Turbo Racing) to 1:57 (Coke Can Cars) and more.

More details on the site [www.miniracechallage.com](https://www.miniracechallenge.com).

The app is available at [app.miniracechallage.com](https://app.miniracechallenge.com)
and works on PC, IOS and Android.

This repository contains a few projects.

The project `gate` depends on the other ones.

`startlights` and `controller-box` are stand alone projects.

`ruler` and `car` are utilities.

## Contexts
The projects use a kind of framework.
You can find some directories that define the context:
- `src`: It contains the source code (*.scad) in an abstract/generic/default context.
  The 3d parts are located in a useful and natural position without a specific purpose.  
- `sim`: It contains modules useful for the simulation. These modules wrap and transform the source modules
  to translate and rotate them for a better placement in the space for a simulation purpose.
- `print`: It contains modules useful for the printing. These modules wrap and transform the source modules
  to translate and rotate them for a better placement in the space for a printing purpose.
- `test`: It contains modules useful for the testing. These modules cut or reduce the source
  modules to print drafts to test joints, plays, friction between parts and other test stuff.
  
## Conventions

Not all projects and parts still adopt the following conventions, but they are proving useful. 

### Private modules
To indicate a "private" module that is used only in the same file, it is prefixed with an underscore `_`.

A private module has a global scope too (with risk of name collision), but it helps to identify which modules in a file
should be considered "exported" and usable from who "< use >" the file.

### Context prefix
To specify a module belongs to a context it is prefixed with the context keyword (`print_*`, `sim_*`, `test_*`, ...).

### _transform suffix
To specify a module help to place a model in the right position (for a specific context for example)
it is suffixed with `_transform`. Obviously it has a `children()` instruction to which apply the transformation.

### _color suffix
To specify a module apply a color to a model (for a simulation for example)
it is suffixed with `_color`. Obviously it has a `children()` instruction to which apply the color.


# Index

[`controller-box`](controller-box/README.md): is the box to contain the controller card.

[`startlights`](startlights/README.md): Provides cover and hanger for the startlights card.
It provides a generic clip to hang the startlights and a metaclip to build a specific clip.

[`gate`](gate/README.md): Assembles the gate and the startlights together to simulate
and build the printable parts in stl files.
It adds the joint to hang up the startlights on the traverse.
It uses the rules to show the measures in the simulation context.
It uses the car models (1:54) to show the aspect ratio of the gate in the simulation context.

[`ruler`](ruler/README.md): is an utility to show rulers with some measures in simulation context.

[`car`](car/README.md): is an utility to show some cars in simulation context.
