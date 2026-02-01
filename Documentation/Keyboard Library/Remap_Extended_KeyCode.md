# Remap_Extended_KeyCode

## Syntax

qb64

```
SUB Remap_Extended_KeyCode (Which&, AltShift&, AltCtrl&, AltAltGr&, _
    CtrlShift&, CtrlAltGr&, ShiftAltGr&, CtrlAltShift&)
```

## Description

`Remap_Extended_KeyCode` assigns or overrides the **combination‑modifier mappings** for a specific key index within the keyboard‑handling library.

While `Remap_KeyCode` handles the basic modifier states:

- Unmodified

- Ctrl

- Shift

- Alt

- AltGr

…this routine handles **multi‑modifier combinations**, enabling the library to return different values when multiple modifiers are pressed simultaneously.

This is essential for international keyboard layouts, advanced shortcuts, and languages where characters require combinations like **Ctrl+Alt**, **Shift+AltGr**, or **Ctrl+Alt+Shift**.

## Parameters

| Parameter      | Type | Description                                              |
| -------------- | ---- | -------------------------------------------------------- |
| `Which`        | LONG | The key index to modify (1–254).                         |
| `AltShift`     | LONG | Value returned when Alt + Shift + key is pressed.        |
| `AltCtrl`      | LONG | Value returned when Alt + Ctrl + key is pressed.         |
| `AltAltGr`     | LONG | Value returned when Alt + AltGr + key is pressed.        |
| `CtrlShift`    | LONG | Value returned when Ctrl + Shift + key is pressed.       |
| `CtrlAltGr`    | LONG | Value returned when Ctrl + AltGr + key is pressed.       |
| `ShiftAltGr`   | LONG | Value returned when Shift + AltGr + key is pressed.      |
| `CtrlAltShift` | LONG | Value returned when Ctrl + Alt + Shift + key is pressed. |

These values are stored in the corresponding fields of the `Keys()` array.

## Behavior

The routine updates the extended modifier fields for the specified key:

- `Keys(Which).AltShift`

- `Keys(Which).AltCtrl`

- `Keys(Which).AltAltGr`

- `Keys(Which).CtrlShift`

- `Keys(Which).CtrlAltGr`

- `Keys(Which).ShiftAltGr`

- `Keys(Which).CtrlAltShift`

These values are used by `KeyHit` when determining which mapped value to return based on the active modifier combination.

## Example

qb64

```
'Example: Remap the "A" key for Ctrl+Shift+A
Remap_Extended_KeyCode 65, 0, 0, 0, 1, 0, 0, 0
```

## Notes

- This routine is typically used by `Init_KeyCodes` when loading international layouts.

- It allows full customization of multi‑modifier behavior.

- If a combination value is set to `0`, that combination is considered unmapped.

- `KeyHit` checks these extended mappings **before** basic modifier mappings.

## Related

- Remap_KeyCode

- Init_KeyCodes

- KeyHit

- KeyboardInfo_Type
