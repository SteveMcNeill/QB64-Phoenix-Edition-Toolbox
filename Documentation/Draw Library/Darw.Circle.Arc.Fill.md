# Draw.Circle.Arc.Fill

## Syntax

qb64

```
SUB Draw.Circle.Arc.Fill (cx AS LONG, cy AS LONG, r AS LONG, a1 AS SINGLE, a2 AS SINGLE, col AS _UNSIGNED LONG)
```

## Description

Draws a **filled circular arc** (a pie‑slice shape) centered at `(cx, cy)` using a scanline polygon‑fill method.
This routine is a convenience wrapper that forwards the work to `Draw.Ellipse.Ring.Arc.Fill` with an inner radius of `0`, producing a solid wedge.

Use this when you need pie slices, gauges, radial meters, or any filled circular sector.

## Parameters

| Name  | Type           | Description                   |
| ----- | -------------- | ----------------------------- |
| `cx`  | LONG           | X‑coordinate of circle center |
| `cy`  | LONG           | Y‑coordinate of circle center |
| `r`   | LONG           | Radius of the arc             |
| `a1`  | SINGLE         | Starting angle in degrees     |
| `a2`  | SINGLE         | Ending angle in degrees       |
| `col` | _UNSIGNED LONG | Fill color                    |

## Behavior

- Converts the circular radius into ellipse radii `(r, r)`.

- Calls `Draw.Ellipse.Ring.Arc.Fill` with inner radii set to `0`.

- Supports arcs that wrap past 360° by allowing `a2 < a1`.

- Produces a smooth, solid pie slice with no gaps.

- Uses only `LINE`‑based scanline filling for compatibility and speed.

## Notes

- Angles follow standard mathematical orientation:
  
  - `0°` = right
  
  - `90°` = up
  
  - `180°` = left
  
  - `270°` = down

- If `a1 = 0` and `a2 = 360`, the result is a filled circle.

- For ring‑shaped arcs, use `Draw.Circle.Ring.Arc.Fill`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a yellow pie slice from 0° to 120°
Draw.Circle.Arc.Fill 400, 300, 150, 0, 120, _RGB32(255, 255, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
