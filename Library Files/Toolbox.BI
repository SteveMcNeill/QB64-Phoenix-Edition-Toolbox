$Let INCLUDE_ALL = TRUE
Option _Explicit
'Let above is only enabled to allow the auto-formatting and syntax checking to run.
'Be certain to disable if before saving or using this file.


$If INCLUDE_ALL = TRUE OR INCLUDE_MOUSE = TRUE OR INCLUDE_MOUSEBUTTONSTATUS = TRUE Then
    $If MOUSEBUTTONSTATUS_BI = UNDEFINED Then
        $Let MOUSEBUTTONSTATUS_BI = TRUE
        Dim Shared As Long Mouse_StartX, Mouse_StartY, Mouse_EndX, Mouse_EndY
    $End If
$End If

