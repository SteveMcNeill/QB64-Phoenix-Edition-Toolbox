# Date.Month$

## Syntax

result$ = Date.Month\$(dayString\$, formatString\$)

## Description

Extracts the **month** portion from a date string based on a user‑supplied format pattern.  
The function searches for `"MM"` inside the format string and returns the corresponding characters from the date string.

## Parameters

| Parameter       | Type   | Description                                                         |
| --------------- | ------ | ------------------------------------------------------------------- |
| `dayString$`    | STRING | The date text to extract from.                                      |
| `formatString$` | STRING | A format mask containing `"MM"` indicating where the month appears. |

## Return Value

A **2‑character string** representing the month number.  
Returns an empty string if `"MM"` is not found.

## Example

```
d$ = "2026/02/14"
f$ = "YYYY/MM/DD"
PRINT Date.Month$(d$, f$)   'prints 02
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
