List of $LET tags to enable and add various routines to your code:

#### INCLUDE_ALL:  Enables all subs and functions inside the toolbox.

#### INCLUDE_IMAGE:  Enables all subs and functions related to IMAGE commands and functionality.
    INCLUDE_CIRCLEFILL
    INCLUDE_ELLIPSEFILL
    INCLUDE_ELLIPSETILT
    INCLUDE_ELLIPSETILTFILL
    INCLUDE_QUADFILL
    INCLUDE_TRIANGLEFILL
    

#### INCLUDE_MEM:  Enables all subs and functions related to MEM commands and functionality.
    INCLUDE_CONVERT_OFFSET
    INCLUDE_MEMSORT

#### INCLUDE_MOUSE:  Enables all subs and functions related to MOUSE commands and functionality.
    INCLUDE_MOUSEBUTTONSTATUS

#### INCLUDE_SCREEN: Enables all subs and functions related to SCREEN commands and functionality.
    INCLUDE_BORDERWIDTH
    INCLUDE_SCREENMOVE
    INCLUDE_SCREENMOVE_MIDDLE
    INCLUDE_SCROLLUP
    INCLUDE_SCROLLDOWN
    INCLUDE_TITLEBARHEIGHT

##### INCLUDE_SOUND:  Enables all subs and functions related to SOUND commands and functionality.
    INCLUDE_SPEAK

#### INCLUDE_TIME:  Enables all subs and functions related to TIME and DATE commands and functionality.
    INCLUDE_EXTENDEDTIMER
    INCLUDE_GETDAY
    INCLUDE_UNIDATE
    INCLUDE_TIMESTAMP


#### INDEPENDENT INCLUDES:  
    INCLUDE_BORDERWIDTH: Enables the Function BorderWidth which is used to return the width of the programs borders to us.
    INCLUDE_CIRCLEFILL:  Enables the Sub CircleFill which generates a circle filled in the specified color.
    INCLUDE_CONVERT_OFFSET: Enables the Function ConvertOffset which is used to convert offsets to either LONG or INTEGER64 values as appropiate.
    INCLUDE_ELLIPSEFILL:  Enables the Sub EllipseFill which generates an ellipse filled in the specified color.
    INCLUDE_ELLIPSETILT:  Enables the Sub EllipseTilt which generates an ellipse tiled by the specified angle.
    INCLUDE_ELLIPSETILTFILL:  Enables the Sub EllipseTileFill which generates an ellipse tiled by the specified angle, and filled in the specified color.
    INCLUDE_EXTENDEDTIMER:  Enables the Function ExtendedTimer which is used to get system time without worrying over midnight issues.
    INCLUDE_GETDAY:  Enables the Function GetDay$ which is used to return the Day from any given MM/DD/YYYY date.
    INCLUDE_UNIDATE:  Enables the Function UniDate which transforms a given DATE$ to whatever Universal Date format is desired.
    INCLUDE_MEMSORT:  Enables the Function MemSort which is used to quickly sort arrays via the _MEM commands.
    INCLUDE_MOUSEBUTTONSTATUS:  Enables the Function MouseButtonStatus which returns enhanced values for mouse buttons and scroll wheels for programs.
    INCLUDE_SCREENMOVE: Enables the Sub ScreenMove which allows the user to place the proram screen at absolute coordinates X, Y, without concern for border or titlebar adjustment.
    INCLUDE_SCREENMOVE_MIDDLE:  Enables the Sub ScreenMove Middle which places the program screen in the middle of the desktop, without concern for border or titlebar adjustment.
    INCLUDE_SCROLLDOWN:  Enables the Sub ScrollDown which is used to scroll the screen down one line of characters.
    INCLUDE_SCROLLUP:  Enables the Sub ScrollUp which is used to scroll the screen up one line of characters.
    INCLUDE_SPEAK:  Windows-Only command which uses Powershell via Sub Speak to turn text into speech.
    INCLUDE_TIMESTAMP:  Enables the Function TimeStamp which returns an Unix-style timestamp.
    INCLUDE_TITLEBARHEIGHT: Enables the Function TitleBarHeight which is used to return the size of the program's titlebar, in pixels.
