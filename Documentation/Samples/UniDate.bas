'Sample for Function UniDate$
'created 10/16/2023 by Steve!(tm)

'Function UniDate$ (format$, userdate$)
'some basic documentation for formatting:
'dates sent via userdate$ should be in the standardized QB64 DATE$ format -- MM/DD/YYYY
'To customize your return date format, use the following syntax
'w = short weekday names.  (Mon, Tue, Wed, Thu, Fri, Sat, Sun)
'W = long weekday names.  (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
'E = Extended month names.  (January, February, March....)
'M = long month names.  (Jan, Feb, Mar...)
'm = short month names.  (01, 02, 03...)
'D = long day names.  (01st, 02nd, 03rd...)
'd = short day names.  (01, 02, 03...)
'Y or y (case insensitive) = year.  Number of Yy present determines the number of digits we return.
'       YY = 2-digit year
'       YYYY = 4 digit year
'       Y with any additional number of y's = 4 digit year by default, so a typo of YYYYY is the same as YYYY.
'Any other character is simply considered part of the desired output and faithfully carried over into the proper spot.
'      For example, "mm/dd/yyyy" gives us "02/10/2023" for Feb 10th, 2023.
'      Second example, "dd.mm.yyyy" gives us "10.02.2023" for the same date.
'      Third example, "dd EE YYYY" gives us "02 February 2023" for that same date.
'Note:  Extra digits of most of these codes are simply ignored for error proofing purposes, with only the initial code being accepted.
'      For example "mM YYYY" is actually processed as a simple "m YYYY".  The process won't mix short, long, or extended results.
'      Also for example, "m YY" is the *exact* same as "mm YY".
'      Feel free to use extra digits as you desire to help you keep track of positional spacing in your format string.
'      Even though "M D, yyyy" may process the same as "MMM DDDD, YYYY", the second may work better for you if you're trying to track
'             position of formatted objects.  (The output would be "Feb 10th, 2023", and those extra characters help hold that
'             positioning for us easily.)

'And, I think that's it.  Enjoy, guys!
'
$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Print "Converting Date$ over to some universally acceptable formats:"
Print UniDate$("mm/dd/yyyy", Date$)
Print UniDate$("w, MM dd, YYYY", Date$)
Print UniDate$("W, MM DD, YYYY", Date$)
Print UniDate$("dd/mm/yyyy", Date$)
Print UniDate$("W, E D, YYYY", Date$)
Print UniDate$("mm-dd-yy", Date$)


'$INCLUDE:'..\Library Files\Toolbox.BM'

