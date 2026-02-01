# MouseInApp

## Syntax

qb64

```
FUNCTION MouseInApp
```

## Description

`MouseInApp` determines whether the mouse cursor is currently **inside the program’s window**.
It uses the Windows API to read the **desktop‑level mouse position**, then converts that position into **application‑relative coordinates** by subtracting the window’s screen position and client‑area offsets.

If the translated coordinates fall within the program’s visible drawing area (`0 TO _Width`, `0 TO _Height`), the function returns **TRUE (−1)**.
Otherwise, it returns **0**.

This routine is essential for:

- Pausing or ignoring input when the mouse leaves the window

- Detecting re‑entry into the application

- Hover‑based UI logic

- Preventing accidental clicks outside the program

## Behavior

1. Calls the Windows API `GetCursorPos` to retrieve the mouse’s absolute desktop coordinates.

2. Uses `glutGet` to obtain window border and title‑bar offsets:
   
   - `glutGet(506)` – horizontal frame offset
   
   - `glutGet(507)` – vertical title‑bar offset

3. Converts desktop coordinates into app‑relative coordinates:
   
   Code
   
   ```
   DX = desktopX - _ScreenX - frameOffset
   DY = desktopY - _ScreenY - frameOffset - titleOffset
   ```

4. Performs a bounds check:
   
   - `DX >= 0 AND DX <= _Width`
   
   - `DY >= 0 AND DY <= _Height`

5. Returns:
   
   - `-1` if inside
   
   - `0` if outside

## Return Value

| Value | Meaning                                    |
| ----- | ------------------------------------------ |
| `-1`  | Mouse cursor is inside the program window  |
| `0`   | Mouse cursor is outside the program window |

## Notes

- Works only on Windows due to the use of `GetCursorPos`.

- Useful for UI systems, drag‑and‑drop logic, and preventing off‑window interactions.

- Does not require mouse buttons to be pressed; it purely checks cursor position.

## Related

- MouseButtonStatus

- MBS

- ReadJoyStick
