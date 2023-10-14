$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Dim As Long i

GetFileList _CWD$
For i = 1 To UBound(FileList)
    Print FileList(i);
    If _FileExists(FileList(i)) Then
        Print "(File)"
    ElseIf _DirExists(FileList(i)) Then
        Print "(Dir)"
    Else
        Print "(Unidentified)"
    End If
Next


'$INCLUDE:'..\Library Files\Toolbox.BM'
