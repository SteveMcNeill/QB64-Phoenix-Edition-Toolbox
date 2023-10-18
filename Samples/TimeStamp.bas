'Sample for Function TimeStamp## (d$, t##) 'date and timer
'created 10/17/2023 by Steve!(tm)
'Based on Unix Epoch time, which starts at year 1970.
'Pass this simple function a valid date and a timer value, and have it return a Unix-style timestamp.

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(640, 480, 32)
$Color:32

Print TimeStamp(Date$, Timer)
_Delay 5
Print TimeStamp(Date$, Timer) 'Notice how this generates an unique time stamp based on whatever date and timer value we set it.

'To get a specific timestamp for one day in particular, you need to convert the Time$ to a suitable Timer value, like so:

tempDate$ = "01-17-2000"
tempTime$ = "12:27:36" 'this is in 24-hour time.  If AM or PM is needed, remember to adjust for that!
hours = Val(Left$(tempTime$, 2))
minutes = Val(Mid$(tempTime$, 4, 2))
seconds = Val(Right$(tempTime$, 2))

tempTimer = hours * 60 * 60 'hours * 60 minutes * 60 seconds
tempTimer = tempTimer + minutes * 60 'minutes * 60 seconds
tempTimer = tempTimer + seconds
tempTimer = tempTimer + milliseconds '(if your Time$ has any of them)

Print "The proper TimeStamp for "; tempDate$; " at "; tempTime$; " is: "; TimeStamp(tempDate$, tempTimer)

'Note that the reason we don't have a TimeToTimer routine is just due to the number of different ways we can format our time string.
'Is it 24 hour time?  12 hour with AM/PM?  Does it include Daylight Savings Time?  Milliseconds?
'With so many formats available for time, it's left up to the user (at this time) to convert from their chosen format to a proper Timer value
'for use with this function.  :)


'$INCLUDE:'..\Library Files\Toolbox.BM'

