# MouseButtonStatus

## Syntax

qb64

```
FUNCTION MouseButtonStatus% (takeMouseInput AS LONG)
```

## Description

Returns a **bit‑field integer** describing the complete mouse state, including:

- Button down

- Button click

- Button hold

- Scroll wheel

- Drag start/end positions

This is the primary mouse‑event interpreter for the library.

## Bit‑State Return Values

### Button Down

| Bit | Value | Meaning            |
| --- | ----- | ------------------ |
| 1   | 1     | Left button down   |
| 2   | 2     | Right button down  |
| 4   | 4     | Middle button down |

### Click Events

(Press + release within 0.2 seconds)

| Bit | Value | Meaning      |
| --- | ----- | ------------ |
| 8   | 8     | Left click   |
| 16  | 16    | Right click  |
| 32  | 32    | Middle click |

### Hold Events

(Button held longer than ClickLimit)

| Bit | Value | Meaning     |
| --- | ----- | ----------- |
| 64  | 64    | Left held   |
| 128 | 128   | Right held  |
| 256 | 256   | Middle held |

### Scroll Wheel

| Bit  | Value | Meaning     |
| ---- | ----- | ----------- |
| 512  | 512   | Scroll down |
| 1024 | 1024  | Scroll up   |

## Additional Shared Variables

- `Mouse_StartX`, `Mouse_StartY` — where the click/hold began

- `Mouse_EndX`, `Mouse_EndY` — where the hold ended (drag release)

## Behavior

- Optionally processes `_MouseInput` automatically

- Tracks button‑down time using a timer

- Distinguishes click vs. hold based on duration

- Records drag start/end positions

- Returns a combined bit‑field representing all active states

## Notes

- Designed for real‑time polling

- Supports simultaneous button states

- Bit‑field allows easy testing with AND logic
