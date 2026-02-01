# Axis_Type

## Syntax

qb64

```
TYPE Axis_Type
    Active AS _BYTE
    X AS INTEGER
    Y AS INTEGER
    Vert AS SINGLE
    Hort AS SINGLE
    Angle AS SINGLE
END TYPE
```

## Description

Internal structure representing a joystick axis group.
Used by `ReadJoyStick` to store processed joystick data.

## Fields

- `Active` — TRUE if stick is moved beyond dead‑zone

- `X` — simplified horizontal direction (−1, 0, 1)

- `Y` — simplified vertical direction (−1, 0, 1)

- `Vert` — raw vertical axis value

- `Hort` — raw horizontal axis value

- `Angle` — 0–360° direction



---



# JoyStick() Array

## Description

Shared array of `Axis_Type` structures.
Populated by `ReadJoyStick`.

Indexes:

- `JoyStick(1)` — Left stick

- `JoyStick(2)` — Right stick

- `JoyStick(3)` — D‑pad



---



# Button() Array

## Description

Shared array of button states for the controller.
Populated by `ReadJoyStick`.

- `Button(i)` is TRUE/FALSE

- Includes face buttons, shoulder buttons, stick‑press buttons, and Z‑axis triggers

# 

---





# Mouse_StartX / Mouse_StartY

# Mouse_EndX / Mouse_EndY

## Description

Shared variables storing mouse drag start and end positions.

- Set when a mouse button is pressed

- Updated when a hold ends

- Useful for drag‑and‑drop logic


