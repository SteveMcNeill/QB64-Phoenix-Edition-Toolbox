'Sample for ScreenMove and ScreenMovotice e_Middle and working with them in QB64PE.
'Created on 10/17/2023 by Steve(tm)!
'This sample contains both of the related style subs:
'Sub ScreenMove (x, y)
'Sub ScreenMove_Middle


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(1024, 720, 32)
$Color:32
_ScreenMove _Middle 'start in the middle of the screen so it's obvious when we move and position manually.

Print "For those of you who didn't know, QB64PE already has a _SCREENMOVE and _SCREENMOVE _MIDDLE set of commands."
Print "So why the heck do we need these two, with the exact same names, sans the underscores?"
Print
Print "The two commands built into QB64 position your program screen -- title bar and all -- at where you specify."
Print "For example, hit the <SPACE BAR> and watch as we use the built in commands to move to position 0,0 on your desktop."
Do
    a$ = Input$(1)
Loop Until a$ = " "
_ScreenMove 0, 0
Print "Notice that your screen moved?  Notice that the titlebar is now at the top left position of the screen, at position 0,0?"
Print
Color Yellow
Print "QB64PE's built in _SCREENMOVE positions the PROGRAM WINDOW at the point where you specify."
Color White
Print
Print "As for this library's version of ScreenMove?  What's it do?"
Print "Press the <SPACE BAR> to find out as we move to position 0,0 on the desktop."
Do
    a$ = Input$(1)
Loop Until a$ = " "
ScreenMove 0, 0
Print
Print "Notice that the screen moved again?  Also notice that you can't see the titlebar or left border anymore?"
Print
Color Yellow
Print "This library's ScreenMove positions the SCREEN WINDOW at the point where you specify."
Color White
Print
Print
Print "It's a subtle difference, but if you needed to position your screen to use with a second program which made use"
Print "of a tool such as _SCREENCLICK, then that positioning might be very important."
Print
Print "It could be even more important on someone else's machine that is running your code."
Print "You might manually adjust for your titlebar height or borderwidth, but what about theirs?  Is it the same as yours?"
Print "Isn't it best to place the SCREEN where you want it, rather than the whole PROGRAM WINDOW?"
Print
Print
Print "I guess that's up to *YOU* to decide.  This library version of the command just gives you the option to choose"
Print "which might suit your needs the best.  :)"
Print
Print
Print "As for the _SCREENMOVE _MIDDLE and ScreenMove_Middle commands, they basically perform in the exact same way -- with"
Print "the only difference being they center your program on your desktop."
Print
Print "_ScreenMove _Middle will center the *WHOLE* program window on your desktop."
Print "ScreenMove_Middle will center your *PROGRAM SCREEN* on your desktop."
Print
Print "When centering, it's a very subtle difference, but it's still more than enough to throw calculations off if you're counting"
Print "on buttons or input areas to be at certain positions on the screen."
Print
Print "And that's basically the only differences in these commands and the ones built into QB64PE:"
Print "QB64PE's native commands position based on the WHOLE program screen."
Print "These commands position based on ONLY the working display screen."


'$INCLUDE:'..\Library Files\Toolbox.BM'

