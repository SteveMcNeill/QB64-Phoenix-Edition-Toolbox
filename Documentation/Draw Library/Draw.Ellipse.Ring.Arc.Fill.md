# Draw.Ellipse.Ring.Arc.Fill

## Syntax

qb64

```
SUB Draw.Ellipse.Ring.Arc.Fill (cx AS LONG, cy AS LONG, a1 AS LONG, b1 AS LONG, a2 AS LONG, b2 AS LONG, t_ang1 AS SINGLE, t_ang2 AS SINGLE, col AS _UNSIGNED LONG)
```

## Description

Draws a **filled elliptical ring arc** — essentially a donut‑shaped elliptical slice — centered at `(cx, cy)`.
This is the **core polygon‑construction and scanline‑fill routine** used by all other arc and ring commands in the library.

The routine builds a closed polygon by tracing:

1. The **outer ellipse** from angle `t_ang1` to `t_ang2`

2. The **inner ellipse** from angle `t_ang2` back to `t_ang1` (reverse direction)

It then performs a **scanline fill** across the polygon, producing a smooth, solid elliptical ring segment.

## Parameters

| Name     | Type           | Description                     |
| -------- | -------------- | ------------------------------- |
| `cx`     | LONG           | X‑coordinate of ellipse center  |
| `cy`     | LONG           | Y‑coordinate of ellipse center  |
| `a1`     | LONG           | Inner ellipse horizontal radius |
| `b1`     | LONG           | Inner ellipse vertical radius   |
| `a2`     | LONG           | Outer ellipse horizontal radius |
| `b2`     | LONG           | Outer ellipse vertical radius   |
| `t_ang1` | SINGLE         | Starting angle in degrees       |
| `t_ang2` | SINGLE         | Ending angle in degrees         |
| `col`    | _UNSIGNED LONG | Fill color                      |

## Behavior

- Converts degree angles to radians.

- Ensures `t_ang2` is always ahead of `t_ang1` by adding `2π` if needed.

- Samples the outer ellipse from `t_ang1 → t_ang2` using a fixed angular step (`5°` by default).

- Samples the inner ellipse from `t_ang2 → t_ang1` in reverse.

- Builds a closed polygon of all sampled points.

- Determines the polygon’s vertical bounds (`minY` to `maxY`).

- For each scanline:
  
  - Finds all edge intersections
  
  - Sorts them
  
  - Draws horizontal spans in pairs using `LINE …, BF`

- Produces a clean, gap‑free filled region.

## Notes

- This is the **most general** ellipse‑based fill routine in the library.

- All other arc and ring commands ultimately call this one.

- The angular step (`5°`) can be adjusted inside the code for smoother curves at the cost of speed.

- If `a1 = b1 = 0`, the result is a filled elliptical arc.

- If `t_ang1 = 0` and `t_ang2 = 360`, the result is a full elliptical ring.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Draw a thick blue elliptical ring arc from 10° to 300°
Draw.Ellipse.Ring.Arc.Fill 400, 300, 80, 40, 150, 90, 10, 300, _RGB32(0, 100, 255)
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
