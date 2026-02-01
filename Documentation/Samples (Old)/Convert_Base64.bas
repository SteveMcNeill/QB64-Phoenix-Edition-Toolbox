'Sample for Function To64$ (original$) and Function From64$ (base64$)
'created 12/10/2023 by Steve!(tm)

'A simple set of functions which can encode and decode text both to and from base64.
'These really shouldn't need to much explaination.
'Usage is as simple as illustrated below:

'Note that -- if possible -- I'd suggest combining these with _Endlate and _Deflate to compress the data before
'   encoding it.  There's less bits in base-64 (6-bits vs 8, which is a normal ASCII character), so the length of
'   the data/return string is going to increase by about 25%.
'   Compressing the data before converting it can help offset that size increase, which is always a nice thing
'   when dealing with memory usage and disk storage space.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

_ControlChr Off
Dim As String original, base64, base256

original = "Hello World."
base64 = To64$(original)
base256 = From64$(base64)

Print "Original: "; original
Print "Base 64 : "; base64
Print "Base 256: "; base256

'$INCLUDE:'..\Library Files\Toolbox.BM'

