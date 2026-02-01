'Sample for quickly and easily scrolling the screen up or down in QB64PE.
'Created on 10/17/2023 by Steve(tm)!
'This sample contains both of the related style subs:
'Sub ScrollUp (ImageHandle As Long)
'Sub ScrollDown (ImageHandle As Long)

'In both these commands, ImageHandle is the handle to the screen that we want to scroll the contents of.
'Use 0 if you just want to scroll the visible display.

'Note that these only scroll the screen; they don't preserve any information which might be lost when the screen is scrolled
'so that it can be scrolled in the opposite direction and restored later.

'General use for these type routines would be when one is writing their own print-style commands, such as for use with a subroutine
'which offers wordwrapping and which might need to scroll the screen up at the bottom of the page.

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(1024, 720, 32)
$Color:32

'First, let's just put a whole bunch of stuff on the screen
For i = 1 To 45
    Locate i, 1
    Print "This is a line of stuff.  This line is line #"; i; ".  It's just stuff; nothing important!";
Next
Sleep 'A pause so we can see a whole page of stuff.
'and when the user presses some key to take us out of the sleep
For i = 1 To 3
    ScrollUp 0 'scroll the screen up three lines, one at a time
    _Delay 1 'with a 1 second delay
Next
For i = 1 To 3
    ScrollDown 0 'and since we scrolled up three lines, let's showcase scrolling back down three lines as well, one at a time.
    _Delay 1 'with a nice 1 second pause between them
Next
'And that's all it is to it!  Works in all screen modes and all size screens.


'$INCLUDE:'..\Library Files\Toolbox.BM'

