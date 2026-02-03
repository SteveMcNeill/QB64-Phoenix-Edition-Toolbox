# Draw.Rect.Rounded

## Syntax

qb64

```
SUB Draw.Rect.Rounded (x AS LONG, y AS LONG, x1 AS LONG, y1 AS LONG, radius AS LONG, c AS _UNSIGNED LONG)
```

## Description

Draws the **outline of a rounded rectangle** between `(x, y)` and `(x1, y1)` with a given corner radius.
Straight edges are drawn with `LINE`, and corners are approximated using a midpoint circle algorithm with `PSET`.

## Parameters

| Name     | Type           | Description                      |
| -------- | -------------- | -------------------------------- |
| `x, y`   | LONG           | One corner of the rectangle      |
| `x1, y1` | LONG           | Opposite corner of the rectangle |
| `radius` | LONG           | Corner radius in pixels          |
| `c`      | _UNSIGNED LONG | Outline color                    |

## Behavior

- Clamps `radius` so it is no more than half the rectangle height.

- Draws four straight edges inset by `radius`.

- Uses a circle algorithm to draw four quarter‑circle corners with `PSET`.

- Connects edges and corners into a continuous rounded rectangle.

## Notes

- Coordinates are used as given; they are not normalized (unlike the fill version).

- For a filled rounded rectangle, use `Draw.Rect.Rounded.Fill`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a rounded rectangle outline
Draw.Rect.Rounded 200, 150, 600, 450, 40, _RGB32(255, 255, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
