# ExtendedTimer##

## Syntax

result## = ExtendedTimer##

## Description

A simplified, high‑performance timestamp generator based on the current date and `TIMER`.

This function produces a **monotonically increasing positive timestamp** suitable for timing operations, animations, or profiling.

Limitations:

- Valid only until the year **2100** (simplified leap‑year logic).
- Not intended for historical date conversion.

## Return Value

A floating‑point number representing seconds since the Unix Epoch (approximate).

## Example

```vb
start## = ExtendedTimer##
' ... do work ...
PRINT ExtendedTimer## - start##
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
