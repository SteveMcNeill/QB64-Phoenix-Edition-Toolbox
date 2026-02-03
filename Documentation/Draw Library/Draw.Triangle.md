# Draw.Triangle

## Syntax

qb64

```
SUB Draw.Triangle (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws the **outline of a triangle** defined by three points.
Each pair of vertices is connected with a `LINE` to form a closed shape.

## Parameters

| Name     | Type           | Description   |
| -------- | -------------- | ------------- |
| `x1, y1` | LONG           | First vertex  |
| `x2, y2` | LONG           | Second vertex |
| `x3, y3` | LONG           | Third vertex  |
| `K`      | _UNSIGNED LONG | Line color    |

## Behavior

- Draws:
  
  - `(x1, y1) → (x2, y2)`
  
  - `(x2, y2) → (x3, y3)`
  
  - `(x3, y3) → (x1, y1)`

## Notes

- Outline only—no fill.

- For filled triangles, use `Draw.Triangle.Fill`.

- For thick outlines, use `Draw.Triangle.Thick`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

Draw.Triangle 200, 200, 600, 220, 400, 450, _RGB32(255, 255, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
