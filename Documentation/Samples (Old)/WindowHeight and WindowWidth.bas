'Sample for Function WindowHeight and Function WindowWidth
'created 10/17/2023 by Steve!(tm)
'No paramets for this simple function.  Just call it, get its result.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long WH, H

Screen _NewImage(640, 480, 32)
$Color:32
$Resize:On


Do
    Cls , Red
    WH = WindowHeight
    WW = WindowWidth
    H = _Height
    W = _Width
    Print "Grab a corner of this window with your mouse and resize it,"
    Print "so you can see this demo in action!"
    Print
    Print "Window Height:"; WH 'notice how this gives you the height of your program window -- not the program screen itself
    Print "Window Width:"; WW 'notice how this gives you the width of your program window -- not the program screen itself
    Print "Height:"; H ' -- this is the height of the screen itself, not the program window
    Print "Width"; W ' -- and this is the width of the screen
    _Limit 30
    _Display
Loop Until _KeyHit



'$INCLUDE:'..\Library Files\Toolbox.BM'

