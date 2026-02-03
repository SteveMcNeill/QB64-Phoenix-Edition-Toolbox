# Draw.Quad.Fill

## Syntax

qb64

```
SUB Draw.Quad.Fill (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, x4 AS LONG, y4 AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws a **filled quadrilateral** by splitting it into two triangles and filling each one.
This uses `Draw.Triangle.Fill` as the underlying primitive.

## Parameters

| Name     | Type           | Description   |
| -------- | -------------- | ------------- |
| `x1, y1` | LONG           | First vertex  |
| `x2, y2` | LONG           | Second vertex |
| `x3, y3` | LONG           | Third vertex  |
| `x4, y4` | LONG           | Fourth vertex |
| `K`      | _UNSIGNED LONG | Fill color    |

## Behavior

- Calls:
  
  - `Draw.Triangle.Fill x1, y1, x2, y2, x3, y3, K`
  
  - `Draw.Triangle.Fill x3, y3, x4, y4, x1, y1, K`

- The two triangles cover the entire quad.

## Notes

- Assumes the quad is reasonably convex and vertices are ordered.

- For outlines, use `Draw.Quad` or `Draw.Quad.Thick`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a filled quadrilateral
Draw.Quad.Fill 200, 200, 600, 220, 580, 400, 220, 380, _RGB32(0, 100, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
