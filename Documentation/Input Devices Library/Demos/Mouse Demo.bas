'$Include:'../../../Input Devices.QLB'

_Title "MBS (Mouse Button Status) by Steve" ' 12-17-2020 // updated 4/23/2022 // Library Update 02-01-2026

Do
    Cls
    held$ = ""
    result = MBS(_TRUE)
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
    If MouseInApp Then Print "Mouse is in program area!" Else Print "The mouse has left the building!"
    _Limit 60
Loop
