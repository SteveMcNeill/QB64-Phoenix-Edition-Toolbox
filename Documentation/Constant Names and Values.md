#### INCLUDE_COMMONCONST
    True = -1
    False = 0
    MyAppPath = (The starting directory of where the compiled program begins to run from.)
    MyAppName = (Tha name of the compiled program, once it becomes an executable program.)
    MyAppFullPath = (The full directory path plus filename of the compiled executable.)
    Quote = Chr$(34)
    Slash$ = "\" (Windows)
    Slash$ = "/" (Linux or Mac)

#### INCLUDE_VARIABLELIMITSCONST
SIGNED MIN | SIGNED MAX | UNSIGNED MIN | UNSIGNED MAX
---|---|---|---
Bit_Min = -1 | Bit_Max = 0 | UBit_Min = 0 | UBit_Max = 1
Byte_Min = -128 | Byte_Max%% = 127 | UByte_Min = 0 | UByte_Max = 256
Integer_Min = -32768 | Integer_Max = 32767 | UInteger_Min = 0 |UInteger_Max = 65535
Long_Min = -2147483648 | Long_Max = 2147483647 | ULong_Min = 0 | ULong_Max = 4294967295
Integer64_Min = -9223372036854775808 | Integer64_Max = 9223372036854775807 | UInteger64_Min = 0 | UInteger64_Max = 18446744073709551615
Single_Min = -2.802597E-45 | Single_Max = 3.402823E+38
Double_Min = -4.490656458412465E-324 | Double_Max# = 1.797693134862310E+308
Float_Min = -1.18E-4932 | Float_Max## = 1.18E+4932
(32-bit) Offset_Min = -2147483648& | (32-bit) Offset_Max = 2147483647&
(64-bit) Offset_Min = -9223372036854775808&& | (64-bit) Offset_Max&& = 9223372036854775807&&
(32-bit) UOffset_Min = 0 | (32-bit) UOffset_Max = 4294967295
(64-bit) UOffset_Min = 0 | (64-bit) UOffset_Max = 18446744073709551615


#### INCLUDE_KEYHITCONST
    Key_Backspace = 8
    Key_Tab = 9
    Key_Enter = 13
    Key_Shift = 16
    Key_Control = 17
    Key_Alt = 18
    Key_CapsLock = 20
    Key_ESC = 27
    Key_Space = 32
    Key_LeftShift = 100304
    Key_RightShift = 100303
    Key_LeftCtrl = 100306
    Key_RightCtrl = 100305
    Key_LeftAlt = 100308
    Key_RightAlt = 100307
    Key_PageUp = 18688
    Key_PageDown = 20736
    Key_LeftArrow = 19200, Key_Left = 19200
    Key_RightArrow = 19712, Key_Right = 19712
    Key_UpArrow = 18432, Key_Up = 18432
    Key_DownArrow = 20480, Key_Down = 20480
    Key_F1 = 15104
    Key_F2 = 15360
    Key_F3 = 15616
    Key_F4 = 15872
    Key_F5 = 16128
    Key_F6 = 16384
    Key_F7 = 16640
    Key_F8 = 16896
    Key_F9 = 17152
    Key_F10 = 17408
    Key_F11 = 34048
    Key_F12 = 34304
    Key_Home = 18176
    Key_Delete = 21248
    Key_Insert = 20992
    Key_Win = 100311
    Key_Menu = 100319
    Key_PrintScreen = 900044
    Key_ScrollLock = 100302
    Key_Accent = 96
    Key_Tilde = 126
    Key_1 = 49
    Key_2 = 50
    Key_3 = 51
    Key_4 = 52
    Key_5 = 53
    Key_6 = 54
    Key_7 = 55
    Key_8 = 56
    Key_9 = 57
    Key_0 = 48
    Key_Minus = 45, Key_Dash = 45, Key_Subtract = 45
    Key_Equal = 61
    Key_Exclaim = 33
    Key_At = 64
    Key_Pound = 35
    Key_Dollar = 36
    Key_Percent = 37
    Key_Power = 94, Key_Caret = 94
    Key_And = 38
    Key_Star = 42, Key_Multiply = 42
    Key_LeftParen = 40
    Key_RightParen = 41
    Key_Underscore = 95
    Key_Plus = 43, Key_Add = 43
    Key_LowerCase = 32 '      Add to key values to get lowercase characters
    Key_A = 65, Key_A_Low = 97 'for example, 65 is A.  65 + 32 = a (97)
    Key_B = 66, Key_B_Low = 98 'So it's basically IF Key_B AND Key_LowerCase THEN 'it's a "b"
    Key_C = 67, Key_C_Low = 99
    Key_D = 68, Key_D_Low = 10
    Key_E = 69, Key_E_Low = 101
    Key_F = 70, Key_F_Low = 102
    Key_G = 71, Key_G_Low = 103
    Key_H = 72, Key_H_Low = 104
    Key_I = 73, Key_I_Low = 105
    Key_J = 74, Key_J_Low = 106
    Key_K = 75, Key_K_Low = 107
    Key_L = 76, Key_L_Low = 108
    Key_M = 77, Key_M_Low = 109
    Key_N = 78, Key_N_Low = 110
    Key_O = 79, Key_O_Low = 111
    Key_P = 80, Key_P_Low = 112
    Key_Q = 81, Key_Q_Low = 113 
    Key_R = 82, Key_R_Low = 114
    Key_S = 83, Key_S_Low = 115
    Key_T = 84, Key_T_Low = 116
    Key_U = 85, Key_U_Low = 117
    Key_V = 86, Key_V_Low = 118
    Key_W = 87, Key_W_Low = 119
    Key_X = 88, Key_X_Low = 110
    Key_Y = 89, Key_Y_Low = 111
    Key_Z = 90, Key_Z_Low = 112
    Key_LeftBrace = 91, Key_LeftBracket = 91
    Key_RightBrace = 93, Key_RightBracket = 93
    Key_BackSlash = 92
    Key_LeftCurly = 123
    Key_RightCurly = 125
    Key_Pipe = 124
    Key_Semicolon = 59
    Key_Colon = 58
    Key_Apostrophy = 39
    Key_Quote = 34
    Key_Comma = 44
    Key_Period = 46, Key_Dot = 46
    Key_ForwardSlash = 47, Key_Slash = 47
    Key_LessThan = 60
    Key_GreaterThan = 62
    Key__QuestionMark = 63, Key_Question = 63
```html
- 'Note that the following keys are listed as 900000+.  These are KeyHit codes from my KeyHit library and not _KEYHIT values.
- 'For _KEYHIT values, drop the 900 in front, and QB64-PE will report the other values on a KEYUP event only.
  'So you can read Mute, but it'll *ONLY* read as -173, and that's *only* when you release the key.
- 'None of these read at all for us on keydown events.
```
    Key_Mute = 900173
    Key_VolUp = 900174
    Key_VolDown = 900175
    Key_Stop = 900178
    Key_Rewind = 900177
    Key_Forward = 900176
    Key_Play = 900179
    Key_LeftMouse = 900001
    Key_RightMouse = 900002
    Key_MiddleMouse = 900004
    Key_Mouse4 = 900005
    Key_Mouse5 = 900006
