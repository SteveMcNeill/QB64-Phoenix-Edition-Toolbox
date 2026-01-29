Option _Explicit
Randomize Timer
_Define A-Z As _FLOAT  'default _float type for all variables, unless explicitly defined otherwise.
'                       This is a simple text-based game.  Floats are easy and speed isn't an issue of FPS. So KISS.
Screen _NewImage(1080, 720, 32)
$Resize:On
$Color:32
Color White, 0 '        default text is white on clear background

Dim Shared As Long Mouse_StartX, Mouse_StartY, Mouse_EndX, Mouse_EndY
Dim temp '              always need a temp trash variable

$If WIN Then
    Const Slash = "\", DotSlash = ".\"
    Type SpeechType
        As Integer Speaker, Speed, Volume
        As String File
    End Type
    Dim Shared SpeechVar As SpeechType
    Speech.Init
    Speech.Speaker "Female"
    Speech.Speed 1
    Declare Dynamic Library "user32"
        Function DPI& Alias SetProcessDpiAwarenessContext (ByVal dpiContext As _Offset)
    End Declare
    Const UNAWARE = -1, AWARE = -2, PER_MONITOR_AWARE = -3
    Const PER_MONITOR_AWARE_V2 = -4, UNAWARE_GDISCALED = -5
    temp = DPI(AWARE)
$Else
    Const Slash = "/", DotSlash = ".\"
$End If

LoadFont 20
Home





Sub Home
    Static FirstEnter
    Dim As Long i, k, action, highlight, temp
    Dim As String * 20 options(3)
    Dim As String * 2 h(1)
    options(0) = "Die"
    options(1) = "Quit Game"
    options(2) = "Do nothing"
    options(3) = "Do more nothings!"


    Do
        CheckResize
        Cls , 0
        Color Gold, 0
        Wrap "Welcome adventurer.  You are now in Hearthstone."
        If FirstEnter = _FALSE Then
            Speech.Speak "You are now in Hearthstone."
            FirstEnter = _TRUE
        End If

        Wrap ""
        Color Ivory, 0
        Wrap "What service would you like to partake in town?"
        For i = LBound(options) To UBound(options)
            If i = action Then
                Color Black, White
                h(0) = "<<": h(1) = ">>" 'highlight for options
            Else
                Color White, 0
                h(0) = "  ": h(1) = "  " 'highlight for options
            End If
            Wrap h(1) + options(i) + h(0)
        Next


        k = _KeyHit

        If _KeyDown(100306) _OrElse _KeyDown(100305) Then 'CTRL + key events
            Select Case k
                Case 18432, 19712 'up or right key
                    LoadFont 2
                Case 19200, 20480 'down or left key
                    LoadFont -2
            End Select
        Else
            Select Case k
                Case 13, 32 'enter or space key to select
                    Select Case action
                        Case 0
                            Cls
                            Wrap "YOU DIED!"
                            _Display
                            Beep
                            Sleep
                            System
                        Case 1: System
                    End Select
                Case 18432, 19200: action = action - 1 'up or left key
                Case 20480, 19712: action = action + 1 'down or right key
            End Select
            If action < LBound(options) Then action = UBound(options)
            If action > UBound(options) Then action = LBound(options)
        End If
        _Limit 30
        _Display
    Loop
End Sub

Sub Wrap (text$)
    WordWrap text$, 0
End Sub

Sub CheckResize
    Dim temp, rsw, rsh, ww, wh
    If _Resize Then
        Do
            While _MouseInput: Wend 'wait for mouse to be released fully before processing resize event
        Loop While _MouseButton(1)
        rsw = _ResizeWidth: rsh = _ResizeHeight
        rsw = _Clamp(rsw, 640, _DesktopWidth)
        rsh = _Clamp(rsh, 480, _DesktopHeight)
        _Resize Off
        Screen _NewImage(rsw, rsh, 32)
        _Delay .2 'delay is necessary to give screen time to resize
        _Resize On
        temp = _Resize 'clear the flag so we don't enter some feedback loop
        LoadFont 0
    End If
End Sub

Sub LoadFont (change As Long)
    Static size As Long
    Dim As Long font
    size = size + change
    If size = 0 Then size = 24 'default size
    If size <= 10 Then size = 10 'minimal size
    If size > 64 Then size = 64 'maximum size
    _Font 16: If font <> 0 _AndAlso font <> 16 Then _FreeFont font
    font = _LoadFont(DotSlash + "SourceCodePro-Medium.ttf", size, "monospace")
    _Font font
End Sub

Sub WordWrap (text$, format As Long)
    Dim temp$, t$
    Dim As Long w, h, x, y, wMax, l, pw, cp, bp, a, length
    Select Case format
        Case 0, 8, 16, 32
        Case Else
            _MessageBox "Invalid Format", "Invalid format sent to WordWrap.", "error"
            Exit Sub
    End Select
    temp$ = text$
    w = _Width: h = _Height
    y = (CsrLin - 1)
    If _FontWidth Then 'monospace font
        x = (Pos(0) - 1) * _FontWidth
    Else 'variable width font
        x = Pos(0)
    End If
    wMax = w - x 'the most width that we have left on this line to print to
    Do
        l = Len(temp$)
        pw = _UPrintWidth(temp$, format)
        If pw < wMax Then 'if the printwidth is smaller than the available width on the line, print it
            _UPrintString (x, y * _UFontHeight), temp$, , format
            x = 0: y = y + 1
            Locate y + 1, 1
            Exit Do
        Else 'we determine how much we can print, and print what we can in the available space
            cp = 1: bp = 0
            t$ = ""
            Do
                a = Asc(temp$, cp)
                Select Case format
                    Case 0 'ASCII
                        length = 1
                    Case 8 'UTF-8
                        Select Case a
                            Case 0 To 127: length = 1
                            Case 128 To 191: length = 2
                            Case 192 To 223: length = 2
                            Case 224 To 239: length = 3
                            Case 240 To 248: length = 4
                            Case 252, 253: length = 5
                            Case Else: length = 1 'we should never see these. Use alt text here
                        End Select
                    Case 16 'UTF-16
                        length = 2 'not fully true, but we'll come back to this later
                    Case 32 'UTF-32
                        length = 4
                End Select
                t$ = t$ + Mid$(temp$, cp, length)
                If _UPrintWidth(t$, format) > wMax Then
                    t$ = Left$(temp$, bp) 'back up to the last breakpoint
                    temp$ = Mid$(temp$, bp + 1) 'remove what we print from the string
                    _UPrintString (x, y * _UFontHeight), t$, , format 'print what we remove
                    x = 0: y = y + 1 'update the print position
                    Locate y + 1, 1
                    Exit Do
                Else
                    Select Case a 'valid breakpoints
                        Case 10 'chr$(10) line ending
                        Case 32: bp = cp 'space
                        Case 46: bp = cp 'period .
                        Case 44: bp = cp 'comma ,
                        Case 45: bp = cp 'dash -
                        Case 33: bp = cp 'exclaimation point !
                        Case 63: bp = cp 'question mark ?
                        Case 59: bp = cp 'semi-colon ;
                    End Select
                    cp = cp + length
                End If
            Loop

        End If
    Loop
End Sub

Sub MemSort (m As _MEM)
    Dim i As _Unsigned Long
    Dim As Long DataType, i1, gap, swapped
    $If 64BIT Then
        Dim ES As _Integer64, EC As _Integer64
    $Else
        Dim ES As Long, EC As Long
    $End If

    If Not m.TYPE And 65536 Then Exit Sub 'We won't work without an array
    If m.TYPE And 1024 Then DataType = 10
    If m.TYPE And 1 Then DataType = DataType + 1
    If m.TYPE And 2 Then DataType = DataType + 2
    If m.TYPE And 4 Then If m.TYPE And 128 Then DataType = DataType + 4 Else DataType = 3
    If m.TYPE And 8 Then If m.TYPE And 128 Then DataType = DataType + 8 Else DataType = 5
    If m.TYPE And 32 Then DataType = 6
    If m.TYPE And 512 Then DataType = 7

    'Convert our offset data over to something we can work with
    Dim m1 As _MEM: m1 = _MemNew(Len(ES))
    _MemPut m1, m1.OFFSET, m.ELEMENTSIZE: _MemGet m1, m1.OFFSET, ES 'Element Size
    _MemPut m1, m1.OFFSET, m.SIZE: _MemGet m1, m1.OFFSET, EC 'Element Count will temporily hold the WHOLE array size
    _MemFree m1

    EC = EC / ES - 1 'Now we take the whole element size / the size of the elements and get our actual element count.  We subtract 1 so our arrays start at 0 and not 1.
    'And work with it!
    Dim o As _Offset, o1 As _Offset, counter As _Unsigned Long

    Select Case DataType
        Case 1 'BYTE
            Dim temp1(-128 To 127) As _Unsigned Long
            Dim t1 As _Byte
            i = 0
            Do
                _MemGet m, m.OFFSET + i, t1
                temp1(t1) = temp1(t1) + 1
                i = i + 1
            Loop Until i > EC
            i1 = -128
            Do
                Do Until temp1(i1) = 0
                    _MemPut m, m.OFFSET + counter, i1 As _Byte
                    counter = counter + 1
                    temp1(i1) = temp1(i1) - 1
                    If counter > EC Then Exit Sub
                Loop
                i1 = i1 + 1
            Loop Until i1 > 127
        Case 2: 'INTEGER
            Dim temp2(-32768 To 32767) As _Unsigned Long
            Dim t2 As Integer
            i = 0
            Do
                _MemGet m, m.OFFSET + i * 2, t2
                temp2(t2) = temp2(t2) + 1
                i = i + 1
            Loop Until i > EC
            i1 = -32768
            Do
                Do Until temp2(i1) = 0
                    _MemPut m, m.OFFSET + counter * 2, i1 As Integer
                    counter = counter + 1
                    temp2(i1) = temp2(i1) - 1
                    If counter > EC Then Exit Sub
                Loop
                i1 = i1 + 1
            Loop Until i1 > 32767
        Case 3 'SINGLE
            Dim T3a As Single, T3b As Single
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 4
                    o1 = m.OFFSET + (i + gap) * 4
                    If _MemGet(m, o, Single) > _MemGet(m, o1, Single) Then
                        _MemGet m, o1, T3a
                        _MemGet m, o, T3b
                        _MemPut m, o1, T3b
                        _MemPut m, o, T3a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 4 'LONG
            Dim T4a As Long, T4b As Long
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 4
                    o1 = m.OFFSET + (i + gap) * 4
                    If _MemGet(m, o, Long) > _MemGet(m, o1, Long) Then
                        _MemGet m, o1, T4a
                        _MemGet m, o, T4b
                        _MemPut m, o1, T4b
                        _MemPut m, o, T4a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 5 'DOUBLE
            Dim T5a As Double, T5b As Double
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 8
                    o1 = m.OFFSET + (i + gap) * 8
                    If _MemGet(m, o, Double) > _MemGet(m, o1, Double) Then
                        _MemGet m, o1, T5a
                        _MemGet m, o, T5b
                        _MemPut m, o1, T5b
                        _MemPut m, o, T5a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 6 ' _FLOAT
            Dim T6a As _Float, T6b As _Float
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 32
                    o1 = m.OFFSET + (i + gap) * 32
                    If _MemGet(m, o, _Float) > _MemGet(m, o1, _Float) Then
                        _MemGet m, o1, T6a
                        _MemGet m, o, T6b
                        _MemPut m, o1, T6b
                        _MemPut m, o, T6a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 7 'String
            Dim T7a As String, T7b As String, T7c As String
            T7a = Space$(ES): T7b = Space$(ES): T7c = Space$(ES)
            gap = EC
            Do
                gap = Int(gap / 1.247330950103979)
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * ES
                    o1 = m.OFFSET + (i + gap) * ES
                    _MemGet m, o, T7a
                    _MemGet m, o1, T7b
                    If T7a > T7b Then
                        T7c = T7b
                        _MemPut m, o1, T7a
                        _MemPut m, o, T7c
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 8 '_INTEGER64
            Dim T8a As _Integer64, T8b As _Integer64
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 8
                    o1 = m.OFFSET + (i + gap) * 8
                    If _MemGet(m, o, _Integer64) > _MemGet(m, o1, _Integer64) Then
                        _MemGet m, o1, T8a
                        _MemGet m, o, T8b
                        _MemPut m, o1, T8b
                        _MemPut m, o, T8a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 11: '_UNSIGNED _BYTE
            Dim temp11(0 To 255) As _Unsigned Long
            Dim t11 As _Unsigned _Byte
            i = 0
            Do
                _MemGet m, m.OFFSET + i, t11
                temp11(t11) = temp11(t11) + 1
                i = i + 1
            Loop Until i > EC
            i1 = 0
            Do
                Do Until temp11(i1) = 0
                    _MemPut m, m.OFFSET + counter, i1 As _Unsigned _Byte
                    counter = counter + 1
                    temp11(i1) = temp11(i1) - 1
                    If counter > EC Then Exit Sub
                Loop
                i1 = i1 + 1
            Loop Until i1 > 255
        Case 12 '_UNSIGNED INTEGER
            Dim temp12(0 To 65535) As _Unsigned Long
            Dim t12 As _Unsigned Integer
            i = 0
            Do
                _MemGet m, m.OFFSET + i * 2, t12
                temp12(t12) = temp12(t12) + 1
                i = i + 1
            Loop Until i > EC
            i1 = 0
            Do
                Do Until temp12(i1) = 0
                    _MemPut m, m.OFFSET + counter * 2, i1 As _Unsigned Integer
                    counter = counter + 1
                    temp12(i1) = temp12(i1) - 1
                    If counter > EC Then Exit Sub
                Loop
                i1 = i1 + 1
            Loop Until i1 > 65535
        Case 14 '_UNSIGNED LONG
            Dim T14a As _Unsigned Long, T14b As _Unsigned Long
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 4
                    o1 = m.OFFSET + (i + gap) * 4
                    If _MemGet(m, o, _Unsigned Long) > _MemGet(m, o1, _Unsigned Long) Then
                        _MemGet m, o1, T14a
                        _MemGet m, o, T14b
                        _MemPut m, o1, T14b
                        _MemPut m, o, T14a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
        Case 18: '_UNSIGNED _INTEGER64
            Dim T18a As _Unsigned _Integer64, T18b As _Unsigned _Integer64
            gap = EC
            Do
                gap = 10 * gap \ 13
                If gap < 1 Then gap = 1
                i = 0
                swapped = 0
                Do
                    o = m.OFFSET + i * 8
                    o1 = m.OFFSET + (i + gap) * 8
                    If _MemGet(m, o, _Unsigned _Integer64) > _MemGet(m, o1, _Unsigned _Integer64) Then
                        _MemGet m, o1, T18a
                        _MemGet m, o, T18b
                        _MemPut m, o1, T18b
                        _MemPut m, o, T18a
                        swapped = -1
                    End If
                    i = i + 1
                Loop Until i + gap > EC
            Loop Until gap = 1 And swapped = 0
    End Select
End Sub

Function MouseButtonStatus% (takeMouseInput As Long)
    '1 -- left down
    '2 -- right down
    '4 -- middle down
    '8 -- left clicked
    '16 -- right clicked
    '32 -- middle clicked
    '64 -- left held
    '128 -- right held
    '256 -- middle held
    '512 -- scroll down
    '1024 -- scroll up

    Static StartTimer As _Float
    Static ButtonDown As Integer
    Const ClickLimit## = 0.2 'Less than 1/4th of a second to down, up a key to count as a CLICK.
    '                          Down longer counts as a HOLD event.
    Dim As Long tempMBS, bd
    If takeMouseInput Then
        While _MouseInput 'Remark out this block, if mouse main input/clear is going to be handled manually in main program.
            Select Case Sgn(_MouseWheel)
                Case 1: tempMBS = tempMBS Or 512
                Case -1: tempMBS = tempMBS Or 1024
            End Select
        Wend
    End If

    If _MouseButton(1) Then tempMBS = tempMBS Or 1
    If _MouseButton(2) Then tempMBS = tempMBS Or 2
    If _MouseButton(3) Then tempMBS = tempMBS Or 4

    If StartTimer = 0 Then
        If _MouseButton(1) Then 'If a button is pressed, start the timer to see what it does (click or hold)
            ButtonDown = 1: StartTimer = Timer(0.01)
            Mouse_StartX = _MouseX: Mouse_StartY = _MouseY
        ElseIf _MouseButton(2) Then
            ButtonDown = 2: StartTimer = Timer(0.01)
            Mouse_StartX = _MouseX: Mouse_StartY = _MouseY
        ElseIf _MouseButton(3) Then
            ButtonDown = 3: StartTimer = Timer(0.01)
            Mouse_StartX = _MouseX: Mouse_StartY = _MouseY
        End If
    Else
        bd = ButtonDown Mod 3
        If bd = 0 Then bd = 3
        If Timer(0.01) - StartTimer <= ClickLimit Then 'Button was down, then up, within time limit.  It's a click
            If _MouseButton(bd) = 0 Then tempMBS = 4 * 2 ^ ButtonDown: ButtonDown = 0: StartTimer = 0
        Else
            If _MouseButton(bd) = 0 Then 'hold event has now ended
                tempMBS = 0: ButtonDown = 0: StartTimer = 0
                Mouse_EndX = _MouseX: Mouse_EndY = _MouseY
            Else 'We've now started the hold event
                tempMBS = tempMBS Or 32 * 2 ^ ButtonDown
            End If
        End If
    End If
    MouseButtonStatus = tempMBS
End Function

Sub Speech.Init
    SpeechVar.Speaker = 0
    SpeechVar.Speed = 0
    SpeechVar.Volume = 100
    SpeechVar.File = ""
    Speech.Speak " "
End Sub

Sub Speech.Speaker (who$)
    Select Case UCase$(who$)
        Case "DAVID", "MALE", "M": SpeechVar.Speaker = 0
        Case "ZIVA", "FEMALE", "F": SpeechVar.Speaker = 1
    End Select
End Sub

Sub Speech.Speed (Speed)
    If Speed < -10 Then Speed = -10
    If Speed > 10 Then Speed = 10
SpeechVar.Speed = Speed: End Sub
Sub Speech.Volume (Volume): SpeechVar.Volume = Volume: End Sub

Sub Speech.OutTo (where$)
    Select Case UCase$(where$)
        Case "CONSOLE", "CONS", "", "SPEAKER": SpeechVar.File$ = ""
        Case Else: SpeechVar.File$ = where$
    End Select
End Sub

Sub Speech.Speak (text$)
    'As this is a powershell only speech text to speech engine, this obviously won't talk
    'unless on a windows system
    $If WIN Then
        Dim As Long s
        If _FileExists("TempSpeech.WAV") Then Kill "TempSpeech.WAV"
        Speech.Process text$, SpeechVar.Speaker, SpeechVar.Speed, "TempSpeech.WAV", SpeechVar.Volume
        Do: _Delay .1: Loop Until _FileExists("TempSpeech.WAV")
        s = _SndOpen("TempSpeech.WAV")
        _SndPlay s
        Do
            _Delay .01
        Loop Until _SndPlaying(s) = 0
        _SndClose s
    $End If
End Sub

Sub Speak.ToWav (text$, file$)
    If UCase$(Right$(file$, 4)) = ".WAV" Then
        Speech.Process text$, SpeechVar.Speaker, SpeechVar.Speed, file$, SpeechVar.Volume
    End If
End Sub

Sub Speech.Process (text As String, Speaker As Integer, Speed, savefile$, volume)
    Dim As String message, file, remove
    Dim out$
    Dim As Long j, i
    message = text 'an in sub variable so we don't change the passed data
    If UCase$(Right$(savefile$, 4)) <> ".WAV" Then file$ = "" Else file$ = savefile$ 'again, don't change passed data
    'some symbols and such can't be used with Powershell like this, as they're command symbols
    'we need to strip them out of our text.  (Like apostrophes!)
    remove$ = "'" + Chr$(34) 'add to remove$ here, if more symbols need to be removed as future testing showcases problems
    For j = 1 To Len(remove$)
        Do
            i = InStr(message, Mid$(remove$, j, 1))
            If i Then message = Left$(message, i - 1) + Mid$(message, i + 1)
        Loop Until i = 0
    Next
    out$ = "Powershell -Command " + Chr$(34)
    out$ = out$ + "Add-Type -AssemblyName System.Speech; "
    out$ = out$ + "$Speech = New-Object System.Speech.Synthesis.SpeechSynthesizer; "
    If file$ <> "" Then out$ = out$ + "$Speech.SetOutputToWaveFile({" + Chr$(34) + file$ + Chr$(34) + "}); " 'The command to send the output to a file and not the speakers.
    If Speaker = 0 Then
        out$ = out$ + "$Speech.SelectVoice('Microsoft David Desktop'); "
    ElseIf Speaker = 1 Then
        out$ = out$ + "$Speech.SelectVoice('Microsoft Zira Desktop'); "
    End If
    If volume >= 0 _AndAlso volume <= 100 Then out$ = out$ + "$Speech.Volume =" + Str$(volume) + "; "
    If Speed Then out$ = out$ + "$Speech.Rate =" + Str$(Speed) + "; "
    out$ = out$ + "$Speech.Speak(' " + message + "');" + Chr$(34)
    Shell _Hide out$
End Sub

