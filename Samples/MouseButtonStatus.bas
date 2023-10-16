'Sample for Function MouseButtonStatus% (takeMouseInput As Long)
'created 10/14/2023 by Steve!(tm)
'Only one parameters for this function -- takeMouseInput.
'When takeMouseInput is TRUE (any non-zero value), the Function MouseButtonStatus takes comple control of mouse handling for us.
'This eliminates the need for a WHILE _MOUSEINPUT: WEND loop inside our main program loop.
'It also gives us access to extended information such as the mouse scroll wheel being activated.
'Without setting takeMouseInput to a TRUE value, mouse scroll events will have to be handled manually and will not be detected via this function.

'Return values from this function are all BINARY bit attributes, and their returns are as follows:
'1 -- left down
'2 -- right down
'4 -- middle down
'8 -- left clicked
'16 -- right clicked
'32 -- middle clicked
'64 -- left held
'128 -- right held
'256 -- middle held
'512 -- scroll down
'1024 -- scroll up

'Additional information is also shared back to the end user via the following:
'DIM SHARED AS LONG Mouse_StartX, Mouse_StartY, Mouse_EndX, Mouse_EndY
'These shared variables can be used in conjecture of a HOLD event to tell us where the mouse began being held at,
'and where the hold event ended at.

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(800, 600, 32)
_ScreenMove _Middle

Do
    Cls
    held$ = ""
    result = MouseButtonStatus(1) 'let the function takecomplete  control of the mouse handling
    left = left - (result And 8) \ 8
    right = right - (result And 16) \ 16
    middle = middle - (result And 32) \ 32
    If result And 64 Then held$ = "Left held"
    If result And 128 Then held$ = "Right held"
    If result And 256 Then held$ = "Middle held"
    If result And 512 Then scroll = scroll + 1
    If result And 1024 Then scroll = scroll - 1

    Print "MouseX: "; _MouseX
    Print "MouseY: "; _MouseY
    Print "Left down     : "; result And 1
    Print "Right down     : "; result And 2
    Print "Middle down     : "; result And 4
    Print "Left pressed  : "; left
    Print "Right pressed : "; right
    Print "Middle pressed: "; middle
    Print "Mouse Wheel Scrolled: "; scroll
    Print
    Print "Last held event started at X/Y :"; Mouse_StartX, Mouse_StartY
    Print "Last held event ended at X/Y   :"; Mouse_EndX, Mouse_EndY
    Print held$
    _Limit 60
    _Display
Loop Until _KeyHit


'$INCLUDE:'..\Library Files\Toolbox.BM'

