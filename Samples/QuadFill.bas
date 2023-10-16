'Sample for Sub QuadFill (x1, y1, x2, y2, x3, y3, x4, y4, K As _Unsigned Long)
'created 10/16/2023 by Steve!(tm)
'Lots of parameters for this one!  Luckily, they're not that confusing once you realize what they represent.  (Phew!)
'Quadfill is a simple routine to fill in a quadrilateral on the screen.
'What's a quadrilateral?  It's any enclosed shape defined by four points.
'A square.  A rectangle.  A rhimbus.  A diamond.
'Draw a series of four continus lines that end up forming an enclosed surface, and you have a quadrilateral.
'With that in mind, what are all these dang parameters here for?

'Four points for where the ends of the lines meet (x, y points from 1 to 4), and then the color which will fill inside that boundry (K).

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(800, 600, 32)
_ScreenMove _Middle
$Color:32
_PrintMode _KeepBackground

QuadFill 100, 100, 450, 175, 300, 300, 150, 550, Red
_PrintString (100, 100), "(100,100)"
_PrintString (450, 175), "(450,175)"
_PrintString (300, 300), "(300,300)"
_PrintString (150, 550), "(150,550)"

'$INCLUDE:'..\Library Files\Toolbox.BM'

