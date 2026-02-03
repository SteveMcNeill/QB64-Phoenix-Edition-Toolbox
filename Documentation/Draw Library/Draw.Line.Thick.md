# Draw.Line.Thick

## Syntax

qb64

```
SUB Draw.Line.Thick (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, thickness AS LONG, colour AS _UNSIGNED LONG)
```

## Description

Draws a **thick line segment** between `(x1, y1)` and `(x2, y2)` using `_MAPTRIANGLE`.
The line is rendered as a filled rectangle oriented along the segment, with the specified thickness.

## Parameters

| Name        | Type           | Description              |
| ----------- | -------------- | ------------------------ |
| `x1`        | LONG           | Starting X‑coordinate    |
| `y1`        | LONG           | Starting Y‑coordinate    |
| `x2`        | LONG           | Ending X‑coordinate      |
| `y2`        | LONG           | Ending Y‑coordinate      |
| `thickness` | LONG           | Line thickness in pixels |
| `colour`    | _UNSIGNED LONG | Line color               |

## Behavior

- Lazily creates a 1×1, 32‑bit `tempimage` and a `_MEM` view of it.

- Writes `colour` directly into the image’s memory.

- Computes the line angle using `_ATAN2`.

- Offsets endpoints perpendicular to the line by `±thickness/2` to form a quad.

- Draws the quad as two triangles using `_MAPTRIANGLE`.

## Notes

- Orientation is centered on the **middle** of the line thickness.

- `tempimage` is reused across calls for efficiency.

- Works well for strokes, outlines, and UI elements.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a thick cyan line
Draw.Line.Thick 100, 100, 700, 500, 12, _RGB32(0, 255, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
