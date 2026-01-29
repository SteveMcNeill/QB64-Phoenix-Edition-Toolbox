_Title "QB64 Phoenix Wiki to Markdown"

' ============================================================
' Main Program
' ============================================================
Dim rawWiki$, md$

Target$ = "AUTODISPLAY"

rawWiki$ = DownloadWikiPage$(Target$)
md$ = WikiToMarkdown$(rawWiki$)

Open Target$ + ".md" For Output As #1
Print #1, md$
Close #1

Print "Done:"; Target$ + ".md"
End


' ============================================================
' Download raw wiki markup via curl
' ============================================================
Function DownloadWikiPage$ (pageTitle$)
    Dim q As String
    q$ = Chr$(34)

    Dim cmd As String
    cmd$ = "curl -L -s " + q$ + "https://qb64phoenix.com/qb64wiki/index.php?title=" _
           + pageTitle$ + "&action=raw" + q$ + " -o " + q$ + "wiki_raw.txt" + q$

    Shell _Hide cmd$

    DownloadWikiPage$ = LoadFileUTF8$("wiki_raw.txt")
End Function


' ============================================================
' Load UTF-8 file ? STRING
' ============================================================
Function LoadFileUTF8$ (filename$)
    Dim raw As String
    Dim decoded As String
    Dim b As _Unsigned _Byte
    Dim i As Long, c As Long

    Open filename$ For Binary As #1
    raw = Space$(LOF(1))
    Get #1, , raw
    Close #1

    i = 1
    Do While i <= Len(raw)
        b = Asc(raw, i)

        If b < 128 Then
            decoded = decoded + Chr$(b)
            i = i + 1

        ElseIf (b And &HE0) = &HC0 Then
            c = ((b And &H1F) * 64) + (Asc(raw, i + 1) And &H3F)
            decoded = decoded + UTF8_To_ASCII$(c)
            i = i + 2

        ElseIf (b And &HF0) = &HE0 Then
            c = ((b And &HF) * 4096) + ((Asc(raw, i + 1) And &H3F) * 64) + (Asc(raw, i + 2) And &H3F)
            decoded = decoded + UTF8_To_ASCII$(c)
            i = i + 3

        Else
            i = i + 1
        End If
    Loop

    LoadFileUTF8$ = decoded
End Function


' ============================================================
' UTF-8 ? ASCII mapping
' ============================================================
Function UTF8_To_ASCII$ (codepoint As Long)
    Select Case codepoint
        Case 8216, 8217: UTF8_To_ASCII$ = "'" ' ‘ ’
        Case 8220, 8221: UTF8_To_ASCII$ = Chr$(34) ' “ ”
        Case 8211, 8212: UTF8_To_ASCII$ = "-" ' – —
        Case 8230: UTF8_To_ASCII$ = "..." ' …
        Case Is <= 255: UTF8_To_ASCII$ = Chr$(codepoint)
        Case Else: UTF8_To_ASCII$ = "?"
    End Select
End Function


' ============================================================
' Top-level wiki ? markdown
' ============================================================
Function WikiToMarkdown$ (src$)
    Dim lines As String
    Dim outLines As String
    Dim n As Long, i As Long

    ' Count lines
    n = 1
    For i = 1 To Len(src$)
        If Mid$(src$, i, 1) = Chr$(10) Then n = n + 1
    Next

    ReDim lines(1 To n) As String
    ReDim outLines(1 To n) As String

    ' Split into lines
    Dim idx As Long: idx = 1
    Dim current As String
    current$ = ""

    For i = 1 To Len(src$)
        If Mid$(src$, i, 1) = Chr$(10) Then
            lines(idx) = current$
            idx = idx + 1
            current$ = ""
        Else
            current$ = current$ + Mid$(src$, i, 1)
        End If
    Next
    If current$ <> "" And idx <= n Then lines(idx) = current$

    ' Process each line
    For i = 1 To n
        outLines(i) = ProcessWikiLine$(lines(i))
    Next

    ' Join output
    Dim result As String
    result$ = ""
    For i = 1 To n
        result$ = result$ + outLines(i) + Chr$(10)
    Next

    WikiToMarkdown$ = result$
End Function


' ============================================================
' Per-line wiki ? markdown
' ============================================================
Function ProcessWikiLine$ (line$)
    Dim s As String
    s$ = LTrim$(RTrim$(line$))

    ' Strip table control lines
    If Left$(s$, 2) = "{|" Then
        ProcessWikiLine$ = ""
        Exit Function
    End If
    If Left$(s$, 2) = "|}" Then
        ProcessWikiLine$ = ""
        Exit Function
    End If
    If Left$(s$, 2) = "|-" Then
        ProcessWikiLine$ = ""
        Exit Function
    End If

    ' Convert table rows (any line starting with |)
    If Left$(s$, 1) = "|" Then
        ProcessWikiLine$ = ProcessWikiTableLine$(s$)
        Exit Function
    End If

    ' Headings
    Dim level As Integer
    level = 0
    Do While level < Len(s$) And Mid$(s$, level + 1, 1) = "="
        level = level + 1
    Loop

    If level > 0 Then
        Dim inner As String
        inner$ = s$
        Do While Left$(inner$, 1) = "="
            inner$ = Mid$(inner$, 2)
        Loop
        Do While Right$(inner$, 1) = "="
            inner$ = Left$(inner$, Len(inner$) - 1)
        Loop
        inner$ = LTrim$(RTrim$(inner$))
        If level > 6 Then level = 6
        ProcessWikiLine$ = String$(level, "#") + " " + ProcessInlineWiki$(inner$)
        Exit Function
    End If

    ' Lists
    If Left$(s$, 1) = "*" Then
        ProcessWikiLine$ = "- " + ProcessInlineWiki$(Mid$(s$, 2))
        Exit Function
    End If

    If Left$(s$, 1) = "#" Then
        ProcessWikiLine$ = "1. " + ProcessInlineWiki$(Mid$(s$, 2))
        Exit Function
    End If

    ' Blank line
    If s$ = "" Then
        ProcessWikiLine$ = ""
        Exit Function
    End If

    ' Default: paragraph
    ProcessWikiLine$ = ProcessInlineWiki$(s$)
End Function


Function StripTemplates$ (s$)
    ' Remove {{Text|  (or any {{Something|)
    Dim r As String
    r$ = s$

    ' Remove opening {{...|
    Do
        Dim p1 As Long, p2 As Long
        p1 = InStr(r$, "{{")
        If p1 = 0 Then Exit Do

        p2 = InStr(p1, r$, "|")
        If p2 = 0 Then Exit Do

        ' Remove from {{ up to and including |
        r$ = Left$(r$, p1 - 1) + Mid$(r$, p2 + 1)
    Loop

    ' Remove all }}
    r$ = ReplaceAll$(r$, "}}", "")

    StripTemplates$ = r$
End Function



' ============================================================
' TABLE HANDLING — Convert all | rows to Markdown rows
' Strip attributes before first real content (Option A)
' ============================================================
Function ProcessWikiTableLine$ (line$)
    Dim s As String
    s$ = LTrim$(RTrim$(line$))

    ' Must start with |
    If Left$(s$, 1) <> "|" Then
        ProcessWikiTableLine$ = ""
        Exit Function
    End If

    ' Strip leading |
    s$ = Mid$(s$, 2)

    ' Split cells on ||
    ReDim parts(0) As String
    Dim count As Long
    count = SplitBy&(s$, "||", parts())

    Dim md As String
    Dim i As Long
    Dim cell As String

    md$ = "|"
    For i = 1 To count
        cell$ = CleanCell$(parts(i))
        md$ = md$ + " " + cell$ + " |"
    Next

    ProcessWikiTableLine$ = md$
End Function


' ============================================================
' Clean a single table cell: strip attribute tokens before content
' Option A: remove everything until first real content
' ============================================================
Function CleanCell$ (cellIn$)
    Dim s As String
    s$ = LTrim$(RTrim$(cellIn$))

    If s$ = "" Then
        CleanCell$ = ""
        Exit Function
    End If

    Dim token As String
    Dim rest As String
    Dim p As Long

    Do While s$ <> ""
        p = InStr(s$, " ")
        If p = 0 Then
            token$ = s$
            rest$ = ""
        Else
            token$ = Left$(s$, p - 1)
            rest$ = Mid$(s$, p + 1)
        End If

        ' If token looks like key="value", treat as attribute
        If InStr(token$, "=") > 0 And InStr(token$, Chr$(34)) > 0 Then
            s$ = LTrim$(rest$)
            _Continue
        End If

        ' If token is a known attribute word, skip it
        IF LCASE$(token$) = "align" OR LCASE$(token$) = "valign" OR LCASE$(token$) = "style" OR _
           LCASE$(token$) = "width" OR LCASE$(token$) = "height" OR LCASE$(token$) = "class" OR _
           LCASE$(token$) = "colspan" OR LCASE$(token$) = "rowspan" OR LCASE$(token$) = "bgcolor" THEN
            s$ = LTrim$(rest$)
            _Continue
        End If

        ' First non-attribute token: keep from here onward
        If rest$ = "" Then
            CleanCell$ = token$
        Else
            CleanCell$ = token$ + " " + LTrim$(rest$)
        End If
        Exit Function
    Loop

    ' If we stripped everything, cell is empty
    CleanCell$ = ""
End Function


' ============================================================
' Inline wiki ? markdown
' ============================================================
Function ProcessInlineWiki$ (s$)
    Dim r As String
    r$ = s$

    r$ = ReplaceAll$(r$, "'''''", "***")
    r$ = ReplaceAll$(r$, "'''", "**")
    r$ = ReplaceAll$(r$, "''", "_")

    ' Basic HTML entities
    r$ = ReplaceAll$(r$, "&apos;", "'")
    r$ = ReplaceAll$(r$, "&quot;", Chr$(34))
    r$ = ReplaceAll$(r$, "&amp;", "&")
    r$ = ReplaceAll$(r$, "&lt;", "<")
    r$ = ReplaceAll$(r$, "&gt;", ">")

    ' Less common but useful
    r$ = ReplaceAll$(r$, "&comma;", ",")
    r$ = ReplaceAll$(r$, "&semi;", ";")

    ' Numeric forms
    r$ = ReplaceAll$(r$, "&#" + "44;", ",")
    r$ = ReplaceAll$(r$, "&#" + "59;", ";")

    'wiki specific entities
    r$ = ReplaceAll$(r$, "{{CodeStart", "```")
    r$ = ReplaceAll$(r$, "{{CodeEnd", "```")
    r$ = ReplaceAll$(r$, "{{DISPLAYTITLE:", "# ")
    r$ = ReplaceAll$(r$, "{{PageSyntax", "## Syntax")
    r$ = ReplaceAll$(r$, "{{PageParameters", "## Parameters")
    r$ = ReplaceAll$(r$, "{{PageDescription", "## Description")
    r$ = ReplaceAll$(r$, "{{PageAvailability", "## Availability")
    r$ = ReplaceAll$(r$, "{{PageExamples", "## Examples")
    r$ = ReplaceAll$(r$, "{{PageSeeAlso", "## See Also")
    r$ = ReplaceAll$(r$, "{{PageNavigation", "")

    r$ = ReplaceAll$(r$, "<nowiki>", "")
    r$ = ReplaceAll$(r$, "</nowiki>", "")

    r$ = ReplaceAll$(r$, "DO...LOOP|", "")
    r$ = ReplaceAll$(r$, "IF...THEN|", "")
    r$ = ReplaceAll$(r$, "TIMER (function)|", "")
    r$ = ReplaceAll$(r$, "ASC (function)|", "")
    r$ = ReplaceAll$(r$, "FOR...NEXT|", "")
    r$ = ReplaceAll$(r$, "FOR (file statement)|", "")
    r$ = ReplaceAll$(r$, "_MEM (function)|", "")
    r$ = ReplaceAll$(r$, "AUTODISPLAY_(function)|", "")
    r$ = ReplaceAll$(r$, "DO...LOOP|", "")
    r$ = ReplaceAll$(r$, "DO...LOOP|", "")


    r$ = ConvertInternalLinks$(r$)
    r$ = ConvertExternalLinks$(r$)
    r$ = StripTemplates$(r$)

    Dim p As _Integer64
    Do
        p = InStr(r$, "|#")
        If p = 0 Then Exit Do
        r$ = Left$(r$, p - 1) + Mid$(r$, p + 8)
    Loop



    ProcessInlineWiki$ = r$
End Function


' ============================================================
' Internal links [[Page|Text]]
' ============================================================
Function ConvertInternalLinks$ (s$)
    Dim p1 As Long, p2 As Long
    Dim before As String, after As String, inner As String
    Dim text As String, target As String
    Dim barPos As Long

    Do
        p1 = InStr(s$, "[[")
        If p1 = 0 Then Exit Do
        p2 = InStr(p1 + 2, s$, "]]")
        If p2 = 0 Then Exit Do

        inner$ = Mid$(s$, p1 + 2, p2 - (p1 + 2))
        barPos = InStr(inner$, "|")

        If barPos > 0 Then
            target$ = Left$(inner$, barPos - 1)
            text$ = Mid$(inner$, barPos + 1)
        Else
            target$ = inner$
            text$ = inner$
        End If

        before$ = Left$(s$, p1 - 1)
        after$ = Mid$(s$, p2 + 2)

        ' Remove leading underscores
        Dim cleanTarget As String
        cleanTarget$ = target$
        Do While Left$(cleanTarget$, 1) = "_"
            cleanTarget$ = Mid$(cleanTarget$, 2)
        Loop

        ' Append .md extension
        cleanTarget$ = cleanTarget$ + ".md"
        cleanTarget$ = ReplaceAll(cleanTarget$, " ", "_")

        s$ = before$ + "[" + text$ + "](" + cleanTarget$ + ")" + after$
    Loop

    ConvertInternalLinks$ = s$
End Function


' ============================================================
' External links [http://url Text]
' ============================================================
Function ConvertExternalLinks$ (s$)
    Dim p1 As Long, p2 As Long
    Dim inner As String, before As String, after As String
    Dim url As String, text As String
    Dim sp As Long

    Do
        p1 = InStr(s$, "[http")
        If p1 = 0 Then Exit Do
        p2 = InStr(p1, s$, "]")
        If p2 = 0 Then Exit Do

        inner$ = Mid$(s$, p1 + 1, p2 - (p1 + 1))
        sp = InStr(inner$, " ")

        If sp > 0 Then
            url$ = Left$(inner$, sp - 1)
            text$ = Mid$(inner$, sp + 1)
        Else
            url$ = inner$
            text$ = inner$
        End If

        before$ = Left$(s$, p1 - 1)
        after$ = Mid$(s$, p2 + 1)
        s$ = before$ + "[" + text$ + "](" + url$ + ")" + after$
    Loop

    ConvertExternalLinks$ = s$
End Function


' ============================================================
' ReplaceAll
' ============================================================
Function ReplaceAll$ (s$, find$, repl$)
    Dim p As Long
    p = 1
    Do
        p = InStr(p, s$, find$)
        If p = 0 Then Exit Do
        s$ = Left$(s$, p - 1) + repl$ + Mid$(s$, p + Len(find$))
        p = p + Len(repl$)
    Loop
    ReplaceAll$ = s$
End Function


' ============================================================
' Split string by separator into parts()
' Two-pass: first count, then fill
' ============================================================
Function SplitBy& (s$, sep$, parts() As String)
    Dim count As Long
    Dim p As Long
    Dim start As Long

    ' First pass: count
    count = 1
    start = 1
    Do
        p = InStr(start, s$, sep$)
        If p = 0 Then Exit Do
        count = count + 1
        start = p + Len(sep$)
    Loop

    ReDim parts(1 To count) As String

    ' Second pass: fill
    Dim idx As Long
    idx = 1
    start = 1
    Do
        p = InStr(start, s$, sep$)
        If p = 0 Then Exit Do
        parts(idx) = Mid$(s$, start, p - start)
        idx = idx + 1
        start = p + Len(sep$)
    Loop
    parts(idx) = Mid$(s$, start)

    SplitBy& = count
End Function

