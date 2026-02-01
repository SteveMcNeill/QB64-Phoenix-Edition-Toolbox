'Sample for Function TitleBarHeight&
'created 10/17/2023 by Steve!(tm)
'No paramets for this simple function.  Just call it, get its result.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long TitleHeight

Screen _NewImage(640, 480, 32)
$Color:32

TitleHeight = TitleBarHeight
Print "The size of the Title Bar on this program window is"; TitleHeight; "pixels thick."


'$INCLUDE:'..\Library Files\Toolbox.BM'

