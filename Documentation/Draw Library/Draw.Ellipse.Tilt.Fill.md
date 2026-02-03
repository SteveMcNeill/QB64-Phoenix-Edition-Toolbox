# Draw.Ellipse.Tilt.Fill

## Syntax

qb64

```
SUB Draw.Ellipse.Tilt.Fill (CX AS LONG, CY AS LONG, a AS LONG, b AS LONG, ang AS LONG, C AS _UNSIGNED LONG)
```

## Description

Draws a **filled, rotated (tilted) ellipse** centered at `(CX, CY)`.
The ellipse is defined by radii `a` and `b`, rotated clockwise by `ang` radians, and then filled using a temporary off‑screen buffer and a scanline fill.

This routine constructs the rotated ellipse outline in an off‑screen image, determines the left and right fill boundaries for each scanline, and then draws the filled shape back onto the destination surface.

## Parameters

| Name  | Type           | Description                             |
| ----- | -------------- | --------------------------------------- |
| `CX`  | LONG           | X‑coordinate of ellipse center          |
| `CY`  | LONG           | Y‑coordinate of ellipse center          |
| `a`   | LONG           | Semi‑major axis length                  |
| `b`   | LONG           | Semi‑minor axis length                  |
| `ang` | LONG           | Clockwise rotation angle **in radians** |
| `C`   | _UNSIGNED LONG | Fill color                              |

## Behavior

- Determines the maximum radius and creates a temporary square image large enough to contain the rotated ellipse.

- Draws the rotated ellipse outline into the temporary image using a white pixel color.

- Scans each row of the temporary image to find the leftmost and rightmost ellipse boundary pixels.

- Draws horizontal spans back onto the destination image using the fill color `C`.

- Frees the temporary image when finished.

## Notes

- Rotation is **clockwise**, matching QB64’s screen coordinate system.

- Produces a clean, solid fill with no gaps.

- The temporary image ensures the fill works correctly regardless of rotation angle.

- For an unrotated filled ellipse, use `Draw.Ellipse.Filled`.

- For an outline only, use `Draw.Ellipse.Tilt`.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a filled rotated ellipse tilted 45 degrees clockwise
Draw.Ellipse.Tilt.Fill 400, 300, 180, 90, 0.7853981634, _RGB32(0, 180, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
