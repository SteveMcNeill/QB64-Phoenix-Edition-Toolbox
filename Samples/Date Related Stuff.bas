'Sample for Function BorderWidth
'created 10/16/2023 by Steve!(tm)
'Sample for multiple date related subs and functions, and working with them in QB64PE
'This sample contains all the related style functions:
'Function GetDay& (Day As String) 'use MM/DD/YYYY format
'Function GetMonth& (Day As String) 'use MM/DD/YYYY format
'Function GetYear& (Day As String) 'use MM/DD/YYYY format
'Function GetWeekDayName$ (Day$) 'use MM/DD/YYYY format
'Function GetWeekDay& (Day$) 'use MM/DD/YYYY format
'Function MakeDate$ (MM As _Unsigned Long, DD As _Unsigned Long, YYYY As _Unsigned Long)
'Function CheckDayFormat (Day As String) 'use MM/DD/YYYY format
'Function UniDate$ (format$, userdate$)

'As you can see, just about all of these are very simple functions where you pass the function a string,
'and then get a number relating to what you want back from it.

'The only Function here that I think might need extra demostrating is the UniDate$ which allows someone to
'format a standard date into whatever universal date which they desire.
'I'll do a separate demo for it independently called UniDate.bas, rather than cover it completely here with
'all these very simple funcitons.

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Print "Is the date in proper format?  The skies say "; CheckDayFormat(Date$)
Print "The Date = "; Date$
Print "Weekday  = "; GetWeekDayName(Date$); ", which is day number"; GetWeekDay(Date$); "of the week."
Print "Day      ="; GetDay(Date$)
Print "Month    ="; GetMonth(Date$)
Print "Year    ="; GetYear(Date$)
Print
Print "And to reverse the process we take those values and make them a date with :"; MakeDate(GetMonth(Date$), GetDay(Date$), GetYear(Date$))
Print
Print
Print
Print "And we can always fancify our date to universal formats: "
Print UniDate$("mm/dd/yyyy", Date$)
Print UniDate$("w, MM dd, YYYY", Date$)
Print UniDate$("W, MM DD, YYYY", Date$)
Print UniDate$("dd/mm/yyyy", Date$)
Print UniDate$("W, E D, YYYY", Date$)
Print UniDate$("mm-dd-yy", Date$)


'$INCLUDE:'..\Library Files\Toolbox.BM'

