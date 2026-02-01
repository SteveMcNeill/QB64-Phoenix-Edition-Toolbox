'Sample for making Rounded Rectangles and Filled Rounded REctangles and working with them in QB64PE.
'Created on 10/17/2023 by Steve(tm)!
'This sample contains both of the related style subs:
'Sub RoundRect (x As Long, y As Long, x1 As Long, y1 As Long, r As Long, c As _Unsigned Long)
'Sub RoundRectFill (x As Long, y As Long, x1 As Long, y1 As Long, r As Long, c As _Unsigned Long)

'Both of these have the *EXACT* same parameters, so their behavior is basically going to be exactly the same.
'x/y -- This is a graphic coordinate which translates into the upper left corner of our rectangle..
'x1/y1 -- This is a graphic coordinate which translates into the lower right corner of our rectangle.
'r -- This is the radius of the circle which we use to form the rounded edges of that rectangle.
'c -- This is the color of our rectangle.  (And also the filled color if RoundRectFill is used over RoundRect.)

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(1024, 720, 32)
$Color:32

RoundRect 100, 130, 300, 180, 5, Red
RoundRectFill 200, 200, 400, 250, 10, Blue
RoundRect 300, 300, 500, 350, 15, Gold
RoundRectFill 400, 400, 600, 450, 25, Silver
RoundRectFill 500, 500, 700, 550, 35, Violet
RoundRect 600, 600, 800, 650, 45, Green

Print "Notice how each of the rectangles has more curve to the edges as we go along?"
Print "That's the R value for the radius of the circle which we use to draw those rounded edges."
Print "If you also notice, eventually, the last 3 all appear to have the *exact* same amount of rounding."
Print "This isn't an optical illusion -- it's TRUE!"
Print "Even though we specified their radius as being 25, 35, and even 45 pixels, our whole box is only a max of 50 pixels tall."
Print "How the heck would we round 45 pixels off the top, and 45 pixels off the bottom, when we only have 50 pixels total height??"
Print "Simple answer?  We *CAN'T*..  The most we can round our edges is going to be limited by the size of the rectangle we're working with."


'$INCLUDE:'..\Library Files\Toolbox.BM'

