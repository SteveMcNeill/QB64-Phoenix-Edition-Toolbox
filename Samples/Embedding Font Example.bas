$Let INCLUDE_ALL = TRUE
$Let EMBED_COURIER_NEW = TRUE
$Let EMBED_CONSOLA = TRUE
$Let EMBED_DEJA_VU_SANS_MONO = TRUE
$Let EMBED_JULIA_MONO = TRUE
$Let EMBED_SOURCE_CODE_PRO = TRUE
$Let EMBED_LUCON = TRUE
$Let EMBED_UNIFONT = TRUE

'Note that we ALSO have to specify which fonts we want to embed in our program,
'as we do above with the EMBED_COURIER_NEW = TRUE statement.
'This is because fonts can become quite large in size, and no single program
'needs to become bloated by several hundred MB as it attempts to embed fonts in itself
'that it doesn't even make use of!


'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(1280, 720, 32)

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


f = ReturnFont("Julia Mono", 20, "Black")
_Font f: _PrintString (0, _FontHeight * 12), "Hello World - Julia Mono Black"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Black Italic")
_Font f: _PrintString (0, _FontHeight * 13), "Hello World - Julia Mono Black Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Bold")
_Font f: _PrintString (0, _FontHeight * 14), "Hello World - Julia Mono Bold"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Bold Italic")
_Font f: _PrintString (0, _FontHeight * 15), "Hello World - Julia Mono Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Extra Bold")
_Font f: _PrintString (0, _FontHeight * 16), "Hello World - Julia Mono Extra Bold"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Extra Bold Italic")
_Font f: _PrintString (0, _FontHeight * 17), "Hello World - Julia Mono Extra Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Semi Bold")
_Font f: _PrintString (0, _FontHeight * 18), "Hello World - Julia Mono Semi Bold"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Semi Bold Italic")
_Font f: _PrintString (0, _FontHeight * 19), "Hello World - Julia Mono Semi Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Light")
_Font f: _PrintString (0, _FontHeight * 20), "Hello World - Julia Mono Light"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Light Italic")
_Font f: _PrintString (0, _FontHeight * 21), "Hello World - Julia Mono Light Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Medium")
_Font f: _PrintString (0, _FontHeight * 22), "Hello World - Julia Mono Medium"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Medium Italic")
_Font f: _PrintString (0, _FontHeight * 23), "Hello World - Julia Mono Medium Italic"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "")
_Font f: _PrintString (0, _FontHeight * 24), "Hello World - Julia Mono Regular"
_Font 16: _FreeFont f

f = ReturnFont("Julia Mono", 20, "Italic")
_Font f: _PrintString (0, _FontHeight * 25), "Hello World - Julia Mono Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Medium")
_Font f: _PrintString (600, 0), "Hello World - Source Code Pro Medium"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Medium Italic")
_Font f: _PrintString (600, _FontHeight * 1), "Hello World - Source Code Pro Medium Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "")
_Font f: _PrintString (600, _FontHeight * 2), "Hello World - Source Code Pro Regular"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Italic")
_Font f: _PrintString (600, _FontHeight * 3), "Hello World - Source Code Pro Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Black")
_Font f: _PrintString (600, _FontHeight * 4), "Hello World - Source Code Pro Black"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Black Italic")
_Font f: _PrintString (600, _FontHeight * 5), "Hello World - Source Code Pro Black Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Bold")
_Font f: _PrintString (600, _FontHeight * 6), "Hello World - Source Code Pro Bold"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Bold Italic")
_Font f: _PrintString (600, _FontHeight * 7), "Hello World - Source Code Pro Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Extra Bold")
_Font f: _PrintString (600, _FontHeight * 8), "Hello World - Source Code Pro Extra Bold"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Extra Bold Italic")
_Font f: _PrintString (600, _FontHeight * 9), "Hello World - Source Code Pro Extra Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Semi Bold")
_Font f: _PrintString (600, _FontHeight * 10), "Hello World - Source Code Pro Semi Bold"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Semi Bold Italic")
_Font f: _PrintString (600, _FontHeight * 11), "Hello World - Source Code Pro Semi Bold Italic"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Light")
_Font f: _PrintString (600, _FontHeight * 12), "Hello World - Source Code Pro Light"
_Font 16: _FreeFont f

f = ReturnFont("Source Code Pro", 20, "Light Italic")
_Font f: _PrintString (600, _FontHeight * 13), "Hello World - Source Code Pro Light Italic"
_Font 16: _FreeFont f

f = ReturnFont("Lucon", 20, "")
_Font f: _PrintString (600, _FontHeight * 15), "Hello World - Lucon"
_Font 16: _FreeFont f

f = ReturnFont("UniFont", 20, "")
_Font f: _PrintString (600, _FontHeight * 17), "Hello World - UniFont"
_Font 16: _FreeFont f


'$INCLUDE:'..\Library Files\Toolbox.BM'
