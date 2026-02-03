# Draw.Triangle.Fill

## Syntax

qb64

```
SUB Draw.Triangle.Fill (x1 AS LONG, y1 AS LONG, x2 AS LONG, y2 AS LONG, x3 AS LONG, y3 AS LONG, K AS _UNSIGNED LONG)
```

## Description

Draws a **filled triangle** using `_MAPTRIANGLE` and a 1×1 32‑bit color image.
This is the core primitive used for many filled polygon and quad operations.

## Parameters

| Name     | Type           | Description   |
| -------- | -------------- | ------------- |
| `x1, y1` | LONG           | First vertex  |
| `x2, y2` | LONG           | Second vertex |
| `x3, y3` | LONG           | Third vertex  |
| `K`      | _UNSIGNED LONG | Fill color    |

## Behavior

- Lazily creates a static 1×1, 32‑bit image and `_MEM` view.

- Writes `K` directly into the pixel via `_MemPut`.

- Uses `_MAPTRIANGLE _SEAMLESS(...)` to map that single pixel across the triangle area.

- Fills the triangle with solid color.

## Notes

- Very fast and flexible; used by `Draw.Quad.Fill` and others.

- Assumes vertices define a non‑degenerate triangle.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

Draw.Triangle.Fill 200, 200, 600, 220, 400, 450, _RGB32(0, 200, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
