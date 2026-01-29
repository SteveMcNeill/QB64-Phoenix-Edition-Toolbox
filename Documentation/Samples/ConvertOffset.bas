'Sample for Function ConvertOffset&& (value AS _OFFSET)
'created 10;14/2023 by Steve!(tm)
'Only one paramter for this function, and that requires the offset that we want to convert to an INTEGER64 value.
'Note:  On 32-bit OSes, an _OFFSET is only 4 bytes in size and can be stored safely in a LONG variable.
'       Since INTEGER64 variable types can hold the same values as LONG variables (and more to boot), I've set the function to
'       always just return an INTEGER64 back to us.
'       If you're on a 32-bit OS, feel free to use a LONG variable to catch and store the return value, if you want.
'       Just be aware that if you're on a 64-bit OS, that LONG will overflow and won't hold the true value of your _OFFSET.
'       Be alert and aware of this difference.


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As _Integer64 MyInt
Dim As _Offset MyOffset
Screen _NewImage(640, 480, 32)
$Color:32

MyOffset = 123456
MyInt = ConvertOffset(MyOffset)

Print "MyOffset ="; MyOffset
Print "MyInt    = "; MyInt



'$INCLUDE:'..\Library Files\Toolbox.BM'

