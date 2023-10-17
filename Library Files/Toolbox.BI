'$Let INCLUDE_ALL = TRUE
'OPTION _EXPLICIT
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
