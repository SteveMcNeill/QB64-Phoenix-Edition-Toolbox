# Date.TimeStamp##

## Syntax

result## = Date.TimeStamp##(dateString$, timerValue##)

## Description

Converts a date and time into a **Unix‑style timestamp**, measured in seconds from the Unix Epoch (`January 1, 1970, 00:00:00 UTC`).  

This implementation supports:

- Dates **after** 1970  
- Dates **before** 1970 (negative timestamps)  
- Leap year corrections  
- Month/day rollover logic  
- Integration with QB64PE’s `TIMER` value for precise time-of-day seconds

The date format expected is `"MM-DD-YYYY"`.

## Parameters

| Parameter      | Type   | Description                                      |
| -------------- | ------ | ------------------------------------------------ |
| `dateString$`  | STRING | A date in `"MM-DD-YYYY"` format.                 |
| `timerValue##` | FLOAT  | Seconds since midnight (typically from `TIMER`). |

## Return Value

A **_FLOAT** (double‑precision) representing seconds since the Unix Epoch.  
Negative values represent dates before 1970.

## Example

```vb
d$ = "02-01-2026"
t## = TIMER
ts## = Date.TimeStamp##(d$, t##)

PRINT ts##
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
