# Draw.Ellipse.Arc.Fill

## Syntax

qb64

```
SUB Draw.Ellipse.Arc.Fill (cx AS LONG, cy AS LONG, a AS LONG, b AS LONG, a1 AS SINGLE, a2 AS SINGLE, col AS _UNSIGNED LONG)
```

## Description

Draws a **filled elliptical arc** (a pie‑slice shape of an ellipse) centered at `(cx, cy)`.
This routine is a convenience wrapper that forwards the work to `Draw.Ellipse.Ring.Arc.Fill` with inner radii set to `0`, producing a solid elliptical wedge.

Use this when you need filled elliptical sectors, gauges, or stylized UI elements that are not perfectly circular.

## Parameters

| Name  | Type           | Description                      |
| ----- | -------------- | -------------------------------- |
| `cx`  | LONG           | X‑coordinate of ellipse center   |
| `cy`  | LONG           | Y‑coordinate of ellipse center   |
| `a`   | LONG           | Horizontal radius of the ellipse |
| `b`   | LONG           | Vertical radius of the ellipse   |
| `a1`  | SINGLE         | Starting angle in degrees        |
| `a2`  | SINGLE         | Ending angle in degrees          |
| `col` | _UNSIGNED LONG | Fill color                       |

## Behavior

- Converts the ellipse radii into inner `(0, 0)` and outer `(a, b)` radii.

- Calls `Draw.Ellipse.Ring.Arc.Fill` to perform polygon construction and scanline filling.

- Supports arcs that wrap past 360° by allowing `a2 < a1`.

- Produces a smooth, solid elliptical wedge with no gaps.

- Uses only `LINE`‑based scanline filling for compatibility and speed.

## Notes

- Angles follow standard mathematical orientation:
  
  - `0°` = right
  
  - `90°` = up
  
  - `180°` = left
  
  - `270°` = down

- If `a1 = 0` and `a2 = 360`, the result is a filled ellipse.

- For ring‑shaped elliptical arcs, use `Draw.Ellipse.Ring.Arc.Fill`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a purple elliptical arc from 30° to 200°
Draw.Ellipse.Arc.Fill 400, 300, 200, 120, 30, 200, _RGB32(180, 0, 180)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
