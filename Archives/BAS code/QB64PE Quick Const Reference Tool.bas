$Let SAVE = TRUE
_Title "QB64PE Quick Const Reference Tool"
Dim Shared font$
Dim Shared As Long font, size, temp, yPos

ScreenWide = 1200: ScreenTall = 800
displayScreen = _NewImage(ScreenWide, ScreenTall, 32): Screen displayScreen
temp = _NewImage(ScreenWide, 26000, 32)

size = 20 'default font size
'default font is set below
$If WIN Then
    font$ = "Courbd.ttf"
$Else
    IF _FileExists("/usr/share/fonts/truetype/3270/3270Condensed-Regular.ttf") THEN 'Tony's suggested font
        font$ = "/usr/share/fonts/truetype/3270/3270Condensed-Regular.ttf"
    ELSEIF _FileExists("/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf") THEN 'grymmjack's suggested font
        font$ = "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"
    ELSE
        _MessageBox "Custom Font Not Found", "Custom font has not be located on your system.  You can not resize fonts as we are falling back to the standard in-built font for use.  Please look inside the source and change the font to point to a desireable font on your system.", "info"
        font$ = ""
    END IF
$End If
_Icon
$Color:32
$Resize:Smooth
_ControlChr Off
Color Black, 0

$If SAVE = TRUE Then
    If _FileExists("Steve's Constant Tool Config.ini") Then
        Open "Steve's Constant Tool Config.ini" For Input As #1
        Input #1, ScreenX, junk$
        Input #1, ScreenY, junk$
        Input #1, size, junk$
        Input #1, tabOn, junk$
        Input #1, ScreenWide, junk$
        Input #1, ScreenTall, junk$
        Close
        size = _Clamp(size, 6, 64)
        ScreenWide = _Clamp(ScreenWide, 600, _DesktopWidth)
        ScreenTall = _Clamp(ScreenTall, 400, _DesktopHeight)
        tabOn = _Clamp(tabOn, 0, 7)
        ScreenX = _Clamp(ScreenX, 0, _DesktopWidth)
        ScreenY = _Clamp(ScreenY, 0, _DesktopHeight)
        If ScreenWide <> _Width Or ScreenTall <> height Then
            _Resize Off
            temp1 = _NewImage(ScreenWide, ScreenTall, 32): Screen temp1
            _FreeImage displayScreen: displayScreen = temp1: _FreeImage temp
            temp = _NewImage(ScreenWide, 26000, 32)
            _Resize On
        End If
        _ScreenMove ScreenX, ScreenY
    End If
$End If

LoadTab tabOn, y 'start with all the consts listed
Do
    If _Exit Then Exit Do 'exit to the save routine, if needed
    TitleLine tabOn
    k = _KeyHit
    MouseScroll = 0
    While _MouseInput: MouseScroll = MouseScroll + _MouseWheel: Wend
    If MouseScroll _AndAlso y > _Height Then yPos = _Clamp(yPos + 5 * _FontHeight * MouseScroll, 0, y - _Height + _FontHeight)
    Select Case k
        Case 9:
            If _KeyDown(100303) Or _KeyDown(100304) Then 'SHIFT + TAB
                tabOn = tabOn - 1: If tabOn < 0 Then tabOn = 7 'tab
            Else
                tabOn = tabOn + 1: If tabOn > 7 Then tabOn = 0 'tab
            End If
        Case 27: Exit Do 'escape
        Case 20736: If y > _Height Then yPos = _Clamp(yPos + _Height - _FontHeight, 0, y - _Height + _FontHeight) 'pagedown
        Case 18688: If y > _Height Then yPos = _Clamp(yPos - _Height + _FontHeight, 0, y) 'pageup
        Case 18432 'up
            If _KeyDown(100306) Or _KeyDown(100305) Then 'CTRL + RIGHT/UP
                size = _Clamp(size + 2, 8, 64): LoadTab tabOn, y
            ElseIf _KeyDown(100308) Or _KeyDown(100307) Then 'alt
                _Resize Off
                ScreenTall = _Clamp(ScreenTall - 100, 400, _DesktopHeight)
                temp1 = _NewImage(ScreenWide, ScreenTall, 32): Screen temp1
                _FreeImage displayScreen: displayScreen = temp1: _FreeImage temp
                temp = _NewImage(ScreenWide, 26000, 32)
                TitleLine tabOn: LoadTab tabOn, y
                _Resize On
            Else 'unmodified up
                If y > _Height Then yPos = _Clamp(yPos - _FontHeight, 0, y)
            End If
        Case 19712 'right
            If _KeyDown(100306) Or _KeyDown(100305) Then 'CTRL + RIGHT/UP
                size = _Clamp(size + 2, 8, 64)
                LoadTab tabOn, y
            ElseIf _KeyDown(100308) Or _KeyDown(100307) Then 'alt
                _Resize Off
                ScreenWide = _Clamp(ScreenWide + 100, 600, _DesktopWidth)
                temp1 = _NewImage(ScreenWide, ScreenTall, 32): Screen temp1
                _FreeImage displayScreen: displayScreen = temp1: _FreeImage temp
                temp = _NewImage(ScreenWide, 26000, 32)
                TitleLine tabOn: LoadTab tabOn, y
                _Resize On
            Else 'unmodified right
                tabOn = tabOn + 1: If tabOn > 7 Then tabOn = 0
            End If
        Case 20480 'down
            If _KeyDown(100306) Or _KeyDown(100305) Then 'CTRL + LEFT/DOWN
                size = _Clamp(size - 2, 8, 64)
                LoadTab tabOn, y
            ElseIf _KeyDown(100308) Or _KeyDown(100307) Then 'alt
                _Resize Off
                ScreenTall = _Clamp(ScreenTall + 100, 400, _DesktopHeight)
                temp1 = _NewImage(ScreenWide, ScreenTall, 32): Screen temp1
                _FreeImage displayScreen: displayScreen = temp1: _FreeImage temp
                temp = _NewImage(ScreenWide, 26000, 32)
                TitleLine tabOn: LoadTab tabOn, y
                _Resize On
            Else 'unmodified down
                If y > _Height Then yPos = _Clamp(yPos + _FontHeight, 8, y - _Height + _FontHeight)
            End If
        Case 19200 'left
            If _KeyDown(100306) Or _KeyDown(100305) Then 'CTRL + LEFT/DOWN
                size = size - 2
                If size < 8 Then size = 8
                LoadTab tabOn, y
            ElseIf _KeyDown(100308) Or _KeyDown(100307) Then 'alt
                If k = 19200 Then 'left
                    _Resize Off
                    ScreenWide = _Clamp(ScreenWide - 100, 600, _DesktopWidth)
                    temp1 = _NewImage(ScreenWide, ScreenTall, 32): Screen temp1
                    _FreeImage displayScreen: displayScreen = temp1
                    _FreeImage temp: temp = _NewImage(ScreenWide, 26000, 32)
                    TitleLine tabOn: LoadTab tabOn, y
                    _Resize On
                End If
            Else 'unmodified left
                tabOn = tabOn - 1: If tabOn < 0 Then tabOn = 7
            End If
    End Select
    If lastTab <> tabOn Then yPos = 0: LoadTab tabOn, y: lastTab = tabOn 'then we changed tabs
    _PutImage (0, _FontHeight)-(_Width, _Height), temp, , (0, yPos)-Step(_Width, _Height - _FontHeight)
    _Display
Loop
_FreeImage temp

'Save Info before ending
$If SAVE = TRUE Then
    Open "Steve's Constant Tool Config.ini" For Output As #1
    Print #1, _ScreenX, "ScreenX"
    Print #1, _ScreenY, "ScreenY"
    Print #1, size, "FontSize"
    Print #1, tabOn, "Last Tab On"
    Print #1, ScreenWide, "ScreenWidth"
    Print #1, ScreenTall, "ScreenHeight"
    Close
$End If
System


Sub TitleLine (tabon)
    TabCount = 7: Dim TabLabel(TabCount) As String
    w = _Width \ (1 + TabCount): h = _FontHeight
    TabLabel(0) = "ALL": TabLabel(1) = "SYSTEM": TabLabel(2) = "NUMBER"
    TabLabel(3) = "GENERAL": TabLabel(4) = "ERROR": TabLabel(5) = "CHARACTER"
    TabLabel(6) = "KEYBOARD": TabLabel(7) = "COLOR"
    For i = 0 To TabCount
        tx = x + i * w
        If _MouseX >= tx And _MouseX <= tx + w And _MouseY <= _FontHeight Then isOver = -1 Else isOver = 0 ' Hover detection
        If _MouseButton(1) And isOver Then tabon = i ' Click detection
        Select Case tabon 'The tabs visual state
            Case Is = i: DrawTab tx, 0, w, _FontHeight, TabLabel(i), 1 'active
            Case Is = isOver: DrawTab tx, 0, w, _FontHeight, TabLabel(i), 2 'hovered over
            Case Else: DrawTab tx, 0, w, _FontHeight, TabLabel(i), 0 'inactive
        End Select
    Next
End Sub


Sub DrawTab (x As Integer, y As Integer, w As Integer, h As Integer, label As String, state As Integer)
    Dim As _Unsigned Long face, border
    Select Case state ' state: 0 = normal, 1 = active, 2 = hover
        Case 0: face = _RGB32(180, 180, 200): border = _RGB32(80, 80, 110) 'inactive
        Case 1: face = _RGB32(230, 230, 255): border = _RGB32(40, 40, 80) ' active
        Case 2: face = _RGB32(200, 200, 230): border = _RGB32(60, 60, 90) ' hover
    End Select
    Line (x, y)-(x + w, y + h), face, BF
    Line (x, y)-(x + w, y), border
    Line (x, y)-(x, y + h), border
    Line (x + w, y)-(x + w, y + h), border
    _PrintString (x + (w - _PrintWidth(label)) \ 2, y + (h - _FontHeight) \ 2), label
End Sub

Sub LoadTab (tabOn, y)
    If font = 0 Then font = 16
    If font > 31 Then _Font 16: _Dest temp: _Font 16: _Dest 0: _FreeFont font
    If font$ = "" Then font = 16
    $If WIN Then
        font = _LoadFont(font$, size, "monospace")
    $Else
        If _FileExists(font$) Then font = _LoadFont(font$, size, "monospace") Else font = 16
    $End If
    _Font font: _Dest temp: _Font font: _Dest 0
    yPos = 0 'go back to the top of the next tab
    _Dest temp: Line (0, 0)-(_Width - 1, 26000), SkyBlue, BF: _Dest 0
    Select Case tabOn
        Case 0: AllConst temp, y
        Case 1: SystemConst temp, y
        Case 2: NumberConst temp, y
        Case 3: GeneralConst temp, y
        Case 4: ErrorConst temp, y
        Case 5: CharacterConst temp, y
        Case 6: KeyBoardConst temp, y
        Case 7: ColorConst temp, y
    End Select
End Sub

Sub ColorConst (handle, y)
    NumberOfRows = 270
    DrawGrid handle, NumberOfRows
    d = _Dest: _Dest handle: fh = _FontHeight + 8
    Dim kolor As _Unsigned Long, info As String * 47

    Restore color_codes
    lineOn = 1
    Color White, &HAA000000
    For i = 0 To 269
        lineOn = lineOn + 1
        Read kolor$, kolor
        Line (0, i * fh)-Step(_Width, fh), kolor, BF
        temp$ = kolor$ + " =  _RGB32(" + _ToStr$(_Red32(kolor)) + "," + _ToStr$(_Green32(kolor)) + "," + _ToStr$(_Blue32(kolor)) + ")"
        info = ""
        Mid$(info, ((_PrintWidth(info) - _PrintWidth(temp$)) / 2) / _FontWidth + 1) = temp$
        center = (_Width - _PrintWidth(info)) / 2
        _PrintString (center, i * fh + 4), info
    Next
    Color Black, 0

    y = NumberOfRows * fh
    _Dest d
    Exit Sub
    color_codes:
    Data "AliceBlue~&",4293982463
    Data "Almond~&",4293910221
    Data "AntiqueBrass~&",4291663221
    Data "AntiqueWhite~&",4294634455
    Data "Apricot~&",4294826421
    Data "Aqua~&",4278255615
    Data "Aquamarine~&",4286578644
    Data "Asparagus~&",4287080811
    Data "AtomicTangerine~&",4294943860
    Data "Azure~&",4293984255
    Data "BananaMania~&",4294633397
    Data "Beaver~&",4288643440
    Data "Beige~&",4294309340
    Data "Bisque~&",4294960324
    Data "Bittersweet~&",4294802542
    Data "Black~&",4278190080
    Data "BlanchedAlmond~&",4294962125
    Data "BlizzardBlue~&",4289521134
    Data "Blue~&",4278190335
    Data "BlueBell~&",4288848592
    Data "BlueGray~&",4284914124
    Data "BlueGreen~&",4279081146
    Data "BlueViolet~&",4287245282
    Data "Blush~&",4292763011
    Data "BrickRed~&",4291510612
    Data "Brown~&",4289014314
    Data "BurlyWood~&",4292786311
    Data "BurntOrange~&",4294934345
    Data "BurntSienna~&",4293557853
    Data "CadetBlue~&",4284456608
    Data "Canary~&",4294967193
    Data "CaribbeanGreen~&",4280079266
    Data "CarnationPink~&",4294945484
    Data "Cerise~&",4292691090
    Data "Cerulean~&",4280134870
    Data "ChartReuse~&",4286578432
    Data "Chestnut~&",4290534744
    Data "Chocolate~&",4291979550
    Data "Copper~&",4292711541
    Data "Coral~&",4294934352
    Data "Cornflower~&",4288335595
    Data "CornflowerBlue~&",4284782061
    Data "Cornsilk~&",4294965468
    Data "CottonCandy~&",4294950105
    Data "CrayolaAquamarine~&",4286110690
    Data "CrayolaBlue~&",4280251902
    Data "CrayolaBlueViolet~&",4285753021
    Data "CrayolaBrown~&",4290013005
    Data "CrayolaCadetBlue~&",4289771462
    Data "CrayolaForestGreen~&",4285378177
    Data "CrayolaGold~&",4293379735
    Data "CrayolaGoldenrod~&",4294760821
    Data "CrayolaGray~&",4287992204
    Data "CrayolaGreen~&",4280069240
    Data "CrayolaGreenYellow~&",4293978257
    Data "CrayolaIndigo~&",4284315339
    Data "CrayolaLavender~&",4294751445
    Data "CrayolaMagenta~&",4294337711
    Data "CrayolaMaroon~&",4291311706
    Data "CrayolaMidnightBlue~&",4279912566
    Data "CrayolaOrange~&",4294931768
    Data "CrayolaOrangeRed~&",4294912811
    Data "CrayolaOrchid~&",4293306583
    Data "CrayolaPlum~&",4287513989
    Data "CrayolaRed~&",4293795917
    Data "CrayolaSalmon~&",4294941610
    Data "CrayolaSeaGreen~&",4288668351
    Data "CrayolaSilver~&",4291675586
    Data "CrayolaSkyBlue~&",4286634731
    Data "CrayolaSpringGreen~&",4293716670
    Data "CrayolaTann~&",4294616940
    Data "CrayolaThistle~&",4293642207
    Data "CrayolaViolet~&",4287786670
    Data "CrayolaYellow~&",4294764675
    Data "CrayolaYellowGreen~&",4291158916
    Data "Crimson~&",4292613180
    Data "Cyan~&",4278255615
    Data "Dandelion~&",4294826861
    Data "DarkBlue~&",4278190219
    Data "DarkCyan~&",4278225803
    Data "DarkGoldenRod~&",4290283019
    Data "DarkGray~&",4289309097
    Data "DarkGreen~&",4278215680
    Data "DarkKhaki~&",4290623339
    Data "DarkMagenta~&",4287299723
    Data "DarkOliveGreen~&",4283788079
    Data "DarkOrange~&",4294937600
    Data "DarkOrchid~&",4288230092
    Data "DarkRed~&",4287299584
    Data "Dark`Salmon~&",4293498490
    Data "DarkSeaGreen~&",4287609999
    Data "DarkSlateBlue~&",4282924427
    Data "DarkSlateGray~&",4281290575
    Data "DarkTurquoise~&",4278243025
    Data "DarkViolet~&",4287889619
    Data "DeepPink~&",4294907027
    Data "DeepSkyBlue~&",4278239231
    Data "Denim~&",4281035972
    Data "DesertSand~&",4293905848
    Data "DimGray~&",4285098345
    Data "DodgerBlue~&",4280193279
    Data "Eggplant~&",4285419872
    Data "ElectricLime~&",4291755805
    Data "Fern~&",4285643896
    Data "FireBrick~&",4289864226
    Data "Floralwhite~&",4294966000
    Data "ForestGreen~&",4280453922
    Data "Fuchsia~&",4290995397
    Data "FuzzyWuzzy~&",4291585638
    Data "Gainsboro~&",4292664540
    Data "GhostWhite~&",4294506751
    Data "Gold~&",4294956800
    Data "GoldenRod~&",4292519200
    Data "GrannySmithApple~&",4289258656
    Data "Gray~&",4286611584
    Data "Green~&",4278222848
    Data "GreenBlue~&",4279329972
    Data "GreenYellow~&",4289593135
    Data "HoneyDew~&",4293984240
    Data "HotMagenta~&",4294909390
    Data "HotPink~&",4294928820
    Data "Inchworm~&",4289915997
    Data "IndianRed~&",4291648604
    Data "Indigo~&",4283105410
    Data "Ivory~&",4294967280
    Data "JazzberryJam~&",4291442535
    Data "JungleGreen~&",4282101903
    Data "Khaki~&",4293977740
    Data "LaserLemon~&",4294901282
    Data "Lavender~&",4293322490
    Data "LavenderBlush~&",4294963445
    Data "LawnGreen~&",4286381056
    Data "LemonChiffon~&",4294965965
    Data "LemonYellow~&",4294964303
    Data "LightBlue~&",4289583334
    Data "LightCoral~&",4293951616
    Data "LightCyan~&",4292935679
    Data "LightGoldenRodYellow~&",4294638290
    Data "LightGray~&",4292072403
    Data "LightGreen~&",4287688336
    Data "LightPink~&",4294948545
    Data "LightSalmon~&",4294942842
    Data "LightSeaGreen~&",4280332970
    Data "LightSkyBlue~&",4287090426
    Data "LightSlateGray~&",4286023833
    Data "LightSteelBlue~&",4289774814
    Data "LightYellow~&",4294967264
    Data "Lime~&",4278255360
    Data "LimeGreen~&",4281519410
    Data "Linen~&",4294635750
    Data "MacaroniAndCheese~&",4294950280
    Data "Magenta~&",4294902015
    Data "MagicMint~&",4289392849
    Data "Mahogany~&",4291643980
    Data "Maize~&",4293775772
    Data "Manatee~&",4288125610
    Data "MangoTango~&",4294935107
    Data "Maroon~&",4286578688
    Data "Mauvelous~&",4293892266
    Data "MediumAquamarine~&",4284927402
    Data "MediumBlue~&",4278190285
    Data "MediumOrchid~&",4290401747
    Data "MediumPurple~&",4287852763
    Data "MediumSeaGreen~&",4282168177
    Data "MediumSlateBlue~&",4286277870
    Data "MediumSpringGreen~&",4278254234
    Data "MediumTurquoise~&",4282962380
    Data "MediumVioletRed~&",4291237253
    Data "Melon~&",4294818996
    Data "MidnightBlue~&",4279834992
    Data "MintCream~&",4294311930
    Data "MistyRose~&",4294960353
    Data "Moccasin~&",4294960309
    Data "MountainMeadow~&",4281383567
    Data "Mulberry~&",4291120012
    Data "NavajoWhite~&",4294958765
    Data "Navy~&",4278190208
    Data "NavyBlue~&",4279858386
    Data "NeonCarrot~&",4294943555
    Data "OldLace~&",4294833638
    Data "Olive~&",4286611456
    Data "OliveDrab~&",4285238819
    Data "OliveGreen~&",4290426988
    Data "Orange~&",4294944000
    Data "OrangeRed~&",4294919424
    Data "OrangeYellow~&",4294497640
    Data "Orchid~&",4292505814
    Data "OuterSpace~&",4282468940
    Data "OutrageousOrange~&",4294929994
    Data "PacificBlue~&",4280068553
    Data "PaleGoldenRod~&",4293847210
    Data "PaleGreen~&",4288215960
    Data "PaleTurquoise~&",4289720046
    Data "PaleVioletRed~&",4292571283
    Data "PapayaWhip~&",4294963157
    Data "Peach~&",4294954923
    Data "PeachPuff~&",4294957753
    Data "Periwinkle~&",4291154150
    Data "Peru~&",4291659071
    Data "PiggyPink~&",4294827494
    Data "PineGreen~&",4279599224
    Data "Pink~&",4294951115
    Data "PinkFlamingo~&",4294735101
    Data "PinkSherbet~&",4294414247
    Data "Plum~&",4292714717
    Data "PowderBlue~&",4289781990
    Data "Purple~&",4286578816
    Data "PurpleHeart~&",4285809352
    Data "PurpleMountainsMajesty~&",4288512442
    Data "PurplePizzazz~&",4294856410
    Data "RadicalRed~&",4294920556
    Data "RawSienna~&",4292250201
    Data "RawUmber~&",4285614883
    Data "RazzleDazzleRose~&",4294920400
    Data "Razzmatazz~&",4293076331
    Data "Red~&",4294901760
    Data "RedOrange~&",4294923081
    Data "RedViolet~&",4290790543
    Data "RobinsEggBlue~&",4280274635
    Data "RosyBrown~&",4290547599
    Data "RoyalBlue~&",4282477025
    Data "RoyalPurple~&",4286075305
    Data "SaddleBrown~&",4287317267
    Data "Salmon~&",4294606962
    Data "SandyBrown~&",4294222944
    Data "Scarlet~&",4294715463
    Data "ScreaminGreen~&",4285988730
    Data "SeaGreen~&",4281240407
    Data "SeaShell~&",4294964718
    Data "Sepia~&",4289030479
    Data "Shadow~&",4287265117
    Data "Shamrock~&",4282764962
    Data "ShockingPink~&",4294672125
    Data "Sienna~&",4288696877
    Data "Silver~&",4290822336
    Data "SkyBlue~&",4287090411
    Data "SlateBlue~&",4285160141
    Data "SlateGray~&",4285563024
    Data "Snow~&",4294966010
    Data "SpringGreen~&",4278255487
    Data "SteelBlue~&",4282811060
    Data "Sunglow~&",4294954824
    Data "SunsetOrange~&",4294794835
    Data "Tann~&",4291998860
    Data "Teal~&",4278222976
    Data "TealBlue~&",4279805877
    Data "Thistle~&",4292394968
    Data "TickleMePink~&",4294740396
    Data "Timberwolf~&",4292597714
    Data "Tomato~&",4294927175
    Data "TropicalRainForest~&",4279730285
    Data "Tumbleweed~&",4292782728
    Data "Turquoise~&",4282441936
    Data "TurquoiseBlue~&",4286045671
    Data "UnmellowYellow~&",4294967142
    Data "Violet~&",4293821166
    Data "VioletBlue~&",4281486002
    Data "VioletRed~&",4294398868
    Data "VividTangerine~&",4294942857
    Data "VividViolet~&",4287582365
    Data "Wheat~&",4294303411
    Data "White~&",4294967295
    Data "Whitesmoke~&",4294309365
    Data "WildBlueYonder~&",4288851408
    Data "WildStrawberry~&",4294919076
    Data "WildWatermelon~&",4294732933
    Data "Wisteria~&",4291667166
    Data "Yellow~&",4294967040
    Data "YellowGreen~&",4288335154
    Data "YellowOrange~&",4294946370
End Sub


Sub KeyBoardConst (handle, y)
    NumberOfRows = 24
    DrawGrid handle, NumberOfRows
    d = _Dest: _Dest handle: fh = _FontHeight + 2
    Line ((_Width - 25) / 2, 25 + fh)-Step(0, fh * NumberOfRows), Black
    Color Red, 0: _PrintString (25, 27), "_KEYDOWN/_KEYHIT CODES"
    _PrintString (25, 27 + fh * 1), "Modifer Keys (Left)"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 1), "Modifer Keys (Right)": Color Black, 0
    _PrintString (27, 27 + fh * 2), "_KEY_LALT             = 100308"
    _PrintString (27, 27 + fh * 3), "_KEY_LAPPLE           = 100310"
    _PrintString (27, 27 + fh * 4), "_KEY_LCTRL            = 100306"
    _PrintString (27, 27 + fh * 5), "_KEY_LSHIFT           = 100304"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 2), "_KEY_RALT             = 100307"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 3), "_KEY_RAPPLE           = 100309"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 4), "_KEY_RCTRL            = 100305"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 5), "_KEY_RSHIFT           = 100303"
    Color Red, 0: _PrintString (25, 27 + fh * 7), "Function Keys (1 To 6)"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 7), "Function Keys (7 To 12)": Color Black, 0
    _PrintString (27, 27 + fh * 8), "_KEY_F1               = 15104"
    _PrintString (27, 27 + fh * 9), "_KEY_F2               = 15360"
    _PrintString (27, 27 + fh * 10), "_KEY_F3               = 15616"
    _PrintString (27, 27 + fh * 11), "_KEY_F4               = 15872"
    _PrintString (27, 27 + fh * 12), "_KEY_F5               = 16128"
    _PrintString (27, 27 + fh * 13), "_KEY_F6               = 16384"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 8), "_KEY_F7               = 16640"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 9), "_KEY_F8               = 16896"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 10), "_KEY_F9               = 17152"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 11), "_KEY_F10              = 17408"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 12), "_KEY_F11              = 34048"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 13), "_KEY_F12              = 34304"
    Color Red, 0: _PrintString (25, 27 + fh * 15), "Navigation Keys"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 15), "Command Keys": Color Black, 0
    _PrintString (27, 27 + fh * 16), "_KEY_DOWN             = 20480"
    _PrintString (27, 27 + fh * 17), "_KEY_END              = 20224"
    _PrintString (27, 27 + fh * 18), "_KEY_HOME             = 18176"
    _PrintString (27, 27 + fh * 19), "_KEY_LEFT             = 19200"
    _PrintString (27, 27 + fh * 20), "_KEY_PAGEDOWN         = 20736"
    _PrintString (27, 27 + fh * 21), "_KEY_PAGEUP           = 18688"
    _PrintString (27, 27 + fh * 22), "_KEY_RIGHT            = 19712"
    _PrintString (27, 27 + fh * 23), "_KEY_UP               = 18432"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 16), "_KEY_BACKSPACE        = 8"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 17), "_KEY_DELETE = 21248"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 18), "_KEY_ENTER = 13"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 19), "_KEY_ESC = 27"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 20), "_KEY_INSERT = 20992"
    _PrintString ((_Width - 25) / 2 + 2, 27 + fh * 21), ""
    y = NumberOfRows * fh + 25
    _Dest d
End Sub

Sub CharacterConst (handle, y)
    NumberOfRows = 76
    DrawGrid handle, NumberOfRows
    d = _Dest: _Dest handle: fh = _FontHeight + 2

    Color Red, 0: _PrintString (27, 27), "STRING CONSTS": Color Black, 0
    _PrintString (27, 27 + fh), "_STR_CRLF         = CHR$(13) + CHR$(10)"
    _PrintString (27, 27 + fh * 2), "_STR_EMPTY        = " + Chr$(34) + Chr$(34)
    _PrintString (27, 27 + fh * 3), "_STR_LF           = CHR$(10)"
    $If WIN Then
        _PrintString (27, 27 + fh * 4), "_STR_NAT_EOL      = CHR$(13) + CHR$(10)"
        Print ""
    $Else
        _PrintString (27, 27 + fh * 4), "_STR_NAT_EOL      = CHR$(10)"
    $End If
    Line (25, 25 + fh * 5 + 1)-Step(_Width - 50, fh), Black, BF

    Line (25 + _FontWidth * 7, 25 + fh * 6)-Step(0, _Height), Black
    Line (25 + _FontWidth * 14, 25 + fh * 6)-Step(0, _Height), Black
    w = 25 + _FontWidth * 14 + (_Width - 25 - _FontWidth * 14) / 3
    w2 = 25 + _FontWidth * 14 + (_Width - 25 - _FontWidth * 14) / 1.5
    Line (w, fh * 6)-Step(0, _Height), Black
    Line (w2, fh * 6)-Step(0, _Height), Black

    Color Red, 0
    _PrintString (27, 27 + fh * 6), "CODE"
    _PrintString (27 + _FontWidth * 7, 27 + fh * 6), "CHAR"
    _PrintString (27 + _FontWidth * 14, 27 + fh * 6), "ASCII NAME"
    _PrintString (2 + w, 27 + fh * 6), "CHR$ NAME"
    _PrintString (2 + w2, 27 + fh * 6), "DESCRIPTION"
    Color Black, 0

    Restore character_data
    For i = 0 To 47
        _PrintString (27, 27 + fh * (7 + i)), _ToStr$(i)
        _PrintString (27 + _FontWidth * 7, 27 + fh * (7 + i)), Chr$(i)
        Read a$, c$, d$
        _PrintString (27 + _FontWidth * 14, 27 + fh * (7 + i)), a$
        _PrintString (2 + w, 27 + fh * (7 + i)), c$
        _PrintString (2 + w2, 27 + fh * (7 + i)), d$
    Next
    Color Red, 0
    _PrintString (27, 27 + fh * 55), "CODE"
    _PrintString (27 + _FontWidth * 7, 27 + fh * 55), "CHAR"
    _PrintString (27 + _FontWidth * 14, 27 + fh * 55), "ASCII NAME"
    _PrintString (2 + w, 27 + fh * 55), "CHR$ NAME"
    _PrintString (2 + w2, 27 + fh * 55), "DESCRIPTION"
    Color Black, 0
    For i = 58 To 64
        _PrintString (27, 27 + fh * (i - 2)), _ToStr$(i)
        _PrintString (27 + _FontWidth * 7, 27 + fh * (i - 2)), Chr$(i)
        Read a$, c$, d$
        _PrintString (27 + _FontWidth * 14, 27 + fh * (i - 2)), a$
        _PrintString (2 + w, 27 + fh * (i - 2)), c$
        _PrintString (2 + w2, 27 + fh * (i - 2)), d$
    Next
    For i = 91 To 96
        _PrintString (27, 27 + fh * (i - 27)), _ToStr$(i)
        _PrintString (27 + _FontWidth * 7, 27 + fh * (i - 27)), Chr$(i)
        Read a$, c$, d$
        _PrintString (27 + _FontWidth * 14, 27 + fh * (i - 27)), a$
        _PrintString (2 + w, 27 + fh * (i - 27)), c$
        _PrintString (2 + w2, 27 + fh * (i - 27)), d$
    Next
    For i = 123 To 127
        _PrintString (27, 27 + fh * (i - 52)), _ToStr$(i)
        _PrintString (27 + _FontWidth * 7, 27 + fh * (i - 52)), Chr$(i)
        Read a$, c$, d$
        _PrintString (27 + _FontWidth * 14, 27 + fh * (i - 52)), a$
        _PrintString (2 + w, 27 + fh * (i - 52)), c$
        _PrintString (2 + w2, 27 + fh * (i - 52)), d$
    Next
    y = NumberOfRows * fh + 25
    _Dest d
    Exit Sub

    character_data:
    Data "_ASC_NUL"," _CHR_NUL","Null"
    Data "_ASC_SOH"," _CHR_SOH","Start of Heading"
    Data "_ASC_STX"," _CHR_STX","Start of Text"
    Data "_ASC_ETX"," _CHR_ETX","End of Text"
    Data "_ASC_EOT"," _CHR_EOT","End of Transmission"
    Data "_ASC_ENQ"," _CHR_ENQ","Enquiry"
    Data "_ASC_ACK"," _CHR_ACK","Acknowledge"
    Data "_ASC_BEL"," _CHR_BEL","Bell"
    Data "_ASC_BS"," _CHR_BS","Backspace"
    Data "_ASC_HT"," _CHR_HT","Horizontal Tab"
    Data "_ASC_LF"," _CHR_LF","Line Feed"
    Data "_ASC_VT"," _CHR_VT","Vertical Tab"
    Data "_ASC_FF"," _CHR_FF","Form Feed"
    Data "_ASC_CR"," _CHR_CR","Carriage Return"
    Data "_ASC_SO"," _CHR_SO","Shift Out"
    Data "_ASC_SI"," _CHR_SI","Shift In"
    Data "_ASC_DLE"," _CHR_DLE","Data Link Escape"
    Data "_ASC_DC1"," _CHR_DC1","Device Control 1"
    Data "_ASC_DC2"," _CHR_DC2","Device Control 2"
    Data "_ASC_DC3"," _CHR_DC3","Device Control 3"
    Data "_ASC_DC4"," _CHR_DC4","Device Control 4"
    Data "_ASC_NAK"," _CHR_NAK","Negative Acknowledge"
    Data "_ASC_SYN"," _CHR_SYN","Synchronous Idle"
    Data "_ASC_ETB"," _CHR_ETB","End Transmission Block"
    Data "_ASC_CAN"," _CHR_CAN","Cancel"
    Data "_ASC_EM"," _CHR_EM","End of Medium"
    Data "_ASC_SUB"," _CHR_SUB","Substitute"
    Data "_ASC_ESC"," _CHR_ESC","Escape"
    Data "_ASC_FS"," _CHR_FS","File Separator"
    Data "_ASC_GS"," _CHR_GS","Group Separator"
    Data "_ASC_RS"," _CHR_RS","Record Separator"
    Data "_ASC_US"," _CHR_US","Unit Separator"
    Data "_ASC_SPACE","_CHR_SPACE","Just a blank space"
    Data "_ASC_EXCLAMATION"," _CHR_EXCLAMATION",""
    Data "_ASC_QUOTE"," _CHR_QUOTE",""
    Data "_ASC_HASH"," _CHR_HASH",""
    Data "_ASC_DOLLAR"," _CHR_DOLLAR",""
    Data "_ASC_PERCENT"," _CHR_PERCENT",""
    Data "_ASC_AMPERSAND"," _CHR_AMPERSAND",""
    Data "_ASC_APOSTROPHE"," _CHR_APOSTROPHE",""
    Data "_ASC_LEFTBRACKET"," _CHR_LEFTBRACKET",""
    Data "_ASC_RIGHTBRACKET"," _CHR_RIGHTBRACKET",""
    Data "_ASC_ASTERISK"," _CHR_ASTERISK ",""
    Data "_ASC_PLUS"," _CHR_PLUS",""
    Data "_ASC_COMMA"," _CHR_COMMA",""
    Data "_ASC_MINUS"," _CHR_MINUS",""
    Data "_ASC_FULLSTOP"," _CHR_FULLSTOP",""
    Data "_ASC_FORWARDSLASH"," _CHR_FORWARDSLASH",""
    Data "_ASC_COLON"," _CHR_COLON",""
    Data "_ASC_SEMICOLON"," _CHR_SEMICOLON",""
    Data "_ASC_LESSTHAN"," _CHR_LESSTHAN",""
    Data "_ASC_EQUAL"," _CHR_EQUAL",""
    Data "_ASC_GREATERTHAN"," _CHR_GREATERTHAN",""
    Data "_ASC_QUESTION"," _CHR_QUESTION",""
    Data "_ASC_ATSIGN"," _CHR_ATSIGN",""
    '91 to 96
    Data "_ASC_LEFTSQUAREBRACKET","_CHR_LEFTSQUAREBRACKET",""
    Data "_ASC_BACKSLASH","_CHR_BACKSLASH",""
    Data "_ASC_RIGHTSQUAREBRACKET","_CHR_RIGHTSQUAREBRACKET",""
    Data "_ASC_CARET","_CHR_CARET",""
    Data "_ASC_UNDERSCORE","_CHR_UNDERSCORE",""
    Data "_ASC_GRAVE","_CHR_GRAVE",""
    '123 to 127
    Data "_ASC_LEFTCURLYBRACKET","_CHR_LEFTCURLYBRACKET",""
    Data "_ASC_VERTICALBAR","_CHR_VERTICALBAR",""
    Data "_ASC_RIGHTCURLYBRACKET","_CHR_RIGHTCURLYBRACKET",""
    Data "_ASC_TILDE","_CHR_TILDE = CHR$(126) ",""
    Data "_ASC_DEL","_CHR_DEL"," Delete"
End Sub

Sub ErrorConst (handle, y)
    NumberOfRows = 29
    DrawGrid handle, NumberOfRows
    d = _Dest: _Dest handle: fh = _FontHeight + 2
    Line ((_Width - 25) / 2, 25)-Step(0, fh * NumberOfRows), Black
    Color Red, 0: _PrintString (25, 27), "ERROR CODES (0 to 35)"
    _PrintString ((_Width - 25) / 2, 27), "ERROR CODES (37 to 258)": Color Black, 0
    _PrintString (25, 27 + fh * 1), "_ERR_NONE = 0 'for compare with ERR only !!"
    _PrintString (25, 27 + fh * 2), "_ERR_NEXT_WITHOUT_FOR = 1"
    _PrintString (25, 27 + fh * 3), "_ERR_SYNTAX_ERROR = 2"
    _PrintString (25, 27 + fh * 4), "_ERR_RETURN_WITHOUT_GOSUB = 3"
    _PrintString (25, 27 + fh * 5), "_ERR_OUT_OF_DATA = 4"
    _PrintString (25, 27 + fh * 6), "_ERR_ILLEGAL_FUNCTION_CALL = 5"
    _PrintString (25, 27 + fh * 7), "_ERR_OVERFLOW = 6"
    _PrintString (25, 27 + fh * 8), "_ERR_OUT_OF_MEMORY = 7"
    _PrintString (25, 27 + fh * 9), "_ERR_LABEL_NOT_DEFINED = 8"
    _PrintString (25, 27 + fh * 10), "_ERR_SUBSCRIPT_OUT_OF_RANGE = 9"
    _PrintString (25, 27 + fh * 11), "_ERR_DUPLICATE_DEFINITION = 10"
    _PrintString (25, 27 + fh * 12), "_ERR_DIVISION_BY_ZERO = 11"
    _PrintString (25, 27 + fh * 13), "_ERR_ILLEGAL_IN_DIRECT_MODE = 12"
    _PrintString (25, 27 + fh * 14), "_ERR_TYPE_MISMATCH = 13"
    _PrintString (25, 27 + fh * 15), "_ERR_OUT_OF_STRING_SPACE = 14"
    _PrintString (25, 27 + fh * 16), "_ERR_STRING_FORMULA_TOO_COMPLEX = 16"
    _PrintString (25, 27 + fh * 17), "_ERR_CANNOT_CONTINUE = 17"
    _PrintString (25, 27 + fh * 18), "_ERR_FUNCTION_NOT_DEFINED = 18"
    _PrintString (25, 27 + fh * 19), "_ERR_NO_RESUME = 19"
    _PrintString (25, 27 + fh * 20), "_ERR_RESUME_WITHOUT_ERROR = 20"
    _PrintString (25, 27 + fh * 21), "_ERR_DEVICE_TIMEOUT = 24"
    _PrintString (25, 27 + fh * 22), "_ERR_DEVICE_FAULT = 25"
    _PrintString (25, 27 + fh * 23), "_ERR_FOR_WITHOUT_NEXT = 26"
    _PrintString (25, 27 + fh * 24), "_ERR_OUT_OF_PAPER = 27"
    _PrintString (25, 27 + fh * 25), "_ERR_WHILE_WITHOUT_WEND = 29"
    _PrintString (25, 27 + fh * 26), "_ERR_WEND_WITHOUT_WHILE = 30"
    _PrintString (25, 27 + fh * 27), "_ERR_DUPLICATE_LABEL = 33"
    _PrintString (25, 27 + fh * 28), "_ERR_SUBPROGRAM_NOT_DEFINED = 35"
    _PrintString ((_Width - 25) / 2, 27 + fh * 1), "_ERR_ARGUMENT_COUNT_MISMATCH = 37"
    _PrintString ((_Width - 25) / 2, 27 + fh * 2), "_ERR_ARRAY_NOT_DEFINED = 38"
    _PrintString ((_Width - 25) / 2, 27 + fh * 3), "_ERR_VARIABLE_REQUIRED = 40"
    _PrintString ((_Width - 25) / 2, 27 + fh * 4), "_ERR_FIELD_OVERFLOW = 50"
    _PrintString ((_Width - 25) / 2, 27 + fh * 5), "_ERR_INTERNAL_ERROR = 51"
    _PrintString ((_Width - 25) / 2, 27 + fh * 6), "_ERR_BAD_FILE_NAME_OR_NUMBER = 52"
    _PrintString ((_Width - 25) / 2, 27 + fh * 7), "_ERR_FILE_NOT_FOUND = 53"
    _PrintString ((_Width - 25) / 2, 27 + fh * 8), "_ERR_BAD_FILE_MODE = 54"
    _PrintString ((_Width - 25) / 2, 27 + fh * 9), "_ERR_FILE_ALREADY_OPEN = 55"
    _PrintString ((_Width - 25) / 2, 27 + fh * 10), "_ERR_FIELD_STATEMENT_ACTIVE = 56"
    _PrintString ((_Width - 25) / 2, 27 + fh * 11), "_ERR_DEVICE_IO_ERROR = 57"
    _PrintString ((_Width - 25) / 2, 27 + fh * 12), "_ERR_FILE_ALREADY_EXISTS = 58"
    _PrintString ((_Width - 25) / 2, 27 + fh * 13), "_ERR_BAD_RECORD_LENGTH = 59"
    _PrintString ((_Width - 25) / 2, 27 + fh * 14), "_ERR_DISK_FULL = 61"
    _PrintString ((_Width - 25) / 2, 27 + fh * 15), "_ERR_INPUT_PAST_END_OF_FILE = 62"
    _PrintString ((_Width - 25) / 2, 27 + fh * 16), "_ERR_BAD_RECORD_NUMBER = 63"
    _PrintString ((_Width - 25) / 2, 27 + fh * 17), "_ERR_BAD_FILE_NAME = 64"
    _PrintString ((_Width - 25) / 2, 27 + fh * 18), "_ERR_TOO_MANY_FILES = 67"
    _PrintString ((_Width - 25) / 2, 27 + fh * 19), "_ERR_DEVICE_UNAVAILABLE = 68"
    _PrintString ((_Width - 25) / 2, 27 + fh * 20), "_ERR_COMMUNICATION_BUFFER_OVERFLOW = 69"
    _PrintString ((_Width - 25) / 2, 27 + fh * 21), "_ERR_PERMISSION_DENIED = 70"
    _PrintString ((_Width - 25) / 2, 27 + fh * 22), "_ERR_DISK_NOT_READY = 71"
    _PrintString ((_Width - 25) / 2, 27 + fh * 23), "_ERR_DISK_MEDIA_ERROR = 72"
    _PrintString ((_Width - 25) / 2, 27 + fh * 24), "_ERR_FEATURE_UNAVAILABLE = 73"
    _PrintString ((_Width - 25) / 2, 27 + fh * 25), "_ERR_RENAME_ACROSS_DISKS = 74"
    _PrintString ((_Width - 25) / 2, 27 + fh * 26), "_ERR_PATH_FILE_ACCESS_ERROR = 75"
    _PrintString ((_Width - 25) / 2, 27 + fh * 27), "_ERR_PATH_NOT_FOUND = 76"
    _PrintString ((_Width - 25) / 2, 27 + fh * 28), "_ERR_INVALID_HANDLE = 258"
    y = NumberOfRows * fh + 25
    _Dest d
End Sub

Sub GeneralConst (handle, y)
    NumberOfRows = 25
    DrawGrid handle, 25
    d = _Dest: _Dest handle: fh = _FontHeight + 2
    Line ((_Width - 25) / 2, 25)-Step(0, fh * NumberOfRows), Black
    Color Red, 0: _PrintString (25, 27), "Base time values": Color Black, 0
    _PrintString (25, 27 + fh), "_SECS_IN_MIN           = 60"
    _PrintString (25, 27 + fh * 2), "_MINS_IN_HOUR          = 60"
    _PrintString (25, 27 + fh * 3), "_HOURS_IN_DAY          = 24"
    _PrintString (25, 27 + fh * 4), "_DAYS_IN_WEEK          = 7"
    _PrintString (25, 27 + fh * 5), "_DAYS_IN_YEAR          = 365"
    _PrintString (25, 27 + fh * 6), "_DAYS_IN_LEAPYEAR      = 366"
    Color Red, 0: _PrintString (25, 27 + fh * 8), "Derived time values": Color Black, 0
    _PrintString (25, 27 + fh * 9), "_HOURS_IN_LEAPYEAR     = 61488"
    _PrintString (25, 27 + fh * 10), "_HOURS_IN_WEEK         = 168"
    _PrintString (25, 27 + fh * 11), "_HOURS_IN_YEAR         = 61320"
    _PrintString (25, 27 + fh * 12), "_MINS_IN_DAY           = 1440"
    _PrintString (25, 27 + fh * 13), "_MINS_IN_LEAPYEAR      = 527040"
    _PrintString (25, 27 + fh * 14), "_MINS_IN_WEEK          = 10080"
    _PrintString (25, 27 + fh * 15), "_MINS_IN_YEAR          = 525600"
    _PrintString (25, 27 + fh * 17), "_SECS_IN_DAY           = 86400"
    _PrintString (25, 27 + fh * 18), "_SECS_IN_HOUR          = 3600"
    _PrintString (25, 27 + fh * 19), "_SECS_IN_WEEK          = 604800"
    _PrintString (25, 27 + fh * 20), "_SECS_IN_YEAR          = 31536000"
    _PrintString (25, 27 + fh * 21), "_SECS_IN_LEAPYEAR      = 31622400"
    _PrintString (25, 27 + fh * 23), "_WEEKS_IN_LEAPYEAR     = 366 / 7"
    _PrintString (25, 27 + fh * 24), "_WEEKS_IN_YEAR         = 365 / 7"
    Color Red, 0: _PrintString ((_Width - 25) / 2 + 4, 27), "Binary size factors": Color Black, 0
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh), "_ONE_KB                = 1024 '            ' 2^10"
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 2), "_ONE_MB                = _ONE_KB * 1024    ' 2^20"
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 3), "_ONE_GB                = _ONE_MB * 1024    ' 2^30"
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 4), "_ONE_TB                = _ONE_GB * 1024    ' 2^40"
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 5), "_ONE_PB                = _ONE_TB * 1024    ' 2^50"
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 6), "_ONE_EB                = _ONE_PB * 1024    ' 2^60"
    Color Red, 0: _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 8), "Some math": Color Black, 0
    _PrintString ((_Width - 25) / 2 + 4, 27 + fh * 9), "_E##                   = EXP(1.0##)"
    y = NumberOfRows * fh + 25
    _Dest d
End Sub

Sub DrawGrid (handle, NumOfLines)
    d = _Dest: _Dest handle
    Line (0, 0)-(_Width - 1, 26000), FF000000, BF
    fh = _FontHeight + 2
    Line (25, 25)-Step(_Width - 50, NumOfLines * fh), LightGray, BF
    For y = fh To NumOfLines * fh Step fh
        Line (25, 25 + y)-Step(_Width - 50, 0), DarkGray
    Next
    _Dest d
End Sub

Sub NumberConst (handle, y)
    DrawGrid handle, 31
    d = _Dest: _Dest handle
    fh = _FontHeight + 2
    For x = (_Width - 25) / 3 To _Width - 50 Step (_Width - 25) / 3
        Line (x, 25)-(x, 25 + fh * 5), Black, BF
    Next
    Color Red, 0: _PrintString (27, 29), "INTEGER SIZES"
    _PrintString ((_Width - 25) / 3 + 2, 29), "FLOAT SIZES"
    _PrintString ((_Width - 25) / 3 * 2 + 2, 25 + 4), "OTHER SIZES": Color Black, 0
    _PrintString (27, 29 + fh), "_SIZE_OF_BYTE = 1"
    _PrintString (27, 29 + fh * 2), "_SIZE_OF_INTEGER = 2"
    _PrintString (27, 29 + fh * 3), "_SIZE_OF_INTEGER64 = 8"
    _PrintString (27, 29 + fh * 4), "_SIZE_OF_LONG = 4"
    _PrintString ((_Width - 25) / 3 + 2, 29 + fh), "_SIZE_OF_DOUBLE = 8"
    _PrintString ((_Width - 25) / 3 + 2, 29 + fh * 2), "_SIZE_OF_FLOAT = 32"
    _PrintString ((_Width - 25) / 3 + 2, 29 + fh * 3), "_SIZE_OF_SINGLE = 4"
    $If 32BIT Then
        o$ = "_SIZE_OF_OFFSET = 4"
    $Else
        o$ = "_SIZE_OF_OFFSET = 8"
    $End If
    _PrintString ((_Width - 25) / 3 * 2 + 2, 29 + fh), o$

    Line (25, 29 + fh * 5)-Step(_Width - 50, fh), Black, BF
    Line ((_Width - 25) / 2, 29 + fh * 6)-Step(0, fh * 7), Black
    Color Red: _PrintString (27, 29 + fh * 6), "MIN VARIABLE VALUE (SIGNED)"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 6), "MAX VARIABLE VALUE (SIGNED)": Color Black
    _PrintString (27, 29 + fh * 7), "_BIT_MIN` = -1"
    _PrintString (27, 29 + fh * 8), "_BYTE_MIN%% = -128"
    _PrintString (27, 29 + fh * 9), "_INTEGER_MIN% = -32768"
    _PrintString (27, 29 + fh * 10), "_INTEGER64_MIN&& = -9223372036854775808"
    _PrintString (27, 29 + fh * 11), "_LONG_MIN& = -2147483648"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 7), "_BIT_MAX` = 0"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 8), "_BYTE_MAX%% = 127"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 9), "_INTEGER_MAX% = 32767"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 10), "_INTEGER64_MAX&& = 9223372036854775807"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 11), "_LONG_MAX& = 2147483647"
    $If 32BIT Then
        _PrintString (27, 29 + fh * 12), "_OFFSET_MIN& = -2147483648"
        _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 12), "_OFFSET_MAX& = 2147483647"
    $Else
        _PrintString (27, 29 + fh * 12), "_OFFSET_MIN& = -9223372036854775808"
        _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 12), "_OFFSET_MAX& = 9223372036854775807"
    $End If
    Line (25, 29 + fh * 13)-Step(_Width - 50, fh), Black, BF
    Line ((_Width - 25) / 2, 29 + fh * 14)-Step(0, fh * 7), Black
    Color Red: _PrintString (27, 29 + fh * 14), "MIN VARIABLE VALUE (UNSIGNED)"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 14), "MAX VARIABLE VALUE (UNSIGNED)": Color Black
    _PrintString (27, 29 + fh * 15), "_UBIT_MIN~` = 0"
    _PrintString (27, 29 + fh * 16), "_UBYTE_MIN~%% = 0"
    _PrintString (27, 29 + fh * 17), "_UINTEGER_MIN~% = 0"
    _PrintString (27, 29 + fh * 18), "_UINTEGER64_MIN~&& = 0"
    _PrintString (27, 29 + fh * 19), "_ULONG_MIN~& = 0"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 15), "_UBIT_MAX~` = 1"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 16), "_UBYTE_MAX~%% = 256"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 17), "_UINTEGER_MAX~% = 65535"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 18), "_UINTEGER64_MAX~&& = 18446744073709551615"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 19), "_ULONG_MAX~& = 4294967295"
    $If 32BIT Then
        _PrintString (27, 29 + fh * 20), "_UOFFSET_MIN& = 0"
        _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 20), "_UOFFSET_MAX& = 4294967295"
    $Else
        _PrintString (27, 29 + fh * 20), "_UOFFSET_MIN& = 0"
        _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 20), "_UOFFSET_MAX& = 18446744073709551615"
    $End If
    Line (25, 29 + fh * 21)-Step(_Width - 50, fh), Black, BF
    Line ((_Width - 25) / 2, 29 + fh * 21)-Step(0, fh * 6), Black
    Color Red: _PrintString (27, 29 + fh * 22), "MIN VARIABLE VALUE (FLOAT)"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 22), "MAX VARIABLE VALUE (FLOAT)": Color Black
    _PrintString (27, 29 + fh * 25), "_SINGLE_MIN! = -3.402823E+38"
    _PrintString (27, 29 + fh * 23), "_DOUBLE_MIN# = -1.797693134862315D+308"
    _PrintString (27, 29 + fh * 24), "_FLOAT_MIN## = -1.189731495357231765F+4932"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 25), "_SINGLE_MAX! = 3.402823E+38"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 23), "_DOUBLE_MAX# = 1.797693134862315D+308"
    _PrintString ((_Width - 25) / 2 + 2, 29 + fh * 24), "_FLOAT_MAX## = 1.189731495357231765F+4932"
    Line (25, 29 + fh * 26)-Step(_Width - 50, fh), Black, BF
    Color Red: _PrintString (27, 29 + fh * 27), "MINIMUM FRACTIONAL VALUE (FLOAT)": Color Black
    _PrintString (27, 29 + fh * 30), "_SINGLE_MIN_FRAC! = 1.175494E-38"
    _PrintString (27, 29 + fh * 28), "_DOUBLE_MIN_FRAC# = 2.225073858507201D-308"
    _PrintString (27, 29 + fh * 29), "_FLOAT_MIN_FRAC## = 3.362103143112093506F-4932"
    y = NumOfLines * fh + 25
    _Dest d
End Sub

Sub SystemConst (handle, y)
    NumberOfRows = 23
    DrawGrid handle, NumberOfRows
    d = _Dest: _Dest handle: fh = _FontHeight + 2
    Color Red, 0: _PrintString (25, 27), "Boolean values": Color Black, 0
    _PrintString (25, 27 + fh), "_FALSE = 0"
    _PrintString (25, 27 + fh * 2), "_TRUE = -1"
    Color Red, 0: _PrintString (25, 27 + fh * 4), "Relations": Color Black, 0
    _PrintString (25, 27 + fh * 5), "_EQUAL = 0"
    _PrintString (25, 27 + fh * 6), "_GREATER = 1"
    _PrintString (25, 27 + fh * 7), "_LESS = -1"
    Color Red, 0: _PrintString (25, 27 + fh * 9), "State values": Color Black, 0
    _PrintString (25, 27 + fh * 10), "_CLIENT_FAILED         = 0"
    _PrintString (25, 27 + fh * 11), "_CONNECTION_FAILED     = 0"
    _PrintString (25, 27 + fh * 12), "_HOST_FAILED           = 0"
    _PrintString (25, 27 + fh * 13), "_INVALID IMAGE         = -1"
    _PrintString (25, 27 + fh * 14), "_LOADFONT_FAILED       = 0"
    _PrintString (25, 27 + fh * 15), "_SNDOPEN_FAILED        = 0"
    Color Red, 0: _PrintString (25, 27 + fh * 17), "Logging values for _LOGMINLEVEL": Color Black, 0
    _PrintString (25, 27 + fh * 18), "_LOG_TRACE             = 1"
    _PrintString (25, 27 + fh * 19), "_LOG_INFO              = 2"
    _PrintString (25, 27 + fh * 20), "_LOG_WARN              = 3"
    _PrintString (25, 27 + fh * 21), "_LOG_ERROR             = 4"
    _PrintString (25, 27 + fh * 22), "_LOG_NONE              = 5"
    y = NumberOfRows * fh + 25
    _Dest d
End Sub

Sub AllConst (handle, y)
    d = _Dest: _Dest handle
    Line (0, 0)-(_Width - 1, 26000), &HFF000000, BF
    Locate 1, 1
    Color Red
    Print "Boolean values"
    Color White
    Print "_TRUE = -1, _FALSE = 0"

    Color Red
    Print "Relations (e.g. SGN and _STRCMP, _STRICMP)"
    Color White
    Print "_LESS = -1, _EQUAL = 0, _GREATER = 1"

    Color Red
    Print "State values (_OPENHOST/CLIENT/CONNECTION, _LOAD/COPYIMAGE, _LOADFONT, _SNDOPEN[RAW])"
    Color White
    Print "_HOST_FAILED = 0, _CLIENT_FAILED = 0, _CONNECTION_FAILED = 0"
    Print "_INVALID_IMAGE = -1, _LOADFONT_FAILED = 0, _SNDOPEN_FAILED = 0"

    Color Red
    Print "Some strings (see also _ASC* and _CHR* section below)"
    Color White
    Print "_STR_EMPTY = "; ""
    Print "_STR_CRLF = CHR$(13) + CHR$(10), _STR_LF = CHR$(10) 'for native use _STR_NAT_EOL below"
    $If WIN Then
        Print "_STR_NAT_EOL = CHR$(13) + CHR$(10)"
    $Else
        print "_STR_NAT_EOL = CHR$(10)"
    $End If
    Color Red
    Print "Some math"
    Color White
    Print "_E## = EXP(1.0##)"

    Color Red
    Print "Logging values for _LOGMINLEVEL"
    Color White
    Print "_LOG_TRACE = 1"
    Print "_LOG_INFO = 2"
    Print "_LOG_WARN = 3"
    Print "_LOG_ERROR = 4"
    Print "_LOG_NONE = 5"

    Color Red
    Print "Base time values"
    Color White
    Print "_SECS_IN_MIN = 60, _MINS_IN_HOUR = 60, _HOURS_IN_DAY = 24"
    Print "_DAYS_IN_WEEK = 7, _DAYS_IN_YEAR = 365"

    Color Red
    Print "Derived time values"
    Color White
    Print "_SECS_IN_HOUR = _MINS_IN_HOUR * _SECS_IN_MIN"
    Print "_SECS_IN_DAY = _HOURS_IN_DAY * _SECS_IN_HOUR"
    Print "_SECS_IN_WEEK = _DAYS_IN_WEEK * _SECS_IN_DAY"
    Print "_SECS_IN_YEAR = _DAYS_IN_YEAR * _SECS_IN_DAY"
    Print "_SECS_IN_LEAPYEAR = _SECS_IN_YEAR + _SECS_IN_DAY"
    Print "_MINS_IN_DAY = _HOURS_IN_DAY * _MINS_IN_HOUR"
    Print "_MINS_IN_WEEK = _DAYS_IN_WEEK * _MINS_IN_DAY"
    Print "_MINS_IN_YEAR = _DAYS_IN_YEAR * _MINS_IN_DAY"
    Print "_MINS_IN_LEAPYEAR = _MINS_IN_YEAR + _MINS_IN_DAY"
    Print "_HOURS_IN_WEEK = _DAYS_IN_WEEK * _HOURS_IN_DAY"
    Print "_HOURS_IN_YEAR = _DAYS_IN_YEAR * _HOURS_IN_DAY"
    Print "_HOURS_IN_LEAPYEAR = _HOURS_IN_YEAR + _HOURS_IN_DAY"
    Print "_DAYS_IN_LEAPYEAR = _DAYS_IN_YEAR + 1"
    Print "_WEEKS_IN_YEAR = _DAYS_IN_YEAR / _DAYS_IN_WEEK"
    Print "_WEEKS_IN_LEAPYEAR = _DAYS_IN_LEAPYEAR / _DAYS_IN_WEEK"

    Color Red
    Print "Binary size factors"
    Color White
    Print "_ONE_KB = 1024 '            ' 2^10"
    Print "_ONE_MB = _ONE_KB * _ONE_KB ' 2^20"
    Print "_ONE_GB = _ONE_MB * _ONE_KB ' 2^30"
    Print "_ONE_TB = _ONE_GB * _ONE_KB ' 2^40"
    Print "_ONE_PB = _ONE_TB * _ONE_KB ' 2^50"
    Print "_ONE_EB = _ONE_PB * _ONE_KB ' 2^60"

    Color Red
    Print "Sizes of elementary integer types (in bytes)"
    Color White
    Print "_SIZE_OF_BYTE = 1"
    Print "_SIZE_OF_INTEGER = 2"
    Print "_SIZE_OF_LONG = 4"
    Print "_SIZE_OF_INTEGER64 = 8"
    Color Red
    Print "Sizes of elementary floating point types (in bytes)"
    Color White
    Print "_SIZE_OF_SINGLE = 4"
    Print "_SIZE_OF_DOUBLE = 8"
    Print "_SIZE_OF_FLOAT = 32"
    Color Red
    Print "Sizes of elementary pointer types (in bytes)"
    Color White
    $If 32BIT Then
        print "_SIZE_OF_OFFSET = 4"
    $Else
        Print "_SIZE_OF_OFFSET = 8"
    $End If

    Color Red
    Print "Limits of elementary integer types (min/max values)"
    Color White
    Print "_BIT_MIN` = -1, _BIT_MAX` = 0"
    Print "_UBIT_MIN~` = 0, _UBIT_MAX~` = 1"
    Print "_BYTE_MIN%% = -128, _BYTE_MAX%% = 127"
    Print "_UBYTE_MIN~%% = 0, _UBYTE_MAX~%% = 255"
    Print "_INTEGER_MIN% = -32768, _INTEGER_MAX% = 32767"
    Print "_UINTEGER_MIN~% = 0, _UINTEGER_MAX~% = 65535"
    Print "_LONG_MIN& = -2147483648, _LONG_MAX& = 2147483647"
    Print "_ULONG_MIN~& = 0, _ULONG_MAX~& = 4294967295"
    Print "_INTEGER64_MIN&& = -9223372036854775808, _INTEGER64_MAX&& = 9223372036854775807"
    Print "_UINTEGER64_MIN~&& = 0, _UINTEGER64_MAX~&& = 18446744073709551615"
    Color Red
    Print "Limits of elementary floating point types (min/max values)"
    Color White
    Print "_SINGLE_MIN! = -3.402823E+38, _SINGLE_MAX! = 3.402823E+38"
    Print "_SINGLE_MIN_FRAC! = 1.175494E-38"
    Print "_DOUBLE_MIN# = -1.797693134862315D+308, _DOUBLE_MAX# = 1.797693134862315D+308"
    Print "_DOUBLE_MIN_FRAC# = 2.225073858507201D-308"
    Print "_FLOAT_MIN## = -1.189731495357231765F+4932, _FLOAT_MAX## = 1.189731495357231765F+4932"
    Print "_FLOAT_MIN_FRAC## = 3.362103143112093506F-4932"

    Color Red
    Print "Limits of elementary pointer types (min/max values)"
    Color White
    $If 32BIT Then
        print "_OFFSET_MIN& = -2147483648, _OFFSET_MAX& = 2147483647"
        print "_UOFFSET_MIN~& = 0, _UOFFSET_MAX~& = 4294967295"
    $Else
        Print "_OFFSET_MIN&& = -9223372036854775808, _OFFSET_MAX&& = 9223372036854775807"
        Print "_UOFFSET_MIN~&& = 0, _UOFFSET_MAX~&& = 18446744073709551615"
    $End If

    Color Red
    Print "Control char codes (ASC + CHR$)"
    Color White
    Print "_ASC_NUL = 0, _CHR_NUL = CHR$(0) '     Null"
    Print "_ASC_SOH = 1, _CHR_SOH = CHR$(1) '     Start of Heading"
    Print "_ASC_STX = 2, _CHR_STX = CHR$(2) '     Start of Text"
    Print "_ASC_ETX = 3, _CHR_ETX = CHR$(3) '     End of Text"
    Print "_ASC_EOT = 4, _CHR_EOT = CHR$(4) '     End of Transmission"
    Print "_ASC_ENQ = 5, _CHR_ENQ = CHR$(5) '     Enquiry"
    Print "_ASC_ACK = 6, _CHR_ACK = CHR$(6) '     Acknowledge"
    Print "_ASC_BEL = 7, _CHR_BEL = CHR$(7) '     Bell"
    Print "_ASC_BS = 8, _CHR_BS = CHR$(8) '       Backspace"
    Print "_ASC_HT = 9, _CHR_HT = CHR$(9) '       Horizontal Tab"
    Print "_ASC_LF = 10, _CHR_LF = CHR$(10) '     Line Feed"
    Print "_ASC_VT = 11, _CHR_VT = CHR$(11) '     Vertical Tab"
    Print "_ASC_FF = 12, _CHR_FF = CHR$(12) '     Form Feed"
    Print "_ASC_CR = 13, _CHR_CR = CHR$(13) '     Carriage Return"
    Print "_ASC_SO = 14, _CHR_SO = CHR$(14) '     Shift Out"
    Print "_ASC_SI = 15, _CHR_SI = CHR$(15) '     Shift In"
    Print "_ASC_DLE = 16, _CHR_DLE = CHR$(16) '   Data Link Escape"
    Print "_ASC_DC1 = 17, _CHR_DC1 = CHR$(17) '   Device Control 1"
    Print "_ASC_DC2 = 18, _CHR_DC2 = CHR$(18) '   Device Control 2"
    Print "_ASC_DC3 = 19, _CHR_DC3 = CHR$(19) '   Device Control 3"
    Print "_ASC_DC4 = 20, _CHR_DC4 = CHR$(20) '   Device Control 4"
    Print "_ASC_NAK = 21, _CHR_NAK = CHR$(21) '   Negative Acknowledge"
    Print "_ASC_SYN = 22, _CHR_SYN = CHR$(22) '   Synchronous Idle"
    Print "_ASC_ETB = 23, _CHR_ETB = CHR$(23) '   End of Transmission Block"
    Print "_ASC_CAN = 24, _CHR_CAN = CHR$(24) '   Cancel"
    Print "_ASC_EM = 25, _CHR_EM = CHR$(25) '     End of Medium"
    Print "_ASC_SUB = 26, _CHR_SUB = CHR$(26) '   Substitute"
    Print "_ASC_ESC = 27, _CHR_ESC = CHR$(27) '   Escape"
    Print "_ASC_FS = 28, _CHR_FS = CHR$(28) '     File Separator"
    Print "_ASC_GS = 29, _CHR_GS = CHR$(29) '     Group Separator"
    Print "_ASC_RS = 30, _CHR_RS = CHR$(30) '     Record Separator"
    Print "_ASC_US = 31, _CHR_US = CHR$(31) '     Unit Separator"
    Print "_ASC_DEL = 127, _CHR_DEL = CHR$(127) ' Delete"

    Color Red
    Print "Normal char codes (exluding 0-9/Aa-Zz)"
    Color White

    Print "_ASC_SPACE = 32, _CHR_SPACE = CHR$(32)"
    Print "_ASC_EXCLAMATION = 33, _CHR_EXCLAMATION = CHR$(33) '               !"
    Print "_ASC_QUOTE = 34, _CHR_QUOTE = CHR$(34) '                           "
    Print "_ASC_HASH = 35, _CHR_HASH = CHR$(35) '                             #"
    Print "_ASC_DOLLAR = 36, _CHR_DOLLAR = CHR$(36) '                         $"
    Print "_ASC_PERCENT = 37, _CHR_PERCENT = CHR$(37) '                       %"
    Print "_ASC_AMPERSAND = 38, _CHR_AMPERSAND = CHR$(38) '                   &"
    Print "_ASC_APOSTROPHE = 39, _CHR_APOSTROPHE = CHR$(39) '                 '"
    Print "_ASC_LEFTBRACKET = 40, _CHR_LEFTBRACKET = CHR$(40) '               ("
    Print "_ASC_RIGHTBRACKET = 41, _CHR_RIGHTBRACKET = CHR$(41) '             )"
    Print "_ASC_ASTERISK = 42, _CHR_ASTERISK = CHR$(42) '                     *"
    Print "_ASC_PLUS = 43, _CHR_PLUS = CHR$(43) '                             +"
    Print "_ASC_COMMA = 44, _CHR_COMMA = CHR$(44) '                           ,"
    Print "_ASC_MINUS = 45, _CHR_MINUS = CHR$(45) '                           -"
    Print "_ASC_FULLSTOP = 46, _CHR_FULLSTOP = CHR$(46) '                     ."
    Print "_ASC_FORWARDSLASH = 47, _CHR_FORWARDSLASH = CHR$(47) '             /"
    Print "_ASC_COLON = 58, _CHR_COLON = CHR$(58) '                           :"
    Print "_ASC_SEMICOLON = 59, _CHR_SEMICOLON = CHR$(59) '                   ;"
    Print "_ASC_LESSTHAN = 60, _CHR_LESSTHAN = CHR$(60) '                     <"
    Print "_ASC_EQUAL = 61, _CHR_EQUAL = CHR$(61) '                           ="
    Print "_ASC_GREATERTHAN = 62, _CHR_GREATERTHAN = CHR$(62) '               >"
    Print "_ASC_QUESTION = 63, _CHR_QUESTION = CHR$(63) '                     ?"
    Print "_ASC_ATSIGN = 64, _CHR_ATSIGN = CHR$(64) '                         @"
    Print "_ASC_LEFTSQUAREBRACKET = 91, _CHR_LEFTSQUAREBRACKET = CHR$(91) '   ["
    Print "_ASC_BACKSLASH = 92, _CHR_BACKSLASH = CHR$(92) '                   \"
    Print "_ASC_RIGHTSQUAREBRACKET = 93, _CHR_RIGHTSQUAREBRACKET = CHR$(93) ' ]"
    Print "_ASC_CARET = 94, _CHR_CARET = CHR$(94) '                           ^"
    Print "_ASC_UNDERSCORE = 95, _CHR_UNDERSCORE = CHR$(95) '                 _"
    Print "_ASC_GRAVE = 96, _CHR_GRAVE = CHR$(96) '                           `"
    Print "_ASC_LEFTCURLYBRACKET = 123, _CHR_LEFTCURLYBRACKET = CHR$(123) '   {"
    Print "_ASC_VERTICALBAR = 124, _CHR_VERTICALBAR = CHR$(124) '             |"
    Print "_ASC_RIGHTCURLYBRACKET = 125, _CHR_RIGHTCURLYBRACKET = CHR$(125) ' }"
    Print "_ASC_TILDE = 126, _CHR_TILDE = CHR$(126) '                         ~"

    Color Red
    Print "_KEYDOWN/_KEYHIT codes"
    Color White
    Print "_KEY_LSHIFT = 100304, _KEY_RSHIFT = 100303"
    Print "_KEY_LCTRL = 100306, _KEY_RCTRL = 100305"
    Print "_KEY_LALT = 100308, _KEY_RALT = 100307"
    Print "_KEY_LAPPLE = 100310, _KEY_RAPPLE = 100309"
    Print "_KEY_F1 = 15104, _KEY_F2 = 15360, _KEY_F3 = 15616, _KEY_F4 = 15872"
    Print "_KEY_F5 = 16128, _KEY_F6 = 16384, _KEY_F7 = 16640, _KEY_F8 = 16896"
    Print "_KEY_F9 = 17152, _KEY_F10 = 17408, _KEY_F11 = 34048, _KEY_F12 = 34304"
    Print "_KEY_INSERT = 20992, _KEY_DELETE = 21248"
    Print "_KEY_HOME = 18176, _KEY_END = 20224"
    Print "_KEY_PAGEUP = 18688, _KEY_PAGEDOWN = 20736"
    Print "_KEY_LEFT = 19200, _KEY_RIGHT = 19712, _KEY_UP = 18432, _KEY_DOWN = 20480"
    Print "_KEY_BACKSPACE = 8, _KEY_TAB = 9, _KEY_ENTER = 13, _KEY_ESC = 27"

    Color Red
    Print "ERROR codes (ERROR n triggers an error, n = ERR will return the last occurred error)"
    Color White
    Print "_ERR_NONE = 0 'for compare with ERR only !!"
    Print "_ERR_NEXT_WITHOUT_FOR = 1"
    Print "_ERR_SYNTAX_ERROR = 2"
    Print "_ERR_RETURN_WITHOUT_GOSUB = 3"
    Print "_ERR_OUT_OF_DATA = 4"
    Print "_ERR_ILLEGAL_FUNCTION_CALL = 5"
    Print "_ERR_OVERFLOW = 6"
    Print "_ERR_OUT_OF_MEMORY = 7"
    Print "_ERR_LABEL_NOT_DEFINED = 8"
    Print "_ERR_SUBSCRIPT_OUT_OF_RANGE = 9"
    Print "_ERR_DUPLICATE_DEFINITION = 10"
    Print "_ERR_DIVISION_BY_ZERO = 11"
    Print "_ERR_ILLEGAL_IN_DIRECT_MODE = 12"
    Print "_ERR_TYPE_MISMATCH = 13"
    Print "_ERR_OUT_OF_STRING_SPACE = 14"
    Print "_ERR_STRING_FORMULA_TOO_COMPLEX = 16"
    Print "_ERR_CANNOT_CONTINUE = 17"
    Print "_ERR_FUNCTION_NOT_DEFINED = 18"
    Print "_ERR_NO_RESUME = 19"
    Print "_ERR_RESUME_WITHOUT_ERROR = 20"
    Print "_ERR_DEVICE_TIMEOUT = 24"
    Print "_ERR_DEVICE_FAULT = 25"
    Print "_ERR_FOR_WITHOUT_NEXT = 26"
    Print "_ERR_OUT_OF_PAPER = 27"
    Print "_ERR_WHILE_WITHOUT_WEND = 29"
    Print "_ERR_WEND_WITHOUT_WHILE = 30"
    Print "_ERR_DUPLICATE_LABEL = 33"
    Print "_ERR_SUBPROGRAM_NOT_DEFINED = 35"
    Print "_ERR_ARGUMENT_COUNT_MISMATCH = 37"
    Print "_ERR_ARRAY_NOT_DEFINED = 38"
    Print "_ERR_VARIABLE_REQUIRED = 40"
    Print "_ERR_FIELD_OVERFLOW = 50"
    Print "_ERR_INTERNAL_ERROR = 51"
    Print "_ERR_BAD_FILE_NAME_OR_NUMBER = 52"
    Print "_ERR_FILE_NOT_FOUND = 53"
    Print "_ERR_BAD_FILE_MODE = 54"
    Print "_ERR_FILE_ALREADY_OPEN = 55"
    Print "_ERR_FIELD_STATEMENT_ACTIVE = 56"
    Print "_ERR_DEVICE_IO_ERROR = 57"
    Print "_ERR_FILE_ALREADY_EXISTS = 58"
    Print "_ERR_BAD_RECORD_LENGTH = 59"
    Print "_ERR_DISK_FULL = 61"
    Print "_ERR_INPUT_PAST_END_OF_FILE = 62"
    Print "_ERR_BAD_RECORD_NUMBER = 63"
    Print "_ERR_BAD_FILE_NAME = 64"
    Print "_ERR_TOO_MANY_FILES = 67"
    Print "_ERR_DEVICE_UNAVAILABLE = 68"
    Print "_ERR_COMMUNICATION_BUFFER_OVERFLOW = 69"
    Print "_ERR_PERMISSION_DENIED = 70"
    Print "_ERR_DISK_NOT_READY = 71"
    Print "_ERR_DISK_MEDIA_ERROR = 72"
    Print "_ERR_FEATURE_UNAVAILABLE = 73"
    Print "_ERR_RENAME_ACROSS_DISKS = 74"
    Print "_ERR_PATH_FILE_ACCESS_ERROR = 75"
    Print "_ERR_PATH_NOT_FOUND = 76"
    Print "_ERR_INVALID_HANDLE = 258"
    y = (CsrLin - 1) * _FontHeight
    _Display
    _Dest d
End Sub
