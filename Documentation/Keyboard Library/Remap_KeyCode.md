# Remap_KeyCode

## Syntax

qb64

```
SUB Remap_KeyCode (Which AS LONG, ASCII AS LONG, Ctrl AS LONG, Shift AS LONG, Alt AS LONG, AltGr AS LONG, Repeat AS _FLOAT)
```

## Description

`Remap_KeyCode` assigns or overrides the internal mapping for a specific key index within the keyboard‑handling library.
Each key index (1–254) contains a full set of modifier‑dependent return values, allowing the library to translate physical keypresses into:

- Unmodified ASCII

- Ctrl‑modified values

- Shift‑modified values

- Alt‑modified values

- AltGr‑modified values

- Custom repeat timing

This routine is the foundation of the library’s **international keyboard support**, **custom layouts**, and **user‑defined remapping**.

## Parameters

| Parameter | Type   | Description                                                  |
| --------- | ------ | ------------------------------------------------------------ |
| `Which`   | LONG   | The key index to modify (1–254).                             |
| `ASCII`   | LONG   | Value returned when the key is pressed with no modifiers.    |
| `Ctrl`    | LONG   | Value returned when pressed with Ctrl.                       |
| `Shift`   | LONG   | Value returned when pressed with Shift.                      |
| `Alt`     | LONG   | Value returned when pressed with Alt.                        |
| `AltGr`   | LONG   | Value returned when pressed with AltGr.                      |
| `Repeat`  | _FLOAT | Key repeat delay; `-1` disables repeat (used for modifiers). |

## Behavior

The routine updates the corresponding fields in the global `Keys()` array:

- `Index`

- `ASCII`

- `Ctrl`

- `Shift`

- `Alt`

- `AltGr`

- `Repeat`

- `LastHit` (reset to 0)

- `Down` (reset to 0)

This ensures the key begins in a clean state after remapping.

## Example

qb64

```
'Remap the semicolon key (;:)
Remap_KeyCode 186, 59, 0, 58, 0, 0, 0.2
```

## Notes

- This routine does not validate the key index; the caller must ensure `Which` is valid.

- Modifier mappings are used by `KeyHit` to determine the correct return value.

- Repeat timing is essential for natural typing behavior.

- Many international layouts override dozens of keys using this routine.

## Related

- Remap_Extended_KeyCode

- Init_KeyCodes

- KeyHit

- KeyboardInfo_Type
