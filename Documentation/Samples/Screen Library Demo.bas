$Resize:Stretch
$ScreenHide
Screen.DPIaware -2 'turn on awareness
Screen _NewImage(800, 600, 32)
_ScreenShow
Screen.Move.Middle

f = _LoadFont("courbd.ttf", 32, "monospace")
_Font f

Do
    Cls
    Print "Desktop size: "; _DesktopWidth; _DesktopHeight
    Print "Screen size: "; _Width; _Height
    Print "Scaled size: "; _ScaledWidth; _ScaledHeight
    Print "Window size: "; Screen.Window.Width; Screen.Window.Height 'these let us see the window size after resizing
    Print "Our border size in pixels: "; Screen.Border.Width
    Print "Our title bar height in pixels: "; Screen.TitleBar.Height
    Screen.Snapback 320, 240, 1024, 720 'this limits our program to stay inside these dimensions
    _Limit 10
    _Display
Loop Until _KeyHit

'$Include:'..\Screen Library.BM'
