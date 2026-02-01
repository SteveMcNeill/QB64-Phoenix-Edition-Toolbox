# KB_GetValue

## Syntax

qb64

```
FUNCTION KB_GetValue (limiter$, what$)
```

## Description

`KB_GetValue` extracts a **numeric value** from a limiter string used by `ExtendedInput`.
Limiter strings appear inside `{...}` at the start of the prompt and define constraints such as:

- Maximum length (`L##`)

- X/Y screen position (`X##`, `Y##`)

- Float digit limits (`F##.##`)

- Unlimited values (`F-`, `L-`, etc.)

This function isolates the digits that follow a specific limiter code and returns them as a number.

It is a small but essential helper routine that makes the entire `{...}` limiter system work.

# Parameters

| Parameter  | Type   | Description                                                          |
| ---------- | ------ | -------------------------------------------------------------------- |
| `limiter$` | STRING | The full limiter block extracted from `{...}`.                       |
| `what$`    | STRING | The specific limiter code to search for (e.g., `"L"`, `"X"`, `"F"`). |

# Return Value

| Return | Meaning                                                        |
| ------ | -------------------------------------------------------------- |
| `-1`   | The limiter explicitly specifies unlimited (e.g., `L-`, `F-`). |
| `0`    | No digits found after the limiter code.                        |
| `n`    | The numeric value following the limiter code.                  |

# Behavior

### 1. Locate the limiter code

The function searches for the first occurrence of `what$` inside `limiter$`:

qb64

```
jstart = InStr(limiter$, what$)
```

If not found, the function returns `0`.

### 2. Check for unlimited (`-`)

If the character immediately after the limiter code is `"-"`:

qb64

```
If Mid$(limiter$, jstart + 1, 1) = "-" Then
    GetValue = -1
```

This indicates **no limit**.

### 3. Extract digits

The function then loops through characters following the limiter code, collecting digits until a non‑digit is found.

Example:

Code

```
L12X5 → KB_GetValue(limiter$, "L") returns 12
```

### 4. Convert to number

The collected digits are returned via `Val`.

# Examples

### Extract maximum length

qb64

```
limit$ = "L20P"
maxLen = KB_GetValue(limit$, "L")   'Returns 20
```

### Extract X position

qb64

```
limit$ = "X5Y10"
xPos = KB_GetValue(limit$, "X")     'Returns 5
```

### Unlimited float digits

qb64

```
limit$ = "F-"
digits = KB_GetValue(limit$, "F")   'Returns -1
```

# Notes

- This function is used exclusively by `ExtendedInput`.

- It supports multi‑digit values (e.g., `L120`).

- It stops reading at the first non‑digit character.

- It does not validate the limiter format; it simply extracts digits after the code.

# Related

- ExtendedInput

- KeyHit

- KeyDown
