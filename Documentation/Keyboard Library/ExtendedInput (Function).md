# ExtendedInput (Function)

## Syntax

qb64

```
FUNCTION ExtendedInput$ (prompt$)
```

## Description

`ExtendedInput$` is the **function‑based** version of the over‑engineered input system.
It provides the same rich, interactive input experience as the `SUB ExtendedInput`, but instead of writing the result into a variable passed by reference, this version **returns the final input string directly**.

This makes it ideal for inline usage such as:

qb64

```
name$ = ExtendedInput$("Enter name: ")
```

Both versions share the same internal engine:

- Full cursor‑controlled editing

- Undo (Ctrl+Z)

- Paste (Ctrl+V), with optional disabling

- Password masking

- Numeric validation (unsigned, integer, float)

- Length limits

- Screen positioning

- ALT‑code entry (Alt+###)

- Hidden final output

- Smooth redraw with `_Display` and `_Limit`

However, the **function version** is designed for convenience and expression‑style coding.

# Differences Between the FUNCTION and SUB Versions

Although they share nearly identical internal logic, the two routines differ in several important ways:

## 1. **Return Mechanism**

| Version                     | How the result is delivered                                        |
| --------------------------- | ------------------------------------------------------------------ |
| **SUB ExtendedInput**       | Writes the result into a variable passed by reference (`result$`). |
| **FUNCTION ExtendedInput$** | Returns the result directly as the function value.                 |

This is the primary and most important distinction.

## 2. **Call Style**

| Version      | Example                                   |
| ------------ | ----------------------------------------- |
| **SUB**      | `ExtendedInput "{L10}Enter:", answer$`    |
| **FUNCTION** | `answer$ = ExtendedInput$("{L10}Enter:")` |

The function version is more natural for inline expressions and assignment.

## 3. **Prompt Handling**

Both versions parse `{...}` limiter blocks the same way, but:

- The **SUB version** expects a prompt *and* a result variable.

- The **FUNCTION version** expects only the prompt.

## 4. **Output Behavior**

Both versions support the `H` (hide) flag, but:

- The **SUB version** prints the final input unless hidden.

- The **FUNCTION version** also prints the final input unless hidden, but then **returns** the string instead of assigning it.

## 5. **Use Cases**

| Version                     | Best used when…                                                     |
| --------------------------- | ------------------------------------------------------------------- |
| **SUB ExtendedInput**       | You want explicit variable passing, or you prefer procedural style. |
| **FUNCTION ExtendedInput$** | You want compact, expression‑style input handling.                  |

# Prompt Modifiers

The function supports the same modifiers as the SUB version:

| Code  | Meaning                     |
| ----- | --------------------------- |
| `U`   | Unsigned numeric input only |
| `I`   | Integer input only          |
| `F`   | Floating‑point input only   |
| `P`   | Password mode               |
| `L##` | Maximum length              |
| `X##` | Set cursor X                |
| `Y##` | Set cursor Y                |
| `D`   | Disable paste               |
| `V`   | Move cursor after paste     |
| `H`   | Hide final input            |

Float modifiers may include before/after decimal limits:

Code

```
{F3.2}
```

# Behavior Overview

The FUNCTION version performs the same steps as the SUB version:

### 1. Screen Setup

- Saves screen page with `PCopy`

- Stores cursor position

- Clears key buffer

- Initializes cursor position and editing state

### 2. Limiter Parsing

- Extracts `{...}` block

- Sets numeric, password, paste, and position flags

- Uses `KB_GetValue` to extract numeric limits

### 3. Input Loop

Handles:

- Backspace

- Delete

- Tab insertion

- Printable characters

- Ctrl+V paste

- Ctrl+Z undo

- ALT‑code entry

- Cursor movement

- Numeric validation

- Length limits

### 4. Display

- Redraws prompt and input each frame

- Shows blinking cursor

- Masks input if password mode is active

### 5. Exit

- Restores screen

- Prints final input unless hidden

- Returns the final string as the function value

# Example

qb64

```
age$ = ExtendedInput$("{UI L3}Enter age: ")

PRINT "You entered:"; age$
```

# Notes

- The FUNCTION version is a drop‑in alternative to the SUB version when you prefer return‑value semantics.

- Both versions rely on `KeyHit`, `_KeyDown`, and `KB_GetValue`.

- Undo is single‑level.

- ALT‑code entry supports 0–255.

- Cursor behavior matches a simple text editor.

# Related

- ExtendedInput (SUB version)

- KB_GetValue

- KeyHit

- KeyDown

- SetAltGr

- Init_KeyCodes
