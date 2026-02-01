$Color:32
Screen _NewImage(800, 600, 32)
Color -1
Print "Some of the new drawing commands to showcase:"
Draw.Circle.Fill 100, 100, 50, Red 'draw a filled red circle
Draw.Circle.Thick 300, 100, 50, 5, Red 'draw a circle (ring) of 5 pixels in thickness
Draw.Ellipse.Fill 500, 100, 50, 100, Red
Draw.Ellipse.Tilt 700, 100, 50, 100, _Pi(.25), Red
Draw.Ellipse.Tilt.Fill 100, 300, 50, 100, _Pi(-.25), Red
Draw.Quad 250, 250, 330, 275, 275, 325, 200, 350, Red
Draw.Quad.Fill 450, 250, 530, 275, 575, 325, 400, 350, Red
Draw.Quad.Thick 650, 250, 730, 275, 775, 325, 600, 350, 5, Red
Draw.Triangle 100, 400, 150, 500, 50, 500, Red
Draw.Triangle.Fill 300, 400, 350, 500, 250, 500, Red
Draw.Triangle.Thick 500, 400, 550, 500, 450, 500, 5, Red
Draw.Line.Thick 600, 400, 700, 500, 5, Red
Sleep
image = Draw.Text.To.Image("Steve is Amazing!", 16, Yellow, Blue, 0)
_Delay .25
_KeyClear
d = 0.1: x = 1: y = 1
Do
    angle = (angle + 3) Mod 360
    x = x + d: y = y + d / 2
    If x > 5 _OrElse x < 0.5 Then d = -d
    Cls , 0
    Draw.Rect.Rounded 100, 100, 300, 300, 50, Blue
    Draw.Rect.Rounded.Fill 400, 100, 600, 200, 50, Blue
    Draw.Image image, 400, 300, x, y, angle, 0
    _Display
    _Limit 60
Loop Until _KeyHit
System

'$Include:'..\Draw Library.BM'
