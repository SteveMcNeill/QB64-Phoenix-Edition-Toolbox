'Sample for Function TextToImage& (text$, font&, fc&, bfc&, mode As _Byte)
'created 10;14/2023 by Steve!(tm)
'Five parameters for this function, as follows:
'Text$ -- the text that we want to convert into an image.
'font& -- the font handle that we want to use with this text that we're going to turn into an image.
'fc& -- Font Color.  The color of the text that we're printing and turning into an image.
'bfc& -- Background Font Color.  The color of the background under the text that we're turning into an image.
'mode -- Determines how we print our text, as indicated by the following settings:
'        Mode 1 is print forwards
'        Mode 2 is print backwards
'        Mode 3 is print upwards
'        Mode 4 is print downwards
'        Mode 0 got lost somewhere, but it's OK.  We check to see if our mode is < 1 or > 4 and compensate automatically via defaulting to 1.




$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long i, Hw(4), angle


Screen _NewImage(800, 700, 32)
_ScreenMove 250, 0
For i = 1 To 4
    Hw(i) = TextToImage("Hello World", 16, &HFFFFFF00, 0, i)
Next


Cls
Print "The first thing to showcase is just how simple it is to turn"
Print "text into an image with TextToImage."
Sleep
Print
Print "First, let's print it forwards:"
_PutImage (250, 48), Hw(1)
Sleep
Print
Print "Then, let's print it backwards:"
_PutImage (250, 80), Hw(2)
Sleep
Print
Print "Then, let's print it upwards:"
_PutImage (270, 112), Hw(3)
Sleep
Locate 8, 40: Print "And let's finish with downwards:"
_PutImage (580, 112), Hw(4)
Sleep
Locate 20, 1
Print
Print
Print "TextToImage simply transforms text into an image for us, with a few built in options"
Print "to it for the direction we want we text to print."
Print "It's as simple as a call with:"
Print "    Handle = TextToImage(text$, fonthandle, fontcolor, backgroundcolor, mode"
Print
Print "        text$ is the string which we want to print.  (In this case 'Hello World'"
Print "        fonthandle is the handle of the font which we _LOADFONT for use."
Print "            (In this case, I choose the default _FONT 16.)"
Print "        fontcolor is the color which we want our text in.  (Here, it's YELLOW.)"
Print "        backgroundcolor is the background which we want for the text time.  (Clear this time.)"
Print "        mode is how we decide to print forwards, backwards, up to down, or down to up."
Print
Print "Once we have an image handle, we can use that image just the same as we can with any other."
Print "For those who don't need to do anything more than display the text as an image,"
Print "feel free to use it as I have in the first part of this program with _PUTIMAGE."

'$INCLUDE:'..\Library Files\Toolbox.BM'

