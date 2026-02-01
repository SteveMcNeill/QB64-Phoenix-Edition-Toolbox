# Date.TimeStamp.HR$

## Syntax

result\$ = Date.TimeStamp.HR\$(dateString$, timeString\$)

## Description

Creates a **human‑readable timestamp** by combining a date and time into a compact sortable string.

Unlike `Date.TimeStamp##`, this function is **not** intended for timing or measurement.  
It simply formats the date and time into:

**YYYYMMDD.HHMMSS**

This makes it ideal for filenames, logs, or chronological sorting.

## Parameters

| Parameter     | Type   | Description                                              |
| ------------- | ------ | -------------------------------------------------------- |
| `dateString$` | STRING | A date in standard QB64PE `DATE$` format (`MM-DD-YYYY`). |
| `timeString$` | STRING | A time in standard QB64PE `TIME$` format (`HH:MM:SS`).   |

## Return Value

A **string** formatted as `YYYYMMDD.HHMMSS`.

## Example

```vb
PRINT Date.TimeStamp.HR$(DATE$, TIME$)
' Example output: 20260201.074455
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
