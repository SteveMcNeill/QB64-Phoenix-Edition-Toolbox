$Let INCLUDE_ALL = TRUE
$Let EMBED_COURIER_NEW = TRUE
$Let EMBED_CONSOLA = TRUE
$Let EMBED_DEJA_VU_SANS_MONO = TRUE
$Let EMBED_SOURCE_CODE_PRO = TRUE

'Note that we ALSO have to specify which fonts we want to embed in our program,
'as we do above with the EMBED_COURIER_NEW = TRUE statement.
'This is because fonts can become quite large in size, and no single program
'needs to become bloated by several hundred MB as it attempts to embed fonts in itself
'that it doesn't even make use of!


'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(800, 600, 32)

f = ReturnFont("Courier New", 20, "") '             A simple little _LOADFONT replacement
_Font f: _PrintString (0, 0), "Hello World - Courier New" '       except here, we specify the font's name (not FILE NAME)
_Font 16: _FreeFont f

f = ReturnFont("Courier New", 20, "Bold") '         and we can set the style which we want for the font.
_Font f: _PrintString (0, _FontHeight), "Hello World - Courier New Bold"
_Font 16: _FreeFont f

f = ReturnFont("Courier New", 20, "Italic")
_Font f: _PrintString (0, _FontHeight * 2), "Hello World - Courier New Italic"
_Font 16: _FreeFont f

f = ReturnFont("Courier New", 20, "Bold,Italic")
_Font f: _PrintString (0, _FontHeight * 3), "Hello World - Courier New Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Consola", 20, "")
_Font f: _PrintString (0, _FontHeight * 5), "Hello World - Consola"
_Font 16: _FreeFont f

f = ReturnFont("Consola", 20, "Bold")
_Font f: _PrintString (0, _FontHeight * 6), "Hello World - Consola Bold"
_Font 16: _FreeFont f

f = ReturnFont("Consola", 20, "Italic")
_Font f: _PrintString (0, _FontHeight * 7), "Hello World - Consola Italic"
_Font 16: _FreeFont f

f = ReturnFont("Consola", 20, "Bold,Italic")
_Font f: _PrintString (0, _FontHeight * 8), "Hello World - Consola Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Deja Vu Sans Mono", 20, "")
_Font f: _PrintString (0, _FontHeight * 10), "Hello World - Deja Vu Sans Mono"
_Font 16: _FreeFont f


f = ReturnFont("Source Code Pro", 20, "Medium")
_Font f: _PrintString (0, _FontHeight * 12), "Hello World - Source Code Pro Medium"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Medium Italic")
_Font f: _PrintString (0, _FontHeight * 13), "Hello World - Source Code Pro Medium Italic"
_Font 16: _FreeFont f


'$INCLUDE:'..\Library Files\Toolbox.BM'
