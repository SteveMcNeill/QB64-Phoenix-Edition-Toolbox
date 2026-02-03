# Draw.Image

## Syntax

qb64

```
SUB Draw.Image (Image AS LONG, x AS INTEGER, y AS INTEGER, xscale AS SINGLE, yscale AS SINGLE, angle AS SINGLE, mode AS _BYTE)
```

## Description

Draws an image onto the screen with **scaling**, **rotation**, and **anchor‑point control**.
This routine uses `_MAPTRIANGLE` to transform the image into an arbitrary rotated/scaled quadrilateral, allowing smooth rotation and resizing without distortion.

The `mode` parameter determines how the image is positioned relative to `(x, y)`.

## Parameters

| Name     | Type    | Description                                          |
| -------- | ------- | ---------------------------------------------------- |
| `Image`  | LONG    | Image handle returned by `_LOADIMAGE` or `_NEWIMAGE` |
| `x`      | INTEGER | X‑coordinate of the placement point                  |
| `y`      | INTEGER | Y‑coordinate of the placement point                  |
| `xscale` | SINGLE  | Horizontal scale factor                              |
| `yscale` | SINGLE  | Vertical scale factor                                |
| `angle`  | SINGLE  | Rotation angle **in degrees**                        |
| `mode`   | _BYTE   | Anchor mode determining how `(x, y)` is interpreted  |

### Anchor Modes

| Mode | Meaning                                   |
| ---- | ----------------------------------------- |
| `0`  | Center of the image is placed at `(x, y)` |
| `1`  | Top‑left corner at `(x, y)`               |
| `2`  | Bottom‑left corner at `(x, y)`            |
| `3`  | Top‑right corner at `(x, y)`              |
| `4`  | Bottom‑right corner at `(x, y)`           |

## Behavior

- Retrieves the image width and height.

- Computes scaled dimensions (`w1`, `h1`).

- Based on `mode`, constructs the four corner points of the scaled image before rotation.

- Converts the rotation angle from degrees to radians.

- Rotates all four corner points around the anchor using the standard 2D rotation matrix.

- Uses two `_MAPTRIANGLE` calls to draw the transformed image as two textured triangles.

- Produces smooth rotation and scaling with no pixel gaps.

## Notes

- Rotation is **clockwise**, matching QB64’s coordinate system.

- Scaling factors may be fractional (e.g., `0.5` for half‑size).

- Negative scale values will mirror the image.

- `_MAPTRIANGLE` handles clipping automatically.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

img& = _LOADIMAGE("ship.png", 32)

' Draw a rotated, scaled spaceship centered at (400, 300)
Draw.Image img&, 400, 300, 1.5, 1.5, 45, 0
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
