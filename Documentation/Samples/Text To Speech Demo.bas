Option _Explicit
'$Include:'..\Sound.BI'

Speech.Init
Speech.Speaker "Female"
Speech.Speak "Hello World. My name is Steve. Testing."
Speech.Speaker "Male"
Speech.Speak "This is a second line of text.  Do I sound completely stupid?"
Speech.Speak "Are any of these cutting off the first few words?"
Speech.Speak "I hope not.  I've tried to sort those issues out, and correct for proper pausing to make certain the text is heard completely before moving on."
Speech.Speed 5
Speech.Speak "And this should be speaking fast as crap!"
Speech.Speed -10
Speech.Speak "And this should be a slow, drawn out speech."

System

'$Include:'..\Sound.BM'
