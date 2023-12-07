$Let INCLUDE_ALL = TRUE
$Let EMBED_COURIER_NEW = TRUE

'Note that we ALSO have to specify which fonts we want to embed in our program,
'as we do above with the EMBED_COURIER_NEW = TRUE statement.
'This is because fonts can become quite large in size, and no single program
'needs to become bloated by several hundred MB as it attempts to embed fonts in itself
'that it doesn't even make use of!


'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(800, 600, 32)

f = ReturnFont("Courier New", 20, "") 'A simple little _LOADFONT replacement
_Font f '                              except here, we specify the font's name (not FILE NAME)
Print "Hello World"
Sleep

Cls
_Font 16: _FreeFont f
f = ReturnFont("Courier New", 20, "Bold") ' and we can set the style which we want for the font.
_Font f
Print "Hello World"
Sleep

Cls
_Font 16: _FreeFont f
f = ReturnFont("Courier New", 20, "Italic")
_Font f
Print "Hello World"
Sleep

Cls
_Font 16: _FreeFont f
f = ReturnFont("Courier New", 20, "Bold,Italic")
_Font f
Print "Hello World"
Sleep

'$INCLUDE:'..\Library Files\Toolbox.BM'
