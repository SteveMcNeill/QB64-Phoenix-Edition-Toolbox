# Date.Day$

## Syntax

```
result$ = Date.Day$(dayString$, formatString$)
```

## Description

Extracts the **day-of-month** portion from a date string based on a user‑supplied format pattern.  
The function looks for `"DD"` inside the format string and returns the corresponding characters from the date string.

Useful when parsing dates in arbitrary formats such as `"MM-DD-YYYY"`, `"DD/MM/YYYY"`, `"YYYY.MM.DD"`, etc.

## Parameters

| Parameter       | Type   | Description                                                       |
| --------------- | ------ | ----------------------------------------------------------------- |
| `dayString$`    | STRING | The date text to extract from.                                    |
| `formatString$` | STRING | A format mask containing `"DD"` indicating where the day appears. |

## Return Value

A **2‑character string** representing the day of the month.  
Returns an empty string if `"DD"` is not found in the format mask.

## Example

```
d$ = "02-14-2026"
f$ = "MM-DD-YYYY"
PRINT Date.Day$(d$, f$) 'prints 14
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
