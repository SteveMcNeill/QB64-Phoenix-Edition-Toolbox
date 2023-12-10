'Sample for Function Ansi_To_Utf8$ (text$) and Function Unicode_To_UTF8$ (unicode&)
'created 12/10/2023 by Steve!(tm)

'Function Ansi_To_Utf8$ (text$) -- this function takes a standard ANSI/ASCII encoded string and converts it
'   to Utf8 format.
'   Usuage is as simple as utf8$ = Ansi_To_Utf8$(text$)

'Function Function Unicode_To_UTF8$ (unicode&) -- this function converts on single unicode value into a properly
'   formatted Utf8 character.
'   Usuage is as simple as utf8$ = Unicode_To_UTF8$(unicode_value&)

'A few things to note here:
'1) The first function works as a shortcut to convert whole strings from standard QB64 text to UTF8 formatted text.
'2) The second function expects an unicode VALUE to be passed to it, and not a string.
'       Be certain to convert your string to a proper unicode value, before making use of UniCode_To_UTF8$
'3) QB64PE's built in _MapUnicode function can convert characters from ASCII to unicode for you.
'       (Note that it's this single character by character conversion that _MapUnicode does, that had me
'       set up UniCode_To_Utf8$ to work the same way.
'       Creating your own Unicode_String_to_UTF8$ shouldn't be hard, just by making use of the tools available
'       here, if that's what someone really needs to do.)



$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

_ControlChr Off
Dim As Long l, u
Dim As String a, b

a = Chr$(1) 'a starting character of any value from 0 to 255, as represented in our ASCII chart
l = Asc(a) 'This is the ASCII value of that character
u = _MapUnicode(l) 'This is the UniCode value of that character
b = Unicode_To_UTF8$(u) 'This converts that UniDode value into an UTF8 string character

Print "String:"; a, b
Print "Value:"; l, u
b = "" 'reset b to nothing

b = Ansi_To_Utf8$(a)
Print
Print "Alterative way to get our string: "; b



'$INCLUDE:'..\Library Files\Toolbox.BM'

