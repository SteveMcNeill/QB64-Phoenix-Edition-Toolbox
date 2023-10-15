'Sample for making Ellipes and working with them in QB64PE
'This sample contains all the related style functions:
'SUB EllipseFill (CX AS INTEGER, CY AS INTEGER, Wide AS INTEGER, Tall AS INTEGER, C AS _UNSIGNED LONG)
'SUB EllipseTilt (CX, CY, Wide, Tall, ang, C AS _UNSIGNED LONG)
'SUB EllipseTiltFill (destHandle&, CX, CY, Wide, Tall, ang, C AS _UNSIGNED LONG)



$LET INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

SCREEN _NEWIMAGE(1024, 720, 32)
$COLOR:32

PRINT "A filled Ellipse at 100, 100, 10 pixels wide and 30 pixels tall, colored red:"
EllipseFill 100, 100, 10, 30, Red
LINE (100 - 10, 100 - 30)-(100 + 10, 100 + 30), White, B 'A white box around the ellipse to showcase that it's 10 pixels width FROM CENTER
'                                                         and 30 pixels tall FROM CENTER.
'                                                         It's not a TOTAL of 10 pixels wide and 30 pixels tall; it's 10 wide in each
'                                                         X direction and 30 tall in each Y direction.
SLEEP
PRINT "A tilted Ellipse at 200, 200, 10 pixels wide and 30 pixels tall, tilted 45 degrees, colored blue:"
EllipseTilt 200, 200, 10, 30, 45, Red
SLEEP
PRINT "A tilted Ellipse at 300, 300, 20 pixels wide and 50 pixels tall, tilted -45 degrees, colored and filled gold:"
EllipseTiltFill 0, 300, 300, 20, 50, -45, Gold 'Notice that this routine has a destination handle located at the front of it,
'                                               which is different from the other two, making it slightly more versitile.


'$INCLUDE:'..\Library Files\Toolbox.BM'

