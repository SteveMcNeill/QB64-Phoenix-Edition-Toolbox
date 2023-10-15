'$LET INCLUDE_ALL = TRUE
'OPTION _EXPLICIT
'Let above is only enabled to allow the auto-formatting and syntax checking to run.
'Be certain to disable if before saving or using this file.


$IF INCLUDE_ALL = TRUE OR INCLUDE_MOUSE = TRUE OR INCLUDE_MOUSEBUTTONSTATUS = TRUE THEN
    $IF MOUSEBUTTONSTATUS_BI = UNDEFINED THEN
            $LET MOUSEBUTTONSTATUS_BI = TRUE
            DIM SHARED AS LONG Mouse_StartX, Mouse_StartY, Mouse_EndX, Mouse_EndY
    $END IF
$END IF

$IF INCLUDE_ALL = TRUE OR INCLUDE_FILE = TRUE OR INCLUDE_GETFILELIST = TRUE THEN
    $IF GETFILELIST_BI = UNDEFINED THEN
            $LET GETFILELIST_BI = TRUE
            REDIM SHARED FileList(0) AS STRING
    $END IF
$END IF

