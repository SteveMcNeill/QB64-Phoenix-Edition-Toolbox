# Date.ToUniDate$

## Syntax

result\$ = Date.ToUniDate\$(userDate\$, format\$)

## Description

Converts a standard QB64PE date (`MM/DD/YYYY`) into a **fully customizable** output format.

Supports a rich formatting language:

### Month

- `E` → Full month name (January)
- `M` → Abbreviated month (Jan)
- `m` → Numeric month (01)

### Day

- `D` → Day with ordinal suffix (01st, 02nd)
- `d` → Numeric day (01)

### Weekday

- `W` → Full weekday name (Monday)
- `w` → Abbreviated weekday (Mon)

### Year

- `YYYY` → 4‑digit year  
- `YY` → 2‑digit year  
- `Y` or `y` → treated as 4‑digit year

### Notes

- Extra repeated letters are ignored (`MMM` behaves like `M`).
- Literal characters are copied directly.

## Parameters

| Parameter   | Type   | Description                                     |
| ----------- | ------ | ----------------------------------------------- |
| `userDate$` | STRING | A date in QB64PE `DATE$` format (`MM/DD/YYYY`). |
| `format$`   | STRING | A custom formatting mask.                       |

## Return Value

A formatted date string.

## Example

```vb
PRINT Date.ToUniDate$("02/10/2026", "W, M D, YYYY")
' prints: Tuesday, Feb 10th, 2026
```

## See Also

[Date.Day$](Date.Day.md)

[Date.ExtendedTimer##](Date.ExtendedTimer.md)

[Date.Hour$](Date.Hour.md)

[Date.Minute$](Date.Minute.md)

[Date.Month$](Date.Month.md)

[Date.Second$](Date.Second.md)

[Date.TimeStamp##](Date.TimeStamp.md)

[Date.TimeStamp.HR$](Date.TimeStamp.HR.md)

[Date.ToUniDate$](Date.ToUniDate.md)

[Date.ToString$](Date.ToString.md)

[Date.WeekDay&](Date.WeekDay.md)

[Date.WeekDay.Name$](Date.WeekDay.Name.md)

[Date.Year$](Date.Year.md)
