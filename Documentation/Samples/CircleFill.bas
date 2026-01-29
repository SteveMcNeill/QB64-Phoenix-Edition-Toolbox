'Sample for SUB CircleFill (CX AS INTEGER, CY AS INTEGER, R AS INTEGER, C AS _UNSIGNED LONG)
'created 10/14/2023 by Steve!(tm)
'4 paramters for this routine which are very simple:
'CX -- Center X.  This is the center x position of our circle.
'CY -- Center Y.  This is the center y position of our circle.
'R -- Radius.  This is the radius of our circle.
'C -- Color.  This is the color that we want our circle to be drawn in.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(640, 480, 32)
$Color:32

'Draw a simple 50 pixel radius circle centered on 100, 100, in Red:
CircleFill 100, 100, 50, Red

'Draw a simple 75 pixel radius circle centered at 200,200, in Green
CircleFill 200, 200, 75, Green

'Draw a simple 25 radius circle centered at 300,300, in Gold
CircleFill 300, 300, 25, Gold

'That's all there is to it.  I don't think any extra examples would showcase anything that the preceeding three
'haven't already covered for us.  :P

'$INCLUDE:'..\Library Files\Toolbox.BM'
