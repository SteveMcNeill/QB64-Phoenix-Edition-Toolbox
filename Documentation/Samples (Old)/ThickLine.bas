'Sample for Sub ThickLine (x1 As Single, y1 As Single, x2 as Single, y2 As Single, thickness As Long, colour As _Unsigned Long)
'created 01/02/2022 by Steve!(tm)
'Several paramaters for this routine, but they're all very simple to understand and work with.
'x1, y1 -- graphic coordinates which pinpoint the start of our line.
'x2, y2 -- graphic coordinates which pinpoint the end of our line.
'thickness -- the size of the thickness of the line, in pixels.
'colour -- the color of the line



$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(640, 480, 32)
$Color:32

ThickLine 100, 100, 200, 200, 5, Red '5 thickness line from 100,100 to 200,200
ThickLine 200, 200, 100, 300, 5, Blue '5 thickness line from 200,200 to 100,300
ThickLine 100, 300, 100, 100, 5, Gold '5 thickness line from 100,300 back to 100,100
'These should combine to make a crude |> style arrowhead on the screen in multi-colors.
'And that's all there really is to it!

'$INCLUDE:'..\Library Files\Toolbox.BM'

