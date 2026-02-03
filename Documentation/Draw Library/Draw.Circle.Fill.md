# Draw.Circle.Fill

## Syntax

qb64

```
SUB Draw.Circle.Fill (CX AS INTEGER, CY AS INTEGER, R AS INTEGER, C AS _UNSIGNED LONG)
```

## Description

Draws a **filled circle** centered at `(CX, CY)` using an optimized scanline algorithm.
The routine computes horizontal spans for each vertical step of the circle and fills them using `LINE …, BF`, producing a smooth, solid circle with excellent performance.

This method is faster and cleaner than pixel‑plotting approaches and works reliably for circles of any size.

## Parameters

| Name | Type           | Description                   |
| ---- | -------------- | ----------------------------- |
| `CX` | INTEGER        | X‑coordinate of circle center |
| `CY` | INTEGER        | Y‑coordinate of circle center |
| `R`  | INTEGER        | Radius of the circle          |
| `C`  | _UNSIGNED LONG | Fill color                    |

## Behavior

- Uses an integer‑based midpoint circle algorithm to determine horizontal extents.

- Draws the center scanline first.

- Expands outward symmetrically above and below the center.

- Ensures no gaps or missing pixels in the fill.

- If `R = 0`, a single pixel is drawn.

## Notes

- Produces a perfectly filled circle with no artifacts.

- Uses only `LINE` commands, ensuring compatibility with all QB64 graphics modes.

- For thick circular outlines, use `Draw.Circle.Thick`.

- For elliptical fills, use `Draw.Ellipse.Filled`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a solid orange circle centered at (400, 300)
Draw.Circle.Fill 400, 300, 100, _RGB32(255, 140, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
