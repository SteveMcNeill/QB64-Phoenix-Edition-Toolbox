# Draw.Circle.Thick

## Syntax

qb64

```
SUB Draw.Circle.Thick (x AS SINGLE, y AS SINGLE, radius AS SINGLE, thickness AS SINGLE, colour AS _UNSIGNED LONG)
```

## Description

Draws a **thick, filled circle** centered at `(x, y)` by rendering a filled ring with the specified thickness.
Internally, this routine calls `Draw.Ellipse.Ring.Arc.Fill` using equal radii to produce a circular band.

This is ideal for outlines, halos, gauges, and stylized UI elements.

## Parameters

| Name        | Type           | Description                                               |
| ----------- | -------------- | --------------------------------------------------------- |
| `x`         | SINGLE         | X‑coordinate of circle center                             |
| `y`         | SINGLE         | Y‑coordinate of circle center                             |
| `radius`    | SINGLE         | Outer radius of the circle                                |
| `thickness` | SINGLE         | Thickness of the ring (inner radius = radius − thickness) |
| `colour`    | _UNSIGNED LONG | Fill color                                                |

## Behavior

- Computes the inner radius as `radius − thickness`.

- Calls `Draw.Ellipse.Ring.Arc.Fill` with a full 360° sweep.

- Produces a smooth, solid circular band.

- If `thickness` is equal to `radius`, the result is a filled circle.

- If `thickness` is very small, the result resembles a thick outline.

## Notes

- Thickness must be less than or equal to the radius to produce visible output.

- Uses only `LINE`‑based scanline filling, ensuring compatibility with all QB64 graphics modes.

- For non‑circular rings, use `Draw.Ellipse.Ring.Arc.Fill`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a thick red circle centered at (400, 300)
Draw.Circle.Thick 400, 300, 120, 20, _RGB32(255, 0, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
