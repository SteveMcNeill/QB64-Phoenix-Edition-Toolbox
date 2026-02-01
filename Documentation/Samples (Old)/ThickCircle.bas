'Sample for Sub ThickCircle (x As Single, y As Single, radius As Single, thickness As Single, colour As _Unsigned Long)
'created 10/17/2023 by Steve!(tm)
'Several paramaters for this routine, but they're all very simple to understand and work with.
'x, y -- graphic coordinates which pinpoint the center of our circle.
'radius -- the size of the radius of our circle.
'thickness -- the size of the thickness of the ring which we have around our circle, in pixels.
'colour -- the color of the circle



$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long BorderSize

Screen _NewImage(640, 480, 32)
$Color:32

ThickCircle 100, 100, 50, 5, Red '5 thickness circle
ThickCircle 100, 300, 50, 10, Pink '10 thickness circle
ThickCircle 300, 100, 75, 15, Green '75 radius, 15 thickness.
ThickCircle 350, 300, 100, 20, Gold '100 radius, 20 thickness.


'$INCLUDE:'..\Library Files\Toolbox.BM'

