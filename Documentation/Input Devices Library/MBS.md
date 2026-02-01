# MBS

## Syntax

qb64

```
FUNCTION MBS% (takeMouseInput AS LONG)
```

## Description

Convenience wrapper for `MouseButtonStatus`.
Returns the same bit‑field integer but with fewer keystrokes.

Equivalent to:

qb64

```
MBS% = MouseButtonStatus(takeMouseInput)
```

## Notes

- Use `MBS(1)` when you want mouse input processed automatically

- Use `MBS(0)` when you handle `_MouseInput` manually
