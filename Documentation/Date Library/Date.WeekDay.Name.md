# Date.WeekDay.Name$

## Syntax

result\$ = Date.WeekDay.Name\$(dateString\$, format\$)

## Description

Returns the **full weekday name** for a given date.

Uses `Date.WeekDay&` internally.

## Parameters

| Parameter     | Type   | Description                               |
| ------------- | ------ | ----------------------------------------- |
| `dateString$` | STRING | A date string.                            |
| `format$`     | STRING | Format mask used to extract MM, DD, YYYY. |

## Return Value

A weekday name such as `"Monday"`.

## Example

```vb
PRINT Date.WeekDay.Name$("02/10/2026", "MM/DD/YYYY")
' prints Tuesday
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
