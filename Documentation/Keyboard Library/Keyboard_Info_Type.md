# KeyboardInfo_Type

## Description

`KeyboardInfo_Type` is the core data structure used by the keyboard‑handling library to store all information about a single physical key.
There are **254 entries** of this type in the global array:

Code

```
DIM SHARED Keys(254) AS KeyboardInfo_Type
```

Each element represents one physical key index and contains:

- The key’s virtual‑key index

- All modifier‑dependent return values

- Extended modifier combinations

- Repeat timing

- State tracking for press/release detection

This structure is populated by `Init_KeyCodes`, modified by `Remap_KeyCode` and `Remap_Extended_KeyCode`, and consumed by `KeyHit` and `KeyDown`.

# Syntax

qb64

```
TYPE KeyboardInfo_Type
    Index AS LONG
    ASCII AS LONG
    Ctrl AS LONG
    Shift AS LONG
    Alt AS LONG
    AltGr AS LONG
    Repeat AS _FLOAT
    LastHit AS _FLOAT
    Down AS LONG
    AltShift AS LONG
    AltCtrl AS LONG
    AltAltGr AS LONG
    CtrlShift AS LONG
    CtrlAlt AS LONG
    CtrlAltGr AS LONG
    ShiftAltGr AS LONG
    CtrlAltShift AS LONG
END TYPE
```

# Field Details

## Index

**Type:** LONG
The Windows virtual‑key code associated with this key index.
Loaded by `Init_KeyCodes`.

## ASCII

**Type:** LONG
The value returned when the key is pressed with **no modifiers**.

## Ctrl

**Type:** LONG
Value returned when the key is pressed with **Ctrl**.

## Shift

**Type:** LONG
Value returned when the key is pressed with **Shift**.

## Alt

**Type:** LONG
Value returned when the key is pressed with **Alt**.

## AltGr

**Type:** LONG
Value returned when the key is pressed with **AltGr**.
AltGr behavior is configured via `SetAltGr`.

## Repeat

**Type:** _FLOAT
Determines how long before the key begins repeating.
A value of `-1` disables repeat (used for Shift, Ctrl, Alt, etc.).

## LastHit

**Type:** _FLOAT
Timestamp (via `ExtendedTimer`) of the last keypress event.
Used by `KeyHit` to generate repeat events.

## Down

**Type:** LONG
Tracks whether the key is currently down and what mapped value it last produced.
Used to detect transitions and generate key‑up events.

# Extended Modifier Fields

These fields store return values for **multi‑modifier combinations**.
They are set via `Remap_Extended_KeyCode`.

## AltShift

Value returned when **Alt + Shift + key** is pressed.

## AltCtrl

Value returned when **Alt + Ctrl + key** is pressed.

## AltAltGr

Value returned when **Alt + AltGr + key** is pressed.

## CtrlShift

Value returned when **Ctrl + Shift + key** is pressed.

## CtrlAlt

Value returned when **Ctrl + Alt + key** is pressed.

## CtrlAltGr

Value returned when **Ctrl + AltGr + key** is pressed.

## ShiftAltGr

Value returned when **Shift + AltGr + key** is pressed.

## CtrlAltShift

Value returned when **Ctrl + Alt + Shift + key** is pressed.

# Notes

- Every key index (1–254) has its own `KeyboardInfo_Type` entry.

- This structure allows the library to support:
  
  - International keyboard layouts
  
  - Custom remapping
  
  - Full modifier and combination logic
  
  - Accurate key‑up detection
  
  - Key repeat behavior

- `KeyHit` relies heavily on these fields to determine what value to return.

# Related

- Init_KeyCodes

- Remap_KeyCode

- Remap_Extended_KeyCode

- KeyHit

- KeyDown

- SetAltGr
