# Date.Year$

## Syntax

result\$ = Date.Year\$(dateString\$, format\$)

## Description

Extracts the **year** from a date string based on a format mask.

Supports:

- `YYYY` → 4‑digit year
- `YY` → 2‑digit year

## Parameters

| Parameter     | Type   | Description                              |
| ------------- | ------ | ---------------------------------------- |
| `dateString$` | STRING | The date text to extract from.           |
| `format$`     | STRING | A format mask containing `YYYY` or `YY`. |

## Return Value

A string containing the year.

## Example

```vb
PRINT Date.Year$("02-10-2026", "MM-DD-YYYY")
' prints 2026
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
