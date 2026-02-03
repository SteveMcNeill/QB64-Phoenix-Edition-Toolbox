# Draw.Ellipse.Tilt

## Syntax

qb64

```
SUB Draw.Ellipse.Tilt (CX AS LONG, CY AS LONG, a AS LONG, b AS LONG, ang AS LONG, C AS _UNSIGNED LONG)
```

## Description

Draws a **rotated (tilted) ellipse outline** centered at `(CX, CY)`.
The ellipse is defined by radii `a` and `b`, then rotated clockwise by `ang` radians before being drawn.

This routine traces the ellipse perimeter using a parametric equation and connects points with `LINE` to produce a smooth rotated outline.

## Parameters

| Name  | Type           | Description                             |
| ----- | -------------- | --------------------------------------- |
| `CX`  | LONG           | X‑coordinate of ellipse center          |
| `CY`  | LONG           | Y‑coordinate of ellipse center          |
| `a`   | LONG           | Semi‑major axis length                  |
| `b`   | LONG           | Semi‑minor axis length                  |
| `ang` | LONG           | Clockwise rotation angle **in radians** |
| `C`   | _UNSIGNED LONG | Outline color                           |

## Behavior

- Iterates angle `k` from `0` to `2π` in small steps (`0.025` radians).

- Computes the rotated ellipse point using the standard rotation matrix:
  
  - `x = a*cos(k)*cos(ang) + b*sin(k)*sin(ang)`
  
  - `y = -a*cos(k)*sin(ang) + b*sin(k)*cos(ang)`

- Offsets the result by `(CX, CY)` to place it on screen.

- Connects each point to the previous one using `LINE` to form a continuous outline.

- Produces a smooth rotated ellipse regardless of orientation.

## Notes

- Rotation is **clockwise**, which matches QB64’s screen coordinate system.

- For filled rotated ellipses, use `Draw.Ellipse.Tilt.Fill`.

- The step size (`0.025`) controls smoothness vs. performance.

- Radii may be swapped to rotate the ellipse 90° without using `ang`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a rotated ellipse tilted 30 degrees clockwise
Draw.Ellipse.Tilt 400, 300, 200, 100, 0.5235987756, _RGB32(255, 255, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
