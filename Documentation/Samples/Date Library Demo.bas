Option _Explicit
Print Date.Day("12/24/1997", "MM/DD/YYYY"), 'Gives the day from a formatted string
Print Date.Day("24/12/1997", "DD/MM/YYYY"),
Print Date.Day("97/12/24", "YY/MM/DD")
Print Date.Month("12/24/1997", "MM/DD/YYYY"), 'Gives the month from a formatted string
Print Date.Month("24/12/1997", "DD/MM/YYYY"),
Print Date.Month("97/12/24", "YY/MM/DD")
Print Date.Year("12/24/1997", "MM/DD/YYYY"), 'Gives the year from a formatted string
Print Date.Year("24/12/1997", "DD/MM/YYYY"),
Print Date.Year("97/12/24", "YY/MM/DD")
Print
Print
Print "01/01/2025 was a "; Date.WeekDay.Name("01/01/2025", "MM/DD/YYYY")
Print "Today is a "; Date.WeekDay.Name(Date$, "MM/DD/YYYY")
Print
Print
Print Date.ToString(12, 25, 2025, "YYYY/MM/DD") 'command to format MM/DD/YYYY values into the format you like
Print Date.ToUniDate(Date$, "WWW MMM DDD, YYYY") 'unidate is much more powerful and can do fancier formatting
Print Date.ToUniDate(Date$, "www, MMM dd, YYYY") 'but requires a standard date format to work with.
'so you may want to use Date.ToString to format your date to QB64 standard "MM/DD/YYYY" then ToUniDate it
'for fancy formatting

Do
    Locate 15, 1
    Print "The current timestamp is: "; Date.TimeStamp(Date$, Timer)
    Print "A human readable timestamp is: "; Date.TimeStamp.HR(Date$, Time$);
    Print "in YYYYMMDD.HHMMSS format."
    Print "(Year Month Day . Hour Minute Second)"
    _Limit 60
Loop Until _KeyHit
System

'$Include:'..\Date Library.BM'
