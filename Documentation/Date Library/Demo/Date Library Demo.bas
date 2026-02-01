Option _Explicit
Dim start As _Float
'$Include:'..\..\..\Date Library.QLB'

Print Date.Day("12/24/1997", "MM/DD/YYYY"), 'Gives the day from a formatted string
Print Date.Day("24/12/1997", "DD/MM/YYYY"), 'all these should print 24 across the top of the screen as the day is the 24th
Print Date.Day("97/12/24", "YY/MM/DD") 'no matter what the position is in the string
Print Date.Month("12/24/1997", "MM/DD/YYYY"), 'Gives the month from a formatted string
Print Date.Month("24/12/1997", "DD/MM/YYYY"), 'same as above, we have three 12s printed next
Print Date.Month("97/12/24", "YY/MM/DD")
Print Date.Year("12/24/1997", "MM/DD/YYYY"), 'Gives the year from a formatted string
Print Date.Year("24/12/1997", "DD/MM/YYYY"), 'and here we have 1997, 1997, 97
Print Date.Year("97/12/24", "YY/MM/DD")
Print
Print
Print "01/01/2025 was a "; Date.WeekDay.Name("01/01/2025", "MM/DD/YYYY") 'This gives us the weekday number (01 to 07 for Sunday to Saturday)
Print "Today is a "; Date.WeekDay.Name(Date$, "MM/DD/YYYY") 'This gives us the name of the weekday
Print
Print
Print Date.ToString(12, 25, 2025, "YYYY/MM/DD") 'command to format MM/DD/YYYY values into the format you like
Print Date.ToUniDate(Date$, "WWW MMM DDD, YYYY") 'unidate is much more powerful and can do fancier formatting
Print Date.ToUniDate(Date$, "www, MMM dd, YYYY") 'but requires a standard date format to work with.
'so you may want to use Date.ToString to format your date to QB64 standard "MM/DD/YYYY" then ToUniDate it
'for fancy formatting

start = ExtendedTimer 'A timer which doesn't reset at midnight
Do
    Locate 15, 1
    Print "The current timestamp is: "; Date.TimeStamp(Date$, Timer)
    Print "A human readable timestamp is: "; Date.TimeStamp.HR(Date$, Time$);
    Print "in YYYYMMDD.HHMMSS format."
    Print "(Year Month Day . Hour Minute Second)"
    Print
    Print Using "###.### seconds have passed since this loop started."; ExtendedTimer - start
    _Limit 60
Loop Until _KeyHit
System
