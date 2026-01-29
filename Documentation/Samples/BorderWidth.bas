'Sample for Function BorderWidth
'created 10/14/2023 by Steve!(tm)
'No paramets for this simple function.  Just call it, get its result.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long BorderSize

Screen _NewImage(640, 480, 32)
$Color:32

BorderSize = BorderWidth
Print "The size of the borders on the window currently holding this text is"; BorderSize; "pixels thick."


'$INCLUDE:'..\Library Files\Toolbox.BM'

