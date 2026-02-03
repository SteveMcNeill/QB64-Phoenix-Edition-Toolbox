# Draw Library

A high‑performance 2D drawing library for **QB64‑PE**, providing fast, flexible routines for shapes, lines, images, text rendering, and geometric transformations. The library is designed to be **lightweight**, **consistent**, and **easy to integrate** into any QB64 project.

## Features

- Fast filled shapes using optimized scanline algorithms

- Thick lines, triangles, quads, and rounded rectangles

- Rotated and scaled image rendering via `_MAPTRIANGLE`

- Rotated and filled ellipses

- Full arc and ring‑arc support (circular and elliptical)

- Text‑to‑image rendering for UI labels and sprites

- Clean, consistent naming conventions

- Zero dependencies beyond QB64‑PE itself

## Installation

1. Place the library file (e.g., `Draw Library.QLB``) into your project folder.

2. Add the include directive at the top of your program:

Code

```
'$INCLUDE:'Draw Library.QLB'
```

3. Compile and run — all commands become immediately available.

## Command Index

[COMMAND INDEX.md](COMMAND INDEX.md)

## ## Philosophy

The Draw Library is built around a few core principles:

### **1. Consistency**

Every command follows the same naming pattern:

Code

```
Draw.<Shape>.<Variant>
```

### **2. Performance**

Wherever possible, routines use:

- `_MAPTRIANGLE` for fast GPU‑accelerated fills

- `_MEM` for direct pixel writes

- Integer math for speed and stability

### **3. Compatibility**

All routines work in:

- Any 32‑bit screen mode

- Any resolution

- Any aspect ratio

### **4. Simplicity**

The API is designed to be intuitive:

- No global state

- No hidden dependencies

- No required initialization

## Example

```vb
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a filled circle
Draw.Circle.Fill 400, 300, 100, _RGB32(255, 140, 0)

' Draw a rotated image
img& = _LOADIMAGE("ship.png", 32)
Draw.Image img&, 400, 300, 1, 1, 45, 0
```

## License

This library is free to use, modify, and distribute in any QB64‑PE project. Attribution is appreciated but not required.

## Author

Created by **Steve**, with a focus on clarity, performance, and developer‑friendly design.
