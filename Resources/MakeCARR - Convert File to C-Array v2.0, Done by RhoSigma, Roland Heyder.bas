'+---------------+---------------------------------------------------+
'| ###### ###### |     .--. .         .-.                            |
'| ##  ## ##   # |     |   )|        (   ) o                         |
'| ##  ##  ##    |     |--' |--. .-.  `-.  .  .-...--.--. .-.        |
'| ######   ##   |     |  \ |  |(   )(   ) | (   ||  |  |(   )       |
'| ##      ##    |     '   `'  `-`-'  `-'-' `-`-`|'  '  `-`-'`-      |
'| ##     ##   # |                            ._.'                   |
'| ##     ###### |  Sources & Documents placed in the Public Domain. |
'+---------------+---------------------------------------------------+
'|                                                                   |
'| === MakeCARR.bas ===                                              |
'|                                                                   |
'| == Create a C/C++ array out of the given file, so you can embed   |
'| == it into your program and read it or write it back when needed. |
'|                                                                   |
'| == Two files are created, the .h file, which contains the array(s)|
'| == and some functions, and a respective .bm file which needs to   |
'| == be $INCLUDEd with your program and does provide the FUNCTIONs  |
'| == to read the array(s) into a string or write them back into any |
'| == file. All used functions are standard library calls, no API    |
'| == calls are involved, so the read and writeback should work on   |
'| == all QB64 supported platforms.                                  |
'|                                                                   |
'| == Make sure to adjust the path for the .h file for your personal |
'| == needs in the created .bm files (DECLARE LIBRARY), if required. |
'| == You may specify default paths right below this header.         |
'|                                                                   |
'| == This program needs the 'lzwpacker.bm' file available from the  |
'| == Libraries Collection here:                                     |
'| ==      http://qb64phoenix.com/forum/forumdisplay.php?fid=23      |
'| == as it will try to pack the given file to keep the array(s) as  |
'| == small as possible. If compression is successful, then your     |
'| == program also must $INCLUDE 'lzwpacker.bm' to be able to unpack |
'| == the file data again for write back. MakeCARR.bas is printing   |
'| == a reminder message in such a case.                             |
'|                                                                   |
'+-------------------------------------------------------------------+
'| Done by RhoSigma, R.Heyder, provided AS IS, use at your own risk. |
'| Find me in the QB64 Forum or mail to support@rhosigma-cw.net for  |
'| any questions or suggestions. Thanx for your interest in my work. |
'+-------------------------------------------------------------------+

_Title "MakeCARR - Convert File to C-Array v2.0, Done by RhoSigma, Roland Heyder"

'--- if you wish, set any default paths, end with a backslash ---
srcPath$ = "" 'source path
tarPath$ = "" 'target path
'-----
If srcPath$ <> "" Then
    Color 15: Print "Default source path: ": Color 7: Print srcPath$: Print
End If
If tarPath$ <> "" Then
    Color 15: Print "Default target path: ": Color 7: Print tarPath$: Print
End If

'--- collect inputs (relative paths allowed, based on default paths) ---
source:
'Line Input "Source Filename: "; src$ 'any file you want to put into a C/C++ array
src$ = _OpenFileDialog$("Source File", _CWD$, "*.*", "Any File", 0)
If src$ = "" GoTo source
target:
Line Input "Target Basename: "; tar$ 'write stuff into this file(s) (.h/.bm is added)
If tar$ = "" GoTo target
'-----
On Error GoTo abort
Open "I", #1, srcPath$ + src$: Close #1 'file exist check
Open "O", #2, tarPath$ + tar$ + ".bm": Close #2 'path exist check
On Error GoTo 0

'--- separate source filename part ---
For po% = Len(src$) To 1 Step -1
    If Mid$(src$, po%, 1) = "\" Or Mid$(src$, po%, 1) = "/" Then
        srcName$ = Mid$(src$, po% + 1)
        Exit For
    ElseIf po% = 1 Then
        srcName$ = src$
    End If
Next po%
'--- separate target filename part ---
For po% = Len(tar$) To 1 Step -1
    If Mid$(tar$, po%, 1) = "\" Or Mid$(tar$, po%, 1) = "/" Then
        tarName$ = Mid$(tar$, po% + 1)
        Exit For
    ElseIf po% = 1 Then
        tarName$ = tar$
    End If
Next po%
Mid$(tarName$, 1, 1) = UCase$(Mid$(tarName$, 1, 1)) 'capitalize 1st letter

'---------------------------------------------------------------------
' Depending on the source file's size, one or more array(s) are
' created. This is because some C/C++ compilers seem to have problems
' with arrays with more than 65535 elements. This does not affect the
' write back, as the write function will take this behavior into account.
'---------------------------------------------------------------------

'--- init ---
Open "B", #1, srcPath$ + src$
filedata$ = Space$(LOF(1))
Get #1, , filedata$
Close #1
rawdata$ = _Deflate$(filedata$)
If rawdata$ <> "" Then
    Open "O", #1, tarPath$ + tar$ + ".lzw"
    Close #1
    Open "B", #1, tarPath$ + tar$ + ".lzw"
    Put #1, , rawdata$
    Close #1
    packed% = -1
    Open "B", #1, tarPath$ + tar$ + ".lzw"
Else
    packed% = 0
    Open "B", #1, srcPath$ + src$
End If
fl& = LOF(1)
cntL& = Int(fl& / 32)
cntV& = Int(cntL& / 8180)
cntB& = (fl& - (cntL& * 32))

'--- .h include file ---
Open "O", #2, tarPath$ + tar$ + ".h"
Print #2, "// ============================================================"
Print #2, "// === This file was created with MakeCARR.bas by RhoSigma, ==="
Print #2, "// === use it in conjunction with its respective .bm file.  ==="
Print #2, "// ============================================================"
Print #2, ""
Print #2, "// --- Array(s) representing the contents of file "; srcName$
Print #2, "// ---------------------------------------------------------------------"
'--- read LONGs ---
tmpI$ = Space$(32)
For vc& = 0 To cntV&
    If vc& = cntV& Then numL& = (cntL& Mod 8180): Else numL& = 8180
    Print #2, "static const uint32_t "; tarName$; "L"; LTrim$(Str$(vc&)); "[] = {"
    Print #2, "    "; LTrim$(Str$(numL& * 8)); ","
    For z& = 1 To numL&
        Get #1, , tmpI$: offI% = 1
        tmpO$ = "    " + String$(88, ","): offO% = 5
        Do
            tmpL& = CVL(Mid$(tmpI$, offI%, 4)): offI% = offI% + 4
            Mid$(tmpO$, offO%, 10) = "0x" + Right$("00000000" + Hex$(tmpL&), 8)
            offO% = offO% + 11
        Loop Until offO% > 92
        If z& < numL& Then Print #2, tmpO$: Else Print #2, Left$(tmpO$, 91)
    Next z&
    Print #2, "};"
    Print #2, ""
Next vc&
'--- read remaining BYTEs ---
If cntB& > 0 Then
    Print #2, "static const uint8_t "; tarName$; "B[] = {"
    Print #2, "    "; LTrim$(Str$(cntB&)); ","
    Print #2, "    ";
    For x% = 1 To cntB&
        Get #1, , tmpB%%
        Print #2, "0x" + Right$("00" + Hex$(tmpB%%), 2);
        If x% <> 16 Then
            If x% <> cntB& Then Print #2, ",";
        Else
            If x% <> cntB& Then
                Print #2, ","
                Print #2, "    ";
            End If
        End If
    Next x%
    Print #2, ""
    Print #2, "};"
    Print #2, ""
End If
'--- some functions ---
Print #2, "// --- Function to copy the array(s) into the provided string buffer."
Print #2, "// --- Buffer size is not checked, as MakeCARR makes sure it's sufficient."
Print #2, "// ---------------------------------------------------------------------"
Print #2, "void Read"; tarName$; "Data(char *Buffer)"
Print #2, "{"
For vc& = 0 To cntV&
    Print #2, "    memcpy(Buffer, &"; tarName$; "L"; LTrim$(Str$(vc&)); "[1], "; tarName$; "L"; LTrim$(Str$(vc&)); "[0] << 2);"
    If vc& < cntV& Or cntB& > 0 Then
        Print #2, "    Buffer += ("; tarName$; "L"; LTrim$(Str$(vc&)); "[0] << 2);"
        Print #2, ""
    End If
Next vc&
If cntB& > 0 Then
    Print #2, "    memcpy(Buffer, &"; tarName$; "B[1], "; tarName$; "B[0]);"
End If
Print #2, "}"
Print #2, ""
Print #2, "// --- Saved full qualified output path and filename, so we've no troubles"
Print #2, "// --- when cleaning up, even if the current working folder was changed"
Print #2, "// --- during program runtime."
Print #2, "// ---------------------------------------------------------------------"
Print #2, "char "; tarName$; "Name[8192]; // it's a safe size for any current OS"
Print #2, ""
Print #2, "// --- Cleanup function to delete the written file, called by the atexit()"
Print #2, "// --- handler at program termination time, if requested by user."
Print #2, "// ---------------------------------------------------------------------"
Print #2, "void Kill"; tarName$; "Data(void)"
Print #2, "{"
Print #2, "    remove("; tarName$; "Name);"
Print #2, "}"
Print #2, ""
Print #2, "// --- Function to write the array(s) back into a file, will return the"
Print #2, "// --- full qualified output path and filename on success, otherwise an"
Print #2, "// --- empty string is returned (access/write errors, file truncated)."
Print #2, "// ---------------------------------------------------------------------"
Print #2, "const char *Write"; tarName$; "Data(const char *FileName, int16_t AutoClean)"
Print #2, "{"
Print #2, "    FILE   *han = NULL; // file handle"
Print #2, "    int32_t num = NULL; // written elements"
Print #2, ""
Print #2, "    #ifdef QB64_WINDOWS"
Print #2, "    if (!_fullpath("; tarName$; "Name, FileName, 8192)) return "; Chr$(34); Chr$(34); ";"
Print #2, "    #else"
Print #2, "    if (!realpath(FileName, "; tarName$; "Name)) return "; Chr$(34); Chr$(34); ";"
Print #2, "    #endif"
Print #2, ""
Print #2, "    if (!(han = fopen("; tarName$; "Name, "; Chr$(34); "wb"; Chr$(34); "))) return "; Chr$(34); Chr$(34); ";"
Print #2, "    if (AutoClean) atexit(Kill"; tarName$; "Data);"
Print #2, ""
For vc& = 0 To cntV&
    Print #2, "    num = fwrite(&"; tarName$; "L"; LTrim$(Str$(vc&)); "[1], 4, "; tarName$; "L"; LTrim$(Str$(vc&)); "[0], han);"
    Print #2, "    if (num != "; tarName$; "L"; LTrim$(Str$(vc&)); "[0]) {fclose(han); return "; Chr$(34); Chr$(34); ";}"
    Print #2, ""
Next vc&
If cntB& > 0 Then
    Print #2, "    num = fwrite(&"; tarName$; "B[1], 1, "; tarName$; "B[0], han);"
    Print #2, "    if (num != "; tarName$; "B[0]) {fclose(han); return "; Chr$(34); Chr$(34); ";}"
    Print #2, ""
End If
Print #2, "    fclose(han);"
Print #2, "    return "; tarName$; "Name;"
Print #2, "}"
Print #2, ""
'--- ending ---
Close #2
Close #1

'--- .bm include file ---
Open "O", #2, tarPath$ + tar$ + ".bm"
Print #2, "'============================================================"
Print #2, "'=== This file was created with MakeCARR.bas by RhoSigma, ==="
Print #2, "'=== you must $INCLUDE this at the end of your program.   ==="
If packed% Then
    Print #2, "'=== ---------------------------------------------------- ==="
    Print #2, "'=== If your program is NOT a GuiTools based application, ==="
    Print #2, "'=== then it must also $INCLUDE: 'lzwpacker.bm' available ==="
    Print #2, "'=== from the Libraries Collection here:                  ==="
    Print #2, "'=== http://qb64phoenix.com/forum/forumdisplay.php?fid=23 ==="
End If
Print #2, "'============================================================"
Print #2, ""
Print #2, "'-----------------"
Print #2, "'--- Important ---"
Print #2, "'-----------------"
Print #2, "' If you need to move around this .bm file and its respective .h file"
Print #2, "' to fit in your project, then make sure the path in the DECLARE LIBRARY"
Print #2, "' statement below does match the actual .h file location. It's best to"
Print #2, "' specify a relative path assuming your QB64 installation folder as root."
Print #2, "'---------------------------------------------------------------------"
Print #2, ""
Print #2, "'--- declare C/C++ functions ---"
Print #2, "DECLARE LIBRARY "; Chr$(34); tarPath$; tar$; Chr$(34); " 'Do not add .h here !!"
Print #2, "    SUB Read"; tarName$; "Data (StrBuf$)"
Print #2, "    FUNCTION Write"; tarName$; "Data$ (FileName$, BYVAL AutoClean%)"
Print #2, "END DECLARE"
Print #2, ""
'--- read function ---
Print #2, "'"; String$(Len(tarName$) + 18, "-")
Print #2, "'--- Read"; tarName$; "Array$ ---"
Print #2, "'"; String$(Len(tarName$) + 18, "-")
Print #2, "' This function will read the array(s) you've created with MakeCARR.bas"
Print #2, "' into a string, no data will be written to disk. If you rather wanna"
Print #2, "' rebuild the original file on disk, then use the write function below."
Print #2, "'"
Print #2, "' You may directly pass the returned string to _SNDOPEN, _LOADIMAGE or"
Print #2, "' _LOADFONT when using the memory load capabilities of these commands."
Print #2, "'----------"
Print #2, "' SYNTAX:"
Print #2, "'   arrData$ = Read"; tarName$; "Array$"
Print #2, "'----------"
Print #2, "' RESULT:"
Print #2, "'   --- arrData$ ---"
Print #2, "'    The data of the embedded file. This is in fact the same as if you"
Print #2, "'    had opend the file and read its entire content into a single string."
Print #2, "'---------------------------------------------------------------------"
Print #2, "FUNCTION Read"; tarName$; "Array$"
Print #2, "'--- option _explicit requirements ---"
Print #2, "DIM temp$"
Print #2, "'--- get array & set result ---"
Print #2, "temp$ = SPACE$("; LTrim$(Str$(fl&)); ") 'Do not change this number !!"
Print #2, "Read"; tarName$; "Data temp$"
If Not packed% Then
    Print #2, "Read"; tarName$; "Array$ = temp$"
Else
    Print #2, "Read"; tarName$; "Array$ = _Inflate$(temp$)"
End If
Print #2, "END FUNCTION"
Print #2, ""
'--- writeback function ---
Print #2, "'"; String$(Len(tarName$) + 19, "-")
Print #2, "'--- Write"; tarName$; "Array$ ---"
Print #2, "'"; String$(Len(tarName$) + 19, "-")
Print #2, "' This function will write the array(s) you've created with MakeCARR.bas"
Print #2, "' back to disk and so it rebuilds the original file."
Print #2, "'"
Print #2, "' After the writeback call, only use the returned realFile$ to access the"
Print #2, "' written file. It's the full qualified absolute path and filename, which"
Print #2, "' is made by expanding your maybe given relative path and an maybe altered"
Print #2, "' filename (number added) in order to avoid the overwriting of an already"
Print #2, "' existing file with the same name in the given location. By this means"
Print #2, "' you'll always have safe access to the file, no matter how your current"
Print #2, "' working folder changes during runtime."
Print #2, "'"
Print #2, "' If you wish, the written file can automatically be deleted for you when"
Print #2, "' your program will end, so you don't need to do the cleanup yourself."
Print #2, "'----------"
Print #2, "' SYNTAX:"
Print #2, "'   realFile$ = Write"; tarName$; "Array$ (wantFile$, autoDel%)"
Print #2, "'----------"
Print #2, "' INPUTS:"
Print #2, "'   --- wantFile$ ---"
Print #2, "'    The filename you would like to write the array(s) to, can contain"
Print #2, "'    a full or relative path."
Print #2, "'   --- autoDel% ---"
Print #2, "'    Shows whether you want the auto cleanup (see description above) at"
Print #2, "'    the program end or not (-1 = delete file, 0 = don't delete file)."
Print #2, "'----------"
Print #2, "' RESULT:"
Print #2, "'   --- realFile$ ---"
Print #2, "'    - On success this is the full qualified path and filename finally"
Print #2, "'      used after all applied checks, use only this returned filename"
Print #2, "'      to access the written file."
Print #2, "'    - On failure (write/access) this will be an empty string, so you"
Print #2, "'      should check for this before trying to access/open the file."
Print #2, "'---------------------------------------------------------------------"
Print #2, "FUNCTION Write"; tarName$; "Array$ (file$, clean%)"
Print #2, "'--- option _explicit requirements ---"
Print #2, "DIM po%, body$, ext$, num%";
If packed% Then Print #2, ", real$, ff%, rawdata$, filedata$": Else Print #2, ""
Print #2, "'--- separate filename body & extension ---"
Print #2, "FOR po% = LEN(file$) TO 1 STEP -1"
Print #2, "    IF MID$(file$, po%, 1) = "; Chr$(34); "."; Chr$(34); " THEN"
Print #2, "        body$ = LEFT$(file$, po% - 1)"
Print #2, "        ext$ = MID$(file$, po%)"
Print #2, "        EXIT FOR"
Print #2, "    ELSEIF MID$(file$, po%, 1) = "; Chr$(34); "\"; Chr$(34); " OR MID$(file$, po%, 1) = "; Chr$(34); "/"; Chr$(34); " OR po% = 1 THEN"
Print #2, "        body$ = file$"
Print #2, "        ext$ = "; Chr$(34); Chr$(34)
Print #2, "        EXIT FOR"
Print #2, "    END IF"
Print #2, "NEXT po%"
Print #2, "'--- avoid overwriting of existing files ---"
Print #2, "num% = 1"
Print #2, "WHILE _FILEEXISTS(file$)"
Print #2, "    file$ = body$ + "; Chr$(34); "("; Chr$(34); " + LTRIM$(STR$(num%)) + "; Chr$(34); ")"; Chr$(34); " + ext$"
Print #2, "    num% = num% + 1"
Print #2, "WEND"
Print #2, "'--- write array & set result ---"
If Not packed% Then
    Print #2, "Write"; tarName$; "Array$ = Write"; tarName$; "Data$(file$ + CHR$(0), clean%)"
Else
    Print #2, "real$ = Write"; tarName$; "Data$(file$ + CHR$(0), clean%)"
    Print #2, "IF real$ <> "; Chr$(34); Chr$(34); " THEN"
    Print #2, "    ff% = FREEFILE"
    Print #2, "    OPEN real$ FOR BINARY AS ff%"
    Print #2, "    rawdata$ = SPACE$(LOF(ff%))"
    Print #2, "    GET #ff%, , rawdata$"
    Print #2, "    filedata$ = _Inflate$(rawdata$)"
    Print #2, "    PUT #ff%, 1, filedata$"
    Print #2, "    CLOSE ff%"
    Print #2, "END IF"
    Print #2, "Write"; tarName$; "Array$ = real$"
End If
Print #2, "END FUNCTION"
Print #2, ""
'--- ending ---
Close #2

'--- finish message ---
Color 10: Print: Print "file successfully processed..."
Color 9: Print: Print "You must $INCLUDE the created file (target name + .bm extension) at"
Print "the end of your program. Look into that file to learn about the"
Print "available options to read or write back the embedded data."
If packed% Then
    Color 12: Print: Print "Your program must also $INCLUDE 'lzwpacker.bm' available from"
    Print "the Libraries Collection here:"
    Print "     http://qb64phoenix.com/forum/forumdisplay.php?fid=23"
    Print "to be able to read or write back the just processed file."
    Kill tarPath$ + tar$ + ".lzw"
End If
done:
Color 7
End
'--- error handler ---
abort:
Color 12: Print: Print "something is wrong with path/file access, check your inputs and try again..."
Resume done

'--- Function to define/return the program's version string.
'-----
Function VersionMakeCARR$
    VersionMakeCARR$ = Mid$("$VER: MakeCARR 2.0 (26-Oct-2023) by RhoSigma :END$", 7, 38)
End Function

