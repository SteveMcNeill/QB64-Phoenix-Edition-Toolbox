# Draw.Ellipse.Filled

## Syntax

qb64

```
SUB Draw.Ellipse.Filled (CX AS INTEGER, CY AS INTEGER, a AS INTEGER, b AS INTEGER, C AS _UNSIGNED LONG)
```

## Description

Draws a **filled ellipse** centered at `(CX, CY)` using a fast **scanline fill** algorithm.
The routine computes horizontal spans for each vertical step of the ellipse and fills them using `LINE … , BF`.

This method is significantly faster than pixel‑by‑pixel plotting and produces smooth, solid ellipses.

## Parameters

| Name | Type           | Description                         |
| ---- | -------------- | ----------------------------------- |
| `CX` | INTEGER        | X‑coordinate of ellipse center      |
| `CY` | INTEGER        | Y‑coordinate of ellipse center      |
| `a`  | INTEGER        | Horizontal radius (semi‑major axis) |
| `b`  | INTEGER        | Vertical radius (semi‑minor axis)   |
| `C`  | _UNSIGNED LONG | Fill color                          |

## Behavior

- Exits immediately if either radius is zero.

- Computes squared radii and uses the ellipse equation to determine the horizontal extent (`x`) for each vertical offset (`y`).

- Draws the center scanline first.

- Iterates outward from the center, drawing symmetric horizontal spans above and below the center.

- Uses integer math for speed and stability.

## Notes

- Produces a perfectly filled ellipse with no gaps.

- Works for all ellipse sizes, including very large radii.

- Uses only `LINE` commands, so it is compatible with all QB64 graphics modes.

- For rotated ellipses, use `Draw.Ellipse.Tilt` or `Draw.Ellipse.Tilt.Fill`.

## Example

```vb
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a blue ellipse centered at (400, 300)
Draw.Ellipse.Filled 400, 300, 150, 80, _RGB32(0, 120, 25)
```

## Related

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
