# Draw.Rect.Rounded.Fill

## Syntax

qb64

```
SUB Draw.Rect.Rounded.Fill (x AS LONG, y AS LONG, x1 AS LONG, y1 AS LONG, radius AS LONG, c AS _UNSIGNED LONG)
```

## Description

Draws a **filled rounded rectangle** between `(x, y)` and `(x1, y1)` with a given corner radius.
The routine uses per‑scanline horizontal spans, shrinking the ends in the rounded regions to approximate circular corners.

## Parameters

| Name     | Type           | Description                      |
| -------- | -------------- | -------------------------------- |
| `x, y`   | LONG           | One corner of the rectangle      |
| `x1, y1` | LONG           | Opposite corner of the rectangle |
| `radius` | LONG           | Corner radius in pixels          |
| `c`      | _UNSIGNED LONG | Fill color                       |

## Behavior

- Normalizes coordinates so `x ≤ x1` and `y ≤ y1`.

- Computes width and height; exits if either is non‑positive.

- Clamps `radius` to fit within the rectangle (no more than half the smaller dimension).

- If `radius = 0`, draws a simple filled rectangle with `LINE …, BF`.

- Otherwise:
  
  - Precomputes `rr = radius^2`.
  
  - For each scanline `yy`:
    
    - Computes an `inset` based on the circle equation in the top and bottom rounded regions.
    
    - Draws a horizontal line from `x + inset` to `x1 - inset`.

## Notes

- Produces a smooth, visually pleasing rounded rectangle fill.

- Works for any rectangle where width and height are positive.

- Pairs naturally with `Draw.Rect.Rounded` for outline + fill.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a filled rounded rectangle
Draw.Rect.Rounded.Fill 200, 150, 600, 450, 40, _RGB32(0, 150, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
