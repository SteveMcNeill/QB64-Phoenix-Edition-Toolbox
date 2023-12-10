List of $LET tags to enable and add various routines to your code:

#### INCLUDE_ALL:  Enables all subs and functions inside the toolbox.

#### INCLUDE_CONVERT:  Enables the embedding of all subs and functions which perform various conversions back and forth for us.
    INCLUDE_CONVERT_BASE64
    INCLUDE_CONVERT_OFFSET
    INCLUDE_CONVERT_TO_UTF8

#### INCLUDE_EMBEDED_FONTS:  Enables the embedding of various fonts via Function ReturnFont&.
    Function ReturnFont& (name$, size As Long, style$)
    EMBED_COURIER_NEW (REGULAR, BOLD, ITALIC, BOLD ITALIC)
    EMBED_CONSOLA (REGULAR, BOLD, ITALIC, BOLD ITALIC)
    EMBED_DEJA_VU_SANS
    EMBED_JULIA_MONO (BLACK, BLACK ITALIC, BOLD, BOLD ITALIC, EXTRA BOLD ITALIC, SEMIBOLD ITALIC, REGULAR, LIGHT, MEDIUM, MEDIUM ITALIC, LIGHT, LIGHT ITALIC)
    EMBED_LUCON
    EMBED_SOURCE_CODE_PRO (BLACK, BLACK ITALIC, BOLD, BOLD ITALIC, EXTRA BOLD ITALIC, SEMIBOLD ITALIC, REGULAR, LIGHT, MEDIUM, MEDIUM ITALIC, LIGHT, LIGHT ITALIC)
    EMBED_UNIFONT (REGULAR, UNICODE)    

#### INCLUDE_FILE:  Enables all subs and functions related to FILE commands and functionality.
    INCLUDE_GETFILELIST

#### INCLUDE_IMAGE:  Enables all subs and functions related to IMAGE commands and functionality.
    INCLUDE_CIRCLEFILL
    INCLUDE_DISPLAYIMAGE
    INCLUDE_ELLIPSEFILL
    INCLUDE_ELLIPSETILT
    INCLUDE_ELLIPSETILTFILL
    INCLUDE_QUADFILL
    INCLUDE_ROUNDRECT
    INCLUDE_ROUNDRECTFILL
    INCLUDE_TEXTTOIMAGE
    INCLUDE_THICKCIRCLE
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
    INCLUDE_SCROLLDOWN
    INCLUDE_SCROLLUP
    INCLUDE_TITLEBARHEIGHT

##### INCLUDE_SOUND:  Enables all subs and functions related to SOUND commands and functionality.
    INCLUDE_SPEECH

#### INCLUDE_TIME:  Enables all subs and functions related to TIME and DATE commands and functionality.
    INCLUDE_CHECKDAYFORMAT
    INCLUDE_EXTENDEDTIMER
    INCLUDE_GETDAY
    INCLUDE_GETMONTH
    INCLUDE_GETWEEKDAY
    INCLUDE_GETWEEKDAYNAME
    INCLUDE_GETYEAR
    INCLUDE_MAKEDATE
    INCLUDE_TIMESTAMP
    INCLUDE_UNIDATE


#### INDEPENDENT INCLUDES:  
    INCLUDE_BORDERWIDTH: Enables the Function BorderWidth which is used to return the width of the programs borders to us.
    INCLUDE_CHECKDAYFORMAT:  Enables the Function MakeDate which takes a string and determines if it's in a proper MM-DD-YYYY format.
    INCLUDE_CIRCLEFILL:  Enables the Sub CircleFill which generates a circle filled in the specified color.
    INCLUDE_CONVERT_BASE64:  Enables the Functions To64$ and From64$, which can be used to convert back and forth from base-256 (ASCII) strings to base-64 strings.
    INCLUDE_CONVERT_OFFSET: Enables the Function ConvertOffset which is used to convert offsets to either LONG or INTEGER64 values as appropiate.
    INCLUDE_CONVERT_TO_UTF8: Enables the Functions Ansi_To_Utf8$ and Unicode_To_UTF8$ which are used to convert ASCII/ANSI values/strings to UTF8 values/strings.
    INCLUDE_DISPLAYIMAGE:  Enables the Sub DisplayImage which displays an image at x/y coordinates, scales it, and rotates it as desired.
    INCLUDE_ELLIPSEFILL:  Enables the Sub EllipseFill which generates an ellipse filled in the specified color.
    INCLUDE_ELLIPSETILT:  Enables the Sub EllipseTilt which generates an ellipse tiled by the specified angle.
    INCLUDE_ELLIPSETILTFILL:  Enables the Sub EllipseTileFill which generates an ellipse tiled by the specified angle, and filled in the specified color.
    INCLUDE_EXTENDEDTIMER:  Enables the Function ExtendedTimer which is used to get system time without worrying over midnight issues.
    INCLUDE_GETDAY:  Enables the Function GetDay which is used to return the Day from any given MM/DD/YYYY date.
    INCLUDE_GETMONTH:  Enables the Function GetMonth which is used to return the Month from any given MM/DD/YYYY date.
    INCLUDE_GETWEEKDAY:    Enables the Function GetWeekDay which is used to return the Position of the Day of Week from any given MM/DD/YYYY date.
    INCLUDE_GETWEEKDAYNAME:    Enables the Function GetWeekDayName which is used to return the Name of the Day of Week from any given MM/DD/YYYY date.
    INCLUDE_GETFILELIST:  Enables the Function GetFileList (Path$) which returns a listing of all files and directories to a set string array called FileList().
    INCLUDE_GETYEAR:  Enables the Function GetYear which is used to return the Year from any given MM/DD/YYYY date.
    INCLUDE_MAKEDATE: Enables the Function MakeDate which takes MM, DD, YYYY values and formats them to create a proper date.     
    INCLUDE_MEMSORT:  Enables the Function MemSort which is used to quickly sort arrays via the _MEM commands.
    INCLUDE_MOUSEBUTTONSTATUS:  Enables the Function MouseButtonStatus which returns enhanced values for mouse buttons and scroll wheels for programs.
    INCLUDE_ROUNDRECT:  Enables the Sub RoundRect which generates a rounded rectangle.  
    INCLUDE_ROUNDRECTFILL:  Enables the Sub RoundRectFill which generates a rounded rectangle filled in the specified color.
    INCLUDE_SCREENMOVE: Enables the Sub ScreenMove which allows the user to place the proram screen at absolute coordinates X, Y, without concern for border or titlebar adjustment.
    INCLUDE_SCREENMOVE_MIDDLE:  Enables the Sub ScreenMove Middle which places the program screen in the middle of the desktop, without concern for border or titlebar adjustment.
    INCLUDE_SCROLLDOWN:  Enables the Sub ScrollDown which is used to scroll the screen down one line of characters.
    INCLUDE_SCROLLUP:  Enables the Sub ScrollUp which is used to scroll the screen up one line of characters.
    INCLUDE_SPEECH:  Multiple Windows-Only commands which use Powershell via Sub Speak to turn text into speech.
    INCLUDE_TEXTTOIMAGE:  Enables the Sub TextToImage which takes a given text string and converts it in an image which can be handled as any other image with _PUTIMAGE or DisplayImage.
    INCLUDE_THICKCIRCLE:  Enables the Sub ThickCircle which generates a circle with a multi-pixel border in the specified color.
    INCLUDE_TIMESTAMP:  Enables the Function TimeStamp which returns an Unix-style timestamp.
    INCLUDE_TITLEBARHEIGHT: Enables the Function TitleBarHeight which is used to return the size of the program's titlebar, in pixels.
    INCLUDE_UNIDATE:  Enables the Function UniDate which transforms a given DATE$ to whatever Universal Date format is desired.