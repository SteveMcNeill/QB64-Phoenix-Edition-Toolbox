'Sample for Sub TriangleFill (x1, y1, x2, y2, x3, y3, K As _Unsigned Long)
'created 10/16/2023 by Steve!(tm)
'Again, lots of parameters, but that's due to the nature of a triangle which has 3 points defining it.
'Three points for where the ends of the lines meet (x, y points from 1 to 3), and then the color which will fill inside that boundry (K).

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(800, 600, 32)
_ScreenMove _Middle
$Color:32
_PrintMode _KeepBackground

TriangleFill 100, 100, 450, 175, 300, 300, Red
_PrintString (100, 100), "(100,100)"
_PrintString (450, 175), "(450,175)"
_PrintString (300, 300), "(300,300)"

'$INCLUDE:'..\Library Files\Toolbox.BM'

