# MiniRace Gate Project

## Intro
This project is the 3d printable part oh the
[Mini Race Challenge Lap Counter](https://www.youtube.com/channel/UCmPbh32NU4jp-B-oBcA80wQ).

It is a lap counter for Can RC cars (1:54) and Turbo Racing RC Cars based on NFC technology.

The app is available at [www.miniracechallage.com](https://www.miniracechallenge.com)
and works on PC, IOS and Android.

It's in an Early bird phase.

This project is composed by a few subprojects.

The main subproject is `gate` and it depends on the other ones.

`startlights` and `controller-box` are developed individually because they
don't need to know anything about the main project `gate`. 

`ruler` and `car` are utilities.

## Contexts
The projects use a kind of framework.
You can find some directories that define the context:
- `src`: It contains the source code (*.scad) in an abstract/generic/default context.
  The 3d parts are located in a useful and natural position without a specific purpose.  
- `sim`: It contains modules useful for the simulation. These modules wrap the source modules
  to translate and rotate them for a better placement in the space for a simulation purpose.
- `print`: It contains modules useful for the printing. These modules wrap the source modules
  to translate and rotate them for a better placement in the space for a printing purpose.
- `test`: It contains module useful for the testing. These modules cut or reduce the source
  modules to print drafts to test joints, plays, friction between parts and other test stuff.
  
## Conventions

Not all projects and parts still adopt the following conventions, but they are proving useful. 

### private modules
To indicate a "private" module that is used only in the same file, it is prefixed with an underscore `_`.

A private module has a global scope too (with risk of name collision), but it helps to identify which modules in a file
should be considered "exported" and usable from who "< use >" the file.

### context prefix
To specify a module belongs to a context it is prefixed with the context keyword (`print_*`, `sim_*`, `test_*`, ...).

### transform suffix
To specify a module help to place a model in the right position (for a specific context for example)
it is suffixed with `_transform`. Obviously it has a `children()` instruction to which apply the transformation.


# Index
[`gate`](gate/README.md): Assembles the gate and all other stuff together to simulate
and build the printable parts in stl files.
It adds the joint to hang up the startlights on the traverse.
It uses the controller box as basement for one of its uprights.
It uses the rules to show the measures in the simulation context.

[`startlights`](startlights/README.md): is the startlights mask for the startlights card.

[`controller-box`](controller-box/README.md): is the box to contain the controller card.

[`ruler`](ruler/README.md): is an utility to show rulers with some measures in simulation context.

[`car`](car/README.md): is an utility to show some cars in simulation context.