# Draw.Quad

## Syntax

qb64

```
SUB Draw.Quad (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, x4 AS LONG, y4 AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws the **outline of a quadrilateral** defined by four points.
The points are connected in order and closed back to the first point.

## Parameters

| Name     | Type           | Description   |
| -------- | -------------- | ------------- |
| `x1, y1` | LONG           | First vertex  |
| `x2, y2` | LONG           | Second vertex |
| `x3, y3` | LONG           | Third vertex  |
| `x4, y4` | LONG           | Fourth vertex |
| `K`      | _UNSIGNED LONG | Line color    |

## Behavior

- Draws four `LINE` segments:
  
  - `(x1, y1) → (x2, y2)`
  
  - `(x2, y2) → (x3, y3)`
  
  - `(x3, y3) → (x4, y4)`
  
  - `(x4, y4) → (x1, y1)`

## Notes

- No fill is performed—this is outline only.

- For thick outlines, use `Draw.Quad.Thick`.

- For filled quads, use `Draw.Quad.Fill`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a simple quadrilateral outline
Draw.Quad 200, 200, 600, 220, 580, 400, 220, 380, _RGB32(255, 255, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
