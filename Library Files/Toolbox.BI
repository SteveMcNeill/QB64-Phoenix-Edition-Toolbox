'$Let INCLUDE_ALL = TRUE
'Option _Explicit
'Let above is only enabled to allow the auto-formatting and syntax checking to run.
'Be certain to disable if before saving or using this file.


$If INCLUDE_ALL = TRUE OR INCLUDE_MOUSE = TRUE OR INCLUDE_MOUSEBUTTONSTATUS = TRUE Then
    $If MOUSEBUTTONSTATUS_BI = UNDEFINED Then
            $Let MOUSEBUTTONSTATUS_BI = TRUE
            Dim Shared As Long Mouse_StartX, Mouse_StartY, Mouse_EndX, Mouse_EndY
    $End If
$End If

$If INCLUDE_ALL = TRUE OR INCLUDE_FILE = TRUE OR INCLUDE_GETFILELIST = TRUE Then
    $If GETFILELIST_BI = UNDEFINED Then
            $Let GETFILELIST_BI = TRUE
            ReDim Shared FileList(0) As String
    $End If
$End If

$If INCLUDE_ALL = TRUE OR INCLUDE_SOUND = TRUE OR INCLUDE_SPEECH = TRUE Then
    $If SPEAK_BI = UNDEFINED Then
            $Let SPEAK_BI = TRUE
            Type SpeechType
            Speaker As Integer
            Speed As Integer
            Volume As Integer
            File As String
            End Type
            Dim Shared Speech As SpeechType
    $End If
$End If

'Commonly used CONST values which can be extremely useful inside programs:
$If INCLUDE_CONST = FALSE Then
        'Don't include anything if the user specifies that CONST usage is FALSE
$Else
    $If INCLUDE_COMMONCONST = FALSE Then
            'Don't include anything if the user specifies that COMMONCONST usage is FALSE
    $Else
        $If INCLUDE_ALL = TRUE OR INCLUDE_CONST = TRUE OR INCLUDE_COMMONCONST = TRUE Then
            $If COMMONCONST_BI = UNDEFINED Then
                    $Let COMMONCONST_BI = TRUE
                    Const True%% = -1%%
                    Const False%% = 0%%
                $If WIN Then
                        Const Slash$ = "\"
                $Else
                        Const Slash$ = "/"
                $End If
                    Dim Shared As String MyAppPath, MyAppName, MyAppFullPath, Quote '  These are shared strings, but they need to be gotten at the start of a program.
                    MyAppPath = _CWD$ '                                                I'll grab them here and just pretend that they're CONST.
                    MyAppName = Mid$(Command$(0), _InStrRev(Command$(0), Slash$) + 1) 'Shhh... don't tell anyone.  It'll be our little secret!
                    MyAppFullPath = MyAppPath + Slash + MyAppName
                    Quote = Chr$(34)
            $End If
        $End If
    $End If

    'Variable Type Limits
    $If INCLUDE_VARIABLELIMITSCONST = FALSE Then
            'Don't include anything if the user specifies that VARIABLELIMITSCONST usage is FALSE
    $Else
        $If INCLUDE_ALL = TRUE OR INCLUDE_CONST = TRUE OR INCLUDE_VIARIABLELIMITSCONST = TRUE Then
            $If VARIABLELIMITS_BI = UNDEFINED Then
                    $Let VARIABLELIMITS_BI = TRUE
                    Const Bit_Min` = -1`, Bit_Max` = 0`
                    Const UBit_Min~` = 0~`, UBit_Max~` = 1~`
                    Const Byte_Min%% = -128%%, Byte_Max%% = 127%%
                    Const UByte_Min~%% = 0~%%, UByte_Max~%% = 255~%%
                    Const Integer_Min% = -32768%, Integer_Max% = 32767%
                    Const UInteger_Min~% = 0~%, UInteger_Max~% = 65535~%
                    Const Long_Min& = -2147483648&, Long_Max& = 2147483647&
                    Const ULong_Min~& = 0~&, ULong_Max~& = 4294967295~&
                    Const Integer64_Min&& = -9223372036854775808&&, Integer64_Max&& = 9223372036854775807&&
                    Const UInteger64_Min~&& = 0~&&, UInteger64_Max~&& = 18446744073709551615~&&
                    Const Single_Min! = -2.802597E-45, Single_Max! = 3.402823E+38
                    Const Double_Min# = -4.490656458412465E-324, Double_Max# = 1.797693134862310E+308
                    Const Float_Min## = -1.18E-4932, Float_Max## = 1.18E+4932
                $If 32BIT Then
                        Const Offset_Min& = -2147483648&, Offset_Max = 2147483647&
                        Const UOffset_Min~& = 0~&, UOffset_Max~& = 4294967295~&
                $Else
                        Const Offset_Min&& = -9223372036854775808&&, Offset_Max&& = 9223372036854775807&&
                        Const UOffset_Min~&& = 0~&&, UOffset_Max~&& = 18446744073709551615~&&
                $End If
            $End If
        $End If
    $End If

    'Keyhit Values
    $If INCLUDE_KEYHITCONST = FALSE Then
            'Don't include anything if the user specifies that KEYHITCONST usage is FALSE
    $Else
        $If INCLUDE_ALL = TRUE OR INCLUDE_CONST = TRUE OR INCLUDE_KEYHITCONST = TRUE Then
            $If KEYHITCONST_BI = UNDEFINED Then
                    $Let KEYHITCONST_BI = TRUE
                    Const Key_Backspace = 8
                    Const Key_Tab = 9
                    Const Key_Enter = 13
                    Const Key_Shift = 16
                    Const Key_Control = 17
                    Const Key_Alt = 18
                    Const Key_CapsLock = 20
                    Const Key_ESC = 27
                    Const Key_Space = 32
                    Const Key_LeftShift = 100304
                    Const Key_RightShift = 100303
                    Const Key_LeftCtrl = 100306
                    Const Key_RightCtrl = 100305
                    Const Key_LeftAlt = 100308
                    Const Key_RightAlt = 100307
                    Const Key_PageUp = 18688
                    Const Key_PageDown = 20736
                    Const Key_LeftArrow = 19200, Key_Left = 19200
                    Const Key_RightArrow = 19712, Key_Right = 19712
                    Const Key_UpArrow = 18432, Key_Up = 18432
                    Const Key_DownArrow = 20480, Key_Down = 20480
                    Const Key_F1 = 15104
                    Const Key_F2 = 15360
                    Const Key_F3 = 15616
                    Const Key_F4 = 15872
                    Const Key_F5 = 16128
                    Const Key_F6 = 16384
                    Const Key_F7 = 16640
                    Const Key_F8 = 16896
                    Const Key_F9 = 17152
                    Const Key_F10 = 17408
                    Const Key_F11 = 34048
                    Const Key_F12 = 34304
                    Const Key_Home = 18176
                    Const Key_Delete = 21248
                    Const Key_Insert = 20992
                    Const Key_Win = 100311
                    Const Key_Menu = 100319
                    Const Key_PrintScreen = 900044
                    Const Key_ScrollLock = 100302
                    Const Key_Accent = 96
                    Const Key_Tilde = 126
                    Const Key_1 = 49
                    Const Key_2 = 50
                    Const Key_3 = 51
                    Const Key_4 = 52
                    Const Key_5 = 53
                    Const Key_6 = 54
                    Const Key_7 = 55
                    Const Key_8 = 56
                    Const Key_9 = 57
                    Const Key_0 = 48
                    Const Key_Minus = 45, Key_Dash = 45, Key_Subtract = 45
                    Const Key_Equal = 61
                    Const Key_Exclaim = 33
                    Const Key_At = 64
                    Const Key_Pound = 35
                    Const Key_Dollar = 36
                    Const Key_Percent = 37
                    Const Key_Power = 94, Key_Caret = 94
                    Const Key_And = 38
                    Const Key_Star = 42, Key_Multiply = 42
                    Const Key_LeftParen = 40
                    Const Key_RightParen = 41
                    Const Key_Underscore = 95
                    Const Key_Plus = 43, Key_Add = 43
                    Const Key_LowerCase = 32 '      Add to key values to get lowercase characters
                    Const Key_A = 65, Key_A_Low = 97 'for example, 65 is A.  65 + 32 = a (97)
                    Const Key_B = 66, Key_B_Low = 98 'So it's basically IF Key_B AND Key_LowerCase THEN 'it's a "b"
                    Const Key_C = 67, Key_C_Low = 99
                    Const Key_D = 68, Key_D_Low = 10
                    Const Key_E = 69, Key_E_Low = 101
                    Const Key_F = 70, Key_F_Low = 102
                    Const Key_G = 71, Key_G_Low = 103
                    Const Key_H = 72, Key_H_Low = 104
                    Const Key_I = 73, Key_I_Low = 105
                    Const Key_J = 74, Key_J_Low = 106
                    Const Key_K = 75, Key_K_Low = 107
                    Const Key_L = 76, Key_L_Low = 108
                    Const Key_M = 77, Key_M_Low = 109
                    Const Key_N = 78, Key_N_Low = 110
                    Const Key_O = 79, Key_O_Low = 111
                    Const Key_P = 80, Key_P_Low = 112
                    Const Key_Q = 81, Key_Q_Low = 113
                    Const Key_R = 82, Key_R_Low = 114
                    Const Key_S = 83, Key_S_Low = 115
                    Const Key_T = 84, Key_T_Low = 116
                    Const Key_U = 85, Key_U_Low = 117
                    Const Key_V = 86, Key_V_Low = 118
                    Const Key_W = 87, Key_W_Low = 119
                    Const Key_X = 88, Key_X_Low = 110
                    Const Key_Y = 89, Key_Y_Low = 111
                    Const Key_Z = 90, Key_Z_Low = 112
                    Const Key_LeftBrace = 91, Key_LeftBracket = 91
                    Const Key_RightBrace = 93, Key_RightBracket = 93
                    Const Key_BackSlash = 92
                    Const Key_LeftCurly = 123
                    Const Key_RightCurly = 125
                    Const Key_Pipe = 124
                    Const Key_Semicolon = 59
                    Const Key_Colon = 58
                    Const Key_Apostrophy = 39
                    Const Key_Quote = 34
                    Const Key_Comma = 44
                    Const Key_Period = 46, Key_Dot = 46
                    Const Key_ForwardSlash = 47, Key_Slash = 47
                    Const Key_LessThan = 60
                    Const Key_GreaterThan = 62
                    Const Key__QuestionMark = 63, Key_Question = 63
                    'Note that the following keys are listed as 900000+.  These are KeyHit codes from my KeyHit library and not _KEYHIT values.
                    'For _KEYHIT values, drop the 900 in front, and QB64-PE will report the other values on a KEYUP event only.
                    'So you can read Mute, but it'll *ONLY* read as -173, and that's *only* when you release the key.
                    'None of these read at all for us on keydown events.
                    Const Key_Mute = 900173
                    Const Key_VolUp = 900174
                    Const Key_VolDown = 900175
                    Const Key_Stop = 900178
                    Const Key_Rewind = 900177
                    Const Key_Forward = 900176
                    Const Key_Play = 900179
                    'And for the following, these are also 900000+ KeyHit library codes.  These are mouse events that QB64-PE simply fails to recognize
                    'at all.  These neither register with _KEYHIT as a keydown, nor a keyup event.  As far as _KEYHIT is concerned, these keys
                    'simply don't exist!
                    Const Key_LeftMouse = 900001
                    Const Key_RightMouse = 900002
                    Const Key_MiddleMouse = 900004
                    Const Key_Mouse4 = 900005
                    Const Key_Mouse5 = 900006
            $End If
        $End If
    $End If
$End If
