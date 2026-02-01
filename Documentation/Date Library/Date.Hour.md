# Date.Hour$

## Syntax

result\$ = Date.Hour\$(timeString\$)

## Description

Extracts the **hour** portion from a time string in standard `TIME$` format (`"HH:MM:SS"`).

## Parameters

| Parameter     | Type   | Description                          |
| ------------- | ------ | ------------------------------------ |
| `timeString$` | STRING | A time value in `"HH:MM:SS"` format. |

## Return Value

A **2‑character string** representing the hour.

## Example

```vb
t$ = "18:45:03"
PRINT Date.Hour$(t$)   'prints 18
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
