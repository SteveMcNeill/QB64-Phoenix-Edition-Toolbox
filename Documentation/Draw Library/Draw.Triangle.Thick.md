# Draw.Triangle.Thick

## Syntax

qb64

```
SUB Draw.Triangle.Thick (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, thickness AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws a **thick triangle outline** by rendering each edge with `Draw.Line.Thick`.
This produces a bold, consistent stroke around the triangle.

## Parameters

| Name        | Type           | Description              |
| ----------- | -------------- | ------------------------ |
| `x1, y1`    | LONG           | First vertex             |
| `x2, y2`    | LONG           | Second vertex            |
| `x3, y3`    | LONG           | Third vertex             |
| `thickness` | LONG           | Line thickness in pixels |
| `K`         | _UNSIGNED LONG | Line color               |

## Behavior

- Calls:
  
  - `Draw.Line.Thick x1, y1, x2, y2, thickness, K`
  
  - `Draw.Line.Thick x2, y2, x3, y3, thickness, K`
  
  - `Draw.Line.Thick x3, y3, x1, y1, thickness, K`

## Notes

- Thickness is centered on each edge.

- Pairs well with `Draw.Triangle.Fill` for outlined filled shapes.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

Draw.Triangle.Thick 200, 200, 600, 220, 400, 450, 8, _RGB32(255, 0, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
