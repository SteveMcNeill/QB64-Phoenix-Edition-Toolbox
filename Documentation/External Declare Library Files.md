A list of the DECLARE LIBRARY routines which are included, which an user might want to make use of separately for whatever reason:

#### INCLUDE_ALL:  Includes all DECLARE LIBRARY subs and functions.

#### INCLUDE_FILE:  Includes all DECLARE LIBRARY subs and functions.
	Note:  direntry.h is ued for the Function GetFileList, but it has no subs or functions which an user would normally find necessary to call or interact with. 

#### INCLUDE_GLUT:  Includes all DECLARE LIBRARY routines that come from glut.
	INCLUDE_GLUTGET
	INCLUDE_GLUTRESHAPEWINDOW

#### INCLUDE_MATH:  Include all DECLARE LIBRARY routines related to math functions or subs.
	INCLUDE_ISINF
	INCLUDE_ISNAN

#### INCLUDE_MEM:  Include all DECLARE LIBRARY routines related to mem functions or subs.
	INCLUDE_SETMEMORYBYTE
	INCLUDE_SETMEMORYINTEGER
	INCLUDE_SETMEMORYLONG

#### INDEPENDENT DECLARE LIBRARY subs and functions.
	INCLUDE_GLUTGET:  Adds Function glutget& (ByVal what&)
	INCLUDE_GLUTRESHAPEWINDOW:  Adds SUB glutReshapeWindow (BYVAL width&, BYVAL height&)
	INCLUDE_ISINF:  Adds FUNCTION IsInf% (BYVAL n AS _FLOAT)
	INCLUDE_ISNAN:  Adds FUNCTION IsNan% (BYVAL n AS _FLOAT)
	INCLUDE_SETMEMORYBYTE:  Adds SUB SetMemoryByte (BYVAL dst AS _UNSIGNED _OFFSET, BYVAL elements AS _UNSIGNED LONG, BYVAL value AS _UNSIGNED _BYTE)
	INCLUDE_SETMEMORYINTEGER:  Adds SUB SetMemoryInteger (BYVAL dst AS _UNSIGNED _OFFSET, BYVAL elements AS _UNSIGNED LONG, BYVAL value AS _UNSIGNED INTEGER)
	INCLUDE_SETMEMORYLONG:  Adds SUB SetMemoryLong (BYVAL dst AS _UNSIGNED _OFFSET, BYVAL elements AS _UNSIGNED LONG, BYVAL value AS _UNSIGNED LONG)