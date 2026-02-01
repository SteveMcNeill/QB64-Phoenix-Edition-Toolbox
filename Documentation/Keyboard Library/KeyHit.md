# KeyHit

## Syntax

qb64

```
FUNCTION KeyHit& ()
```

## Description

`KeyHit` is the core routine of the custom keyboard‑handling library.
It returns **one key event per call**, including:

- Key‑down events

- Key‑up events

- Modifier‑aware key mappings (Shift, Ctrl, Alt, AltGr, combinations)

- Repeated key events based on per‑key repeat timing

Unlike `_KEYHIT`, this function provides **full modifier resolution**, **international layout support**, **AltGr emulation**, and **accurate key‑up detection**.

The function processes:

- Windows virtual key states via `GetKeyState`

- Internal key metadata stored in `Keys()`

- Modifier states (Shift, Ctrl, Alt, AltGr)

- Combination states (Ctrl+Shift, Alt+Shift, Ctrl+Alt+Shift, etc.)

- Key repeat timing via `ExtendedTimer`

If the window does not have focus, the routine falls back to `_KEYHIT`.

## Return Value

A signed 32‑bit integer representing:

- A **positive value** → key pressed

- A **negative value** → key released

- `0` → no key event available

The returned value is **not** ASCII.
It is the library’s **internal mapped key code**, which may represent:

- ASCII

- Shifted ASCII

- Ctrl/Alt/AltGr mappings

- Combination mappings

- Custom per‑key overrides

## Behavior Overview

### 1. Initialization

If `Keys(1).Index = 0`, the routine automatically calls:

Code

```
Init_KeyCodes "US"
```

This ensures the library is initialized even if the user forgets to do so.

### 2. Return Queue Handling

`KeyHit` maintains a small FIFO queue (`ReturnValues()`) to ensure that:

- Modifier keys generate both down and up events

- Multiple events in a single frame are not lost

If the queue contains values, the function returns the next queued event immediately.

### 3. Modifier Detection

The routine updates global modifier flags:

- `Shift`

- `Ctrl`

- `Alt`

- `AltGr`

AltGr is computed based on the user‑defined `AltGr()` settings.

### 4. Combination Detection

The following combination flags are computed:

- `AltShift`

- `AltCtrl`

- `AltAltGr`

- `CtrlShift`

- `ShiftAltGr`

- `CtrlAltShift`

These are used to determine which mapped value to return for each key.

### 5. Per‑Key Processing

For each key index `1 TO 254`:

- `GetKeyState` determines if the key is physically down.

- If down:
  
  - If this is a repeat event, the repeat value is queued.
  
  - If this is a new press:
    
    - The routine selects the correct mapped value based on modifiers.
    
    - The mapped value is queued.
    
    - Repeat timing is updated.

- If up:
  
  - If the key was previously down, a negative value is queued.
  
  - Internal state is reset.

### 6. Final Queue Check

If new events were generated during this pass, the first event is returned immediately.

### 7. Fallback for Non‑Windows Platforms

If `$If WIN` is false:

Code

```
KeyHit = _KEYHIT
```

## Example

qb64

```
DO
    k = KeyHit
    IF k <> 0 THEN
        IF k > 0 THEN
            PRINT "Key pressed:"; k
        ELSE
            PRINT "Key released:"; -k
        END IF
    END IF
LOOP
```

## Notes

- This routine must be called frequently (e.g., once per frame) for best responsiveness.

- It provides **true key‑up detection**, which `_KEYHIT` does not.

- It supports **international keyboard layouts** when paired with `Init_KeyCodes`.

- Modifier and combination logic is fully customizable through the `Keys()` table.

- AltGr behavior is user‑configurable via `SetAltGr`.

## Related

- KeyClear

- SetAltGr

- KeyboardInfo_Type

- Init_KeyCodes

- GetKeyState

- GetAsyncKeyState
