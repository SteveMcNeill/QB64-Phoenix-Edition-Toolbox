# KeyDown

## Syntax

qb64

```
FUNCTION KeyDown& (Code AS LONG)
```

## Description

`KeyDown` checks whether a **specific mapped key code** is currently being physically held down.
This differs from `KeyHit`, which reports discrete key events (presses and releases). `KeyDown` instead provides **real‑time polling**, useful for:

- Movement keys in games

- Continuous actions

- Checking modifier states

- Detecting held keys without generating events

The function compares the requested mapped code against **all possible modifier mappings** for each physical key.

## Parameters

| Parameter | Type | Description                                    |
| --------- | ---- | ---------------------------------------------- |
| `Code`    | LONG | The mapped key code to test. Must be positive. |

If `Code <= 0`, the function immediately returns `0`.

## Return Value

| Return | Meaning                                                          |
| ------ | ---------------------------------------------------------------- |
| `-1`   | The key corresponding to the mapped code is currently held down. |
| `0`    | The key is not held down.                                        |

## Behavior

The function loops through all physical key indices `1 TO 254`:

1. Uses `GetAsyncKeyState(i)` to check if the physical key is currently down.

2. If so, compares the requested `Code` against **every mapping** for that key:
   
   - `ASCII`
   
   - `Shift`
   
   - `Ctrl`
   
   - `Alt`
   
   - `AltGr`
   
   - `AltShift`
   
   - `AltCtrl`
   
   - `AltAltGr`
   
   - `CtrlShift`
   
   - `CtrlAltGr`
   
   - `ShiftAltGr`
   
   - `CtrlAltShift`

3. If any mapping matches the requested `Code`, the function returns `-1`.

If no match is found, the function returns `0`.

## Example

qb64

```
'Check if the "A" key (ASCII 65) is held down
IF KeyDown(65) THEN
    PRINT "A is being held"
END IF
```

## Notes

- This routine checks **physical key state**, not event history.

- It is ideal for continuous input (movement, holding keys).

- It respects all remapped values created by:
  
  - `Remap_KeyCode`
  
  - `Remap_Extended_KeyCode`
  
  - `Init_KeyCodes`

- It does not return which physical key is down — only whether the mapped code is active.

## Related

- KeyHit

- Remap_KeyCode

- Remap_Extended_KeyCode

- Init_KeyCodes

- GetAsyncKeyState
