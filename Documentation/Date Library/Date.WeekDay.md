# Date.WeekDay&

## Syntax

result& = Date.WeekDay&(dateString\$, format\$)

## Description

Returns the **weekday number** for a given date using **Zeller’s Congruence**.

The result is:

| Value | Day       |
| ----- | --------- |
| 1     | Sunday    |
| 2     | Monday    |
| 3     | Tuesday   |
| 4     | Wednesday |
| 5     | Thursday  |
| 6     | Friday    |
| 7     | Saturday  |

## Parameters

| Parameter     | Type   | Description                               |
| ------------- | ------ | ----------------------------------------- |
| `dateString$` | STRING | A date string.                            |
| `format$`     | STRING | Format mask used to extract MM, DD, YYYY. |

## Return Value

A number from **1 to 7** representing the weekday.

## Example

```vb
PRINT Date.WeekDay&("02/10/2026", "MM/DD/YYYY")
' prints 3 (Tuesday)
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
