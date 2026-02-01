# Input Devices Library

### Unified Joystick + Mouse Handling for QB64

The **Input Devices Library** provides a clean, reliable, and modernized interface for reading joystick and mouse input in QB64. It wraps QB64’s low‑level device functions into a consistent, high‑level API that delivers stable axis values, normalized directional data, button states, click/hold detection, scroll events, and window‑boundary awareness.

This library is ideal for games, editors, UI systems, and any interactive application that needs precise, real‑time device input.

## Features

### 🎮 Joystick Support

- Automatic detection of joystick hardware

- Reads all axes and buttons from the controller

- Normalizes analog stick values

- Converts analog movement into digital X/Y direction (−1, 0, 1)

- Computes 0–360° angle for each stick

- Dead‑zone filtering to eliminate drift

- Supports left stick, right stick, and D‑pad

- Captures Z‑axis triggers and stick‑press buttons

### 🖱️ Mouse Support

- Full bit‑field mouse event reporting

- Detects:
  
  - Button down
  
  - Click (timed press + release)
  
  - Hold (press longer than threshold)
  
  - Scroll wheel up/down

- Tracks drag start and end coordinates

- Optional automatic `_MouseInput` clearing

- Works seamlessly with real‑time loops

### 🪟 Window Boundary Detection

- Determines whether the mouse cursor is inside the program window

- Uses Windows API for accurate desktop‑level positioning

- Essential for UI hover logic, pausing input, and preventing off‑window clicks

## Included Commands

### `ReadJoyStick`

Reads all joystick axes and buttons, updates the `JoyStick()` and `Button()` shared arrays, applies dead‑zone filtering, computes angles, and normalizes direction values.

### `MouseButtonStatus`

Returns a **bit‑field integer** describing all mouse events:

- Down, click, hold

- Left, right, middle

- Scroll up/down

- Drag start/end

### `MBS`

Convenience wrapper for `MouseButtonStatus`.

### `MouseInApp`

Returns TRUE if the mouse cursor is inside the program window.
Uses Windows API + GLUT offsets to convert desktop coordinates into app‑relative coordinates.

### `Axis_Type`, `JoyStick()`, `Button()`

Internal structures and arrays storing joystick axis data, direction, angle, activity state, and button states.

## Why Use This Library?

QB64’s built‑in device functions are powerful but low‑level.
This library:

- Normalizes inconsistent axis values

- Removes joystick drift

- Converts analog movement into simple digital directions

- Distinguishes click vs. hold events

- Provides a unified bit‑field for mouse input

- Handles drag detection automatically

- Makes joystick and mouse input predictable and easy to use

Instead of wrestling with raw device data, you get clean, ready‑to‑use values ideal for gameplay logic, UI navigation, and interactive tools.

## Quick Example

qb64

```
ReadJoyStick

IF JoyStick(1).Active THEN
    PRINT "Left stick angle:"; JoyStick(1).Angle
END IF

mbs = MBS(1)
IF mbs AND 8 THEN PRINT "Left click!"
IF mbs AND 64 THEN PRINT "Left held!"
```

## Summary

The **Input Devices Library** gives QB64 developers a compact but powerful toolkit for real‑time joystick and mouse interaction.
It abstracts away hardware quirks, normalizes input, and provides clean, intuitive data structures that make interactive programming dramatically easier.
