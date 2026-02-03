'$Include:'..\..\Draw Library.QLB'
Screen _NewImage(1280, 720, 32)
_Title "Draw Library — Command Showcase"


'===========================================================
'  CIRCLES & ELLIPSES
'===========================================================

'-----------------------------
ShowTitle "Draw.Circle.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled circle using a fast scanline fill."
Draw.Circle.Fill 400, 300, 120, _RGB32(255, 140, 0)
Sleep

'-----------------------------
ShowTitle "Draw.Circle.Thick"
'-----------------------------
_PrintString (40, 100), "Draws a thick circular outline."
Draw.Circle.Thick 400, 300, 120, 20, _RGB32(0, 200, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Ellipse.Filled"
'-----------------------------
_PrintString (40, 100), "Draws a filled ellipse."
Draw.Ellipse.Fill 400, 300, 200, 100, _RGB32(0, 180, 120)
Sleep

'-----------------------------
ShowTitle "Draw.Arc.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled circular arc (pie slice)."
Draw.Circle.Arc.Fill 400, 300, 150, 0, 200, _RGB32(255, 80, 80)
Sleep

'-----------------------------
ShowTitle "Draw.Ring.Arc.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled circular ring arc."
Draw.Circle.Ring.Arc.Fill 400, 300, 60, 120, 45, 315, _RGB32(255, 255, 0)
Sleep

'-----------------------------
ShowTitle "Draw.Ellipse.Arc.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled elliptical arc."
Draw.Ellipse.Arc.Fill 400, 300, 200, 120, 0, 240, _RGB32(255, 0, 180)
Sleep

'-----------------------------
ShowTitle "Draw.Ellipse.Ring.Arc.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled elliptical ring arc."
Draw.Ellipse.Ring.Arc.Fill 400, 300, 60, 30, 120, 60, 45, 315, _RGB32(0, 255, 120)
Sleep

'-----------------------------
ShowTitle "Draw.Ellipse.Tilt"
'-----------------------------
_PrintString (40, 100), "Draws a rotated ellipse outline."
Draw.Ellipse.Tilt 400, 300, 200, 100, 0.7, _RGB32(255, 255, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Ellipse.Tilt.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled rotated ellipse."
Draw.Ellipse.Tilt.Fill 400, 300, 200, 100, 1.0, _RGB32(0, 180, 255)
Sleep


'===========================================================
'  LINES
'===========================================================

'-----------------------------
ShowTitle "Draw.Line.Angle"
'-----------------------------
_PrintString (40, 100), "Draws a line from a point at a given angle and length."
Draw.Line.Angle 400, 300, 0.7853981634, 200, _RGB32(255, 255, 0)
Sleep

'-----------------------------
ShowTitle "Draw.Line.Thick"
'-----------------------------
_PrintString (40, 100), "Draws a thick line using _MAPTRIANGLE."
Draw.Line.Thick 200, 200, 600, 500, 20, _RGB32(255, 0, 0)
Sleep


'===========================================================
'  TRIANGLES
'===========================================================

'-----------------------------
ShowTitle "Draw.Triangle"
'-----------------------------
_PrintString (40, 100), "Draws a triangle outline."
Draw.Triangle 300, 200, 600, 300, 200, 500, _RGB32(255, 255, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Triangle.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled triangle using _MAPTRIANGLE."
Draw.Triangle.Fill 300, 200, 600, 300, 200, 500, _RGB32(0, 200, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Triangle.Thick"
'-----------------------------
_PrintString (40, 100), "Draws a thick triangle outline."
Draw.Triangle.Thick 300, 200, 600, 300, 200, 500, 12, _RGB32(255, 0, 180)
Sleep


'===========================================================
'  QUADRILATERALS
'===========================================================

'-----------------------------
ShowTitle "Draw.Quad"
'-----------------------------
_PrintString (40, 100), "Draws a quadrilateral outline."
Draw.Quad 300, 200, 600, 220, 580, 500, 320, 480, _RGB32(255, 255, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Quad.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled quadrilateral."
Draw.Quad.Fill 300, 200, 600, 220, 580, 500, 320, 480, _RGB32(0, 255, 180)
Sleep

'-----------------------------
ShowTitle "Draw.Quad.Thick"
'-----------------------------
_PrintString (40, 100), "Draws a thick quadrilateral outline."
Draw.Quad.Thick 300, 200, 600, 220, 580, 500, 320, 480, 14, _RGB32(255, 0, 0)
Sleep


'===========================================================
'  ROUNDED RECTANGLES
'===========================================================

'-----------------------------
ShowTitle "Draw.Rect.Rounded"
'-----------------------------
_PrintString (40, 100), "Draws a rounded rectangle outline."
Draw.Rect.Rounded 300, 200, 700, 500, 40, _RGB32(255, 255, 255)
Sleep

'-----------------------------
ShowTitle "Draw.Rect.Rounded.Fill"
'-----------------------------
_PrintString (40, 100), "Draws a filled rounded rectangle."
Draw.Rect.Rounded.Fill 300, 200, 700, 500, 40, _RGB32(0, 150, 255)
Sleep


'===========================================================
'  IMAGES & TEXT
'===========================================================

'-----------------------------
ShowTitle "Draw.Text.To.Image&"
'-----------------------------
_PrintString (40, 100), "Creates an image from text."
txt& = Draw.Text.To.Image&("Hello World!", 0, _RGB32(255, 255, 255), _RGB32(0, 0, 0), 1)
Draw.Image txt&, 400, 300, 2, 2, 0, 0
Sleep

'-----------------------------
ShowTitle "Draw.Image"
'-----------------------------
_PrintString (40, 100), "Draws an image with rotation and scaling."
Draw.Image txt&, 400, 300, 2, 2, 45, 0
Sleep


'===========================================================
'  END OF DEMO
'===========================================================

ShowTitle "Demo Complete!"
_PrintString (40, 100), "Press any key to exit."
Sleep
System


'===========================================================
'  HELPER: Display a title for each demo section
'===========================================================
Sub ShowTitle (t$)
    Cls , _RGB32(20, 20, 20)
    Color _RGB32(255, 255, 255)
    _PrintString (40, 40), t$
End Sub

