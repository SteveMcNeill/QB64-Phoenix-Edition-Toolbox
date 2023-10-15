'Sample for Function ExtendedTimer##
'created 10/15/2023 by Steve!(tm)
'There's no parameters for this function.
'Using it is as simple as just calling currentTime = ExtendedTimer

$LET INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

DIM AS _FLOAT ExtendedTime, Time
SCREEN _NEWIMAGE(640, 480, 32)
$COLOR:32

_DELAY .2
_KEYCLEAR
DO
    CLS , 0
    Time = TIMER
    ExtendedTime = ExtendedTimer
    PRINT USING "System Time         :############.###"; Time
    PRINT USING "Extended System Time:############.###"; ExtendedTime
    PRINT
    PRINT "Notice how the last digits are the same?"
    PRINT "Also notice how ExtendedTime contains a bunch more digits?"
    PRINT
    PRINT "That's because ExtendedTimer also tracks the DATE, which prevents errors from"
    PRINT "occuring with a timer after the midnight rollback to 0.000"
    _LIMIT 60
    _DISPLAY
LOOP UNTIL _KEYHIT
SYSTEM

'$INCLUDE:'..\Library Files\Toolbox.BM'

