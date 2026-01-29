'Sample for two subs:

'SUB Disk.File.List (SearchDirectory AS STRING, Extention AS STRING)
'created 04/21/2025 by Steve!(tm)
'Two simple parameters for this function.
'    The first is the directory we want to get the files from.  (Defaults to _CWD$ if left blank.)
'    The second is for the file extension which we want to get,  (Defaults to "*" if left blank.)

'SUB Disk.Dir.List (SearchDirectory AS STRING, SearchFor AS STRING)
'created 04/21/2025 by Steve!(tm)
'Two simple parameters for this function.
'    The first is the directory we want to get the sub directory list from.  (Defaults to _CWD$ if left blank.)
'    The second is for the directory search extension which we want to get,  (Defaults to "*" if left blank.)

'Note that a search for "*" is a search for all of the files or directories, respectively.

$Let INCLUDE_ALL = TRUE
'$Include:'..\Library Files\Toolbox.BI'

Dim As Long i

Disk.File.List _CWD$, ""
For i = 1 To UBound(FileList)
    Print FileList(i)
Next

Sleep
Cls

Disk.Dir.List _CWD$, ""
For i = 1 To UBound(DirList)
    Print DirList(i)
Next

Sleep
System

'$Include:'..\Library Files\Toolbox.BM'
