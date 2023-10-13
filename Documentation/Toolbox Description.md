List of $LET tags to enable and add various routines to your code:  
  
#### INCLUDE_ALL:  Enables all subs and functions inside the toolbox.  
  
#### INCLUDE_MEM:  Enables all subs and functions related to MEM commands and functionality.  
        - INCLUDE_CONVERT_OFFSET  
        - INCLUDE_MEMSORT  
        - INCLUDE_SCREEN: Enables all subs and functions related to SCREEN commands and functionality.  
        - INCLUDE_BORDERWIDTH  
        - INCLUDE_SCREENMOVE  
        - INCLUDE_SCREENMOVE_MIDDLE  
        - INCLUDE_SCROLLUP  
        - INCLUDE_SCROLLDOWN  
        - INCLUDE_TITLEBARHEIGHT  
  
#### INCLUDE_SOUND:  Enables all subs and functions related to SOUND commands and functionality.  
        - INCLUDE_SPEAK  
  
#### INDIVIDUAL INCLUDES:
        - INCLUDE_BORDERWIDTH: Enables the Function BorderWidth which is used to return the width of the programs borders to us.  
        - INCLUDE_CONVERT_OFFSET: Enables the Function ConvertOffset which is used to convert offsets to either LONG or INTEGER64 values as appropiate.  
        - INCLUDE_MEMSORT:  Enables the Function MemSort which is used to quickly sort arrays via the _MEM commands.  
        - INCLUDE_SCREENMOVE: Enables the Sub ScreenMove which allows the user to place the proram screen at absolute coordinates X, Y, without concern for border or titlebar adjustment.  
        - INCLUDE_SCREENMOVE_MIDDLE:  Enables the Sub ScreenMove Middle which places the program screen in the middle of the desktop, without concern for border or titlebar adjustment.  
        - INCLUDE_SCROLLUP:  Enables the Sub ScrollUp which is used to scroll the screen up one line of characters.  
        - INCLUDE_SCROLLDOWN:  Enables the Sub ScrollDown which is used to scroll the screen down one line of characters.  
        - INCLUDE_SPEAK:  Windows-Only command which uses Powershell via Sub Speak to turn text into speech.  
        - INCLUDE_TITLEBARHEIGHT: Enables the Function TitleBarHeight which is used to return the size of the program's titlebar, in pixels.  
