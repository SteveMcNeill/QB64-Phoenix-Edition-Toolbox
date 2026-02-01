# Date.Minute$

## Syntax

result\$ = Date.Minute\$(timeString\$)

## Description

Extracts the **minute** portion from a time string in `"HH:MM:SS"` format.

## Parameters

| Parameter     | Type   | Description                          |
| ------------- | ------ | ------------------------------------ |
| `timeString$` | STRING | A time value in `"HH:MM:SS"` format. |

## Return Value

A **2‑character string** representing the minutes.

## Example

```vb
t$ = "18:45:03"
PRINT Date.Minute$(t$)   'prints 45
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
