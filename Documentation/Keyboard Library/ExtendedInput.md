# ExtendedInput

## Syntax

qb64

```
SUB ExtendedInput (prompt$, result$)
```

## Description

`ExtendedInput` is an advanced, feature‑rich input routine designed to replace `INPUT` and `LINE INPUT` with a fully interactive, editable, cursor‑controlled input field.

It supports:

- Cursor movement (Left, Right, Home, End)

- Backspace and Delete

- Insertions at any cursor position

- Undo (Ctrl+Z)

- Paste (Ctrl+V), with optional disabling

- Password masking

- Numeric validation (unsigned, integer, float)

- Length limits

- Screen positioning

- Hidden final output

- ALT‑code entry (Alt+###)

- Real‑time display with blinking cursor

The routine is intentionally “over‑engineered” to provide a robust, modern input experience inside QB64.

# Prompt Modifiers

If the prompt begins with `{...}`, the contents define **input constraints** and **behavior flags**.

Example:

Code

```
{UI L10 X5 Y10 P}Enter value:
```

### Supported Modifiers

| Code  | Meaning                                      |
| ----- | -------------------------------------------- |
| `U`   | Unsigned numeric input only                  |
| `I`   | Integer input only                           |
| `F`   | Floating‑point input only                    |
| `P`   | Password mode (mask input with `*`)          |
| `L##` | Maximum length limit                         |
| `X##` | Set cursor X position before printing        |
| `Y##` | Set cursor Y position before printing        |
| `D`   | Disable paste (Ctrl+V)                       |
| `V`   | Move cursor to end of pasted text            |
| `H`   | Hide final input (do not leave it on screen) |

### Float‑specific limits

`F` may include before/after decimal limits:

- Characters before decimal point

- Characters after decimal point

Example:

Code

```
{F3.2}  'Up to 3 digits before decimal, 2 after
```

# Behavior Overview

### 1. Screen and Cursor Setup

- Saves screen page with `PCopy`

- Stores original cursor position

- Clears key buffer with `_KeyClear`

- Initializes cursor position (`CP`) and previous position (`OldCP`)

### 2. Parse Prompt Modifiers

If the prompt begins with `{...}`, the routine:

- Extracts the limiter block

- Converts it to uppercase

- Sets flags for numeric type, password mode, paste behavior, etc.

- Extracts numeric values using `KB_GetValue`

After parsing, the prompt is trimmed to remove the `{...}` block.

### 3. Main Input Loop

Runs until Enter (`k = 13`) is pressed.

Inside the loop:

#### ALT‑code entry

- If Alt is held, only numeric keypad input is accepted.

- When Alt is released, the collected digits are converted to a character.

#### Normal key handling

- **Backspace** removes character before cursor.

- **Tab** inserts four spaces.

- **Printable characters** (32–128) are inserted at cursor.

- **Ctrl+V** pastes clipboard text (unless disabled).

- **Ctrl+Z** undoes last change.

- **Home/End** move cursor to start/end.

- **Left/Right** move cursor one position.

- **Delete** removes character at cursor.

#### Numeric validation

If numeric limits are active:

- Unsigned: no `+` or `-`

- Integer: only digits, optional leading `-`

- Float: digits, one decimal point, optional leading `-`, before/after limits enforced

#### Length limit

If `L##` is set, input cannot exceed that length.

### 4. Display

Each loop iteration:

- Restores screen with `PCopy`

- Prints prompt and input

- Shows blinking cursor (`_`)

- Masks input with `*` if password mode is active

- Uses `_Display` and `_Limit` for smooth updates

### 5. Exit Behavior

When Enter is pressed:

- Restores screen

- Prints final input unless `H` (hide) is active

- Returns the final string in `result$`

- Restores `_AutoDisplay` state

# Example

qb64

```
DIM answer$

ExtendedInput "{UI L5 P}Enter PIN: ", answer$

PRINT "You entered:"; answer$
```

# Notes

- This routine depends on the custom `KeyHit` and `_KeyDown` functions for full keyboard support.

- ALT‑code entry supports up to 3 digits (0–255).

- Undo only stores one level (previous input).

- Paste behavior can be customized with `D` and `V`.

- Cursor movement and editing behave similarly to a modern text editor.

# Related

- KeyHit

- KeyDown

- KB_GetValue

- SetAltGr

- Init_KeyCodes
