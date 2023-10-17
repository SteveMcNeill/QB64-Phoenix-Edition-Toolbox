'Sample for using Text-To-Speech in QB64PE.  (NOTE: Only for Windows!)
'Created on 10/17/2023 by Steve(tm)!
'Lots of subs and functions in this sample, and they're all included together in a program as they're all helper files:
'Sub Speech_Init
'Sub Speech_Speaker (who$)
'Sub Speech_Speed (Speed)
'Sub Speech_Volume (Volume)
'Sub Speech_OutTo (where$)
'Sub Speak (text$)
'Sub Speak_ToWav (text$, file$)
'Sub DoSpeech (text As String, Speaker As Integer, Speed, savefile$, volume)

'Note that this is a very rudimentry PowerShell Script which gives us very basic text to speech capabilities in Windows only.
'This can be used to add minor speech to programs (such as "How much do you want to bet?" for a poker game), but shouldn't be
'relied upon for anything overly demanding.

'Since these routines require a SHELL call to run the powershell script they generate, there may be a noticeable lag of a second
'or two before the speech actually is heard.  This is currently unavoidable as the system has to initialize a new speech handle,
'wait for that handle to be ready for us, and then use that handle to generate our text to speech.

'Older, slower computers may see a longer lag between the time when the speech is called, to when the speech is actually generated and heard.

'Sub descriptions and options:

'Sub Speech_Init -- This initializes or resets all the sound settings to the default for us.
'Sub Speech_Speaker -- We can choose between two voices always included with Windows -- Ziva or David.
'Sub Speech_Speed -- Set the speed of the speaker from -10 to 10.  Higher is faster, 0 is default.
'Sub Speech_Volume -- Like your TV's volumn control.  Levels range from 0 (mute) to 100 (as loud as possible).
'Sub Speech_OutTo -- Set where you want the speech to go; there's two valid options:  "Speaker" and any filename ending in ".WAV"
'Sub Speak -- Speaks the text you type (with limitations as described above) to the device specified via Speech_OutTo
'Sub Speak_ToWav -- Speaks the text to type directly to the file you specify.  (Filename must end with ".WAV")
'Sub DoSpeech -- Honestly should never be called directly by the end user.  It's all our options rolled into one command, and what
'                everything else falls back on and references to run.  Consider it an "internal only" routine, if you would.

$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'

Screen _NewImage(1024, 720, 32)
$Color:32

Speech_Init 'initialize or reset speech options
Print "Hello World, This is a normal speed demo of David's voice"
Speak "Hello World, This is a normal speed demo of David's voice" 'Notice any delay to the speech here?  You may, depending on Windows and PC performance.
_Delay 5 'Give them time to finish speaking so voices don't overlap.  (Unless you desire that for some reason.)
Speech_Speaker "Ziva"
Print "Hello again.  This is a normal speed demo of Ziva's voice."
Speak "Hello again.  This is a normal speed demo of Ziva's voice."
_Delay 5
Speech_Speaker "David"
Speech_Speed -10
Print "And now I'm speaking as David, but I'm speaking veeery slow."
Speak "And now I'm speaking as David, but I'm speaking veeery slow."
_Delay 12
Speech_Speaker "Ziva"
Speech_Speed 5
Print "And now I'm a very hyper Ziva!"
Speak "And now I'm a very hyper Ziva!"
_Delay 4
Speech_Speed 0
Speech_Volume 15
Print "And now I'm whispering to you that I'm done with my demo!"
Speak "And now I'm whispering to you that I'm done with my demo!"
_Delay 5

'$INCLUDE:'..\Library Files\Toolbox.BM'

