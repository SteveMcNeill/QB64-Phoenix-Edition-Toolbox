# SetAltGr

## Syntax

```qb64
SUB SetAltGr (Key1 AS INTEGER, Key2 AS INTEGER)
```

## Description

`SetAltGr` configures which physical key or key combination should be treated as the **AltGr** modifier key within the keyboard‑handling library.

The library internally uses a two‑element array `AltGr(0 TO 1)`:

- `AltGr(0)` — the primary key used to trigger AltGr

- `AltGr(1)` — an optional secondary key that must be held simultaneously

If either element is `0`, that part of the combination is ignored.

This allows the user to redefine AltGr behavior to match different keyboard layouts, OS conventions, or personal preference.

## Parameters

| Parameter | Type    | Description                                                              |
| --------- | ------- | ------------------------------------------------------------------------ |
| `Key1`    | INTEGER | Primary key index used to represent AltGr. `0` disables the primary key. |
| `Key2`    | INTEGER | Optional secondary key index. `0` disables the secondary key.            |

These values correspond to the **internal key index** used by the library (not ASCII codes).
Common values include:

| Value | Meaning    |
| ----- | ---------- |
| 0     | No key     |
| 17    | Any Ctrl   |
| 18    | Any Alt    |
| 162   | Left Ctrl  |
| 163   | Right Ctrl |
| 164   | Left Alt   |
| 165   | Right Alt  |

## Default Behavior

By default, the library sets:

Code

```
AltGr(0) = 165   'Right Alt
AltGr(1) = 0     'No secondary key
```

This matches the Windows On‑Screen Keyboard, where **Right Alt alone** acts as AltGr.

## Example

qb64

```
'Use Right Alt alone as AltGr (default)
SetAltGr 165, 0

'Use Ctrl+Alt as AltGr
SetAltGr 17, 18

'Disable AltGr entirely
SetAltGr 0, 0
```

## Notes

- This routine does not validate key indices; it simply stores them.

- AltGr detection logic is handled inside `KeyHit`.

- Redefining AltGr allows support for international layouts or AltGr emulation on keyboards that lack it.

## Related

- KeyHit

- KeyboardInfo_Type

- Init_KeyCodes
