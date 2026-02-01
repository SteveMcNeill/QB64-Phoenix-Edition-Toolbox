# ReadJoyStick

## Syntax

qb64

```
SUB ReadJoyStick
```

## Description

Reads all joystick axes and button states from the currently connected game controller. Automatically detects:

- Number of devices

- Number of axes

- Number of buttons

The routine maps joystick input into three logical control groups:

- `JoyStick(1)` – Left stick

- `JoyStick(2)` – Right stick

- `JoyStick(3)` – D‑pad

Each joystick entry contains:

- `Hort` – horizontal axis (−1.0 to 1.0)

- `Vert` – vertical axis (−1.0 to 1.0)

- `X` – simplified horizontal direction (−1, 0, 1)

- `Y` – simplified vertical direction (−1, 0, 1)

- `Angle` – 0–360° direction

- `Active` – TRUE if moved beyond dead‑zone threshold

Button states are stored in the shared `Button()` array.

## Behavior

- Reads all axis values via `_Axis(a)`

- Normalizes values to two decimal places

- Applies dead‑zone filtering (±0.01)

- Converts analog movement into digital X/Y direction

- Computes angle using `_Atan2` and `_R2D`

- Detects Z‑axis trigger buttons via `_Axis(3)`

- Updates all button states via `_Button(i)`

## Notes

- Automatically resizes `JoyStick()` and `Button()` arrays based on detected hardware

- Exits early if no joystick is present

- Designed for real‑time polling inside a game loop
