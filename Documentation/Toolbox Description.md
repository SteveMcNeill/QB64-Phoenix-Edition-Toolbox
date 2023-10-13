List of $LET tags to enable and add various routines to your code:

INCLUDE_ALL:  Enables all subs and functions inside the toolbox.

INCLUDE_MEM:  Enables all subs and functions related to MEM commands and functionality.
    INCLUDE_CONVERT_OFFSET
    INCLUDE_MEMSORT
INCLUDE_SCREEN: Enables all subs and functions related to SCREEN commands and functionality.
    INCLUDE_SCROLLUP
    INCLUDE_SCROLLDOWN
INCLUDE_SOUND:  Enables all subs and functions related to SOUND commands and functionality.
    INCLUDE_SPEAK

INCLUDE_CONVERT_OFFSET: Enables the Function ConvertOffset which is used to convert offsets to either LONG or INTEGER64 values as appropiate.
INCLUDE_MEMSORT:  Enables the Function MemSort which is used to quickly sort arrays via the _MEM commands.
INCLUDE_SCROLLUP:  Enables the Sub ScrollUp which is used to scroll the screen up one line of characters.
INCLUDE_SCROLLDOWN:  Enables the Sub ScrollDown which is used to scroll the screen down one line of characters.
INCLUDE_SPEAK:  Windows-Only command which uses Powershell via Sub Speak to turn text into speech. 