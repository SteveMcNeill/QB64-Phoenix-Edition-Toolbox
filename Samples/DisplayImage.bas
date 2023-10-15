'Sample for DisplayImage (Image AS LONG, x AS INTEGER, y AS INTEGER, xscale AS SINGLE, yscale AS SINGLE, angle AS SINGLE, mode AS _BYTE)
'created 10/15/2023 by Steve!(tm)
'Parameters for this function, as follows:
'Image is the image handle which we use to reference our image.
'x,y is the X/Y coordinates where we want the image to be at on the screen.
'angle is the angle which we wish to rotate the image.
'mode determines HOW we place the image at point X,Y.
'Mode 0 we center the image at point X,Y
'Mode 1 we place the Top Left corner of oour image at point X,Y
'Mode 2 is Bottom Left
'Mode 3 is Top Right
'Mode 4 is Bottom Right



$LET INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

DIM AS LONG MyImage, angle


SCREEN _NEWIMAGE(1024, 720, 32)
_SCREENMOVE _MIDDLE


MyImage = _LOADIMAGE("Sample Resources\phoenix.jpg", 32)

CLS , 0
PRINT "First, let's just pop that icon on the screen at it's normal scale and angle, with a simple _PUTIMAGE:"
_PUTIMAGE (0, 100), MyImage
SLEEP 'Take a pause between each step so when compiled the user can see each change in action.
PRINT "And then let's use DisplayImage Instead!"
DisplayImage MyImage, 300, 30, 1, 1, 0, 1
SLEEP
CLS , 0
PRINT "Display your image at a scale!"
SLEEP
PRINT
PRINT "Twice as wide! ";
DisplayImage MyImage, 0, 60, 2, 1, 0, 1
SLEEP
PRINT "Twice as tall! "
DisplayImage MyImage, 600, 60, 1, 2, 0, 1
SLEEP
PRINT
PRINT "At an angle!"
DisplayImage MyImage, 280, 330, 1, 1, -45, 1
SLEEP
_DELAY .2
_KEYCLEAR
DO
    CLS , 0
    PRINT "Make it rotate!"

    LINE (355, 155)-STEP(100, 100), &HFF000000, BF
    DisplayImage MyImage, 400, 200, 1, 1, angle, 0

    angle = (angle + 2) MOD 360
    _LIMIT 60
    _DISPLAY
LOOP UNTIL _KEYHIT
_AUTODISPLAY
SLEEP
CLS , 0
PRINT "You can basically use DisplayImage just as you'd normally use RotoZoom, EXCEPT..."
SLEEP
PRINT "You can choose which CORNER of the image you want to display at your coordinates."
PRINT
LINE (350, 350)-STEP(100, 100), -1, B
CIRCLE (400, 400), 10, -1
SLEEP
PRINT "Top Left corner! ";
DisplayImage MyImage, 400, 400, 1, 1, 0, 1
SLEEP
PRINT "Bottom Left corner! ";
DisplayImage MyImage, 400, 400, 1, 1, 0, 2
SLEEP
PRINT "Top Right corner! ";
DisplayImage MyImage, 400, 400, 1, 1, 0, 3
SLEEP
PRINT "Bottom Right corner! "
DisplayImage MyImage, 400, 400, 1, 1, 0, 4
SLEEP
PRINT "Or Centered! "
DisplayImage MyImage, 400, 400, 1, 1, 0, 0
CIRCLE (400, 400), 10, -1


'$INCLUDE:'..\Library Files\Toolbox.BM'

