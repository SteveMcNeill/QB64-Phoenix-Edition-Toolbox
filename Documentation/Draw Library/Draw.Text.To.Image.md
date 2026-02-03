# Draw.Text.To.Image&

## Syntax

qb64

```
FUNCTION Draw.Text.To.Image& (text$ AS STRING, font& AS LONG, fc& AS _UNSIGNED LONG, bfc& AS _UNSIGNED LONG, mode AS _BYTE)
```

## Description

Renders a string of text into a **new 32‑bit image** and returns its handle.
The text can be drawn horizontally (forwards or backwards) or vertically (top‑to‑bottom or bottom‑to‑top), with full control over font and colors.

This is ideal for creating text sprites, labels, or pre‑rendered UI elements.

## Parameters

| Name    | Type           | Description                           |
| ------- | -------------- | ------------------------------------- |
| `text$` | STRING         | Text to render into an image          |
| `font&` | LONG           | Font handle to use (0 = current font) |
| `fc&`   | _UNSIGNED LONG | Foreground (text) color               |
| `bfc&`  | _UNSIGNED LONG | Background color                      |
| `mode`  | _BYTE          | Text layout mode (1–4)                |

### Modes

| Mode | Layout                                              |
| ---- | --------------------------------------------------- |
| `1`  | Print forwards (left to right)                      |
| `2`  | Print backwards (right to left)                     |
| `3`  | Print from top to bottom (vertical, bottom‑up text) |
| `4`  | Print from bottom to top (vertical, top‑down text)  |

> If `mode < 1` or `mode > 4`, it defaults to `1`.

## Behavior

- Saves current color, background, font, destination, and cursor position.

- Chooses image width/height based on `mode` and text length:
  
  - Horizontal: `w = _PRINTWIDTH(text$)`, `h = _FONTHEIGHT`
  
  - Vertical: `w` = max character width, `h = _FONTHEIGHT * LEN(text$)`

- Creates a new 32‑bit image and sets it as `_DEST`.

- Sets font (if `font& <> 0`) and colors to `fc&`, `bfc&`.

- Renders text according to `mode`, centering vertical characters horizontally.

- Restores original destination, colors, font, and cursor position.

- Returns the new image handle.

## Notes

- Returned image is always 32‑bit, suitable for alpha blending and further processing.

- Vertical modes center each character horizontally for better appearance with proportional fonts.

- You are responsible for freeing the image when no longer needed.

## Example

vb

```
'$INCLUDE:'Draw Library.QLB'
SCREEN _NEWIMAGE(800, 600, 32)

' Create an image from text
txtImg& = Draw.Text.To.Image&("HELLO WORLD", 0, _RGB32(255, 255, 255), _RGB32(0, 0, 0), 1)

' Draw it using Draw.Image
Draw.Image txtImg&, 400, 300, 1, 1, 0, 0
```

## Related

- [COMMAND INDEX.md](COMMAND INDEX.md)
