# Draw.Line.Angle

## Syntax

qb64

```
SUB Draw.Line.Angle (x1 AS LONG, y1 AS LONG, angle AS _FLOAT, length AS LONG, colour AS _UNSIGNED LONG)
```

## Description

Draws a **single line segment** starting at `(x1, y1)` with a given **angle** and **length**. The endpoint is computed using cosine and sine, then drawn with `LINE`.

## Parameters

| Name     | Type           | Description           |
| -------- | -------------- | --------------------- |
| `x1`     | LONG           | Starting X‑coordinate |
| `y1`     | LONG           | Starting Y‑coordinate |
| `angle`  | _FLOAT         | Angle in **radians**  |
| `length` | LONG           | Length of the line    |
| `colour` | _UNSIGNED LONG | Line color            |

## Behavior

- Computes:
  
  - `x2 = x1 + length * COS(angle)`
  
  - `y2 = y1 + length * SIN(angle)`

- Draws a line from `(x1, y1)` to `(x2, y2)`.

## Notes

- Angle is in **radians**, not degrees.

- Uses QB64’s standard `LINE` command.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a 200‑pixel line at 45 degrees
Draw.Line.Angle 400, 300, 0.7853981634, 200, _RGB32(255, 255, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
