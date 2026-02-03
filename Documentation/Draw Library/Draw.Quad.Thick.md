# Draw.Quad.Thick

## Syntax

qb64

```
SUB Draw.Quad.Thick (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, x4 AS LONG, y4 AS LONG, thickness AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws a **thick outline** of a quadrilateral using `Draw.Line.Thick` for each edge.
This produces a bold, consistent stroke around the shape.

## Parameters

| Name        | Type           | Description              |
| ----------- | -------------- | ------------------------ |
| `x1, y1`    | LONG           | First vertex             |
| `x2, y2`    | LONG           | Second vertex            |
| `x3, y3`    | LONG           | Third vertex             |
| `x4, y4`    | LONG           | Fourth vertex            |
| `thickness` | LONG           | Line thickness in pixels |
| `K`         | _UNSIGNED LONG | Line color               |

## Behavior

- Calls `Draw.Line.Thick` for each of the four edges:
  
  - `(x1, y1) → (x2, y2)`
  
  - `(x2, y2) → (x3, y3)`
  
  - `(x3, y3) → (x4, y4)`
  
  - `(x4, y4) → (x1, y1)`

## Notes

- Thickness is applied consistently along each edge.

- Ideal for highlighted frames, panels, and UI boxes.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a thick quadrilateral frame
Draw.Quad.Thick 200, 200, 600, 220, 580, 400, 220, 380, 10, _RGB32(255, 0, 0)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
