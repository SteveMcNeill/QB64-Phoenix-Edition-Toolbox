# Date.ToString$

## Syntax

result\$ = Date.ToString\$(MM, DD, YYYY, format\$)

## Description

Formats a numeric date into a user‑defined string format.  
Supports both 2‑digit and 4‑digit years depending on the format mask.

Recognized tokens:

- `YYYY` → 4‑digit year  
- `YY` → 2‑digit year  
- `MM` → 2‑digit month  
- `DD` → 2‑digit day  

## Parameters

| Parameter | Type          | Description                                      |
| --------- | ------------- | ------------------------------------------------ |
| `MM`      | UNSIGNED LONG | Month number (1–12).                             |
| `DD`      | UNSIGNED LONG | Day of month (1–31).                             |
| `YYYY`    | UNSIGNED LONG | Full year.                                       |
| `format$` | STRING        | Format mask containing `YYYY`, `YY`, `MM`, `DD`. |

## Return Value

A formatted date string.

## Example

```vb
PRINT Date.ToString$(2, 10, 2026, "MM-DD-YYYY")
' prints 02-10-2026
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
