# Draw.Circle.Ring.Arc.Fill

## Syntax

qb64

```
SUB Draw.Circle.Ring.Arc.Fill (cx AS LONG, cy AS LONG, r1 AS LONG, r2 AS LONG, a1 AS SINGLE, a2 AS SINGLE, col AS _UNSIGNED LONG)
```

## Description

Draws a **filled ring arc** (a donut‑shaped slice) centered at `(cx, cy)`.
This routine is a convenience wrapper that converts circular radii into elliptical parameters and forwards the work to `Draw.Ellipse.Ring.Arc.Fill`.

Use this command when you want a circular ring segment rather than an elliptical one.

## Parameters

| Name  | Type           | Description               |
| ----- | -------------- | ------------------------- |
| `cx`  | LONG           | X‑coordinate of center    |
| `cy`  | LONG           | Y‑coordinate of center    |
| `r1`  | LONG           | Inner radius of the ring  |
| `r2`  | LONG           | Outer radius of the ring  |
| `a1`  | SINGLE         | Starting angle in degrees |
| `a2`  | SINGLE         | Ending angle in degrees   |
| `col` | _UNSIGNED LONG | Fill color                |

## Behavior

- Converts circular radii into ellipse radii by passing `(r1, r1)` and `(r2, r2)` to the ellipse‑based routine.

- Delegates all geometric construction and scanline filling to `Draw.Ellipse.Ring.Arc.Fill`.

- Supports arcs that cross the 0° boundary by allowing `a2 < a1`.

- Produces a smooth, filled circular band segment.

## Notes

- Angles follow standard mathematical orientation:
  
  - `0°` = right
  
  - `90°` = up
  
  - `180°` = left
  
  - `270°` = down

- If `r1 = 0`, the result is a filled arc (pie slice).

- If `a1 = 0` and `a2 = 360`, the result is a full ring.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a green ring arc from 45° to 270°
Draw.Circle.Ring.Arc.Fill 400, 300, 60, 120, 45, 270, _RGB32(0, 200, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
