_Title "Steve's Color Match Tool"
Screen _NewImage(800, 800, 32)
Randomize Timer

Open "Color Name Large List.txt" For Binary As #1
Do Until EOF(1)
    Line Input #1, junk$ 'just to count lines
    total = total + 1
Loop

Close: Open "Color Name Large List.txt" For Input As #1

Dim Names(total) As String, Kolors(total) As _Unsigned Long
Dim test As _Unsigned Long

For i = 1 To total
    Input #1, Names(i), r, g, b, a
    Kolors(i) = _RGBA32(r, g, b, a)
Next

Print "Matching against "; total; "colors in list."
For i = 1 To 10
    test = _RGB32(Rnd * 256, Rnd * 256, Rnd * 256)
    closest = ClosestColorIndex(test, Kolors())
    Print Names(closest); " is the closest match", "("; _Red32(test); ","; _Green32(test); ","; _Blue32(test); ")", "("; _Red32(Kolors(closest)); ","; _Green32(Kolors(closest)); ","; _Blue32(Kolors(closest)); ")"
    Line (100, 150 + 50 * i)-Step(100, 50), test, BF
    Line (220, 150 + 50 * i)-Step(100, 50), Kolors(closest), BF
Next

Function ClosestColorIndex& (targetColor As _Unsigned Long, Pal() As _Unsigned Long)
    Dim As Long tr, tg, tb, colors, bestdist
    Dim As Long bestIndex, dr, dg, db, i, dist
    Dim As _Unsigned Long c

    tr = _Red32(targetColor): tg = _Green32(targetColor): tb = _Blue32(targetColor):
    colors = UBound(Pal): bestdist = _LONG_MAX

    $Checking:Off
    While i < colors
        c = Pal(i)
        dr = tr - _Red32(c)
        dg = tg - _Green32(c)
        db = tb - _Blue32(c)
        dist = dr * dr + dg * dg + db * db
        If dist < bestdist Then
            If dist = 0 Then ClosestColorIndex = i: Exit Function
            bestdist = dist: bestIndex = i
        End If
        i = i + 1
    Wend
    $Checking:On
    ClosestColorIndex = bestIndex
End Function

